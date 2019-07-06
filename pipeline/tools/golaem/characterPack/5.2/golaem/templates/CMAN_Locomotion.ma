//Maya ASCII 2012 scene
//Name: CMAN_LocomotionShape.ma
//Last modified: Thu, Mar 19, 2015 03:52:15 PM
//Codeset: 1252
requires maya "2012";
requires "stereoCamera" "10.0";
requires "glmCrowd" "4.0.2[ab6051b]-2015/03/18";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2012";
fileInfo "version" "2012 x64";
fileInfo "cutIdentifier" "201109261240-811691";
fileInfo "osv" "Microsoft Business Edition, 64-bit  (Build 9200)\n";
createNode transform -n "crowdBehaviors";
createNode transform -n "crowdTriggers" -p "crowdBehaviors";
createNode transform -n "CrowdManLocomotion:beLocomotion1StartTrigger" -p "crowdTriggers";
createNode CrowdBeTrigger -n "CrowdManLocomotion:beLocomotion1StartTriggerShape" 
		-p "CrowdManLocomotion:beLocomotion1StartTrigger";
	setAttr -k off ".v";
	setAttr ".rdc[0]"  0;
	setAttr ".ppc[0]"  0;
	setAttr ".ppn[0]" -type "string" "";
	setAttr ".dac[0]"  0;
	setAttr ".cfc[0]"  0;
	setAttr ".zoc[0]"  0;
	setAttr ".pzc[0]"  0;
	setAttr ".dic[0]"  0;
	setAttr ".btc[0]"  0;
	setAttr ".phc[0]"  0;
	setAttr ".phm[0]"  3;
	setAttr ".scc[0]"  0;
	setAttr ".scm[0]" -type "string" "";
	setAttr ".trc[0]"  1;
	setAttr ".fsc[0]"  0;
	setAttr ".osc" -type "string" "";
createNode transform -n "CrowdManLocomotion:beLocomotion1StopTrigger" -p "crowdTriggers";
createNode CrowdBeTrigger -n "CrowdManLocomotion:beLocomotion1StopTriggerShape" 
		-p "CrowdManLocomotion:beLocomotion1StopTrigger";
	setAttr -k off ".v";
	setAttr ".rdc[0]"  0;
	setAttr ".ppc[0]"  0;
	setAttr ".ppn[0]" -type "string" "";
	setAttr ".dac[0]"  0;
	setAttr ".cfc[0]"  0;
	setAttr ".zoc[0]"  0;
	setAttr ".pzc[0]"  0;
	setAttr ".dic[0]"  0;
	setAttr ".btc[0]"  0;
	setAttr ".phc[0]"  0;
	setAttr ".phm[0]"  3;
	setAttr ".scc[0]"  0;
	setAttr ".scm[0]" -type "string" "";
	setAttr ".trc[0]"  0;
	setAttr ".fsc[0]"  1;
	setAttr ".osc" -type "string" "";
createNode transform -n "CMAN_Locomotion" -p "crowdBehaviors";
createNode CrowdBeContainer -n "CMAN_LocomotionShape" -p "CMAN_Locomotion";
	setAttr -k off ".v";
	setAttr ".bpy" 82;
	setAttr ".fpx" 600;
createNode transform -n "crowdMotionClips" -p "crowdBehaviors";
createNode transform -n "StandClip" -p "crowdMotionClips";
createNode MotionClip -n "Stand" -p "StandClip";
	setAttr -k off ".v";
	setAttr ".mcid" 1;
	setAttr ".gmo" -type "string" "/atomo/pipeline/tools/golaem/characterPack/5.2/crowd/motions/Locomotion/CMAN_Stand.gmo";
	setAttr -l on ".fn" 119;
	setAttr -l on ".fr" 24;
	setAttr -l on ".rot" -type "float3" 1.3784529e-012 0 1.4708235e-012 ;
	setAttr -l on ".rot";
	setAttr -l on ".vl" -type "float3" 2.803633e-013 0 2.9915052e-013 ;
	setAttr -l on ".vl";
	setAttr ".ror" -type "float3" 6.2120209e-018 2.1344334e-007 -3.3350522e-009 ;
	setAttr ".rvl" -type "float3" 1.2634618e-018 4.3412204e-008 -6.7831568e-010 ;
	setAttr -l on ".ic" -type "float3" 0 1 0 ;
	setAttr -l on ".ic";
	setAttr -l on ".il" -type "float3" 0 1 0 ;
	setAttr -l on ".il";
	setAttr -l on ".ili" -type "float3" 0 1 0 ;
	setAttr -l on ".ili";
	setAttr ".hed" -type "float3" 2.8036292e-013 -3.5173402e-022 2.9915068e-013 ;
createNode transform -n "StandOrientLeft45_LeftFootClip" -p "crowdMotionClips";
createNode MotionClip -n "StandOrientLeft45_LeftFoot" -p "StandOrientLeft45_LeftFootClip";
	setAttr -k off ".v";
	setAttr ".mcid" 2;
	setAttr ".gmo" -type "string" "/atomo/pipeline/tools/golaem/characterPack/5.2/crowd/motions/Locomotion/CMAN_StandOrientLeft45_LeftFoot.gmo";
	setAttr -l on ".fn" 31;
	setAttr -l on ".fr" 24;
	setAttr -l on ".rot" -type "float3" 5.2154064e-008 0 2.0489097e-008 ;
	setAttr -l on ".rot";
	setAttr -l on ".vl" -type "float3" 4.1723251e-008 0 1.6391278e-008 ;
	setAttr -l on ".vl";
	setAttr ".ror" -type "float3" 38.500805 0.33329034 -0.89114529 ;
	setAttr ".rvl" -type "float3" 30.800642 0.26663229 -0.71291625 ;
	setAttr -l on ".ic" -type "float3" 0 1 0 ;
	setAttr -l on ".ic";
	setAttr -l on ".il" -type "float3" 0 1 0 ;
	setAttr -l on ".il";
	setAttr -l on ".ili" -type "float3" 0 1 0 ;
	setAttr -l on ".ili";
	setAttr ".hed" -type "float3" 3.7015841e-008 -2.7629229e-012 1.5041744e-008 ;
createNode transform -n "StandOrientLeft90_LeftFootClip" -p "crowdMotionClips";
createNode MotionClip -n "StandOrientLeft90_LeftFoot" -p "StandOrientLeft90_LeftFootClip";
	setAttr -k off ".v";
	setAttr ".mcid" 3;
	setAttr ".gmo" -type "string" "/atomo/pipeline/tools/golaem/characterPack/5.2/crowd/motions/Locomotion/CMAN_StandOrientLeft90_LeftFoot.gmo";
	setAttr -l on ".fn" 31;
	setAttr -l on ".fr" 24;
	setAttr -l on ".rot" -type "float3" -0.020771252 0 -1.1175871e-008 ;
	setAttr -l on ".rot";
	setAttr -l on ".vl" -type "float3" -0.016617002 0 -8.9406971e-009 ;
	setAttr -l on ".vl";
	setAttr ".ror" -type "float3" 79.92041 -1.3191996 -2.6760547 ;
	setAttr ".rvl" -type "float3" 63.936329 -1.0553596 -2.1408439 ;
	setAttr -l on ".ic" -type "float3" 0 1 0 ;
	setAttr -l on ".ic";
	setAttr -l on ".il" -type "float3" 0 1 0 ;
	setAttr -l on ".il";
	setAttr -l on ".ili" -type "float3" 0 1 0 ;
	setAttr -l on ".ili";
	setAttr ".hed" -type "float3" -0.0097516179 1.0181068e-005 -0.00027275042 ;
createNode transform -n "StandOrientLeft135_LeftFootClip" -p "crowdMotionClips";
createNode MotionClip -n "StandOrientLeft135_LeftFoot" -p "StandOrientLeft135_LeftFootClip";
	setAttr -k off ".v";
	setAttr ".mcid" 4;
	setAttr ".gmo" -type "string" "/atomo/pipeline/tools/golaem/characterPack/5.2/crowd/motions/Locomotion/CMAN_StandOrientLeft135_LeftFoot.gmo";
	setAttr -l on ".fn" 31;
	setAttr -l on ".fr" 24;
	setAttr -l on ".rot" -type "float3" 0.093471259 0 0.13501379 ;
	setAttr -l on ".rot";
	setAttr -l on ".vl" -type "float3" 0.074777007 0 0.10801103 ;
	setAttr -l on ".vl";
	setAttr ".ror" -type "float3" 119.94749 -0.96965635 -3.0861912 ;
	setAttr ".rvl" -type "float3" 95.958 -0.77572507 -2.4689529 ;
	setAttr -l on ".ic" -type "float3" 0 1 0 ;
	setAttr -l on ".ic";
	setAttr -l on ".il" -type "float3" 0 1 0 ;
	setAttr -l on ".il";
	setAttr -l on ".ili" -type "float3" 0 1 0 ;
	setAttr -l on ".ili";
	setAttr ".hed" -type "float3" 0.017135222 1.2481906e-009 0.028082043 ;
createNode transform -n "StandOrientLeft180_LeftFootClip" -p "crowdMotionClips";
createNode MotionClip -n "StandOrientLeft180_LeftFoot" -p "StandOrientLeft180_LeftFootClip";
	setAttr -k off ".v";
	setAttr ".mcid" 5;
	setAttr ".gmo" -type "string" "/atomo/pipeline/tools/golaem/characterPack/5.2/crowd/motions/Locomotion/CMAN_StandOrientLeft180_LeftFoot.gmo";
	setAttr -l on ".fn" 57;
	setAttr -l on ".fr" 24;
	setAttr -l on ".rot" -type "float3" 0.12462829 0 -0.051928535 ;
	setAttr -l on ".rot";
	setAttr -l on ".vl" -type "float3" 0.053412121 0 -0.022255085 ;
	setAttr -l on ".vl";
	setAttr ".ror" -type "float3" 179.96841 -4.2138391 -0.85884053 ;
	setAttr ".rvl" -type "float3" 77.129311 -1.8059309 -0.36807451 ;
	setAttr -l on ".ic" -type "float3" 0 1 0 ;
	setAttr -l on ".ic";
	setAttr -l on ".il" -type "float3" 0 1 0 ;
	setAttr -l on ".il";
	setAttr -l on ".ili" -type "float3" 0 1 0 ;
	setAttr -l on ".ili";
	setAttr ".hed" -type "float3" 4.1692863e-010 5.6006383e-010 -2.5940275e-010 ;
createNode transform -n "WalkSlow_LeftfootClip" -p "crowdMotionClips";
createNode MotionClip -n "WalkSlow_Leftfoot" -p "WalkSlow_LeftfootClip";
	setAttr -k off ".v";
	setAttr ".mcid" 6;
	setAttr ".gmo" -type "string" "/atomo/pipeline/tools/golaem/characterPack/5.2/crowd/motions/Locomotion/CMAN_WalkSlow_Leftfoot.gmo";
	setAttr -l on ".fn" 54;
	setAttr -l on ".fr" 24;
	setAttr -l on ".rot" -type "float3" -0.70217568 0 0 ;
	setAttr -l on ".rot";
	setAttr -l on ".vl" -type "float3" -0.31796631 0 0 ;
	setAttr -l on ".vl";
	setAttr ".ror" -type "float3" -0.00059950451 -0.064354867 0.098539665 ;
	setAttr ".rvl" -type "float3" -0.00027147372 -0.029141823 0.044621732 ;
	setAttr -l on ".ic" -type "float3" 0 1 0 ;
	setAttr -l on ".ic";
	setAttr -l on ".il" -type "float3" 0 1 0 ;
	setAttr -l on ".il";
	setAttr -l on ".ili" -type "float3" 0 1 0 ;
	setAttr -l on ".ili";
	setAttr ".hed" -type "float3" -0.31796634 -3.5518358e-006 -3.0595655e-007 ;
createNode transform -n "WalkNormal_LeftfootClip" -p "crowdMotionClips";
createNode MotionClip -n "WalkNormal_Leftfoot" -p "WalkNormal_LeftfootClip";
	setAttr -k off ".v";
	setAttr ".mcid" 7;
	setAttr ".gmo" -type "string" "/atomo/pipeline/tools/golaem/characterPack/5.2/crowd/motions/Locomotion/CMAN_WalkNormal_Leftfoot.gmo";
	setAttr -l on ".fn" 31;
	setAttr -l on ".fr" 24;
	setAttr -l on ".rot" -type "float3" -1.4115177 0 0 ;
	setAttr -l on ".rot";
	setAttr -l on ".vl" -type "float3" -1.1292142 0 0 ;
	setAttr -l on ".vl";
	setAttr ".ror" -type "float3" 3.9756934e-016 -2.1344336e-007 2.1344336e-007 ;
	setAttr ".rvl" -type "float3" 3.1805547e-016 -1.7075469e-007 1.7075469e-007 ;
	setAttr -l on ".ic" -type "float3" 0 1 0 ;
	setAttr -l on ".ic";
	setAttr -l on ".il" -type "float3" 0 1 0 ;
	setAttr -l on ".il";
	setAttr -l on ".ili" -type "float3" 0 1 0 ;
	setAttr -l on ".ili";
	setAttr ".hed" -type "float3" -1.129214 1.1546945e-008 6.4657191e-009 ;
createNode transform -n "WalkFast_LeftfootClip" -p "crowdMotionClips";
createNode MotionClip -n "WalkFast_Leftfoot" -p "WalkFast_LeftfootClip";
	setAttr -k off ".v";
	setAttr ".mcid" 8;
	setAttr ".gmo" -type "string" "/atomo/pipeline/tools/golaem/characterPack/5.2/crowd/motions/Locomotion/CMAN_WalkFast_Leftfoot.gmo";
	setAttr -l on ".fn" 27;
	setAttr -l on ".fr" 24;
	setAttr -l on ".rot" -type "float3" -1.5725996 0 0 ;
	setAttr -l on ".rot";
	setAttr -l on ".vl" -type "float3" -1.4516304 0 0 ;
	setAttr -l on ".vl";
	setAttr ".ror" -type "float3" 3.9756934e-016 -2.1344336e-007 2.1344336e-007 ;
	setAttr ".rvl" -type "float3" 3.6698706e-016 -1.9702463e-007 1.9702463e-007 ;
	setAttr -l on ".ic" -type "float3" 0 1 0 ;
	setAttr -l on ".ic";
	setAttr -l on ".il" -type "float3" 0 1 0 ;
	setAttr -l on ".il";
	setAttr -l on ".ili" -type "float3" 0 1 0 ;
	setAttr -l on ".ili";
	setAttr ".hed" -type "float3" -1.4516301 1.009679e-008 4.083911e-009 ;
createNode transform -n "WalkTurnRight45_LeftFootClip" -p "crowdMotionClips";
createNode MotionClip -n "WalkTurnRight45_LeftFoot" -p "WalkTurnRight45_LeftFootClip";
	setAttr -k off ".v";
	setAttr ".mcid" 9;
	setAttr ".gmo" -type "string" "/atomo/pipeline/tools/golaem/characterPack/5.2/crowd/motions/Locomotion/CMAN_WalkTurnRight45_LeftFoot.gmo";
	setAttr -l on ".fn" 37;
	setAttr -l on ".fr" 24;
	setAttr -l on ".rot" -type "float3" 0.73644066 0 -0.94563055 ;
	setAttr -l on ".rot";
	setAttr -l on ".vl" -type "float3" 0.49096045 0 -0.63042039 ;
	setAttr -l on ".vl";
	setAttr ".ror" -type "float3" -41.792686 2.3707871 -1.9675457 ;
	setAttr ".rvl" -type "float3" -27.861792 1.5805247 -1.3116971 ;
	setAttr -l on ".ic" -type "float3" 0 1 0 ;
	setAttr -l on ".ic";
	setAttr -l on ".il" -type "float3" 0 1 0 ;
	setAttr -l on ".il";
	setAttr -l on ".ili" -type "float3" 0 1 0 ;
	setAttr -l on ".ili";
	setAttr ".hed" -type "float3" 0.42222151 -0.00012535146 -0.55422843 ;
createNode transform -n "WalkTurnRight90_LeftFootClip" -p "crowdMotionClips";
createNode MotionClip -n "WalkTurnRight90_LeftFoot" -p "WalkTurnRight90_LeftFootClip";
	setAttr -k off ".v";
	setAttr ".mcid" 10;
	setAttr ".gmo" -type "string" "/atomo/pipeline/tools/golaem/characterPack/5.2/crowd/motions/Locomotion/CMAN_WalkTurnRight90_LeftFoot.gmo";
	setAttr -l on ".fn" 37;
	setAttr -l on ".fr" 24;
	setAttr -l on ".rot" -type "float3" 0.33423871 0 -0.88622046 ;
	setAttr -l on ".rot";
	setAttr -l on ".vl" -type "float3" 0.22282581 0 -0.59081364 ;
	setAttr -l on ".vl";
	setAttr ".ror" -type "float3" -73.460754 4.9355907 -1.4922906 ;
	setAttr ".rvl" -type "float3" -48.973835 3.2903938 -0.99486041 ;
	setAttr -l on ".ic" -type "float3" 0 1 0 ;
	setAttr -l on ".ic";
	setAttr -l on ".il" -type "float3" 0 1 0 ;
	setAttr -l on ".il";
	setAttr -l on ".ili" -type "float3" 0 1 0 ;
	setAttr -l on ".ili";
	setAttr ".hed" -type "float3" 0.13484441 -0.00042073108 -0.38138556 ;
createNode transform -n "WalkTurnRight135_LeftFootClip" -p "crowdMotionClips";
createNode MotionClip -n "WalkTurnRight135_LeftFoot" -p "WalkTurnRight135_LeftFootClip";
	setAttr -k off ".v";
	setAttr ".mcid" 11;
	setAttr ".gmo" -type "string" "/atomo/pipeline/tools/golaem/characterPack/5.2/crowd/motions/Locomotion/CMAN_WalkTurnRight135_LeftFoot.gmo";
	setAttr -l on ".fn" 35;
	setAttr -l on ".fr" 24;
	setAttr -l on ".rot" -type "float3" 0.57104135 0 -0.15126705 ;
	setAttr -l on ".rot";
	setAttr -l on ".vl" -type "float3" 0.40308797 0 -0.10677674 ;
	setAttr -l on ".vl";
	setAttr ".ror" -type "float3" -105.10561 5.3777766 -12.391813 ;
	setAttr ".rvl" -type "float3" -74.192192 3.7960775 -8.7471619 ;
	setAttr -l on ".ic" -type "float3" 0 1 0 ;
	setAttr -l on ".ic";
	setAttr -l on ".il" -type "float3" 0 1 0 ;
	setAttr -l on ".il";
	setAttr -l on ".ili" -type "float3" 0 1 0 ;
	setAttr -l on ".ili";
	setAttr ".hed" -type "float3" 0.14350349 -5.4004409e-005 -0.044102773 ;
createNode transform -n "WalkTurnRight180_LeftFootClip" -p "crowdMotionClips";
createNode MotionClip -n "WalkTurnRight180_LeftFoot" -p "WalkTurnRight180_LeftFootClip";
	setAttr -k off ".v";
	setAttr ".mcid" 12;
	setAttr ".gmo" -type "string" "/atomo/pipeline/tools/golaem/characterPack/5.2/crowd/motions/Locomotion/CMAN_WalkTurnRight180_LeftFoot.gmo";
	setAttr -l on ".fn" 32;
	setAttr -l on ".fr" 24;
	setAttr -l on ".rot" -type "float3" 0.23533964 0 -1.2039217e-007 ;
	setAttr -l on ".rot";
	setAttr -l on ".vl" -type "float3" 0.18219842 0 -9.3206836e-008 ;
	setAttr -l on ".vl";
	setAttr ".ror" -type "float3" -179.67018 9.895505 -3.8085349 ;
	setAttr ".rvl" -type "float3" -139.09949 7.6610355 -2.9485431 ;
	setAttr -l on ".ic" -type "float3" 0 1 0 ;
	setAttr -l on ".ic";
	setAttr -l on ".il" -type "float3" 0 1 0 ;
	setAttr -l on ".il";
	setAttr -l on ".ili" -type "float3" 0 1 0 ;
	setAttr -l on ".ili";
	setAttr ".hed" -type "float3" 2.1601152e-009 -4.5990536e-009 2.3885005e-010 ;
createNode transform -n "CrowdManLocomotion:crowdBehaviors";
createNode transform -n "CrowdManLocomotion:beLocomotion1" -p "CrowdManLocomotion:crowdBehaviors";
createNode CrowdBeLocomotion -n "CrowdManLocomotion:beLocomotionShape1" -p "CrowdManLocomotion:beLocomotion1";
	setAttr -k off ".v";
	setAttr ".bpx" 406;
	setAttr ".bpy" 210;
	setAttr -s 13 ".mcp";
	setAttr -s 13 ".gms";
	setAttr ".gms[12:16]" 1.3 1 1 1 1;
	setAttr -s 13 ".gmi";
	setAttr ".gmi[1]" 2;
	setAttr ".gmi[3]" 2;
	setAttr ".gmi[6:7]" 2 2;
	setAttr ".gmi[9:16]" 0 0 0 0 2 2 2 2;
	setAttr ".mmm" 2;
	setAttr ".gmm[0]" -type "string" "/atomo/pipeline/tools/golaem/characterPack/5.2/crowd_sample/characters/crowdMan_replay_CMAN.gmm";
select -ne :time1;
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".o" 1;
	setAttr -av ".unw" 1;
select -ne :renderPartition;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 3 ".st";
	setAttr -cb on ".an";
	setAttr -cb on ".pt";
lockNode -l 1 ;
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
	setAttr ".ro" yes;
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
	setAttr ".ro" yes;
select -ne :defaultShaderList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 2 ".s";
select -ne :postProcessList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 2 ".p";
select -ne :defaultRenderingList1;
select -ne :renderGlobalsList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
select -ne :defaultResolution;
	setAttr -av -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -k on ".bnm";
	setAttr -av ".w";
	setAttr -av ".h";
	setAttr -av -k on ".pa" 1;
	setAttr -av -k on ".al";
	setAttr -av ".dar";
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
	setAttr -av -k on ".bcr";
	setAttr -av -k on ".bcg";
	setAttr -av -k on ".bcb";
	setAttr -k on ".ei";
	setAttr -k on ".ex";
	setAttr -av -k on ".es";
	setAttr -av -k on ".ef";
	setAttr -av -k on ".bf";
	setAttr -k on ".fii";
	setAttr -av -k on ".sf";
	setAttr -k on ".gr";
	setAttr -k on ".li";
	setAttr -k on ".ls";
	setAttr -k on ".mb";
	setAttr -k on ".ti";
	setAttr -k on ".txt";
	setAttr -k on ".mpr";
	setAttr -k on ".wzd";
	setAttr ".fn" -type "string" "im";
	setAttr -k on ".if";
	setAttr ".res" -type "string" "ntsc_4d 646 485 1.333";
	setAttr -k on ".as";
	setAttr -k on ".ds";
	setAttr -k on ".lm";
	setAttr -k on ".fir";
	setAttr -k on ".aap";
	setAttr -k on ".gh";
	setAttr -cb on ".sd";
connectAttr "CrowdManLocomotion:beLocomotionShape1.nb" "CMAN_LocomotionShape.fb[0]"
		;
connectAttr "CrowdManLocomotion:beLocomotion1StartTriggerShape.msg" "CrowdManLocomotion:beLocomotionShape1.istat"
		;
connectAttr "CrowdManLocomotion:beLocomotion1StopTriggerShape.msg" "CrowdManLocomotion:beLocomotionShape1.istot"
		;
connectAttr "CMAN_LocomotionShape.chb" "CrowdManLocomotion:beLocomotionShape1.pb"
		;
connectAttr "CMAN_LocomotionShape.ib" "CrowdManLocomotion:beLocomotionShape1.prb[0]"
		;
connectAttr "Stand.msg" "CrowdManLocomotion:beLocomotionShape1.mcp[0]";
connectAttr "StandOrientLeft45_LeftFoot.msg" "CrowdManLocomotion:beLocomotionShape1.mcp[1]"
		;
connectAttr "StandOrientLeft90_LeftFoot.msg" "CrowdManLocomotion:beLocomotionShape1.mcp[3]"
		;
connectAttr "StandOrientLeft135_LeftFoot.msg" "CrowdManLocomotion:beLocomotionShape1.mcp[6]"
		;
connectAttr "StandOrientLeft180_LeftFoot.msg" "CrowdManLocomotion:beLocomotionShape1.mcp[7]"
		;
connectAttr "WalkSlow_Leftfoot.msg" "CrowdManLocomotion:beLocomotionShape1.mcp[9]"
		;
connectAttr "WalkNormal_Leftfoot.msg" "CrowdManLocomotion:beLocomotionShape1.mcp[10]"
		;
connectAttr "WalkFast_Leftfoot.msg" "CrowdManLocomotion:beLocomotionShape1.mcp[11]"
		;
connectAttr "WalkFast_Leftfoot.msg" "CrowdManLocomotion:beLocomotionShape1.mcp[12]"
		;
connectAttr "WalkTurnRight45_LeftFoot.msg" "CrowdManLocomotion:beLocomotionShape1.mcp[13]"
		;
connectAttr "WalkTurnRight90_LeftFoot.msg" "CrowdManLocomotion:beLocomotionShape1.mcp[14]"
		;
connectAttr "WalkTurnRight135_LeftFoot.msg" "CrowdManLocomotion:beLocomotionShape1.mcp[15]"
		;
connectAttr "WalkTurnRight180_LeftFoot.msg" "CrowdManLocomotion:beLocomotionShape1.mcp[16]"
		;
// End of CMAN_LocomotionShape.ma
