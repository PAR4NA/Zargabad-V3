//	@file Name: tierThree.sqf
// 	@file Version: 2.0
// 	@file Author: [BMRF] Madhatter
// 	@file Site: www.BMRF.me
// 	@file Date: 11-June-2013
//  @file Note: Out of respect, please request permission from the author prior to use. Thank you.
// ===============================================================================================
// ===============================================================================================

if (((getPlayerUID player) in TierThree)) then {

removeAllWeapons player;
player addMagazine "5Rnd_762x51_M24";
player addMagazine "5Rnd_762x51_M24";
player addMagazine "5Rnd_762x51_M24";
player addMagazine "5Rnd_762x51_M24";
player addMagazine "5Rnd_762x51_M24";
player addMagazine "5Rnd_762x51_M24";
player addWeapon "M40A3";
player addMagazine "20Rnd_B_765x17_Ball";
player addMagazine "20Rnd_B_765x17_Ball";
player addMagazine "20Rnd_B_765x17_Ball";
player addMagazine "20Rnd_B_765x17_Ball";
player addMagazine "20Rnd_B_765x17_Ball";
player addWeapon "Sa61_EP1";
player selectWeapon "M40A3;
player addWeapon "Binocular";
player addWeapon "NVgoggles";
player setVariable["cmoney",800,true];
player setVariable["canfood",2,true];
player setVariable["water",2,true];
player setVariable["medkits",2,true];
player setVariable["fuel",0,true];
player setVariable["fuelFull",1,true];
player setVariable["fuelEmpty",0,true];
player setVariable["repairkits",1,true];
player setVariable["spawnBeacon",0,true];
player setVariable["camonet",0,true];
player setVariable["ShowNameAllies", false];
};