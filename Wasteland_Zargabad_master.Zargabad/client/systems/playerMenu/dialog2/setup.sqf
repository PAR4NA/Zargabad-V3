// 	@file Name: setup.sqf
// 	@file Version: 2.0
// 	@file Author: [BMRF] Madhatter
// 	@file Site: www.BMRF.me
// 	@file Date: 11-June-2013
//  @file Note: Out of respect, please request permission from the author prior to use. Thank you.
// ===============================================================================================
// ===============================================================================================

_uid = "";
_uid = getPlayerUID player;

if (_uid in TierOne) then {
    player execVM "client\systems\playerMenu\dialog2\tierOne.sqf"; 
    sleep 0.1;
    hint "Welcome FPSU VIP!";
} 
else {

if (_uid in TierTwo) then {
    player execVM "client\systems\playerMenu\dialog2\tierTwo.sqf"; 
    sleep 0.1;
    hint "Welcome FPSU VIP!";
} 
else {

if (_uid in TierThree) then {
    player execVM "client\systems\playerMenu\dialog2\tierThree.sqf"; 
    sleep 0.1;
    hint "Welcome FPSU VIP!";
} 
else {

if (_uid in TierFour) then {
    player execVM "client\systems\playerMenu\dialog2\tierFour.sqf"; 
    sleep 0.1;
    hint "Welcome FPSU VIP!";
} 
else {
    player execVM "client\systems\playerMenu\dialog2\nonDonator.sqf"; 
    sleep 0.1;
};
};
};
};
