["Caue_Anticheat_Init", {

	if (isServer) exitWith {AnticheatReady = true;};

	private _uid = getPlayerUID player;

	/* Check Mods */
	private _clientPatches = configFile >> "CfgPatches";
	private _missingPatches = "isClass _x && !((configName _x) in (call Batatafrita))" configClasses _clientPatches;
	_missingPatches = _missingPatches apply {configName _x};

	if !(_missingPatches isEqualTo []) exitWith {
		[_uid,"Hack",format["More Patches | %1",_missingPatches]] remoteExec ["Caue_Log_Anticheat",2];
		sleep 0.5;
		failMission "FEKOFF";
	};

	uiNamespace setVariable ["RscDisplayRemoteMissions",displayNull];
	uiNamespace setVariable ["RscDisplayMultiplayer",displayNull];

	/* Check MPInterrupt */
	private _children = [configFile >> "RscDisplayMPInterrupt" >> "controls",0] call BIS_fnc_returnChildren;
	private _allowedChildren = [
	    "Title","MissionTitle","PlayersName","ButtonCancel","ButtonSAVE","ButtonSkip","ButtonRespawn","ButtonOptions",
	    "ButtonVideo","ButtonAudio","ButtonControls","ButtonGame","ButtonTutorialHints","ButtonAbort","DebugConsole",
	    "Version","TraffLight","Feedback","MessageBox","cba_help_credits"
	];

	private _notAllowed = [];
	{
		private _config = configName _x;
		if !(_config in _allowedChildren) then {
			_notAllowed pushBack _config;
		};
	} forEach _children;

	if ((count _notAllowed) > 0) exitWith {
		[_uid,"Hack",format["Modified MPInterrupt | %1",_notAllowed]] remoteExec ["Caue_Log_Anticheat",2];
		sleep 0.5;
		failMission "FEKOFF";
	};

	/* Check Modified Display */
	{
	    _x params ["_class","_expectedOnLoad","_expectedOnUnload"];
	    private _onLoad = getText(configFile >> _class >> "onLoad");
	    private _onUnload = getText(configFile >> _class >> "onUnload");
	    if (_onLoad != _expectedOnLoad || _onUnload != _expectedOnUnload) exitWith {
			[_uid,"Hack",format["Modified Display Method | %1 (Memory Edit)",_class]] remoteExec ["Caue_Log_Anticheat",2];
			sleep 0.5;
	        failMission "FEKOFF";
	    };
	} forEach Bananada;

	/* Check Modified Inits */
	if (getText(configFile >> "CfgFunctions" >> "init") != "A3\functions_f\initFunctions.sqf") then {
	    [_uid,"Hack","Modified Functions Init"] remoteExec ["Caue_Log_Anticheat",2];
		sleep 0.5;
		failMission "FEKOFF";
	};

	/* Blacklist */
	if (_uid IN BlacklistFaggots) exitWith {failMission "LEAN";};

	/* Draw Executer */
	if (!(isNil "life_goodshit") || !(isNil "GoodMemes")) then {
	    [_uid,"Hack","Draw display 51 executer"] remoteExec ["Caue_Log_Anticheat",2];
		sleep 0.5;
		failMission "FEKOFF";
	};

	/* Loops */
	[] spawn Caue_Anticheat_VarLoop;
	[] spawn Caue_Anticheat_AutoClick;
	[{[] spawn Caue_Anticheat_VarLoop;},2] spawn Client_Loop;

	AnticheatReady = true;

}, false, true] call Server_Setup_Compile;

["Caue_Anticheat_VarLoop", {

	private _uid = getPlayerUID player;
	{
		if (player getVariable ["ufbhasyufbaufa",false]) exitWith {};

		_vc = missionNamespace getVariable _x;
		if (!isNil _x) then {
			[_uid,"Hack",format["BadVar | %1 - %2",_x,_vc]] remoteExec ["Caue_Log_Anticheat",2];
			sleep 0.5;
			failMission "FEKOFF";
		} else {
			if (!isNil '_vc') then {
				[_uid,"Hack",format["BadVar | %1 - %2",_x,_vc]] remoteExec ["Caue_Log_Anticheat",2];
				sleep 0.5;
				failMission "FEKOFF";
			};
		};

		_vc = player getVariable _x;
		if (!isNil '_vc') then {
			[_uid,"Hack",format["BadVar on player | %1 - %2",_x,_vc]] remoteExec ["Caue_Log_Anticheat",2];
			player setVariable [_x,nil];
			sleep 0.5;
			failMission "FEKOFF";
		};

		_vc = uiNamespace getVariable _x;
		if (!isNil '_vc') then {
			[_uid,"Hack",format["BadVar in uiNamespace | %1 - %2",_x,_vc]] remoteExec ["Caue_Log_Anticheat",2];
			sleep 0.5;
			failMission "FEKOFF";
		};

		_vc = profileNamespace getVariable _x;
		if (!isNil '_vc') then {
			profileNamespace setVariable [_x,nil];
			saveProfileNamespace;
			[_uid,"Hack",format["BadVar in profileNamespace | %1 - %2",_x,_vc]] remoteExec ["Caue_Log_Anticheat",2];
			sleep 0.5;
			failMission "FEKOFF";
		};
	} forEach (call KeppoLul);

}, false, true] call Server_Setup_Compile;

['Caue_Anticheat_AutoClick', {

    clp = 0;
    llo = 0;
    clsa = false;

    waitUntil {!isnull (findDisplay 46)};

    (findDisplay 46) displayAddEventHandler ["MouseButtonDown",{
    	_this spawn {
        	if ((_this select 1) isEqualTo 0) then {
            	clp = clp + 1;
				clsa = true;
            	if (clp < 0) then {clp = 0;};
        	};

        	uisleep 1;
        	clp = clp - 1;

        	if (clp >= 20 && clsa) then {
            	clsa = false;
            	if ((llo + 60) < time) then {
                	llo = time;

                	_log = format["%1 / %2 | %3 c/s | POS - %4", (player getVariable ["name","Undefined"]), (name player), clp, (getPosATL player)];
                	[(getPlayerUID player),"AutoClick",_log] remoteExec ["Caue_Log_Anticheat",2];
                	failMission "OMEGALUL";
            	};
        	};

        	if(clp < 0) then {clp = 0;};

    	};
	}];

}, false, true] call Server_Setup_Compile;

['Caue_Anticheat_Backpack', {

    _nearPlayers = [];
    {
        if (player distance _x < 20) then {_nearPlayers pushBack _x;};
    } forEach allPlayers;

    _backpackcontainer = backpackContainer player;
    _vestcontainer = vestContainer player;
    _uniformcontainer = uniformContainer player;

    _dupe = false;

    for "_i" from 0 to 4 do {
        {
            if (!isNull _x) then {
                if (!isNull _backpackcontainer) then {
                    if (_backpackcontainer isEqualTo backpackContainer _x) then {
                        if (!_dupe) then {
                            _dupe = true;
                            _data = format["Dupe Mochila com - %1 | Mochila - %2 | POS - %3", getplayerUID _x, backpack player, position player];
                            [(getPlayerUID player),"Dupe",_data] remoteExecCall ["Caue_Log_Anticheat",2];
                            removeBackpackGlobal player;
                        };
                    };
                };

                if (!isNull _vestcontainer) then {
                    if (_vestcontainer isEqualTo vestContainer _x) then {
                        if (!_dupe) then {
                            _dupe = true;
                            _data = format["Dupe Colete com - %1 | Colete - %2 | POS - %3", getplayerUID _x, backpack player, position player];
                            [(getPlayerUID player),"Dupe",_data] remoteExecCall ["Caue_Log_Anticheat",2];
                            removeVest player;
                        };
                    };
                };

                if (!isNull _uniformcontainer) then {
                    if (_uniformcontainer isEqualTo uniformContainer _x) then {
                        if (!_dupe) then {
                            _dupe = true;
                            _data = format["Dupe Roupa com - %1 | Roupa - %2 | POS - %3", getplayerUID _x, backpack player, position player];
                            [(getPlayerUID player),"Dupe",_data] remoteExecCall ["Caue_Log_Anticheat",2];
                            removeUniform player;
                        };
                    };
                };
            };
        } forEach _nearPlayers - [player];
    };

}, false, true] call Server_Setup_Compile;

['Caue_Anticheat_LagSwitch', {

	private _return = true;
	private _var = [5] call Caue_Lib_GenerateID;

	[player,_var,true] remoteExec ["Server_Core_ChangeVar",2];

	[_var] spawn {
		uisleep 2;
		player setVariable [(_this select 0),false,true];
	};

	waitUntil {(!((player getVariable [_var,""]) isEqualTo ""))};

	if !(player getVariable _var) then {["AntiLagSwith Bitch",Color_Yellow] call A3PL_HUD_Notification; _return = false;};

	player setVariable [_var,nil,true];

	_return

}, false, true] call Server_Setup_Compile;

['Caue_Anticheat_Server',{

	addMissionEventHandler ["PlayerConnected", {
		params [
			"_id",
			["_uid",""],
			"_name",
			"_jip",
			"_owner"
		];

		if (_uid isEqualTo "") exitWith {};

		private _check = "log" callExtension format["6~%1",_uid];

		if (_check isEqualTo "true") then {
			[_uid,"Ban","Tentou entrar mais e um lixinho"] call Caue_Log_Anticheat;
			"bdsaudbu2412nd98and2" serverCommand format["#kick %1",_uid];
		};
	}];

}, true, true] call Server_Setup_Compile;
