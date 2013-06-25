_player = _this select 0;
_killer = _this select 1;

_killerWep = currentWeapon _killer;
_distance = _killer distance _player;
_distance = floor(_distance);

if(_player == _killer) then {
[player, nil, rGlobalChat, format["%1 killed himself",name _player]] call RE;
} else {
[player, nil, rGlobalChat, format["%1 was killed by %2 with %4",name _player,name _killer,_distance,_killerWep]] call RE;
};