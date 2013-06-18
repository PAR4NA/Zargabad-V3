//	@file Version: 1.0
//	@file Name: fn_refillbox.sqf  "fn_refillbox"
//	@file Author: [404] Pulse , [404] Costlyy , [404] Deadbeat
//	@file Created: 22/1/2012 00:00
//	@file Args: [ OBJECT (Weapons box that needs filling), STRING (Name of the fill to give to object)]

private ["_selectedBox", "_selectedBoxPos", "_finishedBox", "_currBox"];

_box = _this select 0;
_selectedBox = _this select 1;

switch(_selectedBox) do {
    case "mission_Mid_BAF": { // Broad selection of mid-high tier weapons 
    	_currBox = _box;
        
        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
		clearWeaponCargoGlobal _currBox;
        
        // Add new weapons before ammunition
        _currBox addWeaponCargoGlobal ["M4A3_RCO_GL_EP1",5];
		_currBox addWeaponCargoGlobal ["Binocular_Vector",5];
		_currBox addWeaponCargoGlobal ["SCAR_L_STD_Mk4CQT",5];
        _currBox addWeaponCargoGlobal ["Mk_48_DES_EP1",5];
		_currBox addWeaponCargoGlobal ["M14_EP1",5];			
		_currBox addWeaponCargoGlobal ["BAF_L7A2_GPMG",5];
        _currBox addWeaponCargoGlobal ["G36K_camo",5];
		_currBox addWeaponCargoGlobal ["BAF_L85A2_RIS_CWS",5];
        _currBox addWeaponCargoGlobal ["M249_EP1",5];
        _currBox addWeaponCargoGlobal ["BAF_L85A2_UGL_Holo",5];		
		_currBox addWeaponCargoGlobal ["M16A4_ACG",5];
		_currBox addWeaponCargoGlobal ["SCAR_H_STD_EGLM_Spect",5];	 
        _currBox addWeaponCargoGlobal ["SCAR_L_STD_EGLM_RCO",5];
        
        // Add ammunition
        _currBox addMagazineCargoGlobal ["30Rnd_556x45_Stanag",80];
        _currBox addMagazineCargoGlobal ["5Rnd_86x70_L115A1",30];
        _currBox addMagazineCargoGlobal ["20Rnd_762x51_B_SCAR",50];
		_currBox addMagazineCargoGlobal ["15Rnd_9x19_M9SD",20];
        _currBox addMagazineCargoGlobal ["100Rnd_762x51_M240",30];
        _currBox addMagazineCargoGlobal ["1Rnd_HE_M203",30];
        _currBox addMagazineCargoGlobal ["1Rnd_Smoke_M203",20];
        _currBox addMagazineCargoGlobal ["6Rnd_45ACP",20];
        _currBox addMagazineCargoGlobal ["HandGrenade",20];
		_currBox addMagazineCargoGlobal ["200Rnd_556x45_L110A1",30];
        _currBox addMagazineCargoGlobal ["5Rnd_86x70_L115A1",20];
        _currBox addMagazineCargoGlobal ["20Rnd_762x51_DMR",10];
        _currBox addMagazineCargoGlobal ["20Rnd_762x51_FNFAL",15];
		_currBox addMagazineCargoGlobal ["30Rnd_556x45_G36",20]; 		
    };
    case "mission_Side_USLaunchers": { // Used in the airwreck side mission
    	_currBox = _box;

        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
		clearWeaponCargoGlobal _currBox;

		// Add new weapons before ammunition
		_currBox addWeaponCargoGlobal ["MetisLauncher",5]; 
		_currBox addWeaponCargoGlobal ["RPG18",5];
		_currBox addWeaponCargoGlobal ["Javelin",5]; 
		_currBox addWeaponCargoGlobal ["Binocular_Vector",5];
		_currBox addWeaponCargoGlobal ["RPG7V",5];
		_currBox addWeaponCargoGlobal ["SMAW",5];
		_currBox addWeaponCargoGlobal ["M79_EP1",5];
		// Add ammunition
		_currBox addMagazineCargoGlobal ["1Rnd_HE_M203",30];
        _currBox addMagazineCargoGlobal ["AT13",30];
        _currBox addMagazineCargoGlobal ["Javelin",30];
		_currBox addMagazineCargoGlobal ["RPG18",30];
		_currBox addMagazineCargoGlobal ["PG7V",30];
		_currBox addMagazineCargoGlobal ["SMAW_HEAA",30];
		_currBox addMagazineCargoGlobal ["HandGrenade",30];
		_currBox addMagazineCargoGlobal ["Mine",30];
    };
    case "mission_Side_USSpecial": { // Used in the airwreck side mission
    	_currBox = _box;
        
        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
		clearWeaponCargoGlobal _currBox;
        
        // Add new weapons before ammunition
		_currBox addWeaponCargoGlobal ["M107",5];
		_currBox addWeaponCargoGlobal ["BAF_AS50_scoped",5];
		_currBox addWeaponCargoGlobal ["M8_SAW",5];
		_currBox addWeaponCargoGlobal ["SVD_CAMO",5];
		_currBox addWeaponCargoGlobal ["DMR",5];
		_currBox addWeaponCargoGlobal ["M8_sharpshooter",5];
		_currBox addWeaponCargoGlobal ["M24",5];
		_currBox addWeaponCargoGlobal ["SCAR_H_LNG_Sniper",5];
		_currBox addWeaponCargoGlobal ["SCAR_H_LNG_Sniper_SD",5];
		_currBox addWeaponCargoGlobal ["M9",5];
		_currBox addWeaponCargoGlobal ["M9SD",5];
		_currBox addWeaponCargoGlobal ["MakarovSD",5];
		_currBox addWeaponCargoGlobal ["Binocular_Vector",15];
		_currBox addWeaponCargoGlobal ["NVGoggles",15];
		_currBox addWeaponCargoGlobal ["Binocular",15];
	    // Add ammunition
		_currBox addMagazineCargoGlobal ["15Rnd_9x19_M9",30];
		_currBox addMagazineCargoGlobal ["5Rnd_127x99_as50",30];
		_currBox addMagazineCargoGlobal ["20Rnd_762x51_B_SCAR",30];
		_currBox addMagazineCargoGlobal ["20Rnd_762x51_SB_SCAR",30];
		_currBox addMagazineCargoGlobal ["100Rnd_556x45_BetaCMag",30];
		_currBox addMagazineCargoGlobal ["10Rnd_762x54_SVD",30];
		_currBox addMagazineCargoGlobal ["15Rnd_9x19_M9SD",30];
		_currBox addMagazineCargoGlobal ["8Rnd_9x18_MakarovSD",30];
		_currBox addMagazineCargoGlobal ["1Rnd_HE_M203",30];
		_currBox addMagazineCargoGlobal ["FlareRed_M203",30];
		_currBox addMagazineCargoGlobal ["1Rnd_Smoke_M203",30];
		_currBox addMagazineCargoGlobal ["FlareGreen_M203",30];
		_currBox addMagazineCargoGlobal ["10Rnd_127x99_m107",30];
		_currBox addMagazineCargoGlobal ["HandGrenade",30];
		_currBox addMagazineCargoGlobal ["30Rnd_556x45_StanagSD",30];
		_currBox addMagazineCargoGlobal ["30Rnd_556x45_Stanag",50];
		_currBox addMagazineCargoGlobal ["20Rnd_762x51_DMR",30];
		_currBox addMagazineCargoGlobal ["5Rnd_762x51_M24",30];			
    };
};