['A3PL_Placeables_Pickup', {

    private ["_obj","_type","_attachedTo"];
    _obj = param [0,([] call Caue_Intersect_CursorTarget)];

    _attachedTo = attachedTo _obj;
    if ((isPlayer _attachedTo) && (!(_attachedTo isKindOf "Car"))) exitwith {["Item está sendo carregado por outro jogador", Color_Red] call A3PL_HUD_Notification;};

    if ((!local _obj) && (!((typeOf _obj) IN ["A3PL_WheelieBin"]))) exitwith
    {
        ["Problema de localidade, esse item pertence a você?", Color_Red] call A3PL_HUD_Notification;
        ["Se o item que você está tentando pegar é um veículo, por favor entre para mudar o dono da localidade", Color_Red] call A3PL_HUD_Notification;

        _owner = _obj getVariable ["owner",nil];
        if (!isNil "_owner") then
        {
            if (typeName _owner == "ARRAY") then
            {
                if (getPlayerUID player == (_owner select 0)) then
                {
                    [_obj,player] remoteExec ["A3PL_Lib_ChangeLocality",2];
                    ["Parece que você é o dono deste item, uma tentativa de alteração de localidade foi iniciada no servidor. Por favor, tente pegar o item novamente em um segundo", Color_Yellow] call A3PL_HUD_Notification;
                };
            } else
            {
                if (getPlayerUID player == _owner) then
                {
                    [_obj,player] remoteExec ["A3PL_Lib_ChangeLocality",2];
                    ["Parece que você é o dono deste item, uma tentativa de alteração de localidade foi iniciada no servidor. Por favor, tente pegar o item novamente em um segundo", Color_Yellow] call A3PL_HUD_Notification;
                };
            };
        };

        if (typeOf _obj == "A3PL_DeliveryBox") then
        {
            _packageOwner = _obj getVariable ["owner",getPlayerUID player];
            if (_packageOwner == (getPlayerUID player)) then
            {
                [_obj,player] remoteExec ["A3PL_Lib_ChangeLocality",2];
                ["Parece que você é o dono deste item, uma tentativa de alteração de localidade foi iniciada no servidor. Por favor, tente pegar o item novamente em um segundo", Color_Yellow] call A3PL_HUD_Notification;
            };
        };
    };

    _type = typeOf _obj;
    if (_type == "GroundWeaponHolder") then
    {
        _obj attachTo [player, [0,0,0.65], "RightHand"];
    } else
    {
        _dir = getDir _obj;
        _obj attachTo [player];
        _obj setDir (_dir + (360 - (getDir player)));
    };
    [_obj] spawn A3PL_Placeable_AttachedLoop;

}, false] call Server_Setup_Compile;

['A3PL_Placeables_PlaceCone', {

    private ["_cones","_cone"];
    _cones = ([] call A3PL_Lib_Attached) select 0;
    if (isNil "_cones") then {_cones = objNull;};
    if ((typeOf _cones) != "A3PL_RoadCone_x10") exitwith {["Você não tem cones na mão para colocar",Color_Red] call A3PL_HUD_Notification;};

    _sourcePhase = _cones animationSourcePhase "cone_hide";
    if (_sourcePhase >= 9) exitwith {detach _cones;};
    _cones animateSource ["cone_hide",_sourcePhase + 1];

    _cone = createVehicle ["A3PL_RoadCone", (getPosATL _cones), [], 0, "CAN_COLLIDE"];
    _cone setVariable ["class","roadcone",true];

    ["System: You placed a roadcone",Color_Green] call A3PL_HUD_Notification;

}, false] call Server_Setup_Compile;

['A3PL_Placeables_QuickAction', {

    private _attached = [] call A3PL_Lib_Attached;

    if ((count _attached) > 0) exitwith {
        private _obj = _attached select 0;

        private _collision = [_obj] call A3PL_Lib_checkCollision;
        {
            if ((_x isKindOf "Car") || (_x isKindOf "Jonzie_Public_Trailer_Base")) exitwith {_collision = _collision - [_x];};
        } forEach _collision;

        if (Player_NameIntersect IN ["trunkinside","trunkinside1","trunkinside2","trunkinside3","trunkinside4","trunkinside5","trunkinside6","trunkinside7","trunkinside8","trunkinside9","trunkinside10","trunkinside11","lockerbottom","lockertop","mcfishertable","mcfishergrill"]) then {
            _collision = _collision - [player_objintersect];
        };

        if ((typeOf _obj) == "GroundWeaponHolder") then {
            _collision = [];
        };

        private _except = ["A3PL_Ladder","land_market_ded_market_01_f"];
        if ((count _collision > 0) && !((typeOf _obj) IN _except)) exitwith {["Você não pode colocar um item dentro de outro item", Color_Red] call A3PL_HUD_Notification;};

        if (freeLook) exitwith {["Você não pode colocar/pegar um item enquanto olha em volta", Color_Red] call A3PL_HUD_Notification;};

        if (Player_NameIntersect IN ["trunkinside","trunkinside1","trunkinside2","trunkinside3","trunkinside4","trunkinside5","trunkinside6","trunkinside7","trunkinside8","trunkinside9","trunkinside10","trunkinside11","lockerbottom","lockertop","mcfishertable","mcfishergrill"]) exitwith {
            if (Player_NameIntersect IN ["lockerbottom","lockertop"]) exitwith {
                if (Player_ObjIntersect AnimationPhase "door1" < 0.5) exitwith {};
                detach _obj;
                _obj attachto [(call Caue_Intersect_CursorTarget)];
                _obj setDir 180;
                _obj setPos getPos _obj;

                if (_obj == Player_Item) then {[false] call Caue_Inventory_Drop;};
            };

            if (Player_NameIntersect IN ["mcfishertable","mcfishergrill"]) exitwith {
                detach _obj;
                _obj attachto [player_objintersect];
                if (_obj == Player_Item) then {[false] call Caue_Inventory_Drop;};
            };

            if (Player_NameIntersect IN ["trunkinside","trunkinside1","trunkinside2","trunkinside3","trunkinside4","trunkinside5","trunkinside6","trunkinside7","trunkinside8","trunkinside9","trunkinside10","trunkinside11"]) exitwith {
                if ([Player_ObjIntersect,_obj] call A3PL_Placeable_CarBlacklist) exitwith {["Não parece que este item cabe neste veículo", Color_Red] call A3PL_HUD_Notification;};
                private _dir = getDir _obj;
                detach _obj;
                _obj setvelocity [0,0,0];
                _obj attachto [(call Caue_Intersect_CursorTarget)];
                _obj setDir (_dir + (360 - (getDir player_objintersect)));
                _obj setpos (getpos _obj);

                if (_obj == Player_Item) then {[false] call Caue_Inventory_Drop;};
            };
        };

        if ((typeOf _obj) == "GroundWeaponHolder") exitwith {
            detach _obj;
            _obj setpos [(getpos player select 0),(getpos player select 1),(getposATL player select 2)];
        };

        detach _obj;
        _obj setvelocity [0,0,0];
        _obj setposATL (getposATL _obj);
    };

    if !(isNull player_item) exitwith {["Você não pode pegar/largar este item porque tem algo na sua mão", Color_Red] call A3PL_HUD_Notification};
    [] call A3PL_Placeables_Pickup;

}, false] call Server_Setup_Compile;

['A3PL_Placeables_Return', {

    private ["_return"];
    _return = "";
    if ((typeOf (call Caue_Intersect_CursorTarget)) == "Land_A3PL_Locker") exitwith
    {
        _return = (call Caue_Intersect_CursorTarget) getVariable "Owner";
        _return
    };
    _return

}, false] call Server_Setup_Compile;

['A3PL_Placeables_StackCone', {

    private ["_cone","_nearCone","_pos","_animPhase"];
    _cone = param [0,objNull];

    _nearCone = nearestObjects [_cone,["A3PL_RoadCone","A3PL_RoadCone_x10"],4];
    _nearCone = _nearCone - [_cone];
    if (count _nearCone <= 0) exitwith {["Nenhum cone proximo para empilhar",Color_Red] call A3PL_HUD_Notification;};
    _nearCone = _nearCone select 0;

    if ((((_cone animationSourcePhase "cone_hide") <= 0) && (typeOf _cone == "A3PL_RoadCone_x10")) OR (((_nearcone animationSourcePhase "cone_hide") <= 0) && (typeOf _nearcone == "A3PL_RoadCone_x10"))) exitwith {["Você pode empilhar no máximo 10 cones",Color_Red] call A3PL_HUD_Notification;};

    if ((typeOf _nearCone == "A3PL_RoadCone_x10") && (typeOf _cone == "A3PL_RoadCone_x10")) exitwith
    {
        _animPhase = 10 - (_nearCone animationSourcePhase "cone_hide");
        deleteVehicle _nearCone;
        _cone animateSource ["cone_hide",(_cone animationSourcePhase "cone_hide") - _animPhase];
    };

    if ((typeOf _nearCone == "A3PL_RoadCone_x10") OR (typeOf _cone == "A3PL_RoadCone_x10")) exitwith
    {
        if (typeOf _nearCone == "A3PL_RoadCone_x10") then
        {
            if (typeOf _cone == "A3PL_RoadCone") then {_animPhase = 1;} else {_animPhase = _cone animationSourcePhase "cone_hide";};
            deleteVehicle _cone;
            _nearCone animateSource ["cone_hide",((_nearcone animationSourcePhase "cone_hide") - _animPhase)];
        } else
        {
            if (typeOf _nearcone == "A3PL_RoadCone") then {_animPhase = 1;} else {_animPhase = _nearcone animationSourcePhase "cone_hide";};
            deleteVehicle _nearcone;
            _cone animateSource ["cone_hide",((_cone animationSourcePhase "cone_hide") - _animPhase)];
        };
    };
    _pos = getposATL _cone;
    deleteVehicle _cone;
    deleteVehicle _nearCone;
    _cone = createVehicle ["A3PL_RoadCone_x10", _pos, [], 0, "CAN_COLLIDE"];
    _cone animateSource ["cone_hide",8,true];
    _cone setVariable ["class","roadcones",true];

}, false] call Server_Setup_Compile;
