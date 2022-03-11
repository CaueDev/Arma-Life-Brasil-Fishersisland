/*
    Client
*/
['A3PL_JobMcFisher_CombineBurger', {

    private ["_intersect","_classIntersect","_burgers"];
    _intersect = param [0,ObjNull];
    _creating = param [1,"burger"];
    _classIntersect = _intersect getVariable "class";

    if(!([] call Caue_Player_AntiSpam)) exitWith {};
    if (isNull _intersect) exitwith {["System error: _intersect is Null in CombineBurger", Color_Red] call A3PL_HUD_Notification;};
    if (isNil "_classIntersect") exitwith {["System error: _classIntersect is Nil in CombineBurger", Color_Red] call A3PL_HUD_Notification;};
    if (!(_classIntersect IN ["burger_bun","burger_cooked","burger_raw","burger_burnt","tacoshell"])) exitwith {["System error: _classintersect not of correct type in CombineBurger", Color_Red] call A3PL_HUD_Notification;};
    if (!isNull player_item) exitwith {["Você está carregando algo e não pode executar esta ação", Color_Red] call A3PL_HUD_Notification;};


    if (_creating == "taco") exitwith
    {
        _burgers = nearestObjects [_intersect, ["A3PL_Fish_Raw","A3PL_Fish_Cooked","A3PL_Fish_Burned"], 1];
        if (!isNull player_item) then {_burgers = _burgers - [player_item];};
        if (count _burgers == 0) exitwith {["Não há peixe por perto para combinar isso", Color_Red] call A3PL_HUD_Notification;};

        _salads = nearestObjects [_intersect, ["A3PL_Salad"], 1];
        if (!isNull player_item) then {_salads = _salads - [player_item];};
        if (count _salads == 0) exitwith {["Não há salada por perto para combinar isso", Color_Red] call A3PL_HUD_Notification;};

        [player,_intersect] remoteExec ["Server_JobMcfisher_combine", 2];
    };


    if (_classIntersect == "burger_bun") exitwith
    {
        _burgers = nearestObjects [_intersect, ["A3PL_Burger_Raw","A3PL_Burger_Cooked","A3PL_Burger_Burnt"], 1];
        if (!isNull player_item) then {_burgers = _burgers - [player_item];};
        if (count _burgers == 0) exitwith {["Nada perto do item para combinar", Color_Red] call A3PL_HUD_Notification;};

        _salads = nearestObjects [_intersect, ["A3PL_Salad"], 1];
        if (!isNull player_item) then {_salads = _salads - [player_item];};
        if (count _salads == 0) exitwith {["Não há salada por perto para combinar isso", Color_Red] call A3PL_HUD_Notification;};

        [player,_intersect] remoteExec ["Server_JobMcfisher_combine", 2];
    };

    _burgers = nearestObjects [_intersect, ["A3PL_Burger_Bun"], 1];
    if (!isNull player_item) then {_burgers = _burgers - [player_item];};
    if (count _burgers == 0) exitwith {["Nada perto do item para combinar", Color_Red] call A3PL_HUD_Notification;};
    [player,_intersect] remoteExec ["Server_JobMcfisher_combine", 2];

}, false] call Server_Setup_Compile;

['A3PL_JobMcFisher_CookBurger', {

    private ["_burger","_class","_grill"];
    _burger = param [0,objNull];
    _class = typeOf _burger;
    _grill = attachedTo _burger;

    if (isNull _burger) exitwith {["System error: _burger is a null object, report this error", Color_Red] call A3PL_HUD_Notification;};
    if (isNull _grill) exitwith {["System error: _grill is a null object, report this error", Color_Red] call A3PL_HUD_Notification;};
    if (typeOf _grill != "A3PL_Mcfisher_Grill") exitwith {["System error: _grill is not of correct type", Color_Red] call A3PL_HUD_Notification;};
    if (isNil "_class") exitwith {["System error: _burger contains no class, report this error", Color_Red] call A3PL_HUD_Notification;};

    _cookstate = _burger getVariable "cookstate";
    if (isNil "_cookstate") then
    {
        _burger setVariable ["cookstate",0,true];
    };

    [_burger,_grill,_class] spawn
    {
        private ["_burger","_cookstate","_burger","_grill","_pos","_veh"];
        _burger = param [0,ObjNull];
        _grill = param [1,ObjNull];
        _class = param [2,""];

        if (_class == "") exitwith {};

        while {attachedTo _burger == _grill} do
        {
            private ["_cookstate","_newcookstate"];
            _cookstate = _burger getVariable "cookstate";
            _newcookstate = _cookstate + 10;
            _burger setVariable ["cookstate",_newcookstate,true];
            uiSleep 10;
            if (_newcookstate > 90) exitwith {};
            if (isNull _burger) exitwith {};
        };

        _cookstate = _burger getVariable "cookstate";
        if (isNil "_cookstate") exitwith {};

        if (_cookstate > 90) then
        {
            if (_class IN ["A3PL_Burger_Raw","A3PL_Burger_Cooked","A3PL_Fish_Raw","A3PL_Fish_Cooked"]) then
            {
                [player,_burger] remoteExec ["Server_JobMcfisher_cookthres", 2];
            };

            if (_class IN  ["A3PL_Burger_Burnt","A3PL_Fish_Burned"]) then
            {
                _burger setVariable ["cookstate",nil,true];
            };
        };
    };

}, false] call Server_Setup_Compile;
/*
    Server
*/
['Server_JobMcfisher_Combine', {

    private ["_player","_intersect","_classIntersect","_burgerClass"];
    _player = param [0,objNull];
    _intersect = param [1,objNull];
    _classIntersect = _intersect getVariable "class";

    if (typeOf (attachedTo _intersect) == "C_man_1") exitwith {diag_log "Error: _intersect of player type in Server_JobMcfisher_combine?";};
    if ((isNull _player) OR (isNull _intersect)) exitwith {diag_log "Error: _player or _intersect null in Server_JobMcfisher_combine";};
    if (isNil "_classIntersect") exitwith {diag_log "Error: _classIntersect nil in Server_JobMcfisher_combine";};

    if (_classIntersect == "tacoshell") then
    {
        private ["_attached","_pos","_newClass","_veh","_burger","_burgerClass"];
        _burgers = nearestObjects [_intersect, ["A3PL_Fish_Raw","A3PL_Fish_Cooked","A3PL_Fish_Burned"], 1];
        if (count _burgers == 0) exitwith {};
        _burger = _burgers select 0;
        if (typeOf (attachedTo _burger) == "C_man_1") exitwith {};
        _burgerClass = _burger getVariable "class";
        if (isNil "_burgerClass") exitwith {};

        _salads = nearestObjects [_intersect, ["A3PL_Salad"], 1];
        if (count _salads == 0) exitwith {};
        _salad = _salads select 0;

        _attached = attachedTo _intersect;
        _pos = getPosATL _intersect;

        switch (_burgerClass) do
        {
            case "fish_raw": {_newClass = "taco_raw";};
            case "fish_cooked": {_newClass = "taco_cooked";};
            case "fish_burnt": {_newClass = "taco_burned";};
        };

        if (isNil "_newclass") exitwith {};
        deleteVehicle _burger;
        deleteVehicle _intersect;
        deleteVehicle _salad;

        _veh = createVehicle ["A3PL_Taco", _pos, [], 0, "CAN_COLLIDE"];
        _veh setposATL _pos;
        if (!isNull _attached) then
        {
        _veh attachTo [_attached];
        };
        [_veh,"class", _newClass] call Server_Core_ChangeVar;
    };

    if (_classIntersect == "burger_bun") exitwith
    {
        private ["_attached","_pos","_newClass","_veh","_burger","_burgerClass","_salads"];
        _burgers = nearestObjects [_intersect, ["A3PL_Burger_Raw","A3PL_Burger_Cooked","A3PL_Burger_Burnt"], 1];
        if (count _burgers == 0) exitwith {};
        _burger = _burgers select 0;
        if (typeOf (attachedTo _burger) == "C_man_1") exitwith {};
        _burgerClass = _burger getVariable "class";
        if (isNil "_burgerClass") exitwith {};

        _salads = nearestObjects [_intersect, ["A3PL_Salad"], 1];
        if (count _salads == 0) exitwith {};
        _salad = _salads select 0;

        _attached = attachedTo _intersect;
        _pos = getPosATL _intersect;

        switch (_burgerClass) do
        {
            case "burger_raw": {_newClass = "burger_full_raw";};
            case "burger_cooked": {_newClass = "burger_full_cooked";};
            case "burger_burnt": {_newClass = "burger_full_burnt";};
        };

        if (isNil "_newclass") exitwith {};
        deleteVehicle _burger;
        deleteVehicle _intersect;
        deleteVehicle _salad;

        _veh = createVehicle ["A3PL_Burger_Full", _pos, [], 0, "CAN_COLLIDE"];
        _veh setposATL _pos;
        if (!isNull _attached) then
        {
            _veh attachTo [_attached];
        };
        [_veh,"class", _newClass] call Server_Core_ChangeVar;
    };

    private ["_attached","_pos","_veh","_burgers","_burger","_newClass","_salad","_salads"];
    _burgers = nearestObjects [_intersect, ["A3PL_Burger_Bun"], 1];
    if (count _burgers == 0) exitwith {};
    _burger = _burgers select 0;
    if (typeOf (attachedTo _burger) == "C_man_1") exitwith {};

    _salads = nearestObjects [_intersect, ["A3PL_Salad"], 1];
    if (count _salads == 0) exitwith {};
    _salad = _salads select 0;

    _attached = attachedTo _burger;
    _pos = getPosATL _burger;

    switch (_classIntersect) do
    {
        case "burger_raw": {_newClass = "burger_full_raw";};
        case "burger_cooked": {_newClass = "burger_full_cooked";};
        case "burger_burnt": {_newClass = "burger_full_burnt";};
    };

    if (isNil "_newclass") exitwith {};

    deleteVehicle _burger;
    deleteVehicle _intersect;
    deleteVehicle _salad;

    _veh = createVehicle ["A3PL_Burger_Full", _pos, [], 0, "CAN_COLLIDE"];
    _veh setposATL _pos;
    if (!isNull _attached) then
    {
        _veh attachTo [_attached];
    };
    [_veh,"class",_newclass] call Server_Core_ChangeVar;

}, true] call Server_Setup_Compile;

['Server_JobMcfisher_Cookthres', {

    private ["_cookstate","_player","_burger","_class","_newClass","_pos","_veh","_newObjclass","_offset"];
    _player = param [0,objNull];
    _burger = param [1,objNull];
    _grill = attachedTo _burger;
    _class = _burger getVariable "class";

    if (isNull _grill) exitwith {diag_log "Error: _grill is null in Server_JobMcfisher_cookthres"};
    if ((isNull _player) OR (isNull _burger)) exitwith {diag_log "Error: _player or _burger null in Server_JobMcfisher_cookthres"};
    if (isNil "_class") exitwith {diag_log "Error: _class is nil in Server_JobMcfisher_cookthres"};

    _cookstate = _burger getVariable "cookstate";
    if (isNil "_cookstate") exitwith {diag_log "Error: _cookstate is nil in Server_JobMcfisher_cookthres"};

    if (_cookstate > 90) then
    {
        _newClass = "empty";
        if (_class == "burger_raw") then
        {
            _newClass = "burger_cooked";
            _newObjclass = "A3PL_Burger_Cooked";
        };

        if (_class == "burger_cooked") then
        {
            _newClass = "burger_burnt";
            _newObjclass = "A3PL_Burger_Burnt";
        };

        if (_class == "fish_raw") then
        {
            _newClass = "fish_cooked";
            _newObjclass = "A3PL_Fish_Cooked";
        };

        if (_class == "fish_cooked") then
        {
            _newClass = "fish_burned";
            _newObjclass = "A3PL_Fish_Burned";
        };

        if (_newClass == "empty") exitwith {diag_log "Error: _newclass has not been changed in Server_JobMcfisher_cookthres"};

        _pos = getPosATL _burger;
        deleteVehicle _burger;
        _veh = createVehicle [_newObjclass, _pos, [], 0, "CAN_COLLIDE"];
        _veh attachTo [_grill];
        [_veh, "class", _newClass] call Server_Core_ChangeVar;
        [_veh] remoteExec ["A3PL_JobMcfisher_CookBurger", _player];
    };

}, true] call Server_Setup_Compile;