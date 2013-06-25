
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


_player addrating 1000000;
_player switchMove "amovpknlmstpsraswpstdnon_gear";

thirstLevel = 100;
hungerLevel = 100;



[] execVM "client\functions\playerActions.sqf";
[] execVM "client\systems\playerMenu\dialog2\setup.sqf";

_player groupChat format["Player Initialization Complete"];
playerSetupComplete = true;