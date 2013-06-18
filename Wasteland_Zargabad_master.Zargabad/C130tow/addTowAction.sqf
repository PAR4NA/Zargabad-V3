// addTowAction.sqf
// © AUGUST 2009 - norrin (norrin@iinet.net.au)

_vcl 			= _this select 0;
_c 				= 0;
_load 			= _vcl addAction ["Tow aircraft", "c130Tow\attach.sqf", "", 0, false, true];
_unload 		= _vcl addAction ["Detach aircraft ", "c130Tow\dettach.sqf","", 0, false, true];
Norrn_C130Tow 	= false;
_plane 			= objNull;
_distance 		= 0;

_vcl removeAction _load;
_vcl removeAction _unload;

while {alive _vcl && count (crew _vcl) == 1} do
{ 	
	if (count (nearestObjects [_vcl, ["PLANE"], 20]) > 0 && _c == 0 && !Norrn_C130Tow) then
	{	
		_plane = nearestObjects [_vcl, ["Plane"], 20] select 0;
		_distance = switch (typeOf _plane) do {
		case "A10": {9.5};
		case "AV8B2": {9};
		case "C130J": {17};
		case "F35B": {9.2};
		case "MV22": {12.5};
		case "Su25_Ins": {9.2};
		case "Su25_CDF": {9.2};
		case "Su34": {12}; 
		};
	
		_pos = getPos _plane;
		_dir = getDir _plane;
		_posfront = [(_pos select 0) + (sin _dir * _distance), (_pos select 1) + (cos _dir * _distance), 0]; 
		//hint format ["vcl: %1 \nplane: %2", (getPos _vcl), _posfront];
		if (_vcl distance _posfront < 2.5 && (getDir _vcl) > (_dir - 20) && (getDir _vcl) < (_dir + 20)) then 
		{
			_load = _vcl addAction ["Tow aircraft", "c130Tow\attach.sqf", [_vcl, _plane], 0, false, true];
			_vcl removeAction _unload;
			_c = 1;
		};
	};
	if (Norrn_C130Tow && _c == 1) then
	{	
		_unload = _vcl addAction ["Detach aircraft ", "c130Tow\detach.sqf", _plane, 0, false, true];
		_vcl removeAction _load;
		_c = 0;
	};
	
	if (count (nearestObjects [_vcl, ["PLANE"], 20]) > 0 && _c == 1 && !Norrn_C130Tow) then
	{	
		_pos = getPos _plane;
		_dir = getDir _plane;
		_posfront = [(_pos select 0) + (sin _dir * _distance), (_pos select 1) + (cos _dir * _distance), 0]; 
		//hint format ["car: %1 \nplane: %2", getDir _vcl, _dir];
		if (_vcl distance _posfront > 2.5 || (getDir _vcl) > (_dir + 20) || (getDir _vcl) < (_dir - 20)) then 
		{
			_vcl removeAction _load;
			_c = 0;
		};
	};
						
	if (count (nearestObjects [_vcl, ["PLANE"], 20]) == 0 && _c == 1) then
	{
		_vcl removeAction _load;
		_vcl removeAction _unload;
		_c = 0;
	};	
	sleep 1;
};
_vcl removeAction _load;
_vcl removeAction _unload;
detach _plane;

if (!alive _vcl) exitWith {};



