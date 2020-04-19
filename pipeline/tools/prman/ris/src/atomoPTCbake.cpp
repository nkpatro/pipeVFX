/*
# ------------------------------------------------------------------------------
#
# Copyright (c) 1986-2016 Pixar. All rights reserved.
#
# The information in this file (the "Software") is provided for the exclusive
# use of the software licensees of Pixar ("Licensees").  Licensees have the
# right to incorporate the Software into other products for use by other
# authorized software licensees of Pixar, without fee. Except as expressly
# permitted herein, the Software may not be disclosed to third parties, copied
# or duplicated in any form, in whole or in part, without the prior written
# permission of Pixar.
#
# The copyright notices in the Software and this entire statement, including the
# above license grant, this restriction and the following disclaimer, must be
# included in all copies of the Software, in whole or in part, and all permitted
# derivative works of the Software, unless such copies or derivative works are
# solely in the form of machine-executable object code generated by a source
# language processor.
#
# PIXAR DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING ALL
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL PIXAR BE
# LIABLE FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION
# OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN
# CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.  IN NO CASE WILL
# PIXAR'S TOTAL LIABILITY FOR ALL DAMAGES ARISING OUT OF OR IN CONNECTION WITH
# THE USE OR PERFORMANCE OF THIS SOFTWARE EXCEED $50.
#
# Pixar
# 1200 Park Ave
# Emeryville CA 94608
#
# ------------------------------------------------------------------------------
*/

#define MAX_THREADS 16

/*
We need this in the rib to render everything when baking


  Attribute "cull" "hidden" 0   # don't cull hidden surfaces
  Attribute "cull" "backfacing" 0   # don't cull backfacing surfaces
  Attribute "dice" "rasterorient" 0   # view-independent dicing !
*/

/* $Revision: #4 $ */

#include "RixSampleFilter.h"

#include "pointcloud.h"

#include "OpenEXR/ImathVec.h"
#include "IECore.h"
#include "Writer.h"
#include "PointsPrimitive.h"
#include "PointsPrimitiveEvaluator.h"
#include "KDTree.h"
#include "InverseDistanceWeightedInterpolation.h"

#include <thread>


// #define BRICK2
// #define BRICK


class PxrBakeSampleFilter : public RixSampleFilter
{

public:
    PxrBakeSampleFilter();
    virtual ~PxrBakeSampleFilter();
    virtual int Init(RixContext &ctx, char const *pluginPath);
    virtual RixSCParamInfo const *GetParamTable();
    virtual void Finalize(RixContext &ctx);

    virtual int CreateInstanceData(RixContext &ctx, char const *handle,
                                   RixParameterList const *parms,
                                   InstanceData *instance);

    virtual void Filter(RixSampleFilterContext &fCtx,
                        RtConstPointer instance);



    struct sampleParams
    {
        RtColorRGB blackPoint;
        RtColorRGB whitePoint;
        RtColorRGB lift;
        RtColorRGB gain;
        RtColorRGB multiply;
        RtColorRGB gamma;
        RtColorRGB offset;
        RtInt clampWhite;
        RtInt clampBlack;
        RtColorRGB mask;
        RixChannelId channelId;
        RixChannelId channelId2;
        RixChannelId channelId3;
        RixChannelId channelId4;
        RixChannelId channelId5;
    };

    PtcPointCloud outptc = NULL;
    float w2e[16], w2n[16], format[3];
    float point[3], normal[3];
    float radius, *data;
    int datasize, nvars, nv;
    int npoints, _p;
    char **vartypes = NULL, **varnames = NULL, **vt = NULL, **vn = NULL; // arrays of strings
    char *inname, *outname;

    RixMutex       *m_allWorkersMutex;
    RixMutex       *m_allWorkersMutex2;
    RixTransform   *_RixTransform;

    FILE *_f;

    // IECore::PointsPrimitive *__ptc;
    IECore::FloatVectorData *zr;
    IECore::FloatVectorData *zid;
    IECore::V3fVectorData   * p;
    IECore::V3fVectorData   * n;
    IECore::V3fVectorData   * c;
    float r, px, py, pz, nx,ny,nz, cr,cg,cb, id;
    unsigned long nsamples;
    unsigned long nsamples_old;

    float volumeSize;


    virtual Imath::Box3f octreeInit( );
    virtual void octree( Imath::Box3f bbox, unsigned long numberSlices, unsigned long depth=0 );
    IECore::FloatVectorData *__zr  ;
    IECore::FloatVectorData *__zid ;
    IECore::V3fVectorData *__p     ;
    IECore::V3fVectorData *__n     ;
    IECore::V3fVectorData *__c     ;
    IECore::V3fTree *kdtree        ;
    IECore::PointsPrimitive * __ptc;

    int threadLimit;
    unsigned long npoint_in_grids;


    // outptc = PtcCreatePointCloudFile(outname, nvars, vartypes, varnames, w2e, w2n, format);
    // PtcPointCloud PtcCreatePointCloudFile (char *filename, int nvars, char **vartypes,
    //                                       char **varnames, float *world2eye, float *world2ndc,
    //                                       float *format);
private:

};

PxrBakeSampleFilter::PxrBakeSampleFilter()
{
}

PxrBakeSampleFilter::~PxrBakeSampleFilter()
{
}

int PxrBakeSampleFilter::Init(RixContext &ctx, char const *pluginPath)
{
    //_rixContext = &ctx;
    _RixTransform = (RixTransform *)ctx.GetRixInterface(RixInterfaceId::k_RixTransform);
    m_allWorkersMutex=0;
    m_allWorkersMutex2=0;
    nsamples=0;
    nsamples_old=0;
    _f = fopen("/tmp/zz.ptc","w");
    fclose(_f);
    return 0;
}

enum paramIds
{
    k_blackPoint,
    k_whitePoint,
    k_lift,
    k_gain,
    k_multiply,
    k_gamma,
    k_offset,
    k_clampWhite,
    k_clampBlack,
    k_mask,
    k_aov,
    k_aov2,
    k_aov3,
    k_aov4,
    k_aov5,
    k_numParams
};

RixSCParamInfo const *
PxrBakeSampleFilter::GetParamTable()
{
    static RixSCParamInfo s_ptable[] =
    {
        RixSCParamInfo("blackPoint", k_RixSCColor),
        RixSCParamInfo("whitePoint", k_RixSCColor),
        RixSCParamInfo("lift", k_RixSCColor),
        RixSCParamInfo("gain", k_RixSCColor),
        RixSCParamInfo("multiply", k_RixSCColor),
        RixSCParamInfo("gamma", k_RixSCColor),
        RixSCParamInfo("offset", k_RixSCColor),
        RixSCParamInfo("clampWhite", k_RixSCInteger),
        RixSCParamInfo("clampBlack", k_RixSCInteger),
        RixSCParamInfo("mask", k_RixSCColor),
        RixSCParamInfo("aov", k_RixSCString),
        RixSCParamInfo("aov2", k_RixSCString),
        RixSCParamInfo("aov3", k_RixSCString),
        RixSCParamInfo("aov4", k_RixSCString),
        RixSCParamInfo("aov5", k_RixSCString),
        RixSCParamInfo()
    };
    return &s_ptable[0];
}

void PxrBakeSampleFilter::Finalize(RixContext &ctx)
{
    PtcFinishPointCloudFile(outptc);
    // fprintf(_f, "]\n");

        fclose(_f);
        IECore::PointsPrimitive * __ptc = new IECore::PointsPrimitive( p->copy() );
        __ptc->variables["N"] =  IECore::PrimitiveVariable( IECore::PrimitiveVariable::Varying, n->copy() );
        __ptc->variables["Cs"] =  IECore::PrimitiveVariable( IECore::PrimitiveVariable::Varying, c->copy() );
        __ptc->variables["width"] =  IECore::PrimitiveVariable( IECore::PrimitiveVariable::Varying, zr->copy() );
        __ptc->variables["id"] =  IECore::PrimitiveVariable( IECore::PrimitiveVariable::Varying, zid->copy() );

        IECore::Writer::create( __ptc, "/tmp/ptc.cob")->write();

        std::cout << "Writing final ptc.cob" << std::endl; std::cout.flush();

        std::cout << "Filtering ptc to ptc2.cob - " << p->readable().size() << " points to filter..." << std::endl; std::cout.flush();
        octree( octreeInit(), 2);
}

Imath::Box3f PxrBakeSampleFilter::octreeInit()
{
        // ======================================================================================
        volumeSize=0.1;
        // IECore::InverseDistanceWeightedInterpolationV3fV3f closestPointsAverageColor = IECore::InverseDistanceWeightedInterpolationV3fV3f(
        //     p->readable().begin(),
        //     p->readable().end(),
        //     c->readable().begin(),
        //     c->readable().end(),
        //     20,
        //     20
        // );

        __ptc = new IECore::PointsPrimitive( p->copy() );
        std::cout << "1 "  << std::endl; std::cout.flush();

        kdtree = new IECore::V3fTree(
            p->readable().begin(),
            p->readable().end(),
            200
        );
        __zr  = new IECore::FloatVectorData();
        __zid = new IECore::FloatVectorData();
        __p   = new IECore::V3fVectorData();
        __n   = new IECore::V3fVectorData();
        __c   = new IECore::V3fVectorData();

        Imath::Box3f bbox = __ptc->bound();
        threadLimit=0;
        npoint_in_grids = 0;
        return bbox;
}

void PxrBakeSampleFilter::octree( Imath::Box3f _bbox, unsigned long numberSlices, unsigned long depth ){
    // std::cout << "2 "  << std::endl; std::cout.flush();

    // if (m_allWorkersMutex){
    //     m_allWorkersMutex->Lock();
        // std::cout <<  bbox.size().x << " - " <<  bbox.size().y << " - " <<  bbox.size().z << " - "  << std::endl; std::cout.flush();
        float volumeSizeX = _bbox.size().x/numberSlices;
        float volumeSizeY = _bbox.size().y/numberSlices;
        float volumeSizeZ = _bbox.size().z/numberSlices;
        unsigned long slices_counter = 0;
        unsigned long slices_total = pow(numberSlices,3);
        int old_perc = 0;
        int perc = 0;
        for( float sliceX = 0 ; sliceX < numberSlices ; sliceX++ ){
            for( float sliceY = 0 ; sliceY < numberSlices ; sliceY++ ){
                for( float sliceZ = 0 ; sliceZ < numberSlices ; sliceZ++ ){
                    // int perc = int(float(slices_counter++) / slices_total) * 100;
                    // if ( perc != old_perc )
                    //     std::cout <<  perc << "%"  << std::endl; std::cout.flush();
                    // std::cout <<  perc << "%"  << std::endl; std::cout.flush();
                    // old_perc = perc;

                    Imath::V3f gridPmin = Imath::V3f(
                        _bbox.min.x+sliceX*volumeSizeX,
                        _bbox.min.y+sliceY*volumeSizeY,
                        _bbox.min.z+sliceZ*volumeSizeZ
                    );
                    Imath::V3f gridPmax = Imath::V3f(
                        _bbox.min.x+(sliceX+1)*volumeSizeX,
                        _bbox.min.y+(sliceY+1)*volumeSizeY,
                        _bbox.min.z+(sliceZ+1)*volumeSizeZ
                    );
                    Imath::Box3f gridBox = Imath::Box3f(gridPmin, gridPmax);
                    Imath::V3f gridCenter = gridBox.center();

                    // find all points inside the gridBox
                    // IECore::V3fTree::Iterator pointsInsideGridBox;
                    std::vector<std::vector<Imath::V3f>::const_iterator> pointsInsideGridBox;
                    float gridSize = (gridCenter-gridPmax).length();
                    // kdtree.enclosedPoints(gridBox, pointsInsideGridBox);
                    unsigned long numPoints = kdtree->nearestNeighbours( gridCenter, gridSize, pointsInsideGridBox );
                    // unsigned long numPoints = kdtree->nearestNeighbours( gridCenter, gridBox.size().length()/4, pointsInsideGridBox );
                    npoint_in_grids += numPoints;

                    // if (depth<=1)
                        std::cout << "depth:" << depth << " X: " << sliceX << " Y: " << sliceY << " Z: " << sliceZ  << " -> "<< numPoints << " - " << gridSize << " ";
                        std::cout << " bbcenter.x:" <<  gridCenter.x;
                        std::cout << " bbcenter.y:" <<  gridCenter.y;
                        std::cout << " bbcenter.z:" <<  gridCenter.z;
                        std::cout << " bbmin.x:" <<  gridBox.min.x;
                        std::cout << " bbmin.y:" <<  gridBox.min.y;
                        std::cout << " bbmin.z:" <<  gridBox.min.z;
                        std::cout << " bbmax.x:" <<  gridBox.max.x;
                        std::cout << " bbmax.y:" <<  gridBox.max.y;
                        std::cout << " bbmax.z:" <<  gridBox.max.z;
                        std::cout << std::endl; std::cout.flush();
                    if ( numPoints > 0 ) {
                        if ( numPoints > 100 && gridSize > 0.0001) {
                            // while (threadLimit>=MAX_THREADS){
                            //     sleep(1);
                            // }
                            // if (depth < 2){
                            //     threadLimit++;
                            //     // std::cout << "depth:" << depth << " X: " << sliceX << " Y: " << sliceY << " Z: " << sliceZ  << " -> "<< numPoints << std::endl; std::cout.flush();
                            //     std::thread *dive = new std::thread(&PxrBakeSampleFilter::octree, this, gridBox, numberSlices, depth+1);
                            //     threadLimit--;
                            // }else{
                                octree(gridBox, numberSlices, depth+1);
                            // }
                        }else{
                            // std::cout << "depth:" << depth << " sliceX: " << sliceX << " sliceY: " << sliceY << " sliceZ: " << sliceZ  << " -> "<< numPoints << std::endl; std::cout.flush();
                            Imath::V3f resultC = Imath::V3f(0,0,0);
                            Imath::V3f resultN = Imath::V3f(0,0,0);
                            float resultR = 0;
                            float resultID = 0;
                            long counter=0;
                            unsigned long long index=0;
                            for( unsigned long _i=0; _i < numPoints ; _i++ ){
                                // std::cout << "pre-distance: " <<  index << std::endl; std::cout.flush();
                                index = std::distance( p->readable().begin(), pointsInsideGridBox[_i] );
                                // std::cout  << index << "\n" << p->readable().size() << std::endl; std::cout.flush();

                                float distance = (gridCenter - p->readable()[index]).length() / gridSize;
                                distance = 1.0-pow(distance,2);
                                resultC  += c->readable()[index] * distance;
                                resultN  += n->readable()[index] * distance;
                                resultR  += zr->readable()[index] * distance;
                                resultID += zid->readable()[index] * distance;
                                counter++;
                                // pointsInsideGridBox++;
                            }
                            if ( counter > 0 ){
                                if (m_allWorkersMutex){
                                    m_allWorkersMutex->Lock();

                                    resultC /= counter;
                                    resultN /= counter;
                                    resultR /= counter;
                                    resultID /= counter;

                                    __p->writable().push_back( gridCenter );
                                    __c->writable().push_back( resultC );
                                    __n->writable().push_back( resultN );
                                    __zr->writable().push_back( resultR );
                                    __zid->writable().push_back( resultID );

                                    m_allWorkersMutex->Unlock();
                                }
                            }
                        }
                    }
                }
            }
        }

        // after creating the filtered PTC, save it!
        if ( depth == 0 ){
            std::cout << "writing filtered ptc... filtered " << npoint_in_grids << " points generating " << __p->readable().size() << " filtered points."; std::cout.flush();
            IECore::PointsPrimitive * ____ptc = new IECore::PointsPrimitive( __p->copy() );
            ____ptc->variables["N"]           =  IECore::PrimitiveVariable( IECore::PrimitiveVariable::Varying, __n->copy() );
            ____ptc->variables["Cs"]          =  IECore::PrimitiveVariable( IECore::PrimitiveVariable::Varying, __c->copy() );
            ____ptc->variables["width"]       =  IECore::PrimitiveVariable( IECore::PrimitiveVariable::Varying, __zr->copy() );
            ____ptc->variables["id"]          =  IECore::PrimitiveVariable( IECore::PrimitiveVariable::Varying, __zid->copy() );
            IECore::Writer::create( ____ptc, "/tmp/ptc2.cob")->write();
            std::cout << "done" << std::endl; std::cout.flush();
            std::cout << "Finalize!!!!" << std::endl; std::cout.flush();
        }

    //     m_allWorkersMutex->Unlock();
    // }

}

int PxrBakeSampleFilter::CreateInstanceData(RixContext &ctx,
                                   char const *handle,
                                   RixParameterList const *parms,
                                   InstanceData *instance)
{
    instance->datalen = sizeof( sampleParams );
    instance->data = malloc( instance->datalen );
    instance->freefunc = free;
    sampleParams *pp = reinterpret_cast< sampleParams * >( instance->data );

    pp->blackPoint = RtColorRGB(0.0f,0.0f,0.0f);
    pp->whitePoint = RtColorRGB(1.0f,1.0f,1.0f);
    pp->lift = RtColorRGB(0.0f,0.0f,0.0f);
    pp->gain = RtColorRGB(1.0f,1.0f,1.0f);
    pp->multiply = RtColorRGB(1.0f,1.0f,1.0f);
    pp->gamma = RtColorRGB(1.0f,1.0f,1.0f);
    pp->offset = RtColorRGB(0.0f,0.0f,0.0f);
    pp->clampWhite = 0;
    pp->clampBlack = 1;
    pp->mask = RtColorRGB(1.0f,1.0f,1.0f);
    pp->channelId = k_InvalidChannelId;
    RtConstString aov = "Ci";
    RtConstString aov2 = "P";
    RtConstString aov3 = "id";
    RtConstString aov4 = "PRadius";
    RtConstString aov5 = "Nn";

    parms->EvalParam( k_blackPoint, 0, &pp->blackPoint);
    parms->EvalParam( k_whitePoint, 0, &pp->whitePoint);
    parms->EvalParam( k_lift, 0, &pp->lift);
    parms->EvalParam( k_gain, 0, &pp->gain);
    parms->EvalParam( k_multiply, 0, &pp->multiply);
    parms->EvalParam( k_gamma, 0, &pp->gamma);
    parms->EvalParam( k_offset, 0, &pp->offset);
    parms->EvalParam( k_clampWhite, 0, &pp->clampWhite);
    parms->EvalParam( k_clampBlack, 0, &pp->clampBlack);
    parms->EvalParam( k_mask, 0, &pp->mask);
    parms->EvalParam( k_aov, 0, &aov);

    RixMessages *msg = reinterpret_cast< RixMessages * >(
        ctx.GetRixInterface( k_RixMessages ) );
    RixRenderState *renderState = static_cast<RixRenderState*>(
        ctx.GetRixInterface(k_RixRenderState));
    RixRenderState::FrameInfo frameInfo;
    renderState->GetFrameInfo(&frameInfo);
    RixIntegratorEnvironment const *iEnv = frameInfo.integratorEnv;

    RixDisplayChannel const *channel;
    if (!(channel = iEnv->GetDisplayChannel(aov)))
    {
        msg->Warning( "PxrBakeSampleFilter '%s' did not find a "
                      "display for AOV '%s'", handle, aov );
        return -1;
    }
    pp->channelId = channel->id;

    if (!(channel = iEnv->GetDisplayChannel(aov2)))
    {
        msg->Warning( "PxrBakeSampleFilter '%s' did not find a "
                      "display for AOV '%s'", handle, aov );
        return -1;
    }
    pp->channelId2 = channel->id;

    if (!(channel = iEnv->GetDisplayChannel(aov3)))
    {
        msg->Warning( "PxrBakeSampleFilter '%s' did not find a "
                      "display for AOV '%s'", handle, aov );
        return -1;
    }
    pp->channelId3 = channel->id;

    if (!(channel = iEnv->GetDisplayChannel(aov4)))
    {
        msg->Warning( "PxrBakeSampleFilter '%s' did not find a "
                      "display for AOV '%s'", handle, aov );
        return -1;
    }
    pp->channelId4 = channel->id;

    if (!(channel = iEnv->GetDisplayChannel(aov5)))
    {
        msg->Warning( "PxrBakeSampleFilter '%s' did not find a "
                      "display for AOV '%s'", handle, aov );
        return -1;
    }
    pp->channelId5 = channel->id;

    nvars=1;
    char *_vartypes[1] = {(char *)"color"};
    char *_varnames[1] = {(char *)"RGB"};
    char *f=(char *)"/tmp/xx.ptc";
    for ( int n=0; n<16 ; n++ ){
        w2e[n]=1;
        w2n[n]=1;
    }
    format[0]=1920;
    format[1]=1080;
    format[0]=3;
    std::cout << "\nBUMMMM " << channel->id << std::endl; std::cout.flush();

    outptc = PtcCreatePointCloudFile (f, nvars, _vartypes,
                _varnames, w2e, w2n, format);

    if (!outptc) {
         fprintf(stderr, "Unable to open output file %s.\n", outname);
         exit(1);
       }

    // std::cout << "\nBUMMMM 2\n" << std::endl; std::cout.flush();

    if (RixThreadUtils *threadUtils =
        (RixThreadUtils*) ctx.GetRixInterface(k_RixThreadUtils))
    {
        m_allWorkersMutex = threadUtils->NewMutex();
    }

    _f = fopen("/tmp/zz.ptc","a");
    // fprintf(_f, "[\n");
    fflush(_f);



    zr  = new IECore::FloatVectorData();
    zid = new IECore::FloatVectorData();
    p   = new IECore::V3fVectorData();
    n   = new IECore::V3fVectorData();
    c   = new IECore::V3fVectorData();
    nsamples=0;
    nsamples_old=0;

    return 0;
}

void PxrBakeSampleFilter::Filter(RixSampleFilterContext &fCtx,
                                RtConstPointer instance)
{
    sampleParams const* pp = reinterpret_cast< sampleParams const* >(instance);

    // std::cout << "\nBUMMMM 3\n" << std::endl; std::cout.flush();

    float data[3];
    float _P[3];
    float _N[3];
    float id=0;
    RtColorRGB result;
    result.r = result.g = result.b = 0;
    long nn=0;
    RtColorRGB closer_result;
    float oldid=0;
    float anti_alias_pixel = 0;
    closer_result.r = closer_result.g = closer_result.b = 0;
    double lastZ = 9999999999999;


#if defined(BRICK) || defined(BRICK2)
#else
    for (int i=0 ; i < fCtx.numSamples; ++i) {
        RtColorRGB origPixel;
        RtColorRGB Ppixel;
        float _id;
        fCtx.Read(pp->channelId, i, origPixel);
        fCtx.Read(pp->channelId2, i, Ppixel);
        fCtx.Read(pp->channelId3, i, _id);
        if ( Ppixel.b <  lastZ ){
            closer_result = origPixel;
            id = _id;
            lastZ = Ppixel.b;
        }
        if (_id != oldid){
            anti_alias_pixel++;
        }
        oldid = _id;
        result += origPixel;
        nn++;
        fCtx.Write(pp->channelId, i, origPixel);
    }
    result /=nn;
#endif

#ifdef BRICK2
    IECore::FloatVectorData *____zr  = new IECore::FloatVectorData();
    IECore::FloatVectorData *____zid = new IECore::FloatVectorData();
    IECore::V3fVectorData *____p   = new IECore::V3fVectorData();
    IECore::V3fVectorData *____n   = new IECore::V3fVectorData();
    IECore::V3fVectorData *____c   = new IECore::V3fVectorData();
#endif

#if defined(BRICK) || defined(BRICK2)
#else
    if ( anti_alias_pixel <= 1)
#endif
    {
        if (m_allWorkersMutex){
            m_allWorkersMutex->Lock();
            if ( fCtx.shadeCtxs[0] && fCtx.numGrps > 0){

#if defined(BRICK) || defined(BRICK2)
                // if ( fCtx.shadeCtxs[i]->numPts )
                float oldid=0;
                float anti_alias_pixel = 0;

                float data[3];
                float _P[3];
                float _N[3];
                float id=0;
                for (int i=0 ; i < fCtx.numSamples; ++i)
                {
                    // gather stats first
                    RtColorRGB origPixel;
                    fCtx.Read(pp->channelId, i, origPixel);
                    RtColorRGB Ppixel;
                    fCtx.Read(pp->channelId2, i, Ppixel);
                    float _id;
                    fCtx.Read(pp->channelId3, i, _id);
                    float _radius;
                    fCtx.Read(pp->channelId4, i, _radius);
                    RtColorRGB Nn;
                    fCtx.Read(pp->channelId2, i, Nn);

                    if (_id != oldid){
                        anti_alias_pixel++;
                    }
                    oldid = _id;

                    data[0] = origPixel.r;
                    data[1] = origPixel.g;
                    data[2] = origPixel.b;
                    _P[0] = Ppixel.r; _P[1] = Ppixel.g; _P[2] = Ppixel.b;
                    _N[0] = Nn.r; _N[1] = Nn.g; _N[2] = Nn.b;
#else
                    float data[3];
                    float _P[3];
                    float _N[3];
                    float _radius;
                    float _id;

                    const RtFloat3 *P;
                    fCtx.shadeCtxs[0]->GetBuiltinVar(RixShadingContext::k_P, &P);
                    const float *radius;
                    fCtx.shadeCtxs[0]->GetBuiltinVar(RixShadingContext::k_PRadius, &radius);
                    const RtFloat3 *N;
                    fCtx.shadeCtxs[0]->GetBuiltinVar(RixShadingContext::k_Nn, &N);

                    _P[0] = P->x; _P[1] = P->y; _P[2] = P->z;
                    _N[0] = N->x; _N[1] = N->y; _N[2] = N->z;
                    data[1] = result.g;
                    data[0] = result.r;
                    data[2] = result.b;
                    _radius = radius[0];
                    _id=0;
#endif

                    _RixTransform->TransformPoints(const_cast<char*>("camera"), const_cast<char*>("world"), 1, &_N, 0);
                    _RixTransform->TransformPoints(const_cast<char*>("camera"), const_cast<char*>("world"), 1, &_P, 0);

                    p->writable().push_back( Imath::V3f( _P[0], _P[1], _P[2]) );
                    n->writable().push_back( Imath::V3f( _N[0], _N[1], _N[2]) );
                    c->writable().push_back( Imath::V3f( data[0], data[1], data[2]) );
                    zr->writable().push_back( _radius );
                    zid->writable().push_back( _id );

                    fprintf(_f, "[%g,[%g,%g,%g],[%g,%g,%g,],[%g,%g,%g],%g] \n", _radius, _P[0], _P[1], _P[2], _N[0], _N[1], _N[2], data[0], data[1], data[2], _id );
                    fflush(_f);

                    nsamples++;
#ifdef BRICK2
                    ____p->writable().push_back( Imath::V3f( _P[0], _P[1], _P[2]) );
                    ____n->writable().push_back( Imath::V3f( _N[0], _N[1], _N[2]) );
                    ____c->writable().push_back( Imath::V3f( data[0], data[1], data[2]) );
                    ____zr->writable().push_back( _radius );
                    ____zid->writable().push_back( _id );
#else
                    // if ( result.r + result.g + result.b > 0 )
                    {
                        // std::cout << "\nBUMMMM 4 - " << i << " - " << fCtx.numGrps << " - " << fCtx.shadeCtxs[0] << " - " << fCtx.shadeCtxs[0]->shadingCtxId.IsValid() << "\n" << std::endl; std::cout.flush();

                        // PtcWriteDataPoint(outptc, _P, _N, _radius, data);
                        // std::cout << "\nBUMMMM 5\n" << std::endl; std::cout.flush();


 #ifdef BRICK
                            if( nsamples/100000 != nsamples_old){
                                nsamples_old = nsamples/100000;
                                // IECore::FloatVectorData *__zr  = new IECore::FloatVectorData();
                                // IECore::FloatVectorData *__zid = new IECore::FloatVectorData();
                                // IECore::V3fVectorData *__p   = new IECore::V3fVectorData();
                                // IECore::V3fVectorData *__n   = new IECore::V3fVectorData();
                                // IECore::V3fVectorData *__c   = new IECore::V3fVectorData();
                                //
                                // IECore::PointsPrimitive * tmp = new IECore::PointsPrimitive( p->copy() );
                                //
                                // // for( typename Tree::Iterator it=m_points.begin(); it!=m_points.end(); it++ )
                                // // {
                                // // 	// The nearest neighbour to me should be myself!
                                // // 	BOOST_CHECK( m_tree->nearestNeighbour( *it )==it );
                                // // }
                                //
                                // IECore::InverseDistanceWeightedInterpolationV3fV3f kdtreeC = IECore::InverseDistanceWeightedInterpolationV3fV3f(
                                //     p->readable().begin(),
                                //     p->readable().end(),
                                //     c->readable().begin(),
                                //     c->readable().end(),
                                //     20,
                                //     20
                                // );
                                //
                                // IECore::V3fTree kdtree = IECore::V3fTree(
                                //     p->readable().begin(),
                                //     p->readable().end(),
                                //     4
                                // );
                                //
                                // // create a grid using the bounding box of the collected samples so far,
                                // // with volumeSize voxels.
                                // Imath::Box3f bbox = tmp->bound();
                                // for( float sliceX = 0 ; sliceX < bbox.size().x/volumeSize ; sliceX++ ){
                                //     for( float sliceY = 0 ; sliceY < bbox.size().y/volumeSize ; sliceY++ ){
                                //         for( float sliceZ = 0 ; sliceZ < bbox.size().z/volumeSize ; sliceZ++ ){
                                //             Imath::V3f gridP = Imath::V3f(
                                //                 bbox.min.x+sliceX*volumeSize,
                                //                 bbox.min.y+sliceY*volumeSize,
                                //                 bbox.min.z+sliceZ*volumeSize
                                //             );
                                //             // IMath::PointIterator nearest = kdtree.nearestNNeighbours(gridP);
                                //             IECore::V3fTree::Iterator it = kdtree.nearestNeighbour(gridP);
                                //             if (  (p->readable()[it - p->readable().begin()] - gridP).length() < volumeSize ){
                                //                     __p->writable().push_back( gridP );
                                //                     Imath::V3f gridC = kdtreeC(gridP);
                                //                     __c->writable().push_back( gridC );
                                //                     // std::cout << gridC.x << " " << gridC.y << " " << gridC.z << "\n" << std::endl; std::cout.flush();
                                //             }
                                //         }
                                //     }
                                // }
                                IECore::PointsPrimitive * __ptc = new IECore::PointsPrimitive( p->copy() );
                                // p =  new IECore::V3fVectorData(__p->readable());
                                // c =  new IECore::V3fVectorData(__c->readable());

                                __ptc->variables["N"]     =  IECore::PrimitiveVariable( IECore::PrimitiveVariable::Varying, n->copy() );
                                __ptc->variables["Cs"]    =  IECore::PrimitiveVariable( IECore::PrimitiveVariable::Varying, c->copy() );
                                __ptc->variables["width"] =  IECore::PrimitiveVariable( IECore::PrimitiveVariable::Varying, zr->copy() );
                                __ptc->variables["id"]    =  IECore::PrimitiveVariable( IECore::PrimitiveVariable::Varying, zid->copy() );
 #else
                            if( nsamples/1000 != nsamples_old){
                                nsamples_old = nsamples/1000;
                                IECore::PointsPrimitive * __ptc = new IECore::PointsPrimitive( p->copy() );
                                __ptc->variables["N"]           =  IECore::PrimitiveVariable( IECore::PrimitiveVariable::Varying, n->copy() );
                                __ptc->variables["Cs"]          =  IECore::PrimitiveVariable( IECore::PrimitiveVariable::Varying, c->copy() );
                                __ptc->variables["width"]       =  IECore::PrimitiveVariable( IECore::PrimitiveVariable::Varying, zr->copy() );
                                __ptc->variables["id"]          =  IECore::PrimitiveVariable( IECore::PrimitiveVariable::Varying, zid->copy() );
 #endif
                                std::cout << "writing ptc...\n" << std::endl; std::cout.flush();
                                IECore::Writer::create( __ptc, "/tmp/ptc.cob")->write();
                            }
                    }
#endif
#if defined(BRICK) || defined(BRICK2)
                }
#endif
            }
#ifdef BRICK2
            // if( nsamples/1000000 != nsamples_old){
            //     nsamples_old = nsamples/1000000;
                IECore::InverseDistanceWeightedInterpolationV3fV3f closestPointsAverageColor = IECore::InverseDistanceWeightedInterpolationV3fV3f(
                    ____p->readable().begin(),
                    ____p->readable().end(),
                    ____c->readable().begin(),
                    ____c->readable().end(),
                    20,
                    20
                );

                // IECore::V3fTree kdtree = IECore::V3fTree(
                //     ____p->readable().begin(),
                //     ____p->readable().end(),
                //     4
                // );
                IECore::FloatVectorData *__zr  = new IECore::FloatVectorData();
                IECore::FloatVectorData *__zid = new IECore::FloatVectorData();
                IECore::V3fVectorData *__p   = new IECore::V3fVectorData();
                IECore::V3fVectorData *__n   = new IECore::V3fVectorData();
                IECore::V3fVectorData *__c   = new IECore::V3fVectorData();

                // create a grid using the bounding box of the collected samples so far,
                // with volumeSize voxels.
                Imath::Box3f samplebbox = IECore::PointsPrimitive( ____p ).bound();
                Imath::Box3f bbox = IECore::PointsPrimitive( p ).bound();
                for( float sliceX = 0 ; sliceX < bbox.size().x/volumeSize ; sliceX++ ){
                    for( float sliceY = 0 ; sliceY < bbox.size().y/volumeSize ; sliceY++ ){
                        for( float sliceZ = 0 ; sliceZ < bbox.size().z/volumeSize ; sliceZ++ ){
                            Imath::V3f gridP = Imath::V3f(
                                bbox.min.x+sliceX*volumeSize,
                                bbox.min.y+sliceY*volumeSize,
                                bbox.min.z+sliceZ*volumeSize
                            );
                            if ( samplebbox.intersects(gridP) ){
                                Imath::V3f gridC = closestPointsAverageColor(gridP);
                                __p->writable().push_back( gridP );
                                __c->writable().push_back( gridC );
                                __n->writable().push_back( gridP );
                                __zr->writable().push_back( 0.001 );
                                __zid->writable().push_back( 1.0 );
                                std::cout << sliceX << " " << sliceY << " " << sliceZ <<  std::endl; std::cout.flush();
                            }
                        }
                    }
                }
                std::cout << "writing ptc..."; std::cout.flush();
                IECore::PointsPrimitive * ____ptc = new IECore::PointsPrimitive( __p->copy() );
                ____ptc->variables["N"]           =  IECore::PrimitiveVariable( IECore::PrimitiveVariable::Varying, __n->copy() );
                ____ptc->variables["Cs"]          =  IECore::PrimitiveVariable( IECore::PrimitiveVariable::Varying, __c->copy() );
                ____ptc->variables["width"]       =  IECore::PrimitiveVariable( IECore::PrimitiveVariable::Varying, __zr->copy() );
                ____ptc->variables["id"]          =  IECore::PrimitiveVariable( IECore::PrimitiveVariable::Varying, __zid->copy() );
                IECore::Writer::create( ____ptc, "/tmp/ptc.cob")->write();
                std::cout << "done" << std::endl; std::cout.flush();
            // }
#endif
            m_allWorkersMutex->Unlock();
        }

    }

}

RIX_SAMPLEFILTERCREATE
{
    return new PxrBakeSampleFilter();
}

RIX_SAMPLEFILTERDESTROY
{
    delete reinterpret_cast< PxrBakeSampleFilter * >( filter );
}