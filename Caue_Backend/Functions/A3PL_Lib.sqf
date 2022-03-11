['A3PL_Lib_Attached', {

    _player = param [0,player];
    _attachedObjects = attachedobjects _player;
    _return = [];

    {
        if (isNull _x) then
        {
            _attachedObjects = _attachedObjects - [_x];
        };
    } foreach _attachedobjects;

    if (count _attachedObjects > 1) then
    {
        {
            if (_forEachIndex != 0) then
            {
                detach _x;
            };
        } foreach _attachedObjects;
    };

    if (count _attachedObjects == 0) exitwith
    {
        _return
    };

    _return = [(_attachedObjects select 0)];

    _return

}, false] call Server_Setup_Compile;

['A3PL_Lib_AttachedAll', {

    private ["_obj","_attachedObjects"];
    _obj = param [0,player];
    _attachedObjects = attachedobjects _obj;
    _attachedObjects = _attachedObjects - [objNull];

    _attachedObjects

}, false] call Server_Setup_Compile;

['A3PL_Lib_AttachedFirst', {

    private ["_attached"];
    _attached = [] call A3PL_Lib_Attached;
    _return = objNull;
    if (count _attached == 0) exitwith
    {
        _return
    };
    _return = _attached select 0;

    _return

}, false] call Server_Setup_Compile;

['A3PL_Lib_AttachToRelative', {

    private ["_o","_v"];
    _o = _this select 0;
    _v = [_o,player] call A3PL_Lib_vectorDirAndUpRelative;
    _o attachTo [_this select 1];
    _o setVectorDirAndUp _v;

}, false] call Server_Setup_Compile;

['A3PL_Lib_ChangeLocality', {

    params [
        ["_obj",objNull],
        ["_player",objNull]
    ];

    if ((isNull _obj) || (isNull _player)) exitWith {};

    _obj setOwner (owner _player);

}, false] call Server_Setup_Compile;

["AFPL_Lib_HasBadChar", {

	params [
		["_inputString","",[""]],
		["_allowedChars","ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz",[""]]
	];

	private _return = false;

	_allowedChars = toArray _allowedChars;

	{
		if !(_x in _allowedChars) exitWith {
			_return = true;
		};
	} forEach (toArray _inputString);

	_return;

}, false] call Server_Setup_Compile;

['A3PL_Lib_CheckCollision', {

    private ["_obj","_bb","_car","_e1","_e2","_posStart","_posEnd","_intersect"];
    _obj = _this select 0;

    _bb = boundingBoxReal _obj;
    _e1 = _bb select 0;
    _e2 = _bb select 1;

    _posStart = _e1;
    _posEnd = [_e2 select 0,_e1 select 1,_e1 select 2];
    _intersect = lineIntersectsWith [AGLTOASL (_obj modelToWorld _posStart),AGLTOASL (_obj modelToWorld _posEnd ),_obj,objNull,true];
    if (count _intersect > 0) exitwith
    {
        _intersect;
    };

    _posStart = [_e1 select 0,_e2 select 1,_e1 select 2];
    _posEnd = [_e1 select 0,_e2 select 1,_e1 select 2];
    _intersect = lineIntersectsWith [AGLTOASL (_obj modelToWorld _posStart),AGLTOASL (_obj modelToWorld _posEnd ),_obj,objNull,true];
    if (count _intersect > 0) exitwith
    {
        _intersect;
    };

    _posStart = [_e1 select 0,_e1 select 1,_e2 select 2];
    _posEnd = [_e1 select 0,_e2 select 1,_e2 select 2];
    _intersect = lineIntersectsWith [AGLTOASL (_obj modelToWorld _posStart),AGLTOASL (_obj modelToWorld _posEnd ),_obj,objNull,true];
    if (count _intersect > 0) exitwith
    {
        _intersect;
    };

    _posStart = [_e1 select 0,_e2 select 1,_e2 select 2];
    _posEnd = _e2;
    _intersect = lineIntersectsWith [AGLTOASL (_obj modelToWorld _posStart),AGLTOASL (_obj modelToWorld _posEnd ),_obj,objNull,true];
    if (count _intersect > 0) exitwith
    {
        _intersect;
    };

    _intersect = lineIntersectsWith [AGLTOASL (_obj modelToWorld _e1),AGLTOASL (_obj modelToWorld _e2),_obj,objNull,true];
    if (count _intersect > 0) exitwith
    {
        _intersect;
    };

    _intersect = lineIntersectsWith [AGLTOASL (_obj modelToWorld _e2),AGLTOASL (_obj modelToWorld _e1),_obj,objNull,true];
    if (count _intersect > 0) exitwith
    {
        _intersect;
    };
    _return = [];

    _return

}, false] call Server_Setup_Compile;

['A3PL_Lib_CheckIfFurniture', {

    private ["_obj","_modelName","_return","_furnitureArray"];
    _obj = _this select 0;
    _modelname = typeOf _obj;
    _return = false;
    _furnitureArray = [];

    if (isNil "_modelName") exitwith {};

    {
        _furnitureArray pushback (_x select 3);
    } foreach Config_Items;

    _furnitureArray pushback "A3PL_Crate";
    _furnitureArray pushback "A3PL_Clothing";

    if (_modelName IN _furnitureArray) then
    {
        _return = true;
    };

    _return

}, false] call Server_Setup_Compile;

['A3PL_Lib_FactionPlayers', {

    params [
        ["_faction","unemployed"],
        ["_returnID",false]
    ];

    private _factionPeople = [];
    {
        if ((_x getVariable ["job","unemployed"]) isEqualTo _faction) then {
            if (_returnID) then {
                _factionPeople pushback (owner _x);
            } else {
                _factionPeople pushback _x;
            };
        };
    } forEach allPlayers;

    _factionPeople

}, false] call Server_Setup_Compile;

['A3PL_Lib_FindAttached', {

    private ["_obj","_otherObj"];
    _obj = param [0,objNull];
    _otherObj = objNull;

    if (!isNull attachedTo _obj) exitwith {_otherObj = attachedTo _obj; _otherObj};

    {
        _otherObj = _x;
    } foreach (attachedObjects _obj);

    _otherObj

}, false] call Server_Setup_Compile;

['A3PL_Lib_HasPhone', {

    params [["_player",player]];

    private _items = assignedItems _player + items _player;

    private _hasPhone = false;
    {
        if (["RoleplayRadio",_x] call BIS_fnc_inString) exitWith {_hasPhone = true;};
    } forEach _items;

    _hasPhone

}, false] call Server_Setup_Compile;

['A3PL_Lib_HideObject', {

    params [
        ["_object",objNull],
        ["_hide",true]
    ];

    if (isNull _object) exitWith {};

    if (isServer) then {
        _object hideObjectGlobal _hide;
    } else {
        _object hideObject _hide;
    };

}, false] call Server_Setup_Compile;

['A3PL_Lib_JobVehicle_Assign', {

    private ["_class"];
    _class = param [0,""];
    _pos = param [1,[]];
    _job = param [2,""];
    _assignTime = param [3,1200];
    _inArea = param [4,""];

    [_class,_pos,format ["%1",toUpper _job],player] remoteExec [ "Server_Vehicle_Spawn", 2];
    ["Enviada solicitação ao servidor para criar e atribuir o veículo de trabalho, aguarde...",Color_Yellow] call A3PL_HUD_Notification;

    _t = 0;
    waituntil {sleep 0.5; _t = _t + 0.5; if (_t > 5) exitwith {true;}; !isNull (player getVariable ["jobVehicle",objNull]);};
    if (isNull (player getVariable ["jobVehicle",objNull])) exitwith
    {
        ["Ocorreu um erro ao criar seu veículo de trabalho. Tente pegar o trabalho denovo",Color_Red] call A3PL_HUD_Notification;
    };
    _veh = player getVariable ["jobVehicle",objNull];
    ["Seu veículo de trabalho foi criado, por favor, cuide bem do seu veículo ou você pode ser penalizado!"] call A3PL_HUD_Notification;

    player setVariable ["jobVehicleTimer",(diag_tickTime + _assignTime)];

    while {(player getVariable ["job","unemployed"]) == _job} do
    {
        if (isNull _veh) exitwith {["Seu veículo de trabalho foi destruído!",Color_Red] call A3PL_HUD_Notification; true;};
        if (getDammage _veh >= 1) exitwith {["Seu veículo de trabalho foi destruído!",Color_Red] call A3PL_HUD_Notification; true;};
        if ((player distance2D _veh) > 50) exitwith {["Você andou muito longe do seu veículo de trabalho, ele foi devolvido.",Color_Red] call A3PL_HUD_Notification; true;};
        if ((player getVariable ["jobVehicleTimer",diag_tickTime]) <= diag_tickTime) exitwith {["Você atingiu o tempo máximo para usar este veículo de trabalho, ele foi devolvido!",Color_Red] call A3PL_HUD_Notification; true;};

        sleep 10;
    };
    private _packages = _veh getVariable ["packagesdelivery",[]];
    if ((count _packages) > 0) then {
        {deleteVehicle _x;} forEach _packages;
        _packages = [];
    };
    deleteVehicle _veh;
    player setVariable ["jobVehicle",nil,true];
    player setVariable ["jobVehicleTimer",nil];

}, false] call Server_Setup_Compile;

['A3PL_Lib_MoveInPass', {

    params [
        ["_veh",objNull],
        ["_detain",true]
    ];

    _veh lock 1;
    player moveInCargo _veh;
    _veh lock 2;

    if (_detain) then {
        [_veh] spawn {
            params [["_veh",objNull]];
            sleep 2;
            waitUntil {(vehicle player) isEqualTo player};
            sleep 0.5;
            player setVelocityModelSpace [0,3,1];
            [player,"A3PL_HandsupKneelCuffed"] remoteExec ["A3PL_Lib_SyncAnim",-2];
        };
    };

}, false] call Server_Setup_Compile;

['A3PL_Lib_PPEffect', {

    private ["_effect","_priority","_value"];
    _effect = param [0,"DynamicBlur"];
    _value = param [1,[]];
    _priority = 400;
    switch (_effect) do
    {
        case ("DynamicBlur"): {_priority = 400;};
        case ("FilmGrain"): {_priority = 2000;};
    };

    while
    {
        _effect = ppEffectCreate ["DynamicBlur", _priority];
        _effect < 0
    } do
    {
        _priority = _priority + 1;
    };

    _effect ppEffectEnable true;
    _effect ppEffectAdjust _value;
    _effect ppEffectCommit 0;

    _effect

}, false] call Server_Setup_Compile;

['A3PL_Lib_Ragdoll', {

    if (vehicle player != player) exitWith {};
	player allowdamage false;
	private _rag = "Land_Can_V3_F" createVehicleLocal [0,0,0];
	_rag setMass 1e10;
	_rag attachTo [player,[0,0,0],"Spine3"];
	_rag setVelocity [0,0,5];
	detach _rag;
	0 = _rag spawn {
		deleteVehicle _this;
		uisleep 1;
		player allowdamage true;
	};

}, false] call Server_Setup_Compile;

['A3PL_Lib_RelDir', {

    private ["_orig","_dest"];
    _orig = param [0,[0,0,0]];
    _dest = param [1,[0,0,0]];
    _dir = ((((_dest select 0) - (_orig select 0)) atan2 ((_dest select 1) - (_orig select 1))) + 360) % 360;

    _dir

}, false] call Server_Setup_Compile;

['A3PL_Lib_ReturnTurret', {

    private ["_turret","_role","_arr"];
    _turret = -1;
    _role = assignedVehicleRole player;

    if (count _role < 2) exitwith {_turret;};
    _arr = _role select 1;
    if (count _arr < 1) exitwith {_turret};
    _turret = _arr select 0;

    _turret

}, false] call Server_Setup_Compile;

['A3PL_Lib_Sit', {

    private ["_obj","_name"];
    _obj = param [0,objNull];
    _name = param [1,""];
    if ((isNull _obj) OR (_name == "")) exitwith {};

    if (animationState player IN ["hubsittingchairb_idle1","hubsittingchairb_idle2","hubsittingchairb_idle3","incapacitated"]) exitwith {
        [player,""] remoteExec ["A3PL_Lib_SyncAnim",0];
    };

    player setPos (_obj modelToWorld (_obj selectionPosition _name));
    player setDir (([(_obj modelToWorld (_obj selectionPosition _name)),(_obj modelToWorld (_obj selectionPosition format ["%1_dir",_name]))] call A3PL_Lib_RelDir));

    if (_name IN ["bed_1","bed_2","bed_3"]) then
    {
        [player,"A3PL_Bed"] remoteExec ["A3PL_Lib_SyncAnim",0];
    } else
    {
        private ["_r","_anim"];
        _r = round random 2;
        _anim = "hubsittingchairb_idle1";
        switch (_r) do
        {
            case (1): {_anim = "hubsittingchairb_idle2"};
            case (2): {_anim = "hubsittingchairb_idle3"};
        };
        [player,_anim] remoteExec ["A3PL_Lib_SyncAnim",0];
    };

}, false] call Server_Setup_Compile;

['A3PL_Lib_SwitchLight', {

    private ["_obj","_name"];

    _obj = param [0,objNull];
    _name = param [1,""];

    _animName = _name splitString "_";
    if (count _animName < 2) exitwith {};

    _animName = format ["%1_%2",_animName select 0,_animName select 1];
    [_obj,_animName,false] call A3PL_Lib_ToggleAnimation;

}, false] call Server_Setup_Compile;

['A3PL_Lib_SyncAnim', {

    if (isDedicated) exitwith {};

    params [
        ["_player",objNull],
        ["_anim",""],
        ["_isSwitchMove",true],
        ["_cancelOwner",false]
    ];

    if (isNull _player || {(local _player && _cancelOwner)}) exitWith {};

    if (_isSwitchMove) then {
        _player switchMove _anim;
    } else {
        _player playAction _anim;
    };

}, false] call Server_Setup_Compile;

['A3PL_Lib_ToggleAnimation', {

    private ["_obj","_animationName","_animateSource"];
    _obj = param [0,objNull];
    _animationName = param [1,""];
    _animateSource = param [2,true];
    _forceOnOff = param [3,-1];

    if (_animateSource) then {
        if (_forceOnOff != -1) exitwith {_obj animateSource [_animationName,_forceOnOff];};

        if (_obj animationSourcePhase _animationName < 0.5) then {
            _obj animateSource [_animationName,1];
        } else {
            _obj animateSource [_animationName,0];
        };
    } else {
        if (_forceOnOff != -1) exitwith {_obj animate [_animationName,_forceOnOff];};
        if (_obj animationPhase _animationName < 0.5) then {
            _obj animate [_animationName,1];
        } else {
            _obj animate [_animationName,0];
        };
    };

}, false] call Server_Setup_Compile;

['A3PL_Lib_VehStringToObj', {

    params [["_veh",""]];

    {
        private _check = format ["%1",_x];
        if (_check == _veh) exitwith {_veh = _x;};
    } forEach (nearestObjects [player, [], 20]);

    _veh

}, false] call Server_Setup_Compile;



['Caue_Lib_VerifyHunger', {

    private _hunger = player getVariable ["Player_Hunger",100];

    if (_hunger > 100) exitWith {player setVariable ["Player_Hunger",100,true];};
    if (_hunger < 0) exitWith {player setVariable ["Player_Hunger",0,true];};

}, false] call Server_Setup_Compile;

['Caue_Lib_VerifyThirst', {

    private _thirst = player getVariable ["Player_Thirst",100];

    if (_thirst > 100) exitWith {player setVariable ["Player_Thirst",100,true];};
    if (_thirst < 0) exitWith {player setVariable ["Player_Thirst",0,true];};

}, false] call Server_Setup_Compile;

['Caue_Lib_NumberText', {

    params [
        ["_number",0,[0]],
        ["_mod",3,[0]]
    ];

    private _digits = _number call bis_fnc_numberDigits;
    private _digitsCount = count _digits - 1;

    private _modBase = _digitsCount % _mod;
    private _numberText = "";
    {
        _numberText = _numberText + str _x;
        if ((_foreachindex - _modBase) % (_mod) isEqualTo 0 && !(_foreachindex isEqualTo _digitsCount)) then {_numberText = _numberText + ",";};
    } forEach _digits;

    _numberText

}, false] call Server_Setup_Compile;

['Caue_Lib_GenerateID', {

    params ["_digits"];

    private _r = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"];
    private _return = [];
    for "_i" from 1 to _digits do {
        _return pushback (_r select (floor (random (count _r - 1))));
    };
    _return = _return joinString "";

    _return

}, false] call Server_Setup_Compile;

['Caue_Lib_UIDToObject', {

    params [
        ["_uid",""]
    ];

    if (_uid isEqualTo "") exitWith {objNull};

    private _player = objNull;
    {
        if ((getPlayerUID _x) isEqualTo _uid) exitwith {_player = _x;};
    } forEach allPlayers;

    _player

}, false] call Server_Setup_Compile;

['Caue_Lib_InputAccess', {

    params [
        ["_player",player]
    ];

    if (isNull _player) exitWith {false;};

    private _return = true;

    if ((animationState _player) IN ["A3PL_HandsupToKneel","A3PL_HandsupKneelGetCuffed","A3PL_Cuff","A3PL_HandsupKneelCuffed","a3pl_handsupkneelcuffed","A3PL_HandsupKneelKicked","A3PL_CuffKickDown","a3pl_idletohandsup","a3pl_kneeltohandsup","a3pl_handsuptokneel","A3PL_HandsupKneel"]) then {_return = false;};
    if (_player getVariable ["Cuffed",false]) then {_return = false;};
    if (_player getVariable ["Tied",false]) then {_return = false;};
    if (A3PL_MedicalVar_Unconscious) then {_return = false;};

    //if ((!_return) && (_player isEqualTo player)) then {["Você não pode fazer isso.",Color_Red] call A3PL_HUD_Notification;};

    _return

}, false] call Server_Setup_Compile;

['Caue_Lib_FormatDate', {

    private ["_year","_month","_day","_hour","_minutes"];
    params [["_date",[]]];

    if (_date isEqualTo []) exitWith {""};

    _year = _date select 0;
    if ((count(str(_date select 1))) < 2) then {
        _month = format["0%1",_date select 1];
    } else {
        _month = _date select 1;
    };
    if ((count(str(_date select 2))) < 2) then {
        _day = format["0%1",_date select 2];
    } else {
        _day = _date select 2;
    };
    if ((count(str(_date select 3))) < 2) then {
        _hour = format["0%1",_date select 3];
    } else {
        _hour = _date select 3;
    };
    if ((count(str(_date select 4))) < 2) then {
        _minutes = format["0%1",_date select 4];
    } else {
        _minutes = _date select 4;
    };

    private _return = format["%1:%2 - %3/%4/%5",_hour,_minutes,_day,_month,_year];
    _return

}, false] call Server_Setup_Compile;
