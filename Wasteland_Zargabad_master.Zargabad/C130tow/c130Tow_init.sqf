// c130Tow_init.sqf
// © AUGUST 2009 - norrin (norrin@iinet.net.au)
// Based on an idea from David Campagna 
_vcl = _this select 0;

_vcl addEventHandler ["GETIN",{if ((_this select 1) == "driver") then
{_nul = [_this select 0] execVM "c130Tow\addTowAction.sqf"}}];

if (true) exitWith {};



