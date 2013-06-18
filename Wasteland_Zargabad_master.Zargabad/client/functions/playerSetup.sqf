
//	@file Version: 1.0
//	@file Name: playerSetup.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:
// change the player start items from this file

_player = _this;
//Player initialization
_player setskill 0;
{_player disableAI _x} foreach ["move","anim","target","autotarget"];
_player setVariable ["BIS_noCoreConversations", true];

enableSentences false;
_player removeWeapon "ItemRadio";
_player removeWeapon "ItemGPS";
removeAllWeapons _player;
removeBackpack _player;



//Default case means something fucked up.
_player addMagazine "6Rnd_45ACP";
_player addMagazine "6Rnd_45ACP";
_player addWeapon "revolver_gold_EP1";
_player selectWeapon "revolver_gold_EP1";

if(str(playerSide) in ["WEST"]) then
{
    removeAllWeapons _player;
    _player addMagazine "30Rnd_556x45_Stanag";
    _player addMagazine "30Rnd_556x45_Stanag";
	_player addMagazine "30Rnd_556x45_Stanag";
    _player addMagazine "30Rnd_556x45_Stanag";
	_player addMagazine "17Rnd_9x19_glock17";
    _player addMagazine "17Rnd_9x19_glock17";
	_player addWeapon "glock17_EP1";
	_player selectWeapon "glock17_EP1";
	_player addWeapon "M16A2";
	_player selectWeapon "M16A2";
};

if(str(playerSide) in ["EAST"]) then
{
    removeAllWeapons _player;
    _player addMagazine "30Rnd_545x39_AK";
	_player addMagazine "30Rnd_545x39_AK";
	_player addMagazine "30Rnd_545x39_AK";
	_player addMagazine "30Rnd_545x39_AK";
    _player addMagazine "7Rnd_45ACP_1911";
	_player addMagazine "7Rnd_45ACP_1911";
	_player addWeapon "Colt1911";
	_player selectWeapon "Colt1911";
	_player addWeapon "AK_74";
	_player selectWeapon "AK_74";
};

if(str(playerSide) in ["GUER"]) then
{
    removeAllWeapons _player;
    _player addMagazine "15Rnd_9x19_M9";
	_player addMagazine "15Rnd_9x19_M9";
	_player addMagazine "30Rnd_762x39_SA58";
	_player addMagazine "30Rnd_762x39_SA58";
	_player addMagazine "30Rnd_762x39_SA58";
	_player addMagazine "30Rnd_762x39_SA58";
    _player addWeapon "Sa58P_EP1";
	_player selectWeapon "Sa58P_EP1";	
	_player addWeapon "M9";
	_player selectWeapon "M9";
};

_donators = ["68478918","92074182", "92475398","129977734","110661894"];
//8918 = sin?
//1894 = switcher
//92074182 = hawker
//92475398 =mojo

_uid = getPlayerUID player;

{
if (_x == _uid) then {
removeAllWeapons _player;
_player addMagazine "10Rnd_127x99_m107";
_player addMagazine "10Rnd_127x99_m107";
_player addMagazine "10Rnd_127x99_m107";
_player addMagazine "10Rnd_127x99_m107";
_player addMagazine "10Rnd_127x99_m107";
_player addMagazine "10Rnd_127x99_m107";
_player addWeapon "PMC_AS50_scoped_Large";
_player addWeapon "Javelin";
_player addMagazine "Javelin";
_player addWeapon "revolver_gold_EP1";
_player addMagazine "6Rnd_45ACP";
_player addMagazine "6Rnd_45ACP";
_player addMagazine "6Rnd_45ACP";
_player addMagazine "6Rnd_45ACP";
_player selectWeapon "revolver_gold_EP1";
};
}forEach _donators;

_player addrating 1000000;
_player switchMove "amovpknlmstpsraswpstdnon_gear";

thirstLevel = 150;
hungerLevel = 150;

_player setVariable["cmoney",200,false];
_player setVariable["canfood",2,false];
_player setVariable["medkits",0,false];
_player setVariable["water",2,false];
_player setVariable["fuel",0,false];
_player setVariable["repairkits",0,false];
_player setVariable["fuelFull", 1, false];
_player setVariable["fuelEmpty", 0, false];
_player setVariable["bombs",false,false];
_player setVariable["spawnBeacon",0,false];
_player setVariable["camonet",0,false];
_player setVariable["canDrop",false,false];


{
if (_x == _uid) then {
_player setVariable["cmoney",1000,false];
_player setVariable["medkits",1,false];
_player setVariable["repairkits",1,false];
_player setVariable["camonet",1,false];
};
}forEach _donators;

[] execVM "client\functions\playerActions.sqf";


_player groupChat format["Player Initialization Complete"];
playerSetupComplete = true;