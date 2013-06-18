// attach.sqf
// © AUGUST 2009 - norrin (norrin@iinet.net.au)

_array 			= _this select 3;
_vcl 			= _array select 0;
_plane			= _array select 1;

switch (typeOf _plane) do {
		case "A10": 	 	{_plane attachto [_vcl,[0, -9, -0.2]];};
		case "AV8B2": 	 	{_plane attachto [_vcl,[0, -8.5, 1.6]];};
		case "C130J": 	 	{_plane attachto [_vcl,[0,-15.5,4.6]];};
		case "F35B":	 	{_plane attachto [_vcl,[0, -9, 1.1]];};
		case "MV22":  	 	{_plane attachto [_vcl,[0, -12, 2.5]];};;
		case "Su25_Ins": 	{_plane attachto [_vcl,[0, -9, 2]];};
		case "Su25_CDF": 	{_plane attachto [_vcl,[0, -9, 2]];};
		case "Su34": 		{_plane attachto [_vcl,[0, -14, 1.6]];};
		};
Norrn_C130Tow 	= true;

if (true) exitWith {};
