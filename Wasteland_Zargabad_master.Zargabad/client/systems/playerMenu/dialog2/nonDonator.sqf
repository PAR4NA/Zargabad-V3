// 	@file Name: nonDonator.sqf
// 	@file Version: 2.0
// 	@file Author: [BMRF] Madhatter
// 	@file Site: www.BMRF.me
// 	@file Date: 11-June-2013
//  @file Note: Out of respect, please request permission from the author prior to use. Thank you.
// ===============================================================================================
// ===============================================================================================

if(str(playerSide) in ["WEST"]) then
{
    removeAllWeapons player;
	player addWeapon "M16A2";
    player addMagazine "30Rnd_556x45_Stanag";
	player addMagazine "30Rnd_556x45_Stanag";
	player addMagazine "7Rnd_45ACP_1911";
    player addMagazine "7Rnd_45ACP_1911";
    player addMagazine "7Rnd_45ACP_1911";
	player addWeapon "Colt1911";
	player selectWeapon "Colt1911";
	player addWeapon "NVgoggles";
};

if(str(playerSide) in ["EAST"]) then
{
    removeAllWeapons player;
	player addWeapon "M16A2";
    player addMagazine "30Rnd_556x45_Stanag";
	player addMagazine "30Rnd_556x45_Stanag";
	player addMagazine "7Rnd_45ACP_1911";
    player addMagazine "7Rnd_45ACP_1911";
    player addMagazine "7Rnd_45ACP_1911";
	player addWeapon "Colt1911";
	player selectWeapon "Colt1911";
	player addWeapon "NVgoggles";
};

if(str(playerSide) in ["GUER"]) then
{
    removeAllWeapons player;
	player addWeapon "M16A2";
    player addMagazine "30Rnd_556x45_Stanag";
	player addMagazine "30Rnd_556x45_Stanag";
	player addMagazine "7Rnd_45ACP_1911";
    player addMagazine "7Rnd_45ACP_1911";
    player addMagazine "7Rnd_45ACP_1911";
	player addWeapon "Colt1911";
	player selectWeapon "Colt1911";
	player addWeapon "NVgoggles";
};

player setVariable["cmoney",100,false];
player setVariable["canfood",2,false];
player setVariable["water",0,false];
player setVariable["medkits",0,false];
player setVariable["fuel",0,false];
player setVariable["fuelFull",0,false];
player setVariable["fuelEmpty",1,false];
player setVariable["repairkits",0,false];
player setVariable["spawnBeacon",0,false];
player setVariable["camonet",0,false];
player setVariable["bombs",false,false];
player setVariable["canDrop",false,false];
