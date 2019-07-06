//Maya ASCII 2014 scene
//Name: special_paint_carPaint.ma
//Last modified: Mon, Feb 16, 2015 11:14:26 AM
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
createNode transform -n "group1";
createNode place3dTexture -n "car_paint:place3dTexture2" -p "group1";
	setAttr ".s" -type "double3" 0.55 0.55 0.55 ;
createNode place3dTexture -n "car_paint:place3dTexture3" -p "group1";
	setAttr ".t" -type "double3" 0 0 9.4300798812854545 ;
	setAttr ".s" -type "double3" 0.85 0.85 0.85 ;
createNode place3dTexture -n "car_paint:place3dTexture4" -p "group1";
	setAttr ".t" -type "double3" 0 0 -32.518687359713205 ;
	setAttr ".s" -type "double3" 0.85 0.85 0.85 ;
createNode place3dTexture -n "car_paint:place3dTexture5" -p "group1";
	setAttr ".t" -type "double3" 0 0 -16.321153322202328 ;
	setAttr ".s" -type "double3" 0.47 0.47 0.47 ;
createNode PxrLMMetal -n "PxrLMMetalCarPaint";
	setAttr ".eta" -type "float3" 1.6574579 0.88036698 0.52122903 ;
	setAttr ".kappa" -type "float3" 9.2238741 6.2695212 4.8370152 ;
	setAttr ".roughness" 0.20000000298023224;
createNode partition -n "mtorPartition";
	addAttr -ci true -sn "rgcnx" -ln "rgcnx" -at "message";
	addAttr -ci true -sn "sd" -ln "slimData" -dt "string";
	addAttr -ci true -sn "sr" -ln "slimRIB" -dt "string";
	addAttr -ci true -sn "rd" -ln "rlfData" -dt "string";
	setAttr ".sr" -type "string" "";
createNode PxrBump -n "car_paint:PxrBump4";
	setAttr ".scale" 0.20224718749523163;
createNode PxrFlakes -n "car_paint:PxrFlakes1";
	setAttr ".flakeAmount" 1;
	setAttr ".flakeFreq" 52.808990478515625;
	setAttr ".size" 0.64999997615814209;
	setAttr ".jitter" 0.95505619049072266;
createNode PxrLMLayer -n "car_paint:PxrLMLayer1";
	setAttr ".diffuseRoughness" 0.2584269642829895;
	setAttr ".specularBehavior" no;
	setAttr ".specularRoughness" 0.019999999552965164;
	setAttr ".clearcoatBehavior" yes;
	setAttr ".clearcoatColor" -type "float3" 0.93300003 0.93300003 0.93300003 ;
	setAttr ".clearcoatEta" 1.3999999761581421;
	setAttr ".clearcoatRoughness" 0.05000000074505806;
	setAttr ".clearcoatThickness" 0.10000000149011612;
createNode PxrBlend -n "car_paint:PxrBlend5";
	setAttr ".topRGB" -type "float3" 0 1 1 ;
	setAttr ".bottomRGB" -type "float3" 0.79183382 0.87099999 0.16636099 ;
createNode PxrFacingRatio -n "car_paint:PxrFacingRatio1";
	setAttr ".gamma" 0.7415730357170105;
createNode PxrSeExpr -n "car_paint:PxrSeExpr1";
	setAttr ".expression" -type "string" "result = ((colorInput1*0.5) + (0.5*colorInput2));\nresult";
createNode multiplyDivide -n "car_paint:multiplyDivide5";
createNode multiplyDivide -n "car_paint:multiplyDivide3";
createNode PxrFacingRatio -n "car_paint:PxrFacingRatio2";
	setAttr ".gamma" 0.044943820685148239;
createNode gammaCorrect -n "car_paint:gammaCorrect4";
	setAttr ".g" -type "float3" 0.5 0.5 0.5 ;
createNode PxrInvert -n "car_paint:PxrInvert2";
createNode gammaCorrect -n "gammaCorrect6";
	setAttr ".g" -type "float3" 5 5 5 ;
createNode blendColors -n "car_paint:blendColors2";
createNode granite -n "car_paint:granite4";
	setAttr ".c1" -type "float3" 0.55284965 0.55284965 0.55284965 ;
	setAttr ".c2" -type "float3" 0.82113373 0.82113373 0.82113373 ;
	setAttr ".c3" -type "float3" 0.60163271 0.60163271 0.60163271 ;
	setAttr ".fc" -type "float3" 0 0 0 ;
	setAttr ".cs" 0.13008129596710205;
	setAttr ".mr" 0.69918698072433472;
	setAttr ".s" 0.39024388790130615;
	setAttr ".th" 0.4065040647983551;
	setAttr ".c" no;
createNode granite -n "car_paint:granite5";
	setAttr ".c1" -type "float3" 0.55284965 0.55284965 0.55284965 ;
	setAttr ".c2" -type "float3" 0.82113373 0.82113373 0.82113373 ;
	setAttr ".c3" -type "float3" 0.60163271 0.60163271 0.60163271 ;
	setAttr ".fc" -type "float3" 0 0 0 ;
	setAttr ".cs" 0.13008129596710205;
	setAttr ".mr" 0.69918698072433472;
	setAttr ".s" 0.39024388790130615;
	setAttr ".th" 0.4065040647983551;
	setAttr ".c" no;
createNode multiplyDivide -n "car_paint:multiplyDivide4";
createNode gammaCorrect -n "car_paint:gammaCorrect5";
	setAttr ".g" -type "float3" 0.5 0.5 0.5 ;
createNode PxrInvert -n "car_paint:PxrInvert3";
createNode gammaCorrect -n "car_paint:gammaCorrect6";
	setAttr ".g" -type "float3" 5 5 5 ;
createNode blendColors -n "car_paint:blendColors1";
createNode granite -n "car_paint:granite2";
	setAttr ".c1" -type "float3" 0.55284965 0.55284965 0.55284965 ;
	setAttr ".c2" -type "float3" 0.82113373 0.82113373 0.82113373 ;
	setAttr ".c3" -type "float3" 0.60163271 0.60163271 0.60163271 ;
	setAttr ".fc" -type "float3" 0 0 0 ;
	setAttr ".cs" 0.13008129596710205;
	setAttr ".mr" 0.69918698072433472;
	setAttr ".s" 0.39024388790130615;
	setAttr ".th" 0.4065040647983551;
	setAttr ".c" no;
createNode granite -n "car_paint:granite3";
	setAttr ".c1" -type "float3" 0.55284965 0.55284965 0.55284965 ;
	setAttr ".c2" -type "float3" 0.82113373 0.82113373 0.82113373 ;
	setAttr ".c3" -type "float3" 0.60163271 0.60163271 0.60163271 ;
	setAttr ".fc" -type "float3" 0 0 0 ;
	setAttr ".cs" 0.13008129596710205;
	setAttr ".mr" 0.69918698072433472;
	setAttr ".s" 0.39024388790130615;
	setAttr ".th" 0.4065040647983551;
	setAttr ".c" no;
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
	setAttr -s 2 ".st";
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
	setAttr -s 3 ".s";
select -ne :defaultTextureList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 12 ".tx";
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
	setAttr -s 13 ".u";
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
	setAttr -k on ".edl";
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
	setAttr ".w" 720;
	setAttr ".h" 720;
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
connectAttr "car_paint:PxrBump4.resultN" "PxrLMMetalCarPaint.bumpNormal";
connectAttr "car_paint:PxrLMLayer1.result" "PxrLMMetalCarPaint.lmlayer";
connectAttr "car_paint:PxrSeExpr1.resultRGB" "PxrLMMetalCarPaint.specularColor";
connectAttr ":defaultRenderGlobals.msg" "mtorPartition.rgcnx";
connectAttr "car_paint:PxrFlakes1.resultA" "car_paint:PxrBump4.inputBump";
connectAttr "car_paint:PxrBlend5.resultRGB" "car_paint:PxrLMLayer1.diffuseColor"
		;
connectAttr "car_paint:PxrFacingRatio1.resultF" "car_paint:PxrBlend5.topA";
connectAttr "car_paint:multiplyDivide5.o" "car_paint:PxrSeExpr1.colorInput1";
connectAttr "car_paint:multiplyDivide4.o" "car_paint:PxrSeExpr1.colorInput2";
connectAttr "car_paint:multiplyDivide3.o" "car_paint:multiplyDivide5.i1";
connectAttr "car_paint:gammaCorrect4.o" "car_paint:multiplyDivide5.i2";
connectAttr "car_paint:PxrFacingRatio2.resultF" "car_paint:multiplyDivide3.i1x";
connectAttr "car_paint:PxrFacingRatio2.resultF" "car_paint:multiplyDivide3.i1y";
connectAttr "car_paint:PxrFacingRatio2.resultF" "car_paint:multiplyDivide3.i1z";
connectAttr "car_paint:PxrInvert2.resultRGB" "car_paint:gammaCorrect4.v";
connectAttr "gammaCorrect6.o" "car_paint:PxrInvert2.inputRGB";
connectAttr "car_paint:blendColors2.op" "gammaCorrect6.v";
connectAttr "car_paint:granite4.oc" "car_paint:blendColors2.c1";
connectAttr "car_paint:granite5.oc" "car_paint:blendColors2.c2";
connectAttr "car_paint:place3dTexture4.wim" "car_paint:granite4.pm";
connectAttr "car_paint:place3dTexture5.wim" "car_paint:granite5.pm";
connectAttr "car_paint:multiplyDivide3.o" "car_paint:multiplyDivide4.i1";
connectAttr "car_paint:gammaCorrect5.o" "car_paint:multiplyDivide4.i2";
connectAttr "car_paint:PxrInvert3.resultRGB" "car_paint:gammaCorrect5.v";
connectAttr "car_paint:gammaCorrect6.o" "car_paint:PxrInvert3.inputRGB";
connectAttr "car_paint:blendColors1.op" "car_paint:gammaCorrect6.v";
connectAttr "car_paint:granite2.oc" "car_paint:blendColors1.c1";
connectAttr "car_paint:granite3.oc" "car_paint:blendColors1.c2";
connectAttr "car_paint:place3dTexture2.wim" "car_paint:granite2.pm";
connectAttr "car_paint:place3dTexture3.wim" "car_paint:granite3.pm";
connectAttr "PxrLMMetalCarPaint.msg" ":defaultShaderList1.s" -na;
connectAttr "car_paint:granite2.msg" ":defaultTextureList1.tx" -na;
connectAttr "car_paint:granite3.msg" ":defaultTextureList1.tx" -na;
connectAttr "car_paint:granite4.msg" ":defaultTextureList1.tx" -na;
connectAttr "car_paint:granite5.msg" ":defaultTextureList1.tx" -na;
connectAttr "car_paint:PxrFacingRatio1.msg" ":defaultTextureList1.tx" -na;
connectAttr "car_paint:PxrBlend5.msg" ":defaultTextureList1.tx" -na;
connectAttr "car_paint:PxrFacingRatio2.msg" ":defaultTextureList1.tx" -na;
connectAttr "car_paint:PxrFlakes1.msg" ":defaultTextureList1.tx" -na;
connectAttr "car_paint:PxrBump4.msg" ":defaultTextureList1.tx" -na;
connectAttr "car_paint:PxrInvert2.msg" ":defaultTextureList1.tx" -na;
connectAttr "car_paint:PxrInvert3.msg" ":defaultTextureList1.tx" -na;
connectAttr "car_paint:PxrSeExpr1.msg" ":defaultTextureList1.tx" -na;
connectAttr "car_paint:place3dTexture2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "car_paint:place3dTexture3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "car_paint:place3dTexture4.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "car_paint:place3dTexture5.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "car_paint:blendColors1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "car_paint:blendColors2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "car_paint:gammaCorrect4.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "car_paint:gammaCorrect5.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "car_paint:gammaCorrect6.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "car_paint:multiplyDivide3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "car_paint:multiplyDivide4.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "car_paint:multiplyDivide5.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "gammaCorrect6.msg" ":defaultRenderUtilityList1.u" -na;
// End of special_paint_carPaint.ma
