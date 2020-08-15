/*
	Author: KyklopCZ
	
	Description:
	Initializes the default jammer configuration.

	Parameter(s):
	None

	Returns:
	Nothing
*/

#include "properties.hpp"

if(isServer) then
{
	kyk_ew_jammersType1 = [];
	kyk_ew_jammersType2 = [];
	kyk_ew_jammersType1Properties = [];
	kyk_ew_jammersType2Properties = [];
	
	/*
	Properties:
		0 - 0 = broadcast, 1 = directed (only 0 supported at the moment)
		1 - radio range
		2 - GSM range
		3 - RFDet range
		4 - Drone range
		5 - GPS range
		6 - Radar range
		7 - Jammer detector
		8 - Explosion attempt detector
		9 - Effective angle (directional jammers only)
	*/
	
	["B_RadioBag_01_black_F", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
	["B_RadioBag_01_digi_F", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
	["B_RadioBag_01_eaf_F", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
	["B_RadioBag_01_hex_F", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
	["B_RadioBag_01_wdl_F", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
	["B_RadioBag_01_mtp_F", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
	["B_RadioBag_01_tropic_F", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
	["B_RadioBag_01_oucamo_F", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
	["B_RadioBag_01_ghex_F", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
	
	["O_Plane_Fighter_02_F", 2, F22_PROPERTIES] call kyk_ew_fnc_jammerAdd;
	["O_Plane_Fighter_02_Stealth_F", 2, F22_PROPERTIES] call kyk_ew_fnc_jammerAdd;
	["B_Plane_Fighter_01_F", 2, F22_PROPERTIES] call kyk_ew_fnc_jammerAdd;
	["B_Plane_Fighter_01_Stealth_F", 2, F22_PROPERTIES] call kyk_ew_fnc_jammerAdd;
	
	if("tfar_backpacks" in activatedAddons) then
	{
		["TFAR_anarc164", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["TFAR_anarc210", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["TFAR_anprc155", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["TFAR_anprc155_coyote", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["TFAR_bussole", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["TFAR_mr3000", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["TFAR_mr3000_bwmod", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["TFAR_mr3000_bwmod_tropen", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["TFAR_mr3000_multicam", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["TFAR_mr3000_rhs", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["TFAR_mr6000l", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["TFAR_rt1523g", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["TFAR_rt1523g_big", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["TFAR_rt1523g_big_bwmod", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["TFAR_rt1523g_big_bwmod_tropen", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["TFAR_rt1523g_big_rhs", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["TFAR_rt1523g_black", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["TFAR_rt1523g_bwmod", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["TFAR_rt1523g_fabric", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["TFAR_rt1523g_green", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["TFAR_rt1523g_rhs", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["TFAR_rt1523g_sage", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
	};
	
	if("tfw_radios_ilbe" in activatedAddons) then
	{
		["tfw_ilbe_blade_alpine", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["tfw_ilbe_blade_arid", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["tfw_ilbe_blade_black", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["tfw_ilbe_blade_coy", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["tfw_ilbe_blade_gr", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["tfw_ilbe_blade_d", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["tfw_ilbe_blade_wd", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["tfw_ilbe_blade_mct", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["tfw_ilbe_blade_mc", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["tfw_ilbe_blade_ocp", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["tfw_ilbe_blade_wd2", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["tfw_ilbe_DD_alpine", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["tfw_ilbe_DD_arid", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["tfw_ilbe_DD_black", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["tfw_ilbe_DD_coy", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["tfw_ilbe_DD_gr", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["tfw_ilbe_DD_d", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["tfw_ilbe_DD_wd", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["tfw_ilbe_DD_mct", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["tfw_ilbe_DD_mc", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["tfw_ilbe_DD_ocp", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["tfw_ilbe_DD_wd2", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["tfw_ilbe_whip_alpine", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["tfw_ilbe_whip_arid", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["tfw_ilbe_whip_black", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["tfw_ilbe_whip_coy", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["tfw_ilbe_whip_gr", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["tfw_ilbe_whip_d", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["tfw_ilbe_whip_wd", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["tfw_ilbe_whip_mct", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["tfw_ilbe_whip_mc", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["tfw_ilbe_whip_ocp", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["tfw_ilbe_whip_wd2", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["tfw_ilbe_whipext_alpine", 1, RADIOEXT_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["tfw_ilbe_whipext_arid", 1, RADIOEXT_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["tfw_ilbe_whipext_black", 1, RADIOEXT_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["tfw_ilbe_whipext_coy", 1, RADIOEXT_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["tfw_ilbe_whipext_gr", 1, RADIOEXT_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["tfw_ilbe_whipext_d", 1, RADIOEXT_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["tfw_ilbe_whipext_wd", 1, RADIOEXT_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["tfw_ilbe_whipext_mct", 1, RADIOEXT_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["tfw_ilbe_whipext_mc", 1, RADIOEXT_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["tfw_ilbe_whipext_ocp", 1, RADIOEXT_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["tfw_ilbe_whipext_wd2", 1, RADIOEXT_PROPERTIES] call kyk_ew_fnc_jammerAdd;
	};
	
	if("cup_basedata" in activatedAddons) then
	{
		["CUP_B_Kombat_Radio_Olive", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["CUP_B_Motherlode_Radio_MTP", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["CUP_B_Predator_Radio_MTP", 1, RADIO_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["CUP_B_UAVTerminal_Black", 1, [0,0,0,0,500,0,0,1,1]] call kyk_ew_fnc_jammerAdd;
	};
	
	if("cup_vehicles_core" in activatedAddons) then
	{
		["CUP_B_M1151_M2_USA", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["CUP_B_M1151_Deploy_USA", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["CUP_B_M1151_Mk19_USA", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["CUP_B_M1151_USA", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["CUP_B_M1152_USA", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["CUP_B_M1165_GMV_USA", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["CUP_B_M1167_USA", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["CUP_B_M2A3Bradley_USA_D", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["CUP_B_M2A3Bradley_USA_W", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["CUP_B_M1151_M2_USMC", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["CUP_B_M1151_Deploy_USMC", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["CUP_B_M1151_Mk19_USMC", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["CUP_B_M1151_USMC", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["CUP_B_M1152_USMC", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["CUP_B_M1165_GMV_USMC", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["CUP_B_M1167_USMC", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["CUP_B_F35B_BAF", 2, F35_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["CUP_B_F35B_Stealth_BAF", 2, F35_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["CUP_B_F35B_USMC", 2, F35_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["CUP_B_F35B_Stealth_USMC", 2, F35_PROPERTIES] call kyk_ew_fnc_jammerAdd;
	};
	
	if("rhsusf_main" in activatedAddons) then
	{
		["RHS_M2A3_BUSKI", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["RHS_M2A3_BUSKIII", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_M1117_D", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_M1117_O", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_M1220_usarmy_d", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_M1220_M153_M2_usarmy_d", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_M1220_M2_usarmy_d", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_M1220_M153_MK19_usarmy_d", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_M1220_MK19_usarmy_d", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_M1230_M2_usarmy_d", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_M1230_MK19_usarmy_d", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_M1230a1_usarmy_d", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_M1232_usarmy_d", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_M1232_M2_usarmy_d", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_M1232_MK19_usarmy_d", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_M1237_M2_usarmy_d", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_M1237_MK19_usarmy_d", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_m1240a1_usarmy_d", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_m1240a1_m2crows_usarmy_d", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_m1240a1_m2_usarmy_d", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_m1240a1_m240_usarmy_d", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_m1240a1_mk19crows_usarmy_d", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_m1240a1_mk19_usarmy_d", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_m1a2sep1tuskiid_usarmy", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["RHS_M2A3_BUSKI_wd", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["RHS_M2A3_BUSKIII_wd", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_M1117_W", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_M1220_usarmy_wd", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_M1220_M153_M2_usarmy_wd", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_M1220_M2_usarmy_wd", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_M1220_M153_MK19_usarmy_wd", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_M1220_MK19_usarmy_wd", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_M1230_M2_usarmy_wd", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_M1230_MK19_usarmy_wd", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_M1230a1_usarmy_wd", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_M1232_usarmy_wd", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_M1232_M2_usarmy_wd", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_M1232_MK19_usarmy_wd", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_M1237_M2_usarmy_wd", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_M1237_MK19_usarmy_wd", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_m1240a1_usarmy_wd", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_m1240a1_m2crows_usarmy_wd", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_m1240a1_m2_usarmy_wd", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_m1240a1_m240_usarmy_wd", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_m1240a1_mk19crows_usarmy_wd", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_m1240a1_mk19_usarmy_wd", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_m1a2sep1tuskiiwd_usarmy", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_M1232_MC_M2_usmc_d", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_M1232_MC_MK19_usmc_d", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_m1240a1_usmc_d", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_m1240a1_m2crows_usmc_d", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_m1240a1_m2_usmc_d", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_m1240a1_m240_usmc_d", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_m1240a1_mk19crows_usmc_d", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_m1240a1_mk19_usmc_d", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_m1a1fep_d", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_M1232_MC_M2_usmc_wd", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_M1232_MC_MK19_usmc_wd", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_m1240a1_usmc_wd", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_m1240a1_m2crows_usmc_wd", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_m1240a1_m2_usmc_wd", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_m1240a1_m240_usmc_wd", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_m1240a1_mk19crows_usmc_wd", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_m1240a1_mk19_usmc_wd", 1, DUKE_VEHICLE_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsusf_f22", 2, F22_PROPERTIES] call kyk_ew_fnc_jammerAdd;
	};
	
	if("usaf_fighters_core" in activatedAddons) then
	{
		["USAF_F22", 2, F22_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["USAF_F22_EWP_AA", 2, F22_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["USAF_F22_EWP_AG", 2, F22_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["USAF_F22_Heavy", 2, F22_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["USAF_F35A_STEALTH", 2, F35_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["USAF_F35A", 2, F35_PROPERTIES] call kyk_ew_fnc_jammerAdd;
	};
	
	if("rhs_main" in activatedAddons) then
	{
		["rhs_gaz66_r142_msv", 2, GAZ66_R142_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhs_gaz66_r142_vdv", 2, GAZ66_R142_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhs_gaz66_r142_vmf", 2, GAZ66_R142_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhs_gaz66_r142_vv", 2, GAZ66_R142_PROPERTIES] call kyk_ew_fnc_jammerAdd;
	};
	
	if("rhsgref_main" in activatedAddons) then
	{
		["rhsgref_cdf_gaz66_r142", 2, GAZ66_R142_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["rhsgref_ins_g_gaz66_r142", 2, GAZ66_R142_PROPERTIES] call kyk_ew_fnc_jammerAdd;
	};
	
	if("flan_ea18g_f" in activatedAddons) then
	{
		["FLAN_EA18G", 2, [0,7000,8000,5000,8000,8000,14000,1,1]] call kyk_ew_fnc_jammerAdd;
	};
	
	if("fir_f22_f" in activatedAddons) then
	{
		["FIR_F22", 2, F22_PROPERTIES] call kyk_ew_fnc_jammerAdd;
	};
	
	if("fir_f35b_armaverse_f" in activatedAddons) then
	{
		["FIR_F35B_Standard", 2, F35_PROPERTIES] call kyk_ew_fnc_jammerAdd;
	};
	
	if("a3_aegis_air_f_aegis" in activatedAddons) then
	{
		["B_Plane_Fighter_05_F", 2, F35_PROPERTIES] call kyk_ew_fnc_jammerAdd;
		["B_Plane_Fighter_05_Stealth_F", 2, F35_PROPERTIES] call kyk_ew_fnc_jammerAdd;
	};
	
	publicVariable "kyk_ew_jammersType1";
	publicVariable "kyk_ew_jammersType2";
	publicVariable "kyk_ew_jammersType1Properties";
	publicVariable "kyk_ew_jammersType2Properties";
};