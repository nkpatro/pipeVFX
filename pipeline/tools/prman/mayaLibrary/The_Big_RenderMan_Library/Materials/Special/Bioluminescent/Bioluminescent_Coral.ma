//Maya ASCII 2014 scene
//Name: bioLumCoral.ma
//Last modified: Mon, Mar 16, 2015 06:49:34 AM
//Codeset: 1252
requires maya "2014";
requires -nodeType "mentalrayFramebuffer" -nodeType "mentalrayOutputPass" -nodeType "mentalrayRenderPass"
		 -nodeType "mentalrayUserBuffer" -nodeType "mentalraySubdivApprox" -nodeType "mentalrayCurveApprox"
		 -nodeType "mentalraySurfaceApprox" -nodeType "mentalrayDisplaceApprox" -nodeType "mentalrayOptions"
		 -nodeType "mentalrayGlobals" -nodeType "mentalrayItemsList" -nodeType "mentalrayShader"
		 -nodeType "mentalrayUserData" -nodeType "mentalrayText" -nodeType "mentalrayTessellation"
		 -nodeType "mentalrayPhenomenon" -nodeType "mentalrayLightProfile" -nodeType "mentalrayVertexColors"
		 -nodeType "mentalrayIblShape" -nodeType "mapVizShape" -nodeType "mentalrayCCMeshProxy"
		 -nodeType "cylindricalLightLocator" -nodeType "discLightLocator" -nodeType "rectangularLightLocator"
		 -nodeType "sphericalLightLocator" -nodeType "abcimport" -nodeType "mia_physicalsun"
		 -nodeType "mia_physicalsky" -nodeType "mia_material" -nodeType "mia_material_x" -nodeType "mia_roundcorners"
		 -nodeType "mia_exposure_simple" -nodeType "mia_portal_light" -nodeType "mia_light_surface"
		 -nodeType "mia_exposure_photographic" -nodeType "mia_exposure_photographic_rev" -nodeType "mia_lens_bokeh"
		 -nodeType "mia_envblur" -nodeType "mia_ciesky" -nodeType "mia_photometric_light"
		 -nodeType "mib_texture_vector" -nodeType "mib_texture_remap" -nodeType "mib_texture_rotate"
		 -nodeType "mib_bump_basis" -nodeType "mib_bump_map" -nodeType "mib_passthrough_bump_map"
		 -nodeType "mib_bump_map2" -nodeType "mib_lookup_spherical" -nodeType "mib_lookup_cube1"
		 -nodeType "mib_lookup_cube6" -nodeType "mib_lookup_background" -nodeType "mib_lookup_cylindrical"
		 -nodeType "mib_texture_lookup" -nodeType "mib_texture_lookup2" -nodeType "mib_texture_filter_lookup"
		 -nodeType "mib_texture_checkerboard" -nodeType "mib_texture_polkadot" -nodeType "mib_texture_polkasphere"
		 -nodeType "mib_texture_turbulence" -nodeType "mib_texture_wave" -nodeType "mib_reflect"
		 -nodeType "mib_refract" -nodeType "mib_transparency" -nodeType "mib_continue" -nodeType "mib_opacity"
		 -nodeType "mib_twosided" -nodeType "mib_refraction_index" -nodeType "mib_dielectric"
		 -nodeType "mib_ray_marcher" -nodeType "mib_illum_lambert" -nodeType "mib_illum_phong"
		 -nodeType "mib_illum_ward" -nodeType "mib_illum_ward_deriv" -nodeType "mib_illum_blinn"
		 -nodeType "mib_illum_cooktorr" -nodeType "mib_illum_hair" -nodeType "mib_volume"
		 -nodeType "mib_color_alpha" -nodeType "mib_color_average" -nodeType "mib_color_intensity"
		 -nodeType "mib_color_interpolate" -nodeType "mib_color_mix" -nodeType "mib_color_spread"
		 -nodeType "mib_geo_cube" -nodeType "mib_geo_torus" -nodeType "mib_geo_sphere" -nodeType "mib_geo_cone"
		 -nodeType "mib_geo_cylinder" -nodeType "mib_geo_square" -nodeType "mib_geo_instance"
		 -nodeType "mib_geo_instance_mlist" -nodeType "mib_geo_add_uv_texsurf" -nodeType "mib_photon_basic"
		 -nodeType "mib_light_infinite" -nodeType "mib_light_point" -nodeType "mib_light_spot"
		 -nodeType "mib_light_photometric" -nodeType "mib_cie_d" -nodeType "mib_blackbody"
		 -nodeType "mib_shadow_transparency" -nodeType "mib_lens_stencil" -nodeType "mib_lens_clamp"
		 -nodeType "mib_lightmap_write" -nodeType "mib_lightmap_sample" -nodeType "mib_amb_occlusion"
		 -nodeType "mib_fast_occlusion" -nodeType "mib_map_get_scalar" -nodeType "mib_map_get_integer"
		 -nodeType "mib_map_get_vector" -nodeType "mib_map_get_color" -nodeType "mib_map_get_transform"
		 -nodeType "mib_map_get_scalar_array" -nodeType "mib_map_get_integer_array" -nodeType "mib_fg_occlusion"
		 -nodeType "mib_bent_normal_env" -nodeType "mib_glossy_reflection" -nodeType "mib_glossy_refraction"
		 -nodeType "builtin_bsdf_architectural" -nodeType "builtin_bsdf_architectural_comp"
		 -nodeType "builtin_bsdf_carpaint" -nodeType "builtin_bsdf_ashikhmin" -nodeType "builtin_bsdf_lambert"
		 -nodeType "builtin_bsdf_mirror" -nodeType "builtin_bsdf_phong" -nodeType "contour_store_function"
		 -nodeType "contour_store_function_simple" -nodeType "contour_contrast_function_levels"
		 -nodeType "contour_contrast_function_simple" -nodeType "contour_shader_simple" -nodeType "contour_shader_silhouette"
		 -nodeType "contour_shader_maxcolor" -nodeType "contour_shader_curvature" -nodeType "contour_shader_factorcolor"
		 -nodeType "contour_shader_depthfade" -nodeType "contour_shader_framefade" -nodeType "contour_shader_layerthinner"
		 -nodeType "contour_shader_widthfromcolor" -nodeType "contour_shader_widthfromlightdir"
		 -nodeType "contour_shader_widthfromlight" -nodeType "contour_shader_combi" -nodeType "contour_only"
		 -nodeType "contour_composite" -nodeType "contour_ps" -nodeType "mi_metallic_paint"
		 -nodeType "mi_metallic_paint_x" -nodeType "mi_bump_flakes" -nodeType "mi_car_paint_phen"
		 -nodeType "mi_metallic_paint_output_mixer" -nodeType "mi_car_paint_phen_x" -nodeType "physical_lens_dof"
		 -nodeType "physical_light" -nodeType "dgs_material" -nodeType "dgs_material_photon"
		 -nodeType "dielectric_material" -nodeType "dielectric_material_photon" -nodeType "oversampling_lens"
		 -nodeType "path_material" -nodeType "parti_volume" -nodeType "parti_volume_photon"
		 -nodeType "transmat" -nodeType "transmat_photon" -nodeType "mip_rayswitch" -nodeType "mip_rayswitch_advanced"
		 -nodeType "mip_rayswitch_environment" -nodeType "mip_card_opacity" -nodeType "mip_motionblur"
		 -nodeType "mip_motion_vector" -nodeType "mip_matteshadow" -nodeType "mip_cameramap"
		 -nodeType "mip_mirrorball" -nodeType "mip_grayball" -nodeType "mip_gamma_gain" -nodeType "mip_render_subset"
		 -nodeType "mip_matteshadow_mtl" -nodeType "mip_binaryproxy" -nodeType "mip_rayswitch_stage"
		 -nodeType "mip_fgshooter" -nodeType "mib_ptex_lookup" -nodeType "misss_physical"
		 -nodeType "misss_physical_phen" -nodeType "misss_fast_shader" -nodeType "misss_fast_shader_x"
		 -nodeType "misss_fast_shader2" -nodeType "misss_fast_shader2_x" -nodeType "misss_skin_specular"
		 -nodeType "misss_lightmap_write" -nodeType "misss_lambert_gamma" -nodeType "misss_call_shader"
		 -nodeType "misss_set_normal" -nodeType "misss_fast_lmap_maya" -nodeType "misss_fast_simple_maya"
		 -nodeType "misss_fast_skin_maya" -nodeType "misss_fast_skin_phen" -nodeType "misss_fast_skin_phen_d"
		 -nodeType "misss_mia_skin2_phen" -nodeType "misss_mia_skin2_phen_d" -nodeType "misss_lightmap_phen"
		 -nodeType "misss_mia_skin2_surface_phen" -nodeType "surfaceSampler" -nodeType "mib_data_bool"
		 -nodeType "mib_data_int" -nodeType "mib_data_scalar" -nodeType "mib_data_vector"
		 -nodeType "mib_data_color" -nodeType "mib_data_string" -nodeType "mib_data_texture"
		 -nodeType "mib_data_shader" -nodeType "mib_data_bool_array" -nodeType "mib_data_int_array"
		 -nodeType "mib_data_scalar_array" -nodeType "mib_data_vector_array" -nodeType "mib_data_color_array"
		 -nodeType "mib_data_string_array" -nodeType "mib_data_texture_array" -nodeType "mib_data_shader_array"
		 -nodeType "mib_data_get_bool" -nodeType "mib_data_get_int" -nodeType "mib_data_get_scalar"
		 -nodeType "mib_data_get_vector" -nodeType "mib_data_get_color" -nodeType "mib_data_get_string"
		 -nodeType "mib_data_get_texture" -nodeType "mib_data_get_shader" -nodeType "mib_data_get_shader_bool"
		 -nodeType "mib_data_get_shader_int" -nodeType "mib_data_get_shader_scalar" -nodeType "mib_data_get_shader_vector"
		 -nodeType "mib_data_get_shader_color" -nodeType "user_ibl_env" -nodeType "user_ibl_rect"
		 -nodeType "mia_material_x_passes" -nodeType "mi_metallic_paint_x_passes" -nodeType "mi_car_paint_phen_x_passes"
		 -nodeType "misss_fast_shader_x_passes" -dataType "byteArray" "Mayatomr" "2014.0 - 3.11.1.4 ";
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
createNode shadingEngine -n "bioLumCoral:PxrLMPlasticBiolumCoralSG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode partition -n "mtorPartition";
	addAttr -ci true -sn "rgcnx" -ln "rgcnx" -at "message";
	addAttr -ci true -sn "sd" -ln "slimData" -dt "string";
	addAttr -ci true -sn "sr" -ln "slimRIB" -dt "string";
	addAttr -ci true -sn "rd" -ln "rlfData" -dt "string";
	setAttr ".sr" -type "string" "";
createNode materialInfo -n "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:materialInfo86";
createNode PxrLMPlastic -n "bioLumCoral:PxrLMPlasticBiolumCoral";
	setAttr ".sheen" -type "float3" 1 1 1 ;
	setAttr ".specularColor" -type "float3" 1 1 1 ;
	setAttr ".specularRoughness" 0.12359550595283508;
	setAttr ".clearcoatColor" -type "float3" 1 1 1 ;
	setAttr ".clearcoatEta" 1.3250000476837158;
	setAttr ".clearcoatThickness" 0.39325842261314392;
createNode ramp -n "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:ramp12";
	setAttr ".ao" -0.5;
	setAttr ".t" 4;
	setAttr ".in" 4;
	setAttr -s 10 ".cel";
	setAttr ".cel[0].ep" 0.079999998211860657;
	setAttr ".cel[0].ec" -type "float3" 0.40120003 0.68000001 0.48264679 ;
	setAttr ".cel[1].ep" 0.5;
	setAttr ".cel[2].ep" 0.625;
	setAttr ".cel[2].ec" -type "float3" 0.016000001 0.01832035 0.025 ;
	setAttr ".cel[3].ep" 0.35499998927116394;
	setAttr ".cel[3].ec" -type "float3" 0.061200004 0.0686424 0.090000004 ;
	setAttr ".cel[4].ep" 0.2800000011920929;
	setAttr ".cel[4].ec" -type "float3" 0.33099997 1 0.52643716 ;
	setAttr ".cel[5].ep" 0.98500001430511475;
	setAttr ".cel[5].ec" -type "float3" 0.013893 0.018827382 0.033 ;
	setAttr ".cel[6].ep" 0.18500000238418579;
	setAttr ".cel[6].ec" -type "float3" 0.15200001 1 0.68557572 ;
	setAttr ".cel[7].ep" 0.73000001907348633;
	setAttr ".cel[8].ep" 0.88499999046325684;
	setAttr ".cel[8].ec" -type "float3" 0.013893 0.018827382 0.033 ;
	setAttr ".cel[9].ep" 0;
	setAttr ".cel[9].ec" -type "float3" 0.0152666 0.0179254 0.0255762 ;
	setAttr ".n" 0.18699187040328979;
	setAttr ".nf" 0.081300809979438782;
createNode place2dTexture -n "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:place2dTexture12";
	setAttr ".re" -type "float2" 30 30 ;
createNode ramp -n "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:ramp13";
	setAttr ".ao" -0.5;
	setAttr ".t" 3;
	setAttr ".in" 6;
	setAttr -s 21 ".cel";
	setAttr ".cel[0].ep" 0;
	setAttr ".cel[0].ec" -type "float3" 0.03305104 0.03305104 0.03305104 ;
	setAttr ".cel[1].ep" 0.69999998807907104;
	setAttr ".cel[1].ec" -type "float3" 0.015660003 0.034870699 0.090000004 ;
	setAttr ".cel[2].ep" 0.80000001192092896;
	setAttr ".cel[2].ec" -type "float3" 0.015660003 0.034870699 0.090000004 ;
	setAttr ".cel[3].ep" 1;
	setAttr ".cel[3].ec" -type "float3" 0.057846952 0.057846952 0.057846952 ;
	setAttr ".cel[4].ep" 0.60000002384185791;
	setAttr ".cel[4].ec" -type "float3" 0.015660003 0.034870699 0.090000004 ;
	setAttr ".cel[5].ep" 0.5;
	setAttr ".cel[5].ec" -type "float3" 0.015660003 0.034870699 0.090000004 ;
	setAttr ".cel[6].ep" 0.40000000596046448;
	setAttr ".cel[6].ec" -type "float3" 0 0 0 ;
	setAttr ".cel[7].ep" 0.30000001192092896;
	setAttr ".cel[7].ec" -type "float3" 0.015660003 0.034870699 0.090000004 ;
	setAttr ".cel[8].ep" 0.20000000298023224;
	setAttr ".cel[8].ec" -type "float3" 0.015660003 0.034870699 0.090000004 ;
	setAttr ".cel[9].ep" 0.89999997615814209;
	setAttr ".cel[9].ec" -type "float3" 0.015660003 0.034870699 0.090000004 ;
	setAttr ".cel[10].ep" 0.10000000149011612;
	setAttr ".cel[10].ec" -type "float3" 0.015660003 0.034870699 0.090000004 ;
	setAttr ".cel[11].ep" 0.94999998807907104;
	setAttr ".cel[11].ec" -type "float3" 0.87099999 0.90433574 1 ;
	setAttr ".cel[12].ep" 0.85000002384185791;
	setAttr ".cel[12].ec" -type "float3" 0.87099999 0.90433574 1 ;
	setAttr ".cel[13].ep" 0.75;
	setAttr ".cel[13].ec" -type "float3" 0.89899999 0.92510009 1 ;
	setAttr ".cel[14].ep" 0.64999997615814209;
	setAttr ".cel[14].ec" -type "float3" 0.74199998 0.80867147 1 ;
	setAttr ".cel[15].ep" 0.55000001192092896;
	setAttr ".cel[15].ec" -type "float3" 0.86000001 0.89617831 1 ;
	setAttr ".cel[16].ep" 0.44999998807907104;
	setAttr ".cel[16].ec" -type "float3" 0.83099997 0.87467241 1 ;
	setAttr ".cel[17].ep" 0.34999999403953552;
	setAttr ".cel[17].ec" -type "float3" 0.74199998 0.80867147 1 ;
	setAttr ".cel[18].ep" 0.25;
	setAttr ".cel[18].ec" -type "float3" 0.815 0.8628071 1 ;
	setAttr ".cel[19].ep" 0.15000000596046448;
	setAttr ".cel[19].ec" -type "float3" 0.79799998 0.85020018 1 ;
	setAttr ".cel[20].ep" 0.05000000074505806;
	setAttr ".cel[20].ec" -type "float3" 0.81184 0.84599233 0.94400001 ;
createNode ramp -n "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:ramp14";
	setAttr ".ao" -0.5;
	setAttr ".t" 4;
	setAttr ".in" 4;
	setAttr -s 10 ".cel";
	setAttr ".cel[3].ep" 0.36500000953674316;
	setAttr ".cel[3].ec" -type "float3" 0 0 0 ;
	setAttr ".cel[4].ep" 0.23999999463558197;
	setAttr ".cel[4].ec" -type "float3" 0 1 0.29213333 ;
	setAttr ".cel[5].ep" 0;
	setAttr ".cel[5].ec" -type "float3" 0 0 0 ;
	setAttr ".cel[6].ep" 0.094999998807907104;
	setAttr ".cel[6].ec" -type "float3" 0 1 0.32583332 ;
	setAttr ".cel[7].ep" 0.73000001907348633;
	setAttr ".cel[8].ep" 0.625;
	setAttr ".cel[8].ec" -type "float3" 0 0 0 ;
	setAttr ".cel[9].ep" 0.83499997854232788;
	setAttr ".cel[9].ec" -type "float3" 0 0 0 ;
	setAttr ".cel[10].ep" 0.5;
	setAttr ".cel[11].ep" 0.42500001192092896;
	setAttr ".cel[11].ec" -type "float3" 0 0 0 ;
	setAttr ".cel[12].ep" 0.57999998331069946;
	setAttr ".cel[12].ec" -type "float3" 0 0 0 ;
	setAttr ".n" 0.18699187040328979;
	setAttr ".nf" 0.081300809979438782;
createNode ramp -n "bioLumCoral:Harsh_20150315_1359:ramp13";
	setAttr ".ao" -0.5;
	setAttr ".t" 3;
	setAttr ".in" 6;
	setAttr -s 21 ".cel";
	setAttr ".cel[0].ep" 0;
	setAttr ".cel[0].ec" -type "float3" 0.03305104 0.03305104 0.03305104 ;
	setAttr ".cel[1].ep" 0.69999998807907104;
	setAttr ".cel[1].ec" -type "float3" 0.015660003 0.034870699 0.090000004 ;
	setAttr ".cel[2].ep" 0.80000001192092896;
	setAttr ".cel[2].ec" -type "float3" 0.015660003 0.034870699 0.090000004 ;
	setAttr ".cel[3].ep" 1;
	setAttr ".cel[3].ec" -type "float3" 0.057846952 0.057846952 0.057846952 ;
	setAttr ".cel[4].ep" 0.60000002384185791;
	setAttr ".cel[4].ec" -type "float3" 0.015660003 0.034870699 0.090000004 ;
	setAttr ".cel[5].ep" 0.5;
	setAttr ".cel[5].ec" -type "float3" 0.015660003 0.034870699 0.090000004 ;
	setAttr ".cel[6].ep" 0.40000000596046448;
	setAttr ".cel[6].ec" -type "float3" 0 0 0 ;
	setAttr ".cel[7].ep" 0.30000001192092896;
	setAttr ".cel[7].ec" -type "float3" 0.015660003 0.034870699 0.090000004 ;
	setAttr ".cel[8].ep" 0.20000000298023224;
	setAttr ".cel[8].ec" -type "float3" 0.015660003 0.034870699 0.090000004 ;
	setAttr ".cel[9].ep" 0.89999997615814209;
	setAttr ".cel[9].ec" -type "float3" 0.015660003 0.034870699 0.090000004 ;
	setAttr ".cel[10].ep" 0.10000000149011612;
	setAttr ".cel[10].ec" -type "float3" 0.015660003 0.034870699 0.090000004 ;
	setAttr ".cel[11].ep" 0.94999998807907104;
	setAttr ".cel[11].ec" -type "float3" 0.035996031 0.037369344 0.04132143 ;
	setAttr ".cel[12].ep" 0.85000002384185791;
	setAttr ".cel[12].ec" -type "float3" 0.043183032 0.044846267 0.049591821 ;
	setAttr ".cel[13].ep" 0.75;
	setAttr ".cel[13].ec" -type "float3" 0.074296176 0.076462962 0.082642861 ;
	setAttr ".cel[14].ep" 0.64999997615814209;
	setAttr ".cel[14].ec" -type "float3" 0.018402381 0.020050354 0.02479591 ;
	setAttr ".cel[15].ep" 0.55000001192092896;
	setAttr ".cel[15].ec" -type "float3" 0.035553522 0.037048906 0.04132143 ;
	setAttr ".cel[16].ep" 0.44999998807907104;
	setAttr ".cel[16].ec" -type "float3" 0.054932479 0.057831693 0.066117339 ;
	setAttr ".cel[17].ep" 0.34999999403953552;
	setAttr ".cel[17].ec" -type "float3" 0.036789503 0.040100709 0.049591821 ;
	setAttr ".cel[18].ep" 0.25;
	setAttr ".cel[18].ec" -type "float3" 0.040421151 0.042786296 0.049591821 ;
	setAttr ".cel[19].ep" 0.15000000596046448;
	setAttr ".cel[19].ec" -type "float3" 0.05941863 0.063263908 0.074387729 ;
	setAttr ".cel[20].ep" 0.05000000074505806;
	setAttr ".cel[20].ec" -type "float3" 0.035523005 0.037048906 0.04132143 ;
createNode place2dTexture -n "bioLumCoral:Harsh_20150315_1359:place2dTexture12";
	setAttr ".re" -type "float2" 30 30 ;
createNode PxrBump -n "bioLumCoral:PxrBump1";
	setAttr ".scale" 0.15000000596046448;
createNode noise -n "bioLumCoral:noise1";
	setAttr ".ail" yes;
	setAttr ".a" 0.91452991962432861;
	setAttr ".th" 0.059829059988260269;
	setAttr ".dm" 4;
	setAttr ".fq" 53.846153259277344;
	setAttr ".sp" 0.89743590354919434;
	setAttr ".sr" 0.8461538553237915;
	setAttr ".fof" 3;
createNode place2dTexture -n "bioLumCoral:place2dTexture1";
createNode RMSDisplacement -n "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:RMSDisplacement4";
	setAttr ".sphere" 0.10000000149011612;
	setAttr ".displacementAmount" 0.029999999329447746;
	setAttr ".displacementCenter" 0;
createNode ramp -n "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:ramp10";
	setAttr ".t" 4;
	setAttr ".in" 4;
	setAttr -s 11 ".cel";
	setAttr ".cel[0].ep" 0.079999998211860657;
	setAttr ".cel[0].ec" -type "float3" 0 0 0 ;
	setAttr ".cel[1].ep" 0.5;
	setAttr ".cel[2].ep" 0.625;
	setAttr ".cel[2].ec" -type "float3" 0.56198978 0.56198978 0.56198978 ;
	setAttr ".cel[3].ep" 0.35499998927116394;
	setAttr ".cel[3].ec" -type "float3" 0.28099489 0.28099489 0.28099489 ;
	setAttr ".cel[4].ep" 0.28499999642372131;
	setAttr ".cel[4].ec" -type "float3" 1 1 1 ;
	setAttr ".cel[5].ep" 1;
	setAttr ".cel[5].ec" -type "float3" 0 0 0 ;
	setAttr ".cel[6].ep" 0.18500000238418579;
	setAttr ".cel[6].ec" -type "float3" 0.146447 0.146447 0.146447 ;
	setAttr ".cel[7].ep" 0.039999999105930328;
	setAttr ".cel[7].ec" -type "float3" 0.974262 0.974262 0.974262 ;
	setAttr ".cel[8].ep" 0.88499999046325684;
	setAttr ".cel[8].ec" -type "float3" 0.11570916 0.11570916 0.11570916 ;
	setAttr ".cel[9].ep" 0;
	setAttr ".cel[9].ec" -type "float3" 0.0127234 0.0127234 0.0127234 ;
	setAttr ".cel[10].ep" 0.73000001907348633;
	setAttr ".n" 0.18699187040328979;
	setAttr ".nf" 0.081300809979438782;
createNode ramp -n "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:ramp11";
	setAttr ".t" 3;
	setAttr ".in" 5;
	setAttr -s 21 ".cel";
	setAttr ".cel[0].ep" 0;
	setAttr ".cel[0].ec" -type "float3" 0 0 0 ;
	setAttr ".cel[1].ep" 0.69999998807907104;
	setAttr ".cel[1].ec" -type "float3" 0 0 0 ;
	setAttr ".cel[2].ep" 0.80000001192092896;
	setAttr ".cel[2].ec" -type "float3" 0 0 0 ;
	setAttr ".cel[3].ep" 1;
	setAttr ".cel[3].ec" -type "float3" 0 0 0 ;
	setAttr ".cel[4].ep" 0.60000002384185791;
	setAttr ".cel[4].ec" -type "float3" 0 0 0 ;
	setAttr ".cel[5].ep" 0.5;
	setAttr ".cel[5].ec" -type "float3" 0 0 0 ;
	setAttr ".cel[6].ep" 0.40000000596046448;
	setAttr ".cel[6].ec" -type "float3" 0 0 0 ;
	setAttr ".cel[7].ep" 0.30000001192092896;
	setAttr ".cel[7].ec" -type "float3" 0 0 0 ;
	setAttr ".cel[8].ep" 0.20000000298023224;
	setAttr ".cel[8].ec" -type "float3" 0 0 0 ;
	setAttr ".cel[9].ep" 0.89999997615814209;
	setAttr ".cel[9].ec" -type "float3" 0 0 0 ;
	setAttr ".cel[10].ep" 0.10000000149011612;
	setAttr ".cel[10].ec" -type "float3" 0 0 0 ;
	setAttr ".cel[11].ep" 0.94999998807907104;
	setAttr ".cel[11].ec" -type "float3" 1 1 1 ;
	setAttr ".cel[12].ep" 0.85000002384185791;
	setAttr ".cel[12].ec" -type "float3" 1 1 1 ;
	setAttr ".cel[13].ep" 0.75;
	setAttr ".cel[13].ec" -type "float3" 1 1 1 ;
	setAttr ".cel[14].ep" 0.64999997615814209;
	setAttr ".cel[14].ec" -type "float3" 1 1 1 ;
	setAttr ".cel[15].ep" 0.55000001192092896;
	setAttr ".cel[15].ec" -type "float3" 1 1 1 ;
	setAttr ".cel[16].ep" 0.44999998807907104;
	setAttr ".cel[16].ec" -type "float3" 1 1 1 ;
	setAttr ".cel[17].ep" 0.34999999403953552;
	setAttr ".cel[17].ec" -type "float3" 1 1 1 ;
	setAttr ".cel[18].ep" 0.25;
	setAttr ".cel[18].ec" -type "float3" 1 1 1 ;
	setAttr ".cel[19].ep" 0.15000000596046448;
	setAttr ".cel[19].ec" -type "float3" 1 1 1 ;
	setAttr ".cel[20].ep" 0.05000000074505806;
	setAttr ".cel[20].ec" -type "float3" 1 1 1 ;
createNode lightLinker -s -n "lightLinker1";
	setAttr -s 38 ".lnk";
	setAttr -s 38 ".slnk";
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
	setAttr -s 38 ".st";
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
	setAttr -k on ".ro" yes;
	setAttr -cb on ".mimt";
	setAttr -cb on ".miop";
	setAttr -k on ".mico";
	setAttr -cb on ".mise";
	setAttr -cb on ".mism";
	setAttr -cb on ".mice";
	setAttr -av -cb on ".micc";
	setAttr -k on ".micr";
	setAttr -k on ".micg";
	setAttr -k on ".micb";
	setAttr -cb on ".mica";
	setAttr -cb on ".micw";
	setAttr -cb on ".mirw";
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
	setAttr -cb on ".mimt";
	setAttr -cb on ".miop";
	setAttr -k on ".mico";
	setAttr -cb on ".mise";
	setAttr -cb on ".mism";
	setAttr -cb on ".mice";
	setAttr -av -cb on ".micc";
	setAttr -k on ".micr";
	setAttr -k on ".micg";
	setAttr -k on ".micb";
	setAttr -cb on ".mica";
	setAttr -av -cb on ".micw";
	setAttr -cb on ".mirw";
select -ne :defaultShaderList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 21 ".s";
select -ne :defaultTextureList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 40 ".tx";
select -ne :lightList1;
	setAttr -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 4 ".l";
select -ne :lambert1;
	setAttr ".miic" -type "float3" 9.8696051 9.8696051 9.8696051 ;
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
	setAttr -s 21 ".u";
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
	setAttr ".cpe" yes;
	setAttr -cb on ".hbl";
select -ne :defaultResolution;
	setAttr -av -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -k on ".bnm";
	setAttr -av ".w" 1024;
	setAttr -av ".h" 1024;
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
	setAttr -s 7 ".dsm";
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
select -ne :defaultViewColorManager;
	setAttr ".ip" 2;
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
connectAttr "bioLumCoral:PxrLMPlasticBiolumCoral.oc" "bioLumCoral:PxrLMPlasticBiolumCoralSG.ss"
		;
connectAttr "swatch_teapotShape.iog" "bioLumCoral:PxrLMPlasticBiolumCoralSG.dsm"
		 -na;
connectAttr "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:RMSDisplacement4.oc" "bioLumCoral:PxrLMPlasticBiolumCoralSG.ds"
		;
connectAttr ":defaultRenderGlobals.msg" "mtorPartition.rgcnx";
connectAttr "bioLumCoral:PxrLMPlasticBiolumCoralSG.msg" "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:materialInfo86.sg"
		;
connectAttr "bioLumCoral:PxrLMPlasticBiolumCoral.msg" "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:materialInfo86.m"
		;
connectAttr "bioLumCoral:PxrLMPlasticBiolumCoral.msg" "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:materialInfo86.t"
		 -na;
connectAttr "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:ramp12.oc" "bioLumCoral:PxrLMPlasticBiolumCoral.diffuseColor"
		;
connectAttr "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:ramp14.oc" "bioLumCoral:PxrLMPlasticBiolumCoral.incandescence"
		;
connectAttr "bioLumCoral:PxrBump1.resultN" "bioLumCoral:PxrLMPlasticBiolumCoral.specularNn"
		;
connectAttr "bioLumCoral:PxrBump1.resultN" "bioLumCoral:PxrLMPlasticBiolumCoral.diffuseNn"
		;
connectAttr "bioLumCoral:PxrBump1.resultN" "bioLumCoral:PxrLMPlasticBiolumCoral.clearcoatNn"
		;
connectAttr "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:place2dTexture12.o" "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:ramp12.uv"
		;
connectAttr "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:place2dTexture12.ofs" "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:ramp12.fs"
		;
connectAttr "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:ramp13.oc" "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:ramp12.cel[1].ec"
		;
connectAttr "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:ramp13.oc" "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:ramp12.cel[7].ec"
		;
connectAttr "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:place2dTexture12.o" "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:ramp13.uv"
		;
connectAttr "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:place2dTexture12.ofs" "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:ramp13.fs"
		;
connectAttr "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:place2dTexture12.o" "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:ramp14.uv"
		;
connectAttr "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:place2dTexture12.ofs" "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:ramp14.fs"
		;
connectAttr "bioLumCoral:Harsh_20150315_1359:ramp13.oc" "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:ramp14.cel[7].ec"
		;
connectAttr "bioLumCoral:Harsh_20150315_1359:ramp13.oc" "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:ramp14.cel[10].ec"
		;
connectAttr "bioLumCoral:Harsh_20150315_1359:place2dTexture12.o" "bioLumCoral:Harsh_20150315_1359:ramp13.uv"
		;
connectAttr "bioLumCoral:Harsh_20150315_1359:place2dTexture12.ofs" "bioLumCoral:Harsh_20150315_1359:ramp13.fs"
		;
connectAttr "bioLumCoral:noise1.oa" "bioLumCoral:PxrBump1.inputBump";
connectAttr "bioLumCoral:place2dTexture1.o" "bioLumCoral:noise1.uv";
connectAttr "bioLumCoral:place2dTexture1.ofs" "bioLumCoral:noise1.fs";
connectAttr "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:ramp10.oa" "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:RMSDisplacement4.displacementScalar"
		;
connectAttr "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:place2dTexture12.o" "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:ramp10.uv"
		;
connectAttr "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:place2dTexture12.ofs" "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:ramp10.fs"
		;
connectAttr "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:ramp11.oc" "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:ramp10.cel[1].ec"
		;
connectAttr "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:ramp11.oc" "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:ramp10.cel[10].ec"
		;
connectAttr "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:place2dTexture12.o" "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:ramp11.uv"
		;
connectAttr "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:place2dTexture12.ofs" "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:ramp11.fs"
		;
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "bioLumCoral:PxrLMPlasticBiolumCoralSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "bioLumCoral:PxrLMPlasticBiolumCoralSG.message" ":defaultLightSet.message";
connectAttr "bioLumCoral:PxrLMPlasticBiolumCoralSG.pa" ":renderPartition.st" -na;
connectAttr "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:RMSDisplacement4.msg" ":defaultShaderList1.s"
		 -na;
connectAttr "bioLumCoral:PxrLMPlasticBiolumCoral.msg" ":defaultShaderList1.s" -na
		;
connectAttr "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:ramp10.msg" ":defaultTextureList1.tx"
		 -na;
connectAttr "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:ramp11.msg" ":defaultTextureList1.tx"
		 -na;
connectAttr "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:ramp12.msg" ":defaultTextureList1.tx"
		 -na;
connectAttr "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:ramp13.msg" ":defaultTextureList1.tx"
		 -na;
connectAttr "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:ramp14.msg" ":defaultTextureList1.tx"
		 -na;
connectAttr "bioLumCoral:Harsh_20150315_1359:ramp13.msg" ":defaultTextureList1.tx"
		 -na;
connectAttr "bioLumCoral:noise1.msg" ":defaultTextureList1.tx" -na;
connectAttr "bioLumCoral:PxrBump1.msg" ":defaultTextureList1.tx" -na;
connectAttr "bioLumCoral:Harsh_20150315_1359:Harsh_20150315_1345:place2dTexture12.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "bioLumCoral:Harsh_20150315_1359:place2dTexture12.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "bioLumCoral:place2dTexture1.msg" ":defaultRenderUtilityList1.u" -na
		;
// End of bioLumCoral.ma
