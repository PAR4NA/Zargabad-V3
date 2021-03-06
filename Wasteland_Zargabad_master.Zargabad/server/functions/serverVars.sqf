//	@file Version: 1.0
//	@file Name: serverVars.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, [404] Pulse
//	@file Created: 20/11/2012 05:19
//	@file Args:
// --------------------------------------------------------------------------------------------------- \\
// ----------  !DO NOT CHANGE ANYTHING BELOW THIS POINT UNLESS YOU KNOW WHAT YOU ARE DOING!	---------- \\
// ----------																				---------- \\
// ----------			404Games are not responsible for anything that may happen 			---------- \\
// ----------			 as a result of unauthorised modifications to this file.			---------- \\
// --------------------------------------------------------------------------------------------------- \\
#include "setup.sqf"
if(!X_Server) exitWith {};

diag_log format["WASTELAND SERVER - Initilizing Server Vars"];

CVG_weapons = [];
CVG_weapons = CVG_rifles;
CVG_weapons = CVG_weapons + CVG_Scoped;
CVG_weapons = CVG_weapons + CVG_Heavy;
CVG_weapons = CVG_weapons + CVG_pistols;
CVG_weapons = CVG_weapons + CVG_Launchers;

#ifdef __A2NET__
missionStartTime = 0;
netTime = 0;
#endif

sideMissionPos = "";
mainMissionPos = "";

currentVehicles = [];
publicVariable "currentVehicles";
pvar_teamSwitchList = [];
publicVariable "pvar_teamSwitchList";
pvar_teamKillList = [];
publicVariable "pvar_teamKillList";
pvar_beaconListBlu = []; 
publicVariable "pvar_beaconListBlu";
pvar_beaconListRed = []; 
publicVariable "pvar_beaconListRed";
clientMissionMarkers = [];
publicVariable "clientMissionMarkers";
clientRadarMarkers = [];
publicVariable "clientRadarMarkers";
currentDate = [];
publicVariable "currentDate";
currentInvites = [];
publicVariable "currentInvites";
                  
"PlayerCDeath" addPublicVariableEventHandler {_id = (_this select 1) spawn server_playerDied};

staticHeliWrecks = [
	"UH1Wreck",
    "UH1Wreck",
    "Mi8Wreck",
    "Mi8Wreck",
    "C130J_wreck_EP1",
    "UH60_wreck_EP1",
    "UH60_wreck_EP1"];

currentStaticHelis = []; // Storage for the heli marker numbers so that we don't spawn wrecks on top of live helis

//Civilian Vehicle List - Random Spawns
civilianVehicles = ["car_hatchback",
					"car_sedan",
					"datsun1_civil_2_covered",
					"SkodaGreen",
					"Lada2",
					"V3S_Civ",
					"UralCivil",
					"VWGolf",
					"MMT_Civ",
					"Ikarus_TK_CIV_EP1",
					"Lada1_TK_CIV_EP1",
					"Old_moto_TK_Civ_EP1",
					"S1203_TK_CIV_EP1",
					"UAZ_Unarmed_TK_CIV_EP1",
					"ATV_US_EP1",
					"BAF_Offroad_W",
					"S1203_ambulance_EP1"];

//Military Vehicle List - Random Spawns
militaryVehicles = ["UAZ_CDF",
					"Kamaz",
					"MTVR_DES_EP1",
					"SUV_PMC",
					"MTVR",
					"BAF_Offroad_W",
					"HMMWV",
					"HMMWV_Ambulance",
					"S1203_ambulance_EP1",
					"GAZ_Vodnik_MedEvac",
					"UralRepair_TK_EP1",
					"MTVR_Reammo_DES_EP1",
					"MTVR_Refuel_DES_EP1",
					"MTVR_Repair_DES_EP1"];

//Armed Military Vehicle List - Random Spawns
armedMilitaryVehicles = ["ArmoredSUV_PMC",
						 "Pickup_PK_GUE",
                         "BRDM2_CDF",
                         "M113_UN_EP1",
						 "UAZ_MG_TK_EP1",
						 "LandRover_MG_TK_INS_EP1",
						 "HMMWV_M2",
						 "HMMWV_M1151_M2_DES_EP1",
						 "HMMWV_Avenger_DES_EP1",
						 "HMMWV_Armored",
                         "HMMWV_MK19",
						 "HMMWV_TOW",
                         "UAZ_MG_CDF",
                         "GAZ_Vodnik",
						 "BAF_Jackal2_L2A1_D",
						 "BAF_Jackal2_L2A1_w",
						"UAZ_AGS30_TK_EP1",						 
						 "BRDM2_TK_GUE_EP1",
						 "T34_TK_GUE_EP1"];
//Item Config
pickupList = ["Satelit",
				"EvMoney",
				"Suitcase",
				"Fuel_can"];

//Object List - Random Spawns.
objectList = ["Land_Barrel_water",
				"Land_prebehlavka",
				"Land_leseni2x",
                "Fort_Crate_wood",
                "Land_CamoNet_NATO",
				"Land_Barrel_water",
				"Land_stand_small_EP1",
                "Land_stand_small_EP1",
				"Base_WarfareBBarrier10xTall",
				"Base_WarfareBBarrier10x",
				"Base_WarfareBBarrier5x",
                "Base_WarfareBBarrier10xTall",
                "Base_WarfareBBarrier10x",
                "Base_WarfareBBarrier5x",
				"Land_Misc_deerstand",
				"Fort_Barricade",
				"Concrete_Wall_EP1",
                "Concrete_Wall_EP1",
                "Land_fort_bagfence_long",
                "Land_fort_bagfence_long",
                "Land_fort_bagfence_round",
                "Land_fort_bagfence_corner",
                "Land_BagFenceLong",
                "Land_BagFenceLong",
                "Land_fort_artillery_nest",
				"Land_fortified_nest_small_EP1",
				"Land_Misc_deerstand",
                "Land_fort_rampart",
                "Land_fort_rampart_EP1",
				"Land_HBarrier_large",
                "Land_HBarrier_large",
				"Land_Misc_Scaffolding",
				"Land_Fort_Watchtower_EP1",
                "Land_Fort_Watchtower",
				"Land_fortified_nest_big",
				"RampConcrete",
				"WarfareBDepot",
				"WarfareBCamp",
                "Hedgehog",
                "Land_ConcreteRamp",
                "Land_CncBlock_Stripes",
                "Land_Campfire_burning",
                "Land_GuardShed",
                "Land_tent_east",
				"Land_ConcreteBlock"];
                                         
//Object List - Random Spawns.
staticWeaponsList = ["M2StaticMG_US_EP1",
				"DSHKM_TK_INS_EP1",
                "AGS_TK_INS_EP1",
				"M2HD_mini_TriPod",
				"MK19_TriPod",
				"Stinger_Pod_US_EP1",
				"CSJ_Quad50",
				"Stinger_Pod",
				"BAF_L2A1_Minitripod_D",
                "DSHkM_Mini_TriPod_TK_INS_EP1",
                "SearchLight_TK_INS_EP1",
				"BAF_GMG_Tripod_D",        
                "BAF_GPMG_Minitripod_D",
				"BAF_GMG_Tripod_W",        
                "BAF_GPMG_Minitripod_W",
                "SPG9_TK_INS_EP1",
                "ZU23_TK_INS_EP1"];

//Object List - Random Helis.
staticHeliList = ["UH1H_TK_GUE_EP1",
				"Mi17_Civilian",
                "MV22",
                "CH_47F_EP1",
                "MH6J_EP1",
                "UH60M_MEV_EP1",
                "AH6X_EP1",
				"UH1H_TK_GUE_EP1",
				"UH60M_EP1"];

//Random Weapon List - Change this to what you want to spawn in cars.
vehicleWeapons = ["AK_107_kobra",
                "AK_47_M",
				"AK_47_S",
				"AK_74",
				"AKS_74_UN_kobra",		
				"AKS_74_U", 
				"AKS_74_pso",
				"AK_74_GL",
				"AK_107_pso",  
				"AK_107_GL_pso", 
				"AK_107_GL_kobra",
				"BAF_L85A2_RIS_ACOG",
				"bizon",
				"bizon_silenced",
				"FN_FAL",
				"G36a",
				"G36C",
				"G36_C_SD_eotech", 			 
				"G36K",
				"Igla",
              
				"LeeEnfield",
				"M1014",
				"M16A2",
				"M16A2GL",  
				"M16a4",
				"M16A4_GL", 
                "M16A4_ACG_GL",
                "M16A4_ACG",
				"M4A1", 
				"M4A1_HWS_GL", 
				"M4A1_HWS_GL_camo",
				"M4A1_HWS_GL_SD_Camo",
				"M4A1_RCO_GL", 
				"M4A1_Aim_camo",
				"M4A1_AIM_SD_camo",
				"M4A1_Aim",
				"MP5A5",
				"M136",                  
                "MetisLauncher",
				"RPK_74", 
                "Mk_48_DES_EP1",
                "M60A4_EP1",
                "M249_TWS_EP1",
                "M249_m145_EP1",
                "M249_EP1",
                "m240_scoped_EP1",
                "MG36_camo",
				"RPG18", 
				"Sa58V_EP1",
				"Saiga12K",
				"SCAR_L_CQC",
				"SMAW",                  
                "Stinger",               
                "Strela",
		        "Huntingrifle", 
                "DMR",


                "M24",
                "M40A3", 
                "M4SPR",
                "SVD",
                "SVD_CAMO",
                "Mk13_EP1", 
                "M32_EP1",
                "M79_EP1",
                "M8_sharpshooter",
                "M8_carbine",
                "M8_carbineGL",
                "M8_compact",          

                "M24_des_EP1",
                "Sa58V_EP1", 
                "Sa58V_RCO_EP1",           
                "Sa58V_CCO_EP1",             
                "SVD_des_EP1",             
                "SVD",                 
                "SCAR_L_CQC_CCO_SD",           
                "SCAR_L_CQC_Holo",
                "SCAR_L_CQC",
                "SCAR_L_STD_EGLM_RCO",
                "SCAR_L_STD_HOLO", 
                "SCAR_H_CQC_CCO",
                "SCAR_L_STD_Mk4CQT",
                "SCAR_H_CQC_CCO_SD",
                "SCAR_H_STD_EGLM_Spect",
                "SCAR_H_LNG_Sniper",
                "SCAR_H_LNG_Sniper_SD",           
                "M9",
                "M9SD",
                "revolver_EP1",
                "Sa61_EP1",
                "UZI_EP1",
		        "VSS_vintorez"]; 
                
MissionSpawnMarkers = [
            ["Mission_1",false],
            ["Mission_2",false],
            ["Mission_3",false],
            ["Mission_4",false],
            ["Mission_5",false],
            ["Mission_6",false],
            ["Mission_7",false],
            ["Mission_8",false],
            ["Mission_9",false],
            ["Mission_10",false],
            ["Mission_11",false],
            ["Mission_12",false],
            ["Mission_13",false],
            ["Mission_14",false],
            ["Mission_15",false],
            ["Mission_16",false],
            ["Mission_17",false],
            ["Mission_18",false],
            ["Mission_19",false],
            ["Mission_20",false],
            ["Mission_21",false],
            ["Mission_22",false],
            ["Mission_23",false],
            ["Mission_24",false],
            ["Mission_25",false],
            ["Mission_26",false],
            ["Mission_27",false],
            ["Mission_28",false],
            ["Mission_29",false],
            ["Mission_30",false],
            ["Mission_31",false],
            ["Mission_32",false],
            ["Mission_33",false],
            ["Mission_34",false],
            ["Mission_35",false],
            ["Mission_36",false],
            ["Mission_37",false],
            ["Mission_38",false],
            ["Mission_39",false],
            ["Mission_40",false],
            ["Mission_41",false],
            ["Mission_42",false],
            ["Mission_43",false],
            ["Mission_44",false],
            ["Mission_45",false],
            ["Mission_46",false],
            ["Mission_47",false],
            ["Mission_48",false],
            ["Mission_49",false],
            ["Mission_50",false]
];