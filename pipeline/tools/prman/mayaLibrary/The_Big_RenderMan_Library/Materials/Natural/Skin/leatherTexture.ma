//Maya ASCII 2014 scene
//Name: leatherTexture.ma
//Last modified: Fri, Feb 20, 2015 03:19:36 AM
//Codeset: 1252
requires maya "2014";
requires -nodeType "RenderMan" -nodeType "RenderManEnvLightShape" -nodeType "RenderManArchive"
		 -nodeType "RenderManVolume" -nodeType "RenderManLight" -nodeType "RenderManShaderObject"
		 -nodeType "RenderManDisplacement" -nodeType "RenderManShader" -nodeType "PxrLMLayer"
		 -nodeType "PxrLMMixer" -nodeType "PxrOSL" -nodeType "PxrWorley" -nodeType "rmanAOV"
		 -nodeType "RMSLightBlocker" -nodeType "PxrFractal" -nodeType "PxrSkin" -nodeType "PxrTangentField"
		 -nodeType "rmanSideMask" -nodeType "PxrPtexture" -nodeType "PxrProjectionStack" -nodeType "PxrSeExpr"
		 -nodeType "PxrRoundCube" -nodeType "RMSGIPtcLight" -nodeType "RMSMeshLight" -nodeType "RMSGeoLightBlocker"
		 -nodeType "PxrManifold3D" -nodeType "PxrToFloat" -nodeType "PxrCross" -nodeType "rmanDayLight"
		 -nodeType "PxrGlass" -nodeType "PxrDiffuse" -nodeType "rmanPrimVarFloat3" -nodeType "RMSGILight"
		 -nodeType "RMSHair" -nodeType "PxrAttribute" -nodeType "PxrInvert" -nodeType "PxrVoronoise"
		 -nodeType "rmanPrimVarColor" -nodeType "PxrLMGlass" -nodeType "PxrManifold3DN" -nodeType "rmanPrimVarPoint"
		 -nodeType "PxrNormalMap" -nodeType "PxrLMDiffuse" -nodeType "PxrHSL" -nodeType "RMSMatte"
		 -nodeType "PxrLMSubsurface" -nodeType "PxrProjector" -nodeType "PxrToFloat3" -nodeType "RMSCausticLight"
		 -nodeType "rmanTexture3d" -nodeType "PxrBxdfBlend" -nodeType "RMSDisplacement" -nodeType "PxrLMPlastic"
		 -nodeType "PxrPrimvar" -nodeType "PxrThreshold" -nodeType "PxrMix" -nodeType "rmanCellNoise"
		 -nodeType "rmanWorleyTexture" -nodeType "PxrProjectionLayer" -nodeType "PxrVary"
		 -nodeType "PxrClamp" -nodeType "PxrFractalize" -nodeType "rmanManifold3d" -nodeType "PxrTexture"
		 -nodeType "RMSAreaLight" -nodeType "RMSAreaLightManip" -nodeType "rmanPrimVarFloat2"
		 -nodeType "PxrFlakes" -nodeType "rmanPrimVarNormal" -nodeType "PxrDisney" -nodeType "RMSPointLight"
		 -nodeType "PxrLMMetal" -nodeType "PxrBlend" -nodeType "RMSOcean" -nodeType "PxrBlackBody"
		 -nodeType "rmanPrimVarFloat" -nodeType "RMSGPSurface" -nodeType "rmanManifold2d"
		 -nodeType "rmanPrimVarVector" -nodeType "PxrDot" -nodeType "PxrLightEmission" -nodeType "RMSShaveHair"
		 -nodeType "PxrVolume" -nodeType "PxrConstant" -nodeType "PxrBump" -nodeType "RMSGeoAreaLight"
		 -nodeType "RMSGeoAreaLightManip" -nodeType "PxrRemap" -nodeType "RMSEnvLight" -nodeType "rmanWaveletNoise3d"
		 -nodeType "RMSGlass" -nodeType "PxrExposure" -nodeType "PxrFacingRatio" -nodeType "RMSHoldOut"
		 -nodeType "PxrGamma" -nodeType "rmanImageFile" -nodeType "rmanOcclusion" -nodeType "PxrManifold2D"
		 -nodeType "PxrRamp" -nodeType "PxrMatteID" -nodeType "PxrThinFilm" -nodeType "PxrHair"
		 "RenderMan_for_Maya" "5.5";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2014";
fileInfo "version" "2014 x64";
fileInfo "cutIdentifier" "201303010241-864206";
fileInfo "osv" "Microsoft Windows 8 Business Edition, 64-bit  (Build 9200)\n";
createNode shadingEngine -n "leatherTexture:PxrLMPlasticLeather1SG";
	setAttr ".ihi" 0;
	setAttr -s 4 ".dsm";
	setAttr ".ro" yes;
createNode partition -n "mtorPartition";
	addAttr -ci true -sn "rgcnx" -ln "rgcnx" -at "message";
	addAttr -ci true -sn "sd" -ln "slimData" -dt "string";
	addAttr -ci true -sn "sr" -ln "slimRIB" -dt "string";
	addAttr -ci true -sn "rd" -ln "rlfData" -dt "string";
	setAttr ".sr" -type "string" "";
createNode materialInfo -n "leatherTexture:materialInfo33";
createNode PxrLMPlastic -n "leatherTexture:PxrLMPlasticLeather1";
	setAttr ".diffuseRoughness" 0.38202247023582458;
	setAttr ".sheen" -type "float3" 1 0.6398319 0.48299998 ;
	setAttr ".specularRoughness" 0.23595505952835083;
createNode file -n "leatherTexture:file7";
	addAttr -ci true -h true -sn "rman__tx2dFilter" -ln "rman__tx2dFilter" -dt "string";
	addAttr -ci true -k true -sn "rman__tx2dSwidth" -ln "rman__tx2dSwidth" -dv -1 -smn 
		0 -smx 1 -at "float";
	addAttr -ci true -k true -sn "rman__tx2dTwidth" -ln "rman__tx2dTwidth" -dv -1 -smn 
		0 -smx 1 -at "float";
	addAttr -ci true -k true -sn "rman__tx2dLerp" -ln "rman__tx2dLerp" -dv -1 -at "float";
	addAttr -ci true -k true -sn "rman__applysRGB" -ln "rman__applysRGB" -dv -1 -at "float";
	addAttr -ci true -h true -sn "rman__udim" -ln "rman__udim" -dt "string";
	addAttr -ci true -k true -sn "rman__unpremultiply" -ln "rman__unpremultiply" -dv 
		-1 -at "float";
	setAttr ".ftn" -type "string" "D:/pixar/deliverables/shaderSwatch//sourceimages/Leather_02_Color.tif";
	setAttr ".rman__tx2dFilter" -type "string" "unspecified";
	setAttr -k on ".rman__tx2dSwidth" 1;
	setAttr -k on ".rman__tx2dTwidth" 1;
	setAttr -k on ".rman__tx2dLerp" 0;
	setAttr -k on ".rman__applysRGB" 1;
	setAttr ".rman__udim" -type "string" "none";
	setAttr -k on ".rman__unpremultiply" 0;
createNode place2dTexture -n "leatherTexture:place2dTexture22";
	setAttr ".re" -type "float2" 10 10 ;
createNode PxrGamma -n "leatherTexture:PxrGamma7";
	setAttr ".gamma" 0.35955056548118591;
createNode file -n "leatherTexture:file8";
	setAttr ".ail" yes;
	setAttr ".ao" -0.5;
	setAttr ".ftn" -type "string" "D:/pixar/deliverables/shaderSwatch//sourceimages/Leather_02_Disp.tif";
createNode RMSDisplacement -n "leatherTexture:RMSDisplacement6";
	setAttr ".sphere" 0.10000000149011612;
	setAttr ".displacementAmount" 0.019999999552965164;
createNode lightLinker -s -n "lightLinker1";
	setAttr -s 10 ".lnk";
	setAttr -s 10 ".slnk";
select -ne :time1;
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".o" 1;
	setAttr -av ".unw" 1;
select -ne :renderPartition;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 10 ".st";
	setAttr -cb on ".an";
	setAttr -cb on ".pt";
select -ne :initialShadingGroup;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".mwc";
	setAttr -cb on ".an";
	setAttr -cb on ".il";
	setAttr -cb on ".vo";
	setAttr -cb on ".eo";
	setAttr -cb on ".fo";
	setAttr -cb on ".epo";
	setAttr -k on ".ro" yes;
select -ne :initialParticleSE;
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".mwc";
	setAttr -cb on ".an";
	setAttr -cb on ".il";
	setAttr -cb on ".vo";
	setAttr -cb on ".eo";
	setAttr -cb on ".fo";
	setAttr -cb on ".epo";
	setAttr -k on ".ro" yes;
select -ne :defaultShaderList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 9 ".s";
select -ne :defaultTextureList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 11 ".tx";
select -ne :lightList1;
	setAttr -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 2 ".l";
select -ne :postProcessList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 9 ".u";
select -ne :defaultRenderingList1;
select -ne :renderGlobalsList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
select -ne :defaultRenderGlobals;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".macc";
	setAttr -k on ".macd";
	setAttr -k on ".macq";
	setAttr -k on ".mcfr";
	setAttr -cb on ".ifg";
	setAttr -k on ".clip";
	setAttr -k on ".edm";
	setAttr -k on ".edl" no;
	setAttr -cb on ".ren" -type "string" "renderManRIS";
	setAttr -av -k on ".esr";
	setAttr -k on ".ors";
	setAttr -cb on ".sdf";
	setAttr -av -k on ".outf";
	setAttr -k on ".imfkey";
	setAttr -k on ".gama";
	setAttr -k on ".an";
	setAttr -cb on ".ar";
	setAttr -k on ".fs";
	setAttr -k on ".ef";
	setAttr -av -k on ".bfs";
	setAttr -cb on ".me";
	setAttr -cb on ".se";
	setAttr -k on ".be";
	setAttr -cb on ".ep";
	setAttr -k on ".fec";
	setAttr -k on ".ofc";
	setAttr -cb on ".ofe";
	setAttr -cb on ".efe";
	setAttr -cb on ".oft";
	setAttr -cb on ".umfn";
	setAttr -cb on ".ufe";
	setAttr -cb on ".pff";
	setAttr -k on ".peie";
	setAttr -cb on ".ifp";
	setAttr -k on ".comp";
	setAttr -k on ".cth";
	setAttr -k on ".soll";
	setAttr -cb on ".sosl";
	setAttr -k on ".rd";
	setAttr -k on ".lp";
	setAttr -av -k on ".sp";
	setAttr -k on ".shs";
	setAttr -k on ".lpr";
	setAttr -cb on ".gv";
	setAttr -cb on ".sv";
	setAttr -k on ".mm";
	setAttr -k on ".npu";
	setAttr -k on ".itf";
	setAttr -k on ".shp";
	setAttr -cb on ".isp";
	setAttr -k on ".uf";
	setAttr -k on ".oi";
	setAttr -k on ".rut";
	setAttr -cb on ".mb";
	setAttr -av -k on ".mbf";
	setAttr -k on ".afp";
	setAttr -k on ".pfb";
	setAttr -k on ".pram";
	setAttr -k on ".poam";
	setAttr -k on ".prlm";
	setAttr -k on ".polm";
	setAttr -cb on ".prm";
	setAttr -cb on ".pom";
	setAttr -cb on ".pfrm";
	setAttr -cb on ".pfom";
	setAttr -av -k on ".bll";
	setAttr -av -k on ".bls";
	setAttr -av -k on ".smv";
	setAttr -k on ".ubc";
	setAttr -k on ".mbc";
	setAttr -cb on ".mbt";
	setAttr -k on ".udbx";
	setAttr -k on ".smc";
	setAttr -k on ".kmv";
	setAttr -cb on ".isl";
	setAttr -cb on ".ism";
	setAttr -cb on ".imb";
	setAttr -k on ".rlen";
	setAttr -av -k on ".frts";
	setAttr -k on ".tlwd";
	setAttr -k on ".tlht";
	setAttr -k on ".jfc";
	setAttr -cb on ".rsb";
	setAttr -k on ".ope";
	setAttr -k on ".oppf";
	setAttr -cb on ".hbl";
select -ne :defaultResolution;
	setAttr -av -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -k on ".bnm";
	setAttr ".w" 1024;
	setAttr ".h" 1024;
	setAttr -av -k on ".pa" 1;
	setAttr -av -k on ".al" yes;
	setAttr -av ".dar" 1;
	setAttr -av -k on ".ldar";
	setAttr -k on ".dpi";
	setAttr -av -k on ".off";
	setAttr -av -k on ".fld";
	setAttr -av -k on ".zsl";
	setAttr -k on ".isu";
	setAttr -k on ".pdu";
select -ne :defaultLightSet;
	setAttr -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -k on ".bnm";
	setAttr -s 2 ".dsm";
	setAttr -k on ".mwc";
	setAttr -k on ".an";
	setAttr -k on ".il";
	setAttr -k on ".vo";
	setAttr -k on ".eo";
	setAttr -k on ".fo";
	setAttr -k on ".epo";
	setAttr -k on ".ro" yes;
select -ne :defaultObjectSet;
	setAttr -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -k on ".nds";
	setAttr -k on ".bnm";
	setAttr -k on ".mwc";
	setAttr -k on ".an";
	setAttr -k on ".il";
	setAttr -k on ".vo";
	setAttr -k on ".eo";
	setAttr -k on ".fo";
	setAttr -k on ".epo";
	setAttr ".ro" yes;
select -ne :hardwareRenderGlobals;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr ".ctrs" 256;
	setAttr -av ".btrs" 512;
	setAttr -k off ".fbfm";
	setAttr -k off -cb on ".ehql";
	setAttr -k off -cb on ".eams";
	setAttr -k off -cb on ".eeaa";
	setAttr -k off -cb on ".engm";
	setAttr -k off -cb on ".mes";
	setAttr -k off -cb on ".emb";
	setAttr -av -k off -cb on ".mbbf";
	setAttr -k off -cb on ".mbs";
	setAttr -k off -cb on ".trm";
	setAttr -k off -cb on ".tshc";
	setAttr -k off ".enpt";
	setAttr -k off -cb on ".clmt";
	setAttr -k off -cb on ".tcov";
	setAttr -k off -cb on ".lith";
	setAttr -k off -cb on ".sobc";
	setAttr -k off -cb on ".cuth";
	setAttr -k off -cb on ".hgcd";
	setAttr -k off -cb on ".hgci";
	setAttr -k off -cb on ".mgcs";
	setAttr -k off -cb on ".twa";
	setAttr -k off -cb on ".twz";
	setAttr -k on ".hwcc";
	setAttr -k on ".hwdp";
	setAttr -k on ".hwql";
	setAttr -k on ".hwfr";
	setAttr -k on ".soll";
	setAttr -k on ".sosl";
	setAttr -k on ".bswa";
	setAttr -k on ".shml";
	setAttr -k on ".hwel";
select -ne :hardwareRenderingGlobals;
	setAttr ".otfna" -type "stringArray" 18 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surfaces" "Particles" "Fluids" "Image Planes" "UI:" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 18 0 1 1 1 1 1
		 1 0 0 0 0 0 0 0 0 0 0 0 ;
select -ne :defaultHardwareRenderGlobals;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -av -k on ".rp";
	setAttr -k on ".cai";
	setAttr -k on ".coi";
	setAttr -cb on ".bc";
	setAttr -av -k on ".bcb";
	setAttr -av -k on ".bcg";
	setAttr -av -k on ".bcr";
	setAttr -k on ".ei";
	setAttr -av -k on ".ex";
	setAttr -av -k on ".es";
	setAttr -av -k on ".ef";
	setAttr -av -k on ".bf";
	setAttr -k on ".fii";
	setAttr -av -k on ".sf";
	setAttr -k on ".gr";
	setAttr -k on ".li";
	setAttr -k on ".ls";
	setAttr -av -k on ".mb";
	setAttr -k on ".ti";
	setAttr -k on ".txt";
	setAttr -k on ".mpr";
	setAttr -k on ".wzd";
	setAttr -k on ".fn" -type "string" "im";
	setAttr -k on ".if";
	setAttr -k on ".res" -type "string" "ntsc_4d 646 485 1.333";
	setAttr -k on ".as";
	setAttr -k on ".ds";
	setAttr -k on ".lm";
	setAttr -av -k on ".fir";
	setAttr -k on ".aap";
	setAttr -av -k on ".gh";
	setAttr -cb on ".sd";
connectAttr "leatherTexture:PxrLMPlasticLeather1.oc" "leatherTexture:PxrLMPlasticLeather1SG.ss"
		;
connectAttr "leatherTexture:RMSDisplacement6.oc" "leatherTexture:PxrLMPlasticLeather1SG.ds"
		;
connectAttr "teapotBaseShape.iog" "leatherTexture:PxrLMPlasticLeather1SG.dsm" -na
		;
connectAttr "teapotLidShape.iog" "leatherTexture:PxrLMPlasticLeather1SG.dsm" -na
		;
connectAttr "teapotLegsShape.iog" "leatherTexture:PxrLMPlasticLeather1SG.dsm" -na
		;
connectAttr "teapotBodyShape.iog" "leatherTexture:PxrLMPlasticLeather1SG.dsm" -na
		;
connectAttr ":defaultRenderGlobals.msg" "mtorPartition.rgcnx";
connectAttr "leatherTexture:PxrLMPlasticLeather1SG.msg" "leatherTexture:materialInfo33.sg"
		;
connectAttr "leatherTexture:PxrLMPlasticLeather1.msg" "leatherTexture:materialInfo33.m"
		;
connectAttr "leatherTexture:PxrLMPlasticLeather1.msg" "leatherTexture:materialInfo33.t"
		 -na;
connectAttr "leatherTexture:file7.oc" "leatherTexture:PxrLMPlasticLeather1.diffuseColor"
		;
connectAttr "leatherTexture:PxrGamma7.resultRGB" "leatherTexture:PxrLMPlasticLeather1.specularColor"
		;
connectAttr "leatherTexture:place2dTexture22.c" "leatherTexture:file7.c";
connectAttr "leatherTexture:place2dTexture22.tf" "leatherTexture:file7.tf";
connectAttr "leatherTexture:place2dTexture22.rf" "leatherTexture:file7.rf";
connectAttr "leatherTexture:place2dTexture22.mu" "leatherTexture:file7.mu";
connectAttr "leatherTexture:place2dTexture22.mv" "leatherTexture:file7.mv";
connectAttr "leatherTexture:place2dTexture22.s" "leatherTexture:file7.s";
connectAttr "leatherTexture:place2dTexture22.wu" "leatherTexture:file7.wu";
connectAttr "leatherTexture:place2dTexture22.wv" "leatherTexture:file7.wv";
connectAttr "leatherTexture:place2dTexture22.re" "leatherTexture:file7.re";
connectAttr "leatherTexture:place2dTexture22.of" "leatherTexture:file7.of";
connectAttr "leatherTexture:place2dTexture22.r" "leatherTexture:file7.ro";
connectAttr "leatherTexture:place2dTexture22.n" "leatherTexture:file7.n";
connectAttr "leatherTexture:place2dTexture22.vt1" "leatherTexture:file7.vt1";
connectAttr "leatherTexture:place2dTexture22.vt2" "leatherTexture:file7.vt2";
connectAttr "leatherTexture:place2dTexture22.vt3" "leatherTexture:file7.vt3";
connectAttr "leatherTexture:place2dTexture22.vc1" "leatherTexture:file7.vc1";
connectAttr "leatherTexture:place2dTexture22.o" "leatherTexture:file7.uv";
connectAttr "leatherTexture:place2dTexture22.ofs" "leatherTexture:file7.fs";
connectAttr "leatherTexture:file8.oc" "leatherTexture:PxrGamma7.inputRGB";
connectAttr "leatherTexture:place2dTexture22.c" "leatherTexture:file8.c";
connectAttr "leatherTexture:place2dTexture22.tf" "leatherTexture:file8.tf";
connectAttr "leatherTexture:place2dTexture22.rf" "leatherTexture:file8.rf";
connectAttr "leatherTexture:place2dTexture22.mu" "leatherTexture:file8.mu";
connectAttr "leatherTexture:place2dTexture22.mv" "leatherTexture:file8.mv";
connectAttr "leatherTexture:place2dTexture22.s" "leatherTexture:file8.s";
connectAttr "leatherTexture:place2dTexture22.wu" "leatherTexture:file8.wu";
connectAttr "leatherTexture:place2dTexture22.wv" "leatherTexture:file8.wv";
connectAttr "leatherTexture:place2dTexture22.re" "leatherTexture:file8.re";
connectAttr "leatherTexture:place2dTexture22.of" "leatherTexture:file8.of";
connectAttr "leatherTexture:place2dTexture22.r" "leatherTexture:file8.ro";
connectAttr "leatherTexture:place2dTexture22.n" "leatherTexture:file8.n";
connectAttr "leatherTexture:place2dTexture22.vt1" "leatherTexture:file8.vt1";
connectAttr "leatherTexture:place2dTexture22.vt2" "leatherTexture:file8.vt2";
connectAttr "leatherTexture:place2dTexture22.vt3" "leatherTexture:file8.vt3";
connectAttr "leatherTexture:place2dTexture22.vc1" "leatherTexture:file8.vc1";
connectAttr "leatherTexture:place2dTexture22.o" "leatherTexture:file8.uv";
connectAttr "leatherTexture:place2dTexture22.ofs" "leatherTexture:file8.fs";
connectAttr "leatherTexture:file8.oa" "leatherTexture:RMSDisplacement6.displacementScalar"
		;
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "leatherTexture:PxrLMPlasticLeather1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "leatherTexture:PxrLMPlasticLeather1SG.message" ":defaultLightSet.message";
connectAttr "leatherTexture:PxrLMPlasticLeather1SG.pa" ":renderPartition.st" -na;
connectAttr "leatherTexture:PxrLMPlasticLeather1.msg" ":defaultShaderList1.s" -na
		;
connectAttr "leatherTexture:RMSDisplacement6.msg" ":defaultShaderList1.s" -na;
connectAttr "leatherTexture:file7.msg" ":defaultTextureList1.tx" -na;
connectAttr "leatherTexture:file8.msg" ":defaultTextureList1.tx" -na;
connectAttr "leatherTexture:PxrGamma7.msg" ":defaultTextureList1.tx" -na;
connectAttr "leatherTexture:place2dTexture22.msg" ":defaultRenderUtilityList1.u"
		 -na;
// End of leatherTexture.ma
