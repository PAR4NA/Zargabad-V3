_player = _this select 0;
 
// BROKEN SKINS
// BAF_Soldier_EN_W
 
playerSkins = [
["GAME NAME", "Player ID", "", "US_Delta_Force_Medic_EP1", ""],
["Name", "Player ID", "Indy Model", "Blufor Model", "Opfor Model"],
["GAME NAME", "Player ID", "GUE_Soldier_AT", "", ""]
];
 
_uid = getPlayerUID _player;
 
enableSentences false;
 
_skin = "";
 
// Default Skin - BLUE
if(str(playerSide) in ["WEST"]) then
{
    _skin="UN_CDF_Soldier_Light_EP1";
};
 
// Default Skin - RED
if(str(playerSide) in ["EAST"]) then
{
    _skin="RUS_Commander";
};
 
if(str(playerSide) in ["GUER"]) then
{
    _skin="Poet_PMC";
};
 
for "_x" from 0 to (count playerSkins) do {
    _arr = playerSkins select _x;
    _pid = _arr select 1;
    if(_pid==_uid) exitWith {
            
            _skinWEST = _arr select 3;
            _skinEAST = _arr select 4;
            _skinGUER = _arr select 2;
                       
            // Check For Blue Skin
            if(str(playerSide) in ["WEST"]) then
            {
                if(!(_skinWEST=="")) then
                {
                    _skin=_skinWEST;
                };
            };
            // Check For Red Skin
            if(str(playerSide) in ["EAST"]) then
            {
                if(!(_skinEAST=="")) then
                {
                    _skin=_skinEAST;
                };
            };
            // Check For Green Skin
            if(str(playerSide) in ["GUER"]) then
            {
                if(!(_skinGUER=="")) then
                {
                    _skin=_skinGUER;
                };
            };
     };
};
 
// Check if playerSkin == _skin if so skip the rest.
 
/// ***** CBA_fnc_switchPlayer *****
private ["_type", "_ar", "_oldUnit", "_newUnit", "_dummyUnit", "_dummyGroup"];
 
_oldUnit = player;
_type = _skin;
 
_ar = [weapons _oldUnit, magazines _oldUnit, rank _oldUnit, score _oldUnit, group _oldUnit, getPos _oldUnit, (leader _oldUnit) == _oldUnit, vehicleVarName _oldUnit];
 
_dummyGroup = createGroup (side _oldUnit);
if (isNull _dummyGroup) exitWith { hint "Sorry, something went wrong, dummyGroup is null" };
_dummyUnit = (_ar select 4) createUnit [_type, [0, 0, 0], [], 0, "NONE"]; // Join in the old group incase there was only 1 member
if (isNull _dummyUnit) exitWith { hint "Sorry, something went wrong, dummyUnit is null" };
[_oldUnit] join _dummyGroup;
 
hint format["1.Dummy created, State saved and put oldUnit in new group: %1", _dummyGroup];
 
_newUnit = _dummyGroup createUnit [_type, _ar select 5, [], 0, "NONE"];
 
if (isNull _newUnit) exitWith { hint "Sorry, something went wrong, newUnit is null" };
 
hint format["2.New unit created, local: %1", local _newUnit];
sleep 1;
 
setPlayable _newUnit;
addSwitchableUnit _newUnit;
selectPlayer _newUnit;
 
_newUnit setRank (_ar select 2);
_newUnit addScore (_ar select 3);
 
hint format["3.State transfered, switched player control to new unit, local: %1", local _newUnit];
sleep 1;
if (_ar select 7 != "") then {
    _newUnit setVehicleInit format["this setVehicleVarName '%1'; %1 = this", _ar select 7];
    processInitCommands;
};
 
[_newUnit] join (_ar select 4);
removeSwitchableUnit _newUnit;
 
hint "5.New Unit joined in original group";
sleep 1;
 
{ deleteVehicle _x } forEach [_oldUnit, _dummyUnit]; // Might have to remote execute this to be successfull in MP
 
hint "6.Deleted and moved away dummy units etc";
sleep 1;
 
if (_ar select 6) then { (group _newUnit) selectLeader _newUnit };
 
/// *****
 
// _h=[_skin] spawn CBA_fnc_switchPlayer;
// _h=[_skin,"LEAVEWEPS"] spawn CBA_fnc_switchPlayer;
 
removeAllWeapons _player;
removeAllitems _player;
removeBackpack player;
 
_player addMagazine "15Rnd_9x19_M9";
_player addMagazine "15Rnd_9x19_M9";
_player addWeapon "M9";
 
_player addweapon "ItemMap";
_player addweapon "ItemCompass";
_player addweapon "ItemWatch";
 
_secondaryWeapon = secondaryWeapon _player;
_player selectweapon _secondaryWeapon;
 
// _player