// 	@file Name: tierFour.sqf
// 	@file Version: 2.0
// 	@file Author: [BMRF] Madhatter
// 	@file Site: www.BMRF.me
// 	@file Date: 11-June-2013
//  @file Note: Out of respect, please request permission from the author prior to use. Thank you.
// ===============================================================================================
// ===============================================================================================

if (((getPlayerUID player) in TierFour)) then {

removeAllWeapons player;

player addMagazine "6Rnd_45ACP";
player addMagazine "6Rnd_45ACP";
player addMagazine "6Rnd_45ACP";
player addMagazine "6Rnd_45ACP";
player addMagazine "6Rnd_45ACP";
player addWeapon "revolver_gold_EP1";
player addMagazine "5Rnd_127x99_as50";
player addMagazine "5Rnd_127x99_as50";
player addMagazine "5Rnd_127x99_as50";
player addMagazine "5Rnd_127x99_as50";
player addMagazine "5Rnd_127x99_as50";
player addMagazine "5Rnd_127x99_as50";
player addWeapon "BAF_AS50_scoped";
player selectWeapon "BAF_AS50_scoped";
player addMagazine "PG7VR";
player addMagazine "PG7VR";
player addWeapon "RPG7V";
player addWeapon "Binocular";
player addWeapon "NVgoggles";
player setVariable["cmoney",1000,true];
player setVariable["canfood",2,true];
player setVariable["water",2,true];
player setVariable["medkits",2,true];
player setVariable["fuel",0,true];
player setVariable["fuelFull",2,true];
player setVariable["fuelEmpty",0,true];
player setVariable["repairkits",2,true];
player setVariable["spawnBeacon",0,true];
player setVariable["camonet",1,true];
player setVariable["ShowNameAllies", false];
};