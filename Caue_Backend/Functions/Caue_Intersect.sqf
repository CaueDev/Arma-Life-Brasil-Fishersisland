['Caue_Intersect_Lines', {

    if (isDedicated) exitwith {};

    ["Caue_Intersect_Lines", "onEachFrame", {

        if ((count(nearestObjects [player,["A3PL_Stinger"],3]) > 0) && !((vehicle player) isEqualTo player)) then {
            [] call Caue_Police_Spikes;
        };

        _begPos = positionCameraToWorld [0,0,0];
        _begPosASL = AGLToASL _begPos;
        _endPos = positionCameraToWorld [0,0,1000];
        _endPosASL = AGLToASL _endPos;

        _ins = lineIntersectsSurfaces [_begPosASL, _endPosASL, player, objNull, true, 1, "FIRE", "NONE"];

        if (_ins isEqualTo []) exitWith {};

        _ins select 0 params ["_pos","_norm","_obj","_parent"];

        if (isNull _obj) exitwith {
            private _cur = cursorObject;
            if (!isNull cursorObject) exitwith {
                Player_ObjIntersect = cursorObject;
                Player_NameIntersect = "";
                {
                    if ((_x select 0) isEqualTo (typeOf _cur)) then
                    {
                        private ["_name","_icon"];
                        _name = _x select 1;
                        _icon = _x select 2;
                        drawIcon3D [_icon, [1,1,1,1], getpos _cur, 1, 1, 45,_name, 1, 0.05, "PuristaSemiBold"];
                    };
                } forEach Config_Intersect_NoNameNoFire;
            };
            Player_ObjIntersect = player;
            Player_NameIntersect = "";
        };

        if ((!(getModelInfo _parent select 2)) || ((player distance _obj) > 20)) exitWith {
            Player_NameIntersect = "";
            Player_ObjIntersect = _obj;
            {
                if (_x select 0 == (typeOf _obj)) then
                {
                    private ["_name","_icon"];
                    _name = _x select 1;
                    _icon = _x select 2;
                    drawIcon3D [_icon, [1,1,1,1], getpos _obj, 1, 1, 45,_name, 1, 0.05, "PuristaSemiBold"];
                };
            } foreach Config_Intersect_NoName;
        };

        _ins2 = [_parent, "FIRE"] intersect [_begPos, _endPos];

        if (_ins2 isEqualTo []) exitWith {
            Player_NameIntersect = "";
            Player_ObjIntersect = _veh;
        };

        _ins2 select 0 params ["_name", "_dist"];
        _posAGL = _obj modelToWorldVisual (_obj selectionPosition [_name,"Memory"]);

        if (([_posAGL,ASLToAGL (getposASL player)] call BIS_fnc_distance2D) > 3) exitwith {
            Player_NameIntersect = "";
            Player_ObjIntersect = _obj;
        };

        if !(player_nameIntersect isEqualTo _name) then {
            Player_selectedIntersect = 0;
        };

        Player_NameIntersect = _name;
        Player_ObjIntersect = _obj;

        _icon = "\a3\ui_f\data\map\GroupIcons\icon_default.paa";

        _config = (_name call Caue_Intersect_ConditionCalc);

        _countConfig = (count _config) - 1;
        if ( player_selectedIntersect > _countConfig) then {
            player_selectedIntersect = _countConfig;
        };

        if (player_selectedIntersect < 0) exitWith {};

        _configSel = _config select Player_selectedIntersect;
        _name = format ["→ %1 ←",_configSel select 1];
        _icon = _configSel select 2;

        drawIcon3D [_icon, [1,1,1,1], _posAGL, 1, 1, 45,_name, 1, 0.05, "PuristaSemiBold"];

        if (_countConfig > player_selectedIntersect) then {
            _posAGL = [_posAGL select 0,_posAGL select 1, (_posAGL select 2) - ((_begPosASL distance _posAGL) / 50)];
            _configSel = _config select (Player_selectedIntersect + 1);
            _name = _configSel select 1;
            _icon = _configSel select 2;
            drawIcon3D ["", [1,1,1,1], _posAGL, 0, 0, 0,_name, 1, 0.036, "PuristaSemiBold"];
        };

        if (player_selectedIntersect > 0) then {
            _posAGL = [_posAGL select 0,_posAGL select 1, (_posAGL select 2) + ((_begPosASL distance _posAGL) / 35)];
            _configSel = _config select (Player_selectedIntersect - 1);
            _name = _configSel select 1;
            _icon = _configSel select 2;
            drawIcon3D ["", [1,1,1,1], _posAGL, 0, 0, 0,_name, 1, 0.036, "PuristaSemiBold"];
        };

    }] call BIS_fnc_addStackedEventHandler;

    IntersectReady = true;

}, false] call Server_Setup_Compile;

['Caue_Intersect_ActionKey', {

    private ["_isGen","_interName","_interObj","_config"];

    if (A3PL_MedicalVar_Unconscious) exitWith {};

    _config = (Player_NameIntersect call Caue_Intersect_ConditionCalc);

    if ((count _config) isEqualTo 0) then {
        _interName = "";
    } else {
        _interName = (_config select Player_selectedIntersect) select 1;
    };

    _interObj = call Caue_Intersect_CursorTarget;

    if ((count ([] call A3PL_Lib_Attached) > 0) && (isNull player_Item)) exitwith {
        _interObj = ([] call A3PL_Lib_Attached) select 0;

        if (([_interObj] call A3PL_lib_CheckIfFurniture) && (_interObj IN ([] call A3PL_Lib_Attached))) exitwith {
            [] call A3PL_Placeables_QuickAction;
        };

        if ((typeOf _interObj) IN Config_Placeables) then {
            [] call A3PL_Placeables_QuickAction;
        };
    };

    if (_interName IN Config_GenArray) then {
        {
            if (_intername isEqualTo (_x select 1)) exitwith {call (_x select 2);};
        } forEach Config_QuickActions;
    } else {
        {
            if ((_intername == (_x select 1)) && ((typeOf _interObj) == (_x select 0))) exitwith {call (_x select 2);};
        } forEach Config_QuickActions;
    };

}, false] call Server_Setup_Compile;

['Caue_Intersect_ConditionCalc', {

    private _name = _this;
    private _newArray = [];

    {
        if (_name == (_x select 0)) then {
            if (call (_x select 3)) then {_newArray pushback _x;};
        };
    } forEach Config_IntersectArray;

    _newArray

}, false] call Server_Setup_Compile;

['Caue_Intersect_CursorTarget', {

    if (isNil "Player_ObjIntersect") exitwith {player};

    Player_ObjIntersect

}, false] call Server_Setup_Compile;

['Caue_Intersect_CursorTargetName', {

    if (isNil "Player_NameIntersect") exitwith {player};

    Player_NameIntersect

}, false] call Server_Setup_Compile;

['Caue_Intersect_HandleDoors', {

    private _obj = call Caue_Intersect_CursorTarget;
    private _name = Player_NameIntersect;

    if (typeOf _obj == "Land_A3PL_Prison") exitwith {
        [_obj,_name] call A3PL_Prison_HandleDoor;
    };

    private _split = _name splitstring "_";

    if (((_split select 0) find "garagedoor") != -1) exitwith {
        if ((typeOf _obj) IN ["Land_Home1g_DED_Home1g_01_F","Land_Home2b_DED_Home2b_01_F","Land_Home3r_DED_Home3r_01_F","Land_Home4w_DED_Home4w_01_F","Land_Home5y_DED_Home5y_01_F","Land_Home6b_DED_Home6b_01_F","Land_A3PL_Greenhouse","Land_A3PL_Ranch3","Land_A3PL_Ranch2","Land_A3PL_Ranch1"]) exitwith {
            if (isNil {_obj getVariable "unlocked"}) exitwith {
                ['Esta garagem está trancada', Color_Red] call A3PL_HUD_Notification;
            };

            if (count _split > 2) then {
                [_obj,(_split select 0),false] call A3PL_Lib_ToggleAnimation;
            } else {
                [_obj,(_split select 0)] call A3PL_Lib_ToggleAnimation;
            };
        };

        private _canUse = true;
        switch (typeOf _obj) do {
            case ("Land_A3PL_Firestation"): { if ((player getVariable ["job","unemployed"]) != "fifr") exitwith {_canUse = false}; };
        };
        if (!_canUse) exitwith {["Você não pode usar esta porta/botão"] call A3PL_HUD_Notification;};

        [_obj,(_split select 0)] call A3PL_Lib_ToggleAnimation;
    };

    if ((_split select 0) == "door") then {
        private _canUse = true;
        switch (typeOf _obj) do {
            case ("Land_A3PL_Sheriffpd"): { if ((_name IN ["door_3","door_4","door_11","door_18","door_19","door_20","garagedoor_button"]) && !((player getVariable ["job","unemployed"]) IN ["police"])) exitwith {_canUse = false}; };
            case ("Land_A3PL_Clinic"): { if ((_name IN ["door_3","door_4","door_5","door_6","door_7","door_8","door_9","door_10","door_11"]) && !((player getVariable ["job","unemployed"]) IN ["fifr"])) exitwith {_canUse = false}; };
            case ("Land_A3PL_Prison"): { if (((_name find "button") != -1) && ((player getVariable ["job","unemployed"]) != "police")) exitwith {_canUse = false}; };
            case ("Land_A3PL_Firestation"): { if ((player getVariable ["job","unemployed"]) != "fifr") exitwith {_canUse = false}; };
        };
        if (!_canUse) exitwith {["Você não pode usar esta porta/botão"] call A3PL_HUD_Notification;};

        if ((typeOf _obj) IN ["Land_A3PL_Motel","Land_Home1g_DED_Home1g_01_F","Land_Home2b_DED_Home2b_01_F","Land_Home3r_DED_Home3r_01_F","Land_Home4w_DED_Home4w_01_F","Land_Home5y_DED_Home5y_01_F","Land_Home6b_DED_Home6b_01_F","Land_A3PL_Greenhouse","Land_Mansion01","Land_A3PL_Ranch3","Land_A3PL_Ranch2","Land_A3PL_Ranch1","Land_A3PL_Shed2","Land_A3PL_Shed3","Land_A3PL_Shed4","Land_A3PL_BostonHouse"]) exitwith {
            switch (true) do {
                case ((typeOf _obj) == "Land_A3PL_Motel"): {
                    [_obj,format ["%1_%2",(_split select 0),(_split select 1)],false] call A3PL_Lib_ToggleAnimation;
                };

                case ((typeOf _obj) IN ["Land_Home1g_DED_Home1g_01_F","Land_Home2b_DED_Home2b_01_F","Land_Home3r_DED_Home3r_01_F","Land_Home4w_DED_Home4w_01_F","Land_Home5y_DED_Home5y_01_F","Land_Home6b_DED_Home6b_01_F","Land_A3PL_Shed2","Land_A3PL_Shed3","Land_A3PL_Shed4","Land_A3PL_BostonHouse"]): {
                    if (_name IN ["door_1","door_2","door_3"]) then {
                        if (isNil {_obj getVariable "unlocked"}) exitWith {
                            ['Esta porta está trancada', Color_Red] call A3PL_HUD_Notification;
                        };
                        [_obj,format ["%1_%2",(_split select 0),(_split select 1)],false] call A3PL_Lib_ToggleAnimation;
                    } else {
                        [_obj,format ["%1_%2",(_split select 0),(_split select 1)],false] call A3PL_Lib_ToggleAnimation;
                    };
                };

                case ((typeOf _obj) == "Land_Mansion01"): {
                    if (_name IN ["door_8","door_1"]) then {
                        if (isNil {_obj getVariable "unlocked"}) exitwith {
                            ['Esta porta está trancada', Color_Red] call A3PL_HUD_Notification;
                        };
                        [_obj,format ["%1_%2",(_split select 0),(_split select 1)],false] call A3PL_Lib_ToggleAnimation;
                    } else {
                        [_obj,format ["%1_%2",(_split select 0),(_split select 1)],false] call A3PL_Lib_ToggleAnimation;
                    };
                };

                case ((typeOf _obj) IN ["Land_A3PL_Ranch3","Land_A3PL_Ranch2","Land_A3PL_Ranch1","Land_A3PL_Greenhouse"]): {
                    if (_name IN ["door_1","door_2"]) then {
                        if (isNil {_obj getVariable "unlocked"}) exitwith {
                            ['Esta porta está trancada', Color_Red] call A3PL_HUD_Notification;
                        };
                        [_obj,format ["%1_%2",(_split select 0),(_split select 1)],false] call A3PL_Lib_ToggleAnimation;
                    } else {
                        [_obj,format ["%1_%2",(_split select 0),(_split select 1)],false] call A3PL_Lib_ToggleAnimation;
                    };
                };
            };
        };

        if ((typeOf _obj) IN ["Land_A3PL_ATCTower"]) then {
            if (_name IN ["door_1"]) then {
                [_obj,format ["%1_%2",(_split select 0),(_split select 1)],false] call A3PL_Lib_ToggleAnimation;
            } else {
                [_obj,format ["%1_%2",(_split select 0),(_split select 1)],false] call A3PL_Lib_ToggleAnimation;
            };
        };

        [_obj,format ["%1_%2",(_split select 0),(_split select 1)],false] call A3PL_Lib_ToggleAnimation;

        if ((_name IN ["door_3_button","door_3_button2","door_5_button","door_5_button2","door_7_button","door_7_button2","door_9_button","door_9_button2"]) && ((typeOf _obj) == "Land_A3PL_Sheriffpd")) then {
            _doorN = (parseNumber (_split select 1)) + 1;
            [_obj,format ["%1_%2",(_split select 0),_doorN],false] call A3PL_Lib_ToggleAnimation;
        };
    };

}, false] call Server_Setup_Compile;
