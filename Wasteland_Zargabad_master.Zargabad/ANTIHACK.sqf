hintsilent format ["Script Menu/ HOSTILE_ANTI_HACK Loaded"];
private["_array", "_player", "_hackType", "_hackValue"];
 
diag_log "HOSTILE_ANTI_HACK 0.6.3 starting...";
AHAH = {
    diag_log "HOSTILE_ANTI_HACK 0.6.3 starting...";
    if (isServer) exitWith {};
    _commonPaths = ["used for hacking", "wuat\screen.sqf", "scripts\defaultmenu.sqf", "menu\initmenu.sqf", "scr\exec.sqf",
      "crinkly\keymenu.sqf", "menu\exec.sqf", "wuat\exec.sqf", "crinkly\keymenu.sqf", "scripts\ajmenu.sqf", "startup.sqf", "exec.sqf", "wookie_wuat\startup.sqf"
    ]; {
        _contents = format["", loadFile _x];
        if (_contents != "") then {
                diag_log "HOSTILE_ANTI_HACK 0.6.3: hacker?!";
                hackFlag = [player, "hack menu", _x];
				player globalChat "NOTICE: User Was Kicked+Crashed for Using Hacks, Please Report Me"; 
                publicVariableServer "hackFlag";
                sleep 3;
				for "_i"
                from 0 to 99 do {
					(findDisplay _i) closeDisplay 0;
			};
        };
    }
    forEach _commonPaths;
    diag_log "HOSTILE_ANTI_HACK 0.6.3: Starting loops!";
    [] spawn {
        private["_sleepVariableCheck", "_badPublicVariables"];
        _sleepVariableCheck = 30;
        _badPublicVariables = ["p", "fffffffffff", "markPos", "pos", ""TentS", "VL", "MV",
		"mk2", "i", "j", "fuckmegrandma", "mehatingjews", "scode", "TTT5OptionNR",
		"igodokxtt", "omgwtfbbq", "namePlayer", "thingtoattachto", "HaxSmokeOn", "v",
		"antiloop", "ARGT_JUMP", "selecteditem", "moptions", "delaymenu", "gluemenu",
		"spawnweapons1", "abcd", "skinmenu", "changebackpack", "keymenu",
		"img", "surrmenu", "footSpeedIndex", "ctrl_onKeyDown", "plrshldblcklst",
		"musekeys", "dontAddToTheArray", "morphtoanimals", "playerDistanceScreen", "pm",
		"debugConsoleIndex", "MY_KEYDOWN_FNC", "TAG_onKeyDown", "changestats", "helpmenu",
		"unitsmenu", "xZombieBait", "shnmenu", "slag", "tempslag", "dayzRespawn2", "dayzRespawn3",
		"hangender", "BIS_fnc_3dCredits_n", "ViLayer", "maphalf", "activeITEMlist",
		"activeITEMlistanzahl", "xyzaa", "iBeFlying", "rem", "DAYZ_CA1_Lollipops", "bowonky", "HMDIR", "HDIR",
		"Monky_funcs_inited", "atext", "boost", "Ug8YtyGyvguGF", "inv", "rspwn", "nd", "qofjqpofq",
		"invall", "initarr", "reinit", "byebyezombies", "keymenu2", "hotkeymenu", "letmeknow", "Listw",
		"mahcaq", "mapm", "weapFun", "firstrun", "take1", "dwarden", "bowonky", "bowen", "monky", "pic",
		"god", "toggle_keyEH", "drawic", "mk2", "i", "j", "ptags", "abox1", "dayz_godmode", "testIndex", "g0d",
		"g0dmode", "zeus", "zeusmode", "cargod", "qopfkqpofqk", "monkytp", "pbx", "playershield", "zombieDistanceScreen",
		"theKeyControl", "plrshldblckls", "zombieshield", "footSpeedKeys", "wl", "spawnitems1",
		"lmzsjgnas", "vm", "Monky_hax_toggled", "pu", "nb", "vspeed", "godlol", "godall", "initarr3", "initarr2",
		"LOKI_GUI_Key_Color", "_fcukupstar", "inf_ammo_loop_infiSTAR", "xtags_star_xx"
		];
        diag_log "ANTI-HACK 0.6.3: Detection of hack variables started!";
        while {
            true
        }
        do {
            {
                if !(isNil _x) exitWith {
                    diag_log "HOSTILE_ANTI_HACK 0.6.3: Found a Hack Variable!";
                    hackFlag = [player, "hacked variable", _x];
					player globalChat "NOTICE: User Was Kicked+Crashed for Using Hacks, Please Report Me"; 
					publicVariableServer "hackFlag";
					sleep 3;
					for "_i"
                    from 0 to 99 do {
                        (findDisplay _i) closeDisplay 0;
                    };
                };
            }
            forEach _badPublicVariables;
 
            sleep _sleepVariableCheck;
        };
    };
    [] spawn {
        private["_keyDownHandlerCount", "_keyUpHandlerCount", "_ctrlDrawHandlerCount"];
        diag_log "HOSTILE_ANTI_HACK 0.6.3: Hack menu check started!";
        while {
            true
        }
        do {
            (findDisplay 46) displayRemoveAllEventHandlers "KeyUp";
            ((findDisplay 12) displayCtrl 51) ctrlRemoveAllEventHandlers "Draw";
            if (!(isNull findDisplay 3030) || !(isNull findDisplay 155)) then {
 
                    diag_log "HOSTILE_ANTI_HACK 0.6.3: Found a Hack Menu!";
                    hackFlag = [player, "hack menu", _x];
					player globalChat "NOTICE: User Was Kicked+Crashed for Using Hacks, Please Report Me"; 
					publicVariableServer "hackFlag";
					sleep 3;
					for "_i"
                    from 0 to 99 do {
                        (findDisplay _i) closeDisplay 0;
                    };
            };
            sleep 3;
        };
    };
    [] spawn {
        private["_sleepGodModeCheck", "_recoilSettings", "_zombieCheck", "_damageHandler", "_unconsciousFunction"];
        _sleepGodModeCheck = 5;
        _recoilSettings = unitRecoilCoefficient player;
        diag_log "ANTI-HACK 0.6.3: Godmode check started!";
        while {
            true
        }
        do {
            if (unitRecoilCoefficient player != _recoilSettings) exitWith {
                    diag_log "HOSTILE_ANTI_HACK 0.6.3: Detected No-Recoil Hack!";
                    hackFlag = [player, "no recoil", "null"];
					player globalChat "NOTICE: User Was Kicked+Crashed for Using Hacks, Please Report Me"; 
					publicVariableServer "hackFlag";
					sleep 3;
					for "_i"
                    from 0 to 99 do {
                        (findDisplay _i) closeDisplay 0;
                    };
            };
            sleep _sleepGodModeCheck;
        };
    };
};
 
diag_log "HOSTILE_ANTI_HACK 0.6.3: Adding public variable handler";
"hackFlag"
addPublicVariableEventHandler {
    _array = _this select 1;
    _player = _array select 0;
    _hackType = _array select 1;
    _hackValue = format["", _array select 2];
    diag_log format["ANTI-HACK:  () was detected for  with the value ''", name _player, getPlayerUID _player, _hackType, _hackValue];
	player globalChat "NOTICE: User Was Kicked+Crashed for Using Hacks, Please Report Me"; 
	serverCommand format["#kick ", _player];
    serverCommand format["#exec ban ", _uid];
};
"clientStarted"
addPublicVariableEventHandler {
    _client = _this select 1;
    (owner _client) publicVariableClient "AHAH";
    diag_log format["Starting Anti-Hack on client #", owner _client];
};
diag_log "HOSTILE_ANTI_HACK 0.6.3: Anti-hack should be ready now!";