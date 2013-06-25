//	@file Version: 1.0
//	@file Name: antiCheatClient.sqf
//	@file Author: [404] Costlyy
//	@file Created: 03/05/13
//	@file Args:

// This anti-cheat file is a a work-in-progress and is not intended to replace vigilance and or anticheat software.
// The reason that I wrote this file is to mitigate some of the most irritating but not server destroying hacks that
// players complain about the most.

// I couldn't figure out a way to extract all weapons of superClass "cannonBase" and as a result, we have this ugly monstrosity below.
// TODO: Find a better way of doing this...
_bannedWeapons = [
"BAF_AS50_TWS_Large",
"PMC_AS50_TWS_Large",
"SCAR_L_STD_EGLM_TWS",
"m8_tws",
"m8_tws_sd",
"m107_TWS_EP1",
"M110_TWS_EP1",
"AKS_74_GOSHAWK",
"M249_TWS_EP1",
"SCAR_H_STD_EGLM_Spect",
"SVD_NSPU_EP1",
"BAF_L85A2_RIS_CWS",
"SCAR_H_STD_TWS_SD"
   ];
    
// TODO: Make mission vehicles sit in public arrays, then extrapolate the vehicles out of the cfgVehicles in full
//  and just compare to make sure the selected vehicle is not in any of the mission arrays.
_bannedVehicles = [
	"F35B","A10","AH1Z","AH64D","AV8B","C130","C130J",
    "C130J_US_EP1", "A10_US_EP1"];
    
    
_currencyLimit = 10 * 1000; // 10k money limit for initial config.
_moneyKickCeiling = 30 * 1000; // money kick ceiling - default value is 30k.
_instantKick = false; // Kick the bastards immediately or taunght them a little?
_moneyKick = true; // Kick players who greatly exceed the money limit? Note: THIS MAY LEAD TO FALSE-POSITIVES! YOU HAVE BEEN WARNED...

func_tauntHacker = {                
	// Black their screen out and taunt them with silly messages! Mwahahahaha!
	titleText ["", "BLACK IN", 0];
	titleText ["ERROR: Try again mother fucker. ","black"]; 
	sleep 10; titleFadeOut 10; 
};


while {true} do {
     
	// Re-enable input incase it has been disabled.
	player enableSimulation true;
    disableUserInput false;
	        
	// Show the player incase they are trying to be a sneaky little neckbearded fuck.
	player hideObject false;
	[nil, player, "loc", rHideObject, false] call RE;
    
    // Remove existing event handlers before adding them back.
    player removeAllEventHandlers "Killed";
    player removeAllEventHandlers "Respawn";
    player removeAllEventHandlers "handleDamage";
    
    // Add event handlers back incase hacker has disabled them.
    if(!isNil "client_initEH") then { player removeEventHandler ["Respawn", client_initEH]; };
	player addEventHandler ["Respawn", {[_this] call onRespawn;}];
	player addEventHandler ["Killed", {[_this] call onKilled;}];
    player addEventHandler ["handleDamage", { _this select 2 }];
    player allowDamage true;
    
    // Get the player's money and ensure it is < 10k.
	_money = player getVariable["cmoney",0];    
	if (_money > _currencyLimit) then {
    	if (_moneyKick AND _money > _moneyKickCeiling) then { 
        	if (!_instantKick) then { [] call func_tauntHacker; };
            endMission "LOSER";
        } else {
        	player setVariable["cmoney",_currencyLimit, true];
        };
	};
      
    { // Check for illegal weapons. 
    	if (currentWeapon player == _x) exitWith {
        	// Firstly MITIGATE the damage by removing the infringing weaponry.
    		removeAllWeapons player;
            if (!_instantKick) then { [] call func_tauntHacker; }; 
            endMission "LOSER";
        };
    }forEach _bannedWeapons;
    
    { // Check for illegal vehicles. 
    	if ((typeOf (vehicle player)) == _x) then {
        	deleteVehicle (vehicle player);
            playSound "IncomingChallenge";
        	[] call func_tauntHacker;
        };
    }forEach _bannedVehicles;
              	
	// Loop speed not much of an issue clientside.
	sleep 0.5; 
};

