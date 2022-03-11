/*
    Client
*/
["Caue_Vehicle_Unflip", {

    if !([] call Caue_Player_AntiSpam) exitWith {};

    params [
        ["_admin",false],
        ["_target",objNull]
    ];

    if (isNull _target) exitWith {};
    if !(_target isKindOf "LandVehicle") exitWith {};

    if (_admin) exitWith {
        _target setPos [getPos _target select 0, getPos _target select 1, (getPos _target select 2)+0.8];
    };

    if ([10,"Desvirando veiculo...","\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa","default"] call Caue_HUD_Progress) then {
        _target setPos [getPos _target select 0, getPos _target select 1, (getPos _target select 2)+0.8];
    } else {
        ["Cancelado",Color_Red] call A3PL_HUD_Notification;
    };

}, false] call Server_Setup_Compile;

["Caue_Vehicle_Push", {

    if !([] call Caue_Player_AntiSpam) exitWith {};

    params [
        ["_vehicle",objNull]
    ];

    if (isNull _vehicle) exitWith {};

    if ([5,"Empurrando veiculo...","\a3\ui_f\data\IGUI\Cfg\Actions\open_Door_ca.paa","default"] call Caue_HUD_Progress) then {
        _vehicle allowdamage false;
        _vel = velocity _vehicle;
        _dir = direction player;
        _speed = 10;
        _vehicle setVelocity [(_vel select 0) + (sin _dir * _speed), (_vel select 1) + (cos _dir * _speed), (_vel select 2) ];
        uiSleep 1;
        _vehicle allowdamage true;
    } else {
        ["Cancelado",Color_Red] call A3PL_HUD_Notification;
    };

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_Anchor', {

    private ["_veh","_typeOf","_anchor","_anchorX","_sealevel","_Anchorpos","_AnchorWorldpos","_AnchorX_pos","_AnchorX_Height","_Rope_1","_config_offsetY","_relPos","_offsetX","_offsetZ","_offsetY","_length"];
    _veh = _this select 0;
    _typeOf = typeOf _veh;
    _sealevel = abs (getTerrainHeightASL getPos _veh);
    _anchor = _veh getVariable "Boat_Anchor";
    if (isNil "_anchor") then {_anchor = objNull;};
    if ((speed _veh) > 5) exitWith {};
    if (_veh getVariable ["InUse",false]) exitWith {["Âncora já em uso",Color_yellow] call A3PL_HUD_Notification;};

    if (isNull _anchor) then {
        _veh setVariable ["InUse",true,true];
        _Anchorpos = _veh selectionPosition "Anchor_Release";
        _AnchorWorldpos = _veh modelToWorld _Anchorpos;
        _anchorX = "A3PL_Anchor" createvehicle _AnchorWorldpos;
        _anchorX setPos [_AnchorWorldpos select 0,_AnchorWorldpos select 1,_AnchorWorldpos select 2];
        _AnchorX_pos = getPosATL _anchorX;
        _AnchorX_Height = _AnchorX_pos select 2;
        _Rope_1 = ropeCreate [_veh, "Anchor", _anchorX, [0, 0, 0.4], (_AnchorX_Height + 4)];
        sleep 1;
        _anchor = "Land_HelipadEmpty_F" createvehicle _AnchorWorldpos;
        _anchor setDir getDir _veh;
        _veh setVariable ["Boat_Anchor",_anchor,true];
        sleep 0.5;

        [_veh, _anchor] call BIS_fnc_attachToRelative;
        _veh setVariable ["InUse",false,true];
    } else {
        _veh setVariable ["InUse",true,true];
        if (count ropes _veh < 1) exitwith {_anchorX = nearestObject [_veh, "A3PL_Anchor"];_veh setVariable ["Boat_Anchor",objNull,true];deleteVehicle _anchor;deleteVehicle _anchorX;_veh setVariable ["InUse",false,true];};
        _Rope_1 = (ropes _veh) select 0;
        _length = ropeLength _Rope_1;
        _windspeed = (_length/10);
        if(typeOf _veh == "A3PL_Yacht")then {_Rope_1 = (nearestObjects [(_veh modeltoworld (_veh selectionPosition ["Anchor", "Memory"])), ["rope"], 30])select 0;};
        ropeUnwind [_Rope_1, _windspeed, 0];
        while {_length > 0.6} do {_length = ropeLength _Rope_1;sleep 0.2;};
        waitUntil {_length < 0.6};
        sleep 2;
        _anchorX = nearestObject [_veh, "A3PL_Anchor"];
        if(typeOf _veh == "A3PL_Yacht")then {{deleteVehicle _x;} forEach (nearestObjects [(_veh modeltoworld (_veh selectionPosition ["Anchor", "Memory"])), ["rope"], 30])}else
        {{ropeDestroy _x;} foreach (ropes _veh)};
        detach _veh;
        sleep 0.1;
        _veh setVariable ["Boat_Anchor",objNull,true];
        deleteVehicle _anchor;
        deleteVehicle _anchorX;
        _veh setVariable ["InUse",false,true];
    };

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_AtegoLightbar', {

    private ["_isOn"];

    _veh = param [0,objNull];
    if (isNull _veh) exitwith {};

    _isOn = _veh animationSourcePhase "lightbar" > 0;

    if (_isOn) then
    {
        _veh animateSource ["lightbar",0];
        _veh animateSource ["beacons",0];
    } else
    {
        player action ["lightOn",_veh];
        _veh animateSource ["lightbar",1];
        _veh animateSource ["beacons",1];
    };

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_AtegoLower', {

    private ["_veh","_car"];
    _veh = param [0,objNull];
    _car = objNull;

    if (!local _veh) exitwith {["Este veículo não é local, por favor entre como motorista",Color_Red] call A3PL_HUD_Notification;};

    _attached = [_veh] call A3PL_Lib_Attached;
    {
        if (_x isKindOf "Car") exitwith {_car = _x};
    } foreach _attached;

    if ((!isNull _car) && (!local _car)) exitwith
    {
        ["O veículo no flatbed não é local - pedido enviar para mudar de localidade - por favor, tente novamente",Color_Yellow] call A3PL_HUD_Notification;
        [_car,player] remoteExec ["A3PL_Lib_ChangeLocality", 2];
    };

    if (!isNull _car) then
    {
        detach _car;
        _car setVariable ["originalMass",getMass _car,false];
        _car setMass 800;
        [_veh,_car,false] call A3PL_Vehicle_AtegoMoveCar;
    };

    _veh animateSource ["truck_flatbed",1];

    waituntil {uiSleep 0.1; ((_veh animationSourcePhase "truck_flatbed") == 1)};

    if (player IN _veh) then
    {
        moveOut player;
        ["Você foi ejetado do veículo, não pode estar no veículo enquanto o flatbed está abaixado",Color_Yellow] call A3PL_HUD_Notification;
    };

    [_veh] remoteExec ["Server_Vehicle_EnableSimulation", 2];

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_BigTrailerAttach', {

    private ["_trailer","_boats","_boat"];

    _trailer = param [0,objNull];

    _boats = nearestObjects [_trailer, ["Ship"], 12];
    if (count _boats < 1) exitwith
    {
        ["Não parece que nenhum barco perto", Color_Red] call A3PL_HUD_Notification;
    };

    _boat = _boats select 0;

    switch (typeOf _boat) do
    {
        case ("A3PL_RHIB"): {_boat attachTo [_trailer,[0,-0.57,0.9]];};
        case ("A3PL_RBM"): {_boat attachTo [_trailer,[-0.199707,-1.18896,2.68]];};
        default {_boat attachTo [_trailer,[0,-0.25,0.9]]; };
    };
    [_boat] remoteExec ["Server_Vehicle_EnableSimulation", 2];

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_CreateRescueBasket', {

    private ['_veh'];
    _veh = vehicle player;
    _basket = "A3PL_RescueBasket" createVehicle [0,0,0];
    _basket allowdamage false;
    _basket setVariable ["locked",false,true];
    _basket attachTo [_veh, [0,999999,0] ];
    _veh setVariable ["basket",_basket,true];
    _basket setVariable ["vehicle",_veh,true];

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_Despawn', {

    private ["_veh"];
    _veh = param [0,objNull];

    {
        deleteVehicle _x;
    } foreach (attachedObjects _veh);

    deleteVehicle _veh;

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_Jerrycan', {

    private ["_veh","_jerryCan","_newFuel"];
    _veh = param [0,objNull];

    if (isNull _veh) exitwith {};
    if (typeOf _veh IN ["A3PL_RBM","Heli_Medium01_H","Heli_Medium01_Luxury_H","Heli_Medium01_Military_H","Heli_Medium01_Veteran_H","Heli_Medium01_Coastguard_H","Heli_Medium01_Sheriff_H","Heli_Medium01_Medic_H","Heli_Medium01_H","Heli_Medium01_Luxury_H","Heli_Medium01_Military_H","Heli_Medium01_Veteran_H","Heli_Medium01_Coastguard_H","Heli_Medium01_Sheriff_H","Heli_Medium01_Medic_H","Heli_Medium01_H","Heli_Medium01_Luxury_H","Heli_Medium01_Military_H","Heli_Medium01_Veteran_H","Heli_Medium01_Coastguard_H","Heli_Medium01_Sheriff_H","Heli_Medium01_Medic_H","A3PL_Motorboat","A3PL_RHIB","A3PL_Yacht"]) exitWith {["Você não pode um Jerry Can neste veículo, ele usa (querosene)",Color_Red] call A3PL_HUD_Notification;};
    if (player_itemClass != "jerrycan") exitwith {["Você não tem um Jerry Can",Color_Red] call A3PL_HUD_Notification;};

    _jerryCan = Player_Item;
    [player_itemClass,-1] call Caue_Inventory_Add;
    Player_Item = objNull;
    Player_ItemClass = '';

    detach _jerryCan;
    _attachpoint = _veh selectionPosition "gasTank";
    _attachpoint set [0,(_attachPoint select 0) - 0.3];
    _attachpoint set [2,(_attachPoint select 2) + 0.2];
    _jerryCan attachTo [_veh,_attachpoint];
    _jerryCan setVectorDirAndUp [[0,1,0],[1,0,0]];
    playSound3D ["A3PL_Common\effects\gasoline.ogg", _jerrycan, false, getPos _jerryCan, 1.36, 1.1, 0];
    uiSleep 4.5;
    _jerryCan setVectorDirAndUp [[0,1,0],[0,0,1]];
    uiSleep 1;
    deleteVehicle _jerryCan;

    [_veh,((fuel _veh) + 0.20)] remoteExec ['setfuel',_veh];

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_Mooring', {

    private ["_veh","_pos","_boat","_towpos","_rope_1","_MooringPos","_boatrope"];
    _veh = player_objintersect;
    _Pos = Player_NameIntersect;
    _boat = vehicle player;
    if (_boat == _veh) exitWith {};
    if (!(_boat isKindOf "Ship")) exitWith {["Você deve estar em um barco",Color_yellow] call A3PL_HUD_Notification;};
    _towpos = _boat selectionPosition ["Anchor", "Memory"];
    _MooringPos = _veh selectionPosition Player_NameIntersect;
    _boatrope = nearestObject [_boat, "rope"];
    if(_veh == (ropeAttachedTo _boat)) exitwith {{deleteVehicle _x;} forEach (nearestObjects [_boat, ["rope"], 5])};
    _Rope_1 = ropeCreate [_veh,_MooringPos, _boat, _towpos, 15];

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_Repair', {

    private ["_car"];
    _car = param [0,objNull];
    if (isNull _car) exitwith {};
    if (animationstate player == "Acts_carFixingWheel") exitwith {["Você já está consertando um veículo", Color_Red] call A3PL_HUD_Notification;};
    if (!(vehicle player == player)) exitwith {["Você não pode estar dentro de um veículo para consertar isso", Color_Red] call A3PL_HUD_Notification;};
    if (player getVariable ["repairing",false]) exitwith {["Você já está consertando um veículo", Color_Red] call A3PL_HUD_Notification;};

    player playmove "Acts_carFixingWheel";
    ["Você está consertando este veículo", Color_Yellow] call A3PL_HUD_Notification;
    player setVariable ["repairing",true,false];
    [_car] spawn
    {
        private ["_t","_c","_car","_s"];
        _car = param [0,objNull];
        _t = 20;
        _c = 0;
        _s = false;
        while {player getVariable ["repairing",false]} do {
            _c = _c + 1;
            if (!(vehicle player == player)) exitwith {};
            if (!(player_itemClass == "repairwrench")) exitwith {};
            if (!(["repairwrench",1] call Caue_Inventory_Has)) exitwith {};
            if (A3PL_MedicalVar_Unconscious) exitwith {};
            if (!alive player) exitwith {};
            if (!alive _car) exitwith {};

            if (_c >= _t) exitwith {_s = true;};
            uiSleep 1;
        };

        player setVariable ["repairing",nil,false];
        if (!_s) exitwith
        {
            ["Reparação falhou", Color_Red] call A3PL_HUD_Notification;
            [player_item] call Caue_Inventory_Clear;
            if (vehicle player == player) then
            {
                player switchMove "";
            };
        };

        ["Veículo foi reparado", Color_Red] call A3PL_HUD_Notification;
        _car setdammage 0;
        [player_item] call Caue_Inventory_Clear;
        [player,"repairwrench",-1] remoteExec ["Server_Inventory_Change", 2];
    };

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_SirenHotkey', {

    private ["_veh","_sirenObj","_manObj","_atc","_animname","_animsource","_classname","_has","_sirenType"];
    params[["_action",0,[0]]];
    _veh = vehicle player;
    _sirenObj = _veh getVariable ["siren",objNull];
    _manObj = _veh getVariable ["manual",objNull];
    _classname = typeOf _veh;

    switch (true) do {
        case (_classname IN ["A3PL_Pierce_Pumper","A3PL_Pierce_Ladder","A3PL_Pierce_Heavy_Ladder"]): {_sirenType = "fire";};
        case (_classname IN ["A3PL_Tahoe_FD"]): {_sirenType = "fire_FR";};
        case (_classname IN ["A3PL_F150_PD","A3PL_Charger_PD","A3PL_Charger_PD_Slicktop","A3PL_Mustang_PD","A3PL_Mustang_PD_Slicktop","A3PL_CVPI_PD_Slicktop","A3PL_Tahoe_PD","A3PL_Tahoe_PD_Slicktop","A3PL_CVPI_PD","A3PL_RBM","A3PL_Motorboat_Rescue","A3PL_Motorboat_Police","A3PL_Silverado_PD","A3PL_VetteZR1_PD"]): {_sirenType = "police";};
        case (_classname IN ["Jonzie_Ambulance","A3PL_E350"]): {_sirenType = "ems";};
        case (_classname IN ["A3PL_P362_TowTruck","A3PL_F150_Marker"]): {_sirenType = "civ";};
        case (_classname IN ["A3PL_Yacht","A3PL_Container_Ship","A3PL_Yacht_Pirate","A3PL_Cutter","A3PL_Motorboat","A3PL_RHIB"]): {_sirenType = "Ship";};
        default {_sirenType = "police";};
    };

    switch (_sirenType) do {
        case "police": {
            switch (_action) do {
                case 1 :
                {
                    [_veh,false,false,true] call A3PL_Vehicle_SoundSourceClear;
                    _veh animate ["Siren_Control_Switch",0];
                    if (_veh animationSourcePhase "lightbar" > 0.5) then {_veh animateSource ["Lightbar",0];};
                };
                case 2 :
                {
                    if (_veh animationSourcePhase "lightbar" > 0.5) then {
                        [_veh,false,false,true] call A3PL_Vehicle_SoundSourceClear;
                    } else {
                        _veh animateSource ["Lightbar",1];
                        player action ["lightOn",_veh];
                    };
                };
                case 3 :
                {
                    [_veh,false,false,true] call A3PL_Vehicle_SoundSourceClear;
                    _veh call A3PL_Vehicle_SoundSourceCreate;
                    _veh animateSource ["Lightbar",1];
                    player action ["lightOn",_veh];
                    _veh animate ["Siren_Control_Switch",1];
                    _veh animate ["Siren_Control_Noob",12];
                    _veh animate ["SoundSource_1",1, true];
                };
                case 4 :
                {
                    if (_veh animationPhase "SoundSource_2" < 0.5 && {!A3PL_Manual_KeyDown}) then {
                        _veh animate ["SoundSource_2",1, true];
                        _veh animate ["FT_Switch_36",1];
                    } else {
                        _veh animate ["SoundSource_2",0, true];
                        _veh animate ["FT_Switch_36",0];
                    };
                };
                case 5 :
                {
                    if (_veh animationPhase "SoundSource_3" < 0.5 && {!A3PL_Manual_KeyDown}) then {
                        _veh animate ["SoundSource_3",1, true];
                        _veh animate ["FT_Switch_36",1];
                    } else {
                        _veh animate ["SoundSource_3",0, true];
                        _veh animate ["FT_Switch_36",0];
                    };
                };
                case 6 :
                {
                    if (_veh animationPhase "SoundSource_4" < 0.5) then {
                        _veh animate ["SoundSource_4",1, true];
                        _veh animate ["FT_Switch_37",1];
                    } else {
                        _veh animate ["SoundSource_4",0, true];
                        _veh animate ["FT_Switch_37",0];
                    };
                };
            };
        };

        case "ems": {
            switch (_action) do {
                case 1 :
                {
                    [_veh,false,false,true] call A3PL_Vehicle_SoundSourceClear;
                    _veh animate ["Siren_Control_Switch",0];
                    if (_veh animationSourcePhase "lightbar" > 0.5) then {_veh animateSource ["Lightbar",0];};
                };
                case 2 :
                {
                    if (_veh animationSourcePhase "lightbar" > 0.5) then {
                        [_veh,false,false,true] call A3PL_Vehicle_SoundSourceClear;
                    } else {
                        _veh animateSource ["Lightbar",1];
                        player action ["lightOn",_veh];
                    };
                };
                case 3 :
                {
                    [_veh,false,false,true] call A3PL_Vehicle_SoundSourceClear;
                    _veh call A3PL_Vehicle_SoundSourceCreate;
                    _veh animateSource ["Lightbar",1];
                    player action ["lightOn",_veh];
                    _veh animate ["Siren_Control_Switch",1];
                    _veh animate ["Siren_Control_Noob",12];
                    _veh animate ["SoundSource_1",1, true];
                };
                case 4 :
                {
                    if (_veh animationPhase "SoundSource_2" < 0.5 && {!A3PL_Manual_KeyDown}) then {
                        _veh animate ["SoundSource_2",1, true];
                        _veh animate ["FT_Switch_36",1];
                    } else {
                        _veh animate ["SoundSource_2",0, true];
                        _veh animate ["FT_Switch_36",0];
                    };
                };
                case 5 :
                {
                    if (_veh animationPhase "SoundSource_3" < 0.5 && {!A3PL_Manual_KeyDown}) then {
                        _veh animate ["SoundSource_3",1, true];
                        _veh animate ["FT_Switch_36",1];
                    } else {
                        _veh animate ["SoundSource_3",0, true];
                        _veh animate ["FT_Switch_36",0];
                    };
                };
                case 6 :
                {
                    if (_veh animationPhase "SoundSource_4" > 0.5 && {!A3PL_Manual_KeyDown}) then {
                        _veh animate ["SoundSource_4",1, true];
                        _veh animate ["FT_Switch_37",1];
                    } else {
                        _veh animate ["SoundSource_4",0, true];
                        _veh animate ["FT_Switch_37",0];
                    };
                };
            };
        };

        case "fire_FR": {
            switch (_action) do {
                case 1 :
                {
                    [_veh,false,false,true] call A3PL_Vehicle_SoundSourceClear;
                    _veh animate ["Siren_Control_Switch",0];
                    if (_veh animationSourcePhase "lightbar" > 0.5) then {_veh animateSource ["Lightbar",0];};
                };
                case 2 :
                {
                    if (_veh animationSourcePhase "lightbar" > 0.5) then {
                        [_veh,false,false,true] call A3PL_Vehicle_SoundSourceClear;
                    } else {
                        _veh animateSource ["Lightbar",1];
                        player action ["lightOn",_veh];
                    };
                };
                case 3 :
                {
                    [_veh,false,false,true] call A3PL_Vehicle_SoundSourceClear;
                    _veh call A3PL_Vehicle_SoundSourceCreate;
                    _veh animateSource ["Lightbar",1];
                    player action ["lightOn",_veh];
                    _veh animate ["Siren_Control_Switch",1];
                    _veh animate ["Siren_Control_Noob",12];
                    _veh animate ["SoundSource_1",1, true];
                };
                case 4 :
                {
                    if (_veh animationPhase "SoundSource_2" < 0.5 && {!A3PL_Manual_KeyDown}) then {
                        _veh animate ["SoundSource_2",1, true];
                        _veh animate ["FT_Switch_36",1];
                    } else {
                        _veh animate ["SoundSource_2",0, true];
                        _veh animate ["FT_Switch_36",0];
                    };
                };
                case 5 :
                {
                    if (_veh animationPhase "SoundSource_3" < 0.5 && {!A3PL_Manual_KeyDown}) then {
                        _veh animate ["SoundSource_3",1, true];
                        _veh animate ["FT_Switch_36",1];
                    } else {
                        _veh animate ["SoundSource_3",0, true];
                        _veh animate ["FT_Switch_36",0];
                    };
                };
                case 6 :
                {
                    if (_veh animationPhase "SoundSource_4" > 0.5 && {!A3PL_Manual_KeyDown}) then {
                        _veh animate ["SoundSource_4",1, true];
                        _veh animate ["FT_Switch_37",1];
                    } else {
                        _veh animate ["SoundSource_4",0, true];
                        _veh animate ["FT_Switch_37",0];
                    };
                };
            };
        };

        case "fire": {
            switch (_action) do {
                case 1 :
                {
                    [_veh,false,false,true] call A3PL_Vehicle_SoundSourceClear;
                    _veh animate ["Siren_Control_Switch",0];
                    if (_veh animationSourcePhase "lightbar" > 0.5) then {_veh animateSource ["Lightbar",0];};
                };
                case 2 :
                {
                    if (_veh animationSourcePhase "lightbar" > 0.5) then {
                        [_veh,false,false,true] call A3PL_Vehicle_SoundSourceClear;
                    } else {
                        _veh animateSource ["Lightbar",1];
                        player action ["lightOn",_veh];
                    };
                };
                case 3 :
                {
                    [_veh,false,false,true] call A3PL_Vehicle_SoundSourceClear;
                    _veh call A3PL_Vehicle_SoundSourceCreate;
                    _veh animateSource ["Lightbar",1];
                    player action ["lightOn",_veh];
                    _veh animate ["Siren_Control_Switch",1];
                    _veh animate ["Siren_Control_Noob",12];
                    _veh animate ["SoundSource_1",1, true];
                };
                case 4 :
                {
                    if (_veh animationPhase "SoundSource_2" < 0.5) then {
                        _veh animate ["SoundSource_2",1, true];
                        _veh animate ["FT_Switch_36",1];
                    } else {
                        _veh animate ["SoundSource_2",0, true];
                        _veh animate ["FT_Switch_36",0];
                    };
                };
                case 5 :
                {
                    if (_veh animationPhase "SoundSource_3" < 0.5 && {!A3PL_Manual_KeyDown}) then {
                        _veh animate ["SoundSource_3",1, true];
                        _veh animate ["FT_Switch_36",1];
                    } else {
                        _veh animate ["SoundSource_3",0, true];
                        _veh animate ["FT_Switch_36",0];
                    };
                };
            };
        };

        case "civ": {
            switch (_action) do {
                case 1 :
                {
                    [_veh,false,false,true] call A3PL_Vehicle_SoundSourceClear;
                    _veh animate ["Siren_Control_Switch",0];
                    if (_veh animationSourcePhase "lightbar" > 0.5) then {_veh animateSource ["Lightbar",0];};
                };
                case 2 :
                {
                    if (_veh animationSourcePhase "lightbar" > 0.5) then {
                        [_veh,false,false,true] call A3PL_Vehicle_SoundSourceClear;
                    } else {
                        _veh animateSource ["Lightbar",1];
                        player action ["lightOn",_veh];
                    };
                };
            };
        };

        case "Ship": {
            switch (_action) do {
                case 1 :
                {
                    if (_veh animationPhase "SoundSource_1" > 0.5) then {_veh animateSource ["Lightbar",0];};
                };
                case 2 :
                {
                    if (_veh animationPhase "SoundSource_1" < 0.5) then {_veh animate ["SoundSource_1",1, true];};
                };
            };
        };
    };

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_SoundSourceClear', {

    private ["_veh"];
    _veh = param [0,objNull];
    _clearAll = param [1,true];
    _clearManual = param [2,true];
    _clearAnim = param [3,true];

    if (_clearAnim) exitwith {{deleteVehicle _x} forEach (_veh getVariable "SoundSource");_veh animate ["SoundSource_1",0, true];_veh animate ["SoundSource_2",0, true];_veh animate ["SoundSource_3",0, true];_veh animate ["SoundSource_4",0, true];_veh animate ["SoundSource_5",0, true];_veh animate ["SoundSource_6",0, true];_veh animate ["SoundSource_7",0, true];_veh animate ["SoundSource_8",0, true];_veh animate ["SoundSource_9",0, true];_veh animate ["SoundSource_10",0, true];_veh animate ["SoundSource_11",0, true];_veh animate ["SoundSource_12",0, true];_veh animate ["SoundSource_13",0, true];_veh animate ["SoundSource_14",0, true];_veh animate ["SoundSource_15",0, true];_veh animate ["SoundSource_16",0, true];_veh animate ["SoundSource_17",0, true];_veh animate ["SoundSource_18",0, true];_veh animate ["SoundSource_19",0, true];_veh animate ["SoundSource_20",0, true];};

    if (_clearAll) exitwith
    {
        {
            if ((typeOf _x) == "#dynamicSound") then
            {
                deleteVehicle _x;
            };
        } forEach (attachedObjects _veh);
    };

    if (_clearManual) then
    {
        deleteVehicle (_veh getVariable ["manual",objNull]);
    } else
    {
        deleteVehicle (_veh getVariable ["siren",objNull]);
    };

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_SoundSourceCreate', {

    private ["_sirenType","_veh","_classname","_Siren","_SoundSource_1","_SoundSource_2","_SoundSource_3","_SoundSource_4"];
    _veh = _this;
    _classname = typeOf _veh;
    switch (true) do
    {
        case (_classname IN ["A3PL_Pierce_Pumper","A3PL_Pierce_Ladder","A3PL_Pierce_Heavy_Ladder"]): {_sirenType = "fire";};
        case (_classname IN ["A3PL_Tahoe_FD"]): {_sirenType = "fire_FR";};
        case (_classname IN ["A3PL_F150_PD","A3PL_Charger_PD","A3PL_Charger_PD_Slicktop","A3PL_Mustang_PD","A3PL_Mustang_PD_Slicktop","A3PL_CVPI_PD_Slicktop","A3PL_Tahoe_PD","A3PL_Tahoe_PD_Slicktop","A3PL_CVPI_PD","A3PL_RBM","A3PL_Motorboat_Rescue","A3PL_Motorboat_Police","A3PL_Silverado_PD","A3PL_VetteZR1_PD"]): {_sirenType = "police";};
        case (_classname IN ["Jonzie_Ambulance","A3PL_E350"]): {_sirenType = "ems";};
        case (_classname IN ["A3PL_P362_TowTruck","A3PL_F150_Marker"]): {_sirenType = "civ";};
        case (_classname IN ["A3PL_Yacht","A3PL_Container_Ship","A3PL_Yacht_Pirate","A3PL_Cutter","A3PL_Motorboat","A3PL_RHIB"]): {_sirenType = "Ship";};
        default {_sirenType = "police";};
    };

    switch (_sirenType) do
    {
        case "police":
        {
            _SoundSource_1 = createSoundSource ["A3PL_FSS_Siren", [0,0,0], [], 0];
            _SoundSource_1 attachTo [_veh, [0,0,0], "SoundSource_1"];
            _SoundSource_2 = createSoundSource ["A3PL_FSS_Phaser", [0,0,0], [], 0];
            _SoundSource_2 attachTo [_veh, [0,0,0], "SoundSource_2"];
            _SoundSource_3 = createSoundSource ["A3PL_FSS_Priority", [0,0,0], [], 0];
            _SoundSource_3 attachTo [_veh, [0,0,0], "SoundSource_3"];
            _SoundSource_4 = createSoundSource ["A3PL_FSS_Rumbler", [0,0,0], [], 0];
            _SoundSource_4 attachTo [_veh, [0,0,0], "SoundSource_4"];
            _Siren = [_SoundSource_1,_SoundSource_2,_SoundSource_3,_SoundSource_4];
            _veh setVariable ["SoundSource",_Siren,true];
        };
        case "fire":
        {
            _SoundSource_1 = createSoundSource ["A3PL_EQ2B_Wail", [0,0,0], [], 0];
            _SoundSource_1 attachTo [_veh, [0,0,0], "SoundSource_1"];
            _SoundSource_2 = createSoundSource ["A3PL_Whelen_Warble", [0,0,0], [], 0];
            _SoundSource_2 attachTo [_veh, [0,0,0], "SoundSource_2"];
            _SoundSource_3 = createSoundSource ["A3PL_AirHorn_1", [0,0,0], [], 0];
            _SoundSource_3 attachTo [_veh, [0,0,0], "SoundSource_3"];
            _Siren = [_SoundSource_1,_SoundSource_2,_SoundSource_3];
            _veh setVariable ["SoundSource",_Siren,true];
        };
        case "fire_FR":
        {
            _SoundSource_1 = createSoundSource ["A3PL_FSUO_Siren", [0,0,0], [], 0];
            _SoundSource_1 attachTo [_veh, [0,0,0], "SoundSource_1"];
            _SoundSource_2 = createSoundSource ["A3PL_Whelen_Priority3", [0,0,0], [], 0];
            _SoundSource_2 attachTo [_veh, [0,0,0], "SoundSource_2"];
            _SoundSource_3 = createSoundSource ["A3PL_FIPA20A_Priority", [0,0,0], [], 0];
            _SoundSource_3 attachTo [_veh, [0,0,0], "SoundSource_3"];
            _SoundSource_4 = createSoundSource ["A3PL_Electric_Horn", [0,0,0], [], 0];
            _SoundSource_4 attachTo [_veh, [0,0,0], "SoundSource_4"];
            _Siren = [_SoundSource_1,_SoundSource_2,_SoundSource_3,_SoundSource_4];
            _veh setVariable ["SoundSource",_Siren,true];
        };
        case "ems":
        {
            _SoundSource_1 = createSoundSource ["A3PL_Whelen_Siren", [0,0,0], [], 0];
            _SoundSource_1 attachTo [_veh, [0,0,0], "SoundSource_1"];
            _SoundSource_2 = createSoundSource ["A3PL_Whelen_Priority", [0,0,0], [], 0];
            _SoundSource_2 attachTo [_veh, [0,0,0], "SoundSource_2"];
            _SoundSource_3 = createSoundSource ["A3PL_Whelen_Priority2", [0,0,0], [], 0];
            _SoundSource_3 attachTo [_veh, [0,0,0], "SoundSource_3"];
            _SoundSource_4 = createSoundSource ["A3PL_Electric_Airhorn", [0,0,0], [], 0];
            _SoundSource_4 attachTo [_veh, [0,0,0], "SoundSource_4"];
            _Siren = [_SoundSource_1,_SoundSource_2,_SoundSource_3,_SoundSource_4];
            _veh setVariable ["SoundSource",_Siren,true];
        };
        case "civ": {};
        case "Ship": {};
    };

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_Toggle_GooseNeck', {

    private ["_trailer"];
    _trailer = param [0,objNull];
    if (isNull _trailer) exitwith {["Você não está olhando para um reboque", Color_Red] call A3PL_HUD_Notification;};
    if (!(_trailer isKindOf "Car")) exitwith {["Você não está olhando para um veículo para abaixar/levantar a rampa", Color_Red] call A3PL_HUD_Notification;};
    if (!(local _trailer)) exitwith {["Problema de localidade, você não é o proprietário deste reboque. Volte a ligar o reboque/volte a entrar no veículo e tente novamente", Color_Red] call A3PL_HUD_Notification;};
    _truck = getPos _trailer nearestObject "A3PL_P362";

    if ((_trailer animationSourcePhase "Gooseneck_Hide") < 0.5) then
    {
        _trailer animateSource ["Gooseneck_Hide",1];

        [_trailer] spawn
        {
            private ["_trailer","_t"];
            _trailer = param [0,objNull];
            if (isNull _trailer) exitwith {};
            _t = 0;
            waitUntil {sleep 0.1; _t = _t + 0.1; (_t >= 6) OR ((_trailer animationSourcePhase "Gooseneck_Hide" >= 1))};
            if (_trailer animationSourcePhase "Gooseneck_Hide" < 0.9) exitwith {_trailer animateSource ["Gooseneck_Hide",0]};
            if (!(local _trailer)) exitwith {_trailer animateSource ["Gooseneck_Hide",0]};

            [_trailer] remoteExec ["Server_Vehicle_EnableSimulation", 2];

            {
                detach _x;
            } foreach (attachedObjects _trailer);
        };
    } else
    {
        private ["_vehicles","_vehiclesTrailer"];

        _vehicles = nearestObjects [_trailer, ["Air","Thing","LandVehicle","Ship"], 10];
        _vehicles = _vehicles - [_trailer];
        _vehicles = _vehicles - [_truck];
        _vehiclesTrailer = [];

        {
            if ((getpos _x) inArea [_trailer modelToWorld [0,0,0], 6.1, 1,(getDir _trailer+90), true]) then
            {
                _vehiclesTrailer pushback _x;
            };
        } foreach _vehicles;

        {
            [_x,_trailer] call BIS_Fnc_AttachToRelative;
        } foreach _vehiclesTrailer;

        [_trailer] remoteExec ["Server_Vehicle_EnableSimulation", 2];

        _trailer animateSource ["Gooseneck_Hide",0];
    };

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_TowTruck_Loadcar', {

    private ["_truck","_towpoint","_towing","_alignment","_distance","_height","_Eheight","_angle","_shift","_roleon","_pullup","_traytilt","_unload","_pushdown","_roleoff","_Ramp_up","_Edistance","_towingmass","_truckmass","_Fuel_lvl","_Supported_Vehicles","_UnSupported_Vehicles","_wheel1","_wheel2","_type","_stablecar","_stablize"];
    _truck = _this select 0;
    _towpoint = "Land_HelipadEmpty_F" createVehicleLocal (getpos _truck);
    _towpoint attachTo [_truck,[0,-6.41919,-2.1209]];
    _towing = (getpos _towpoint) nearestObject "AllVehicles";
    _alignment = [_truck, _towing] call BIS_fnc_relativeDirTo;

    if (_towing isKindOf "Man") exitWith {
        deleteVehicle _towpoint;
        ["Você não pode rebocar um jogador/npc", Color_Red] call A3PL_HUD_Notification;
    };

    if ((_towpoint distance _towing) >= 6) exitWith {deleteVehicle _towpoint;["Veículo muito longe", Color_Yellow] call A3PL_HUD_Notification;};
    deleteVehicle _towpoint;
    if (_alignment > 182) exitWith  {["O veículo não esta posicionado corretamente", Color_Yellow] call A3PL_HUD_Notification;};
    if (_alignment < 178) exitWith  {["O veículo não esta posicionado corretamente", Color_Yellow] call A3PL_HUD_Notification;};
    if ((_truck animationSourcePhase "truck_flatbed") < 0.5) exitWith {["A rampa precisa estar no chão", Color_Yellow] call A3PL_HUD_Notification;};
    if (_truck == _towing) exitWith {["O veículo não esta posicionado corretamente", Color_Yellow] call A3PL_HUD_Notification;};
    if ((!local _truck) OR ((!isNull _towing) && (!local _towing))) exitWith {[player,_truck,_towing] remoteExec ["Server_Vehicle_AtegoHandle", 2];["Configurando o veículo local para você"] call A3PL_HUD_Notification;};
    {unassignVehicle _x;_x action ["EJECT", vehicle _x];sleep 0.4;} foreach crew _towing;
    _towing engineOn false;

    sleep 0.5;
    _distance = -5.7323;
    _height = 0.373707;
    _Eheight = 0.373707;
    _angle = 0;
    _shift = 0;
    _towing setvectorUp [0,_angle,1];
    _towingdir = [_towing, _truck] call BIS_fnc_relativeDirTo;
    if (_towingdir > 170 && _towingdir < 190) then  {_towingdir = 180;} else {_towingdir = 0;};
    _roleon = true;
    _pullup = true;
    _traytilt = true;
    _unload = false;
    _pushdown = true;
    _roleoff = true;
    _Ramp_up = true;
    _Edistance = 0;
    _towingmass = getMass _towing;
    _truckmass = getMass _truck;
    _Fuel_lvl = fuel _truck;

    _Supported_Vehicles = ["Jonzie_Datsun_Z432"];
    _UnSupported_Vehicles = ["A3PL_Pierce_Pumper","A3PL_Pierce_Ladder","A3PL_Pierce_Heavy_Ladder","A3PL_P362_TowTruck","A3PL_Box_Trailer","A3PL_Tanker_Trailer","A3PL_Lowloader","A3PL_Boat_Trailer","A3PL_MobileCrane"];
    if ((typeOf _towing) in _UnSupported_Vehicles) then {["Você não pode rebocar este veículo", Color_Red] call A3PL_HUD_Notification;};
    if !((typeOf _towing) in _Supported_Vehicles) then
    {
        _wheel1 = _towing selectionPosition "wheel_1_1_bound";
        _wheel2 = _towing selectionPosition "wheel_2_2_bound";
        _height = -(_wheel1 select 2) - 1;
        _Edistance = -((_wheel1 select 1)+(_wheel2 select 1))/2;
        _distance = _Edistance - 5.5;
        _shift = -((_wheel1 select 0)+(_wheel2 select 0))/2;
    };
    _type = typeOf _towing;

    switch (_type) do
    {
        case "A3PL_E350": {_height = _height - 0.2;_shift = _shift + 0.1;};
        case "Jonzie_Ambulance": {_height = _height - 0.2;_Edistance = _Edistance - 0.4;};
        case "A3PL_Small_Boat_Trailer": {_height = _height + 0.3;_Edistance = _Edistance - 1;_shift = _shift - 0.5;_towing attachTo [_truck,[_shift,_distance,_Endheight],"flatbed_middle"];};
        case "A3PL_Drill_Trailer": {_shift = _shift - 0.4;_towing attachTo [_truck,[_shift,_distance,_Endheight],"flatbed_middle"];};
        case "A3PL_MiniExcavator": {_towingmass = 2500;_height = _height + 0.5;_Edistance = _Edistance - 1.4;_towing attachTo [_truck,[_shift,_distance,_Endheight],"flatbed_middle"];};
    };

    while {_roleon} do
    {
        waitUntil {_truck animationSourcePhase "truck_flatbed" == 1};
        _towing attachTo [_truck,[_shift,_distance,_height],"flatbed_middle"];
        _towing setDir _towingdir;
        _towing setvectorUp [0,_angle,1];
        _distance = _distance + 0.01;
        _height = _height + 0.000846;
        _angle = _angle - 0.000846;
        If (_angle <= -0.23) then {_roleon = false;_Eheight = _height;};
        sleep 0.01;
    };

    while {_pullup} do
    {
        waitUntil {_truck animationSourcePhase "truck_flatbed" == 1};
        _towing attachTo [_truck,[_shift,_distance,_Eheight],"flatbed_middle"];
        _distance = _distance + 0.01;
        _Eheight = _Eheight + 0.002346;
        if (_distance >= _Edistance) then {_pullup = false;};
        sleep 0.01;
    };

    [_truck,_angle] spawn A3PL_Vehicle_TowTruck_Ramp_up;
    switch (_type) do
    {
        case "A3PL_E350": {_Endheight = _Eheight + 0.2;_towing attachTo [_truck,[_shift,_distance,_Endheight],"flatbed_middle"];};
        case "Jonzie_Ambulance": {_Endheight = _Eheight + 0.35;_towing attachTo [_truck,[_shift,_distance,_Endheight],"flatbed_middle"];};
        case "A3PL_Ram": {_Endheight = _Eheight - 0.1;_towing attachTo [_truck,[_shift,_distance,_Endheight],"flatbed_middle"];};
        case "A3PL_Ram_Rusty": {_Endheight = _Eheight - 0.1;_towing attachTo [_truck,[_shift,_distance,_Endheight],"flatbed_middle"];};
        case "ALR_Tesla": {_Endheight = _Eheight - 0.1;_towing attachTo [_truck,[_shift,_distance,_Endheight],"flatbed_middle"];};
        case "A3PL_Tahoe": {_Endheight = _Eheight - 0.05;_towing attachTo [_truck,[_shift,_distance,_Endheight],"flatbed_middle"];};
        case "A3PL_Tahoe_PD": {_Endheight = _Eheight - 0.05;_towing attachTo [_truck,[_shift,_distance,_Endheight],"flatbed_middle"];};
        case "A3PL_Tahoe_PD_Slicktop": {_Endheight = _Eheight - 0.05;_towing attachTo [_truck,[_shift,_distance,_Endheight],"flatbed_middle"];};
        case "A3PL_Tahoe_FD": {_Endheight = _Eheight - 0.05;_towing attachTo [_truck,[_shift,_distance,_Endheight],"flatbed_middle"];};
        case "A3PL_Camaro": {_Endheight = _Eheight + 0.04;_towing attachTo [_truck,[_shift,_distance,_Endheight],"flatbed_middle"];};
        case "A3PL_Gallardo": {_Endheight = _Eheight + 0.04;_towing attachTo [_truck,[_shift,_distance,_Endheight],"flatbed_middle"];};
        case "A3PL_MailTruck": {_Endheight = _Eheight - 0.08;_towing attachTo [_truck,[_shift,_distance,_Endheight],"flatbed_middle"];};
        case "A3PL_VetteZR1": {_Endheight = _Eheight + 0.06;_towing attachTo [_truck,[_shift,_distance,_Endheight],"flatbed_middle"];};
        case "A3PL_CRX": {_Endheight = _Eheight + 0.08;_towing attachTo [_truck,[_shift,_distance,_Endheight],"flatbed_middle"];};
        case "A3PL_Small_Boat_Trailer": {_Endheight = _Eheight + 0.08;_towing attachTo [_truck,[_shift,_distance,_Endheight],"flatbed_middle"];};
        case "A3PL_Drill_Trailer": {_Endheight = _Eheight + 0.02;_towing attachTo [_truck,[_shift,_distance,_Endheight],"flatbed_middle"];};
        case "A3PL_MiniExcavator": {_Endheight = _Eheight - 0.15;_towing attachTo [_truck,[_shift,_distance,_Endheight],"flatbed_middle"];};
        case "A3PL_P362": {_Endheight = _Eheight + 0.2;_towing attachTo [_truck,[_shift,_distance,_Endheight],"flatbed_middle"];};
    };
    _totalmass = _towingmass + _truckmass;

    _towing setPos getPos _towing;

    _towing setVariable ["XYZ", [_height,_Edistance,_distance,_Eheight,_towingdir,_truckmass,_angle], true];
    _towing setVariable ["Towed", true, true];
    _truck setVariable ["Towed_Car",_towing,true];
    _truck setVariable ["Towing",true,true];

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_TowTruck_Ramp_Down', {

    private ["_truck","_angle","_Ramp_down","_towing"];
    _truck = _this select 0;
    _angle = _this select 1;
    _towing = _truck getVariable "Towed_Car";
    _truck animateSource ["truck_flatbed",1];
    _truck animate ["Ramp_Switch",1];
    if (isNil {_towing}) exitWith  {};
    _Ramp_down = true;
    while {_Ramp_down} do
    {
        waitUntil {_truck animationSourcePhase "truck_flatbed" > 0.3};
        _angle = _angle - 0.00025567911;
        If (_angle <= -0.2301112) then {_angle = -0.2301112;_Ramp_down = false;};
        _towing setvectorUp [0,_angle,1];
        sleep 0.01;
    };
    _towing setPos getPos _towing;

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_TowTruck_Ramp_Up', {

    private ["_truck","_angle","_Ramp_up","_towing"];
    _truck = _this select 0;
    _angle = _this select 1;
    _towing = _truck getVariable "Towed_Car";
    _truck animateSource ["truck_flatbed",0];
    _truck animate ["Ramp_Switch",0];
    if (isNil {_towing}) exitWith  {};
    _Ramp_up = true;
    while {_Ramp_up} do
    {
        waitUntil {_truck animationSourcePhase "truck_flatbed" < 1};
        _angle = _angle + 0.00025567911;
        If (_angle >= -0.00153407466) then {_angle = 0;_Ramp_up = false;};
        _towing setvectorUp [0,_angle,1];
        sleep 0.01;
    };
    _towing setPos getPos _towing;

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_TowTruck_UnloadCar', {

    private ["_truck","_towpoint","_towing","_alignment","_distance","_height","_Eheight","_angle","_shift","_roleon","_pullup","_traytilt","_unload","_pushdown","_roleoff","_Ramp_up","_Edistance","_towingmass","_truckmass","_Fuel_lvl","_Supported_Vehicles","_UnSupported_Vehicles","_wheel1","_wheel2","_type","_stablecar","_stablize"];
    _truck = _this select 0;
    _towing = _truck getVariable "Towed_Car";
    if ((!local _truck) OR ((!isNull _towing) && (!local _towing))) exitWith {[player,_truck,_towing] remoteExec ["Server_Vehicle_AtegoHandle", 2];["System Locality Issue: Setting vehicle local to you"] call A3PL_HUD_Notification;};
    if (_truck == _towing) exitWith {};
    _pushdown = true;
    _roleoff = true;
    _distance = 0;
    _Edistance = 0;
    _height = 0;
    _Eheight = 0;
    _shift = 0;
    _angle = 0;
    _towingXYZ = _towing getVariable "XYZ";
    _height = _towingXYZ select 0;
    _Edistance = _towingXYZ select 1;
    _distance = _towingXYZ select 2;
    _Eheight = _towingXYZ select 3;
    _towingdir = _towingXYZ select 4;
    _truckmass = _towingXYZ select 5;
    _towingmass = getMass _towing;

    _Fuel_lvl = fuel _truck;

    if ((_truck animationSourcePhase "truck_flatbed") < 0.5) then {[_truck,_angle] spawn A3PL_Vehicle_TowTruck_Ramp_down;}else {_angle = -0.230112;};
    while {_pushdown} do
    {
        waitUntil {_truck animationSourcePhase "truck_flatbed" == 1};
        _towing attachTo [_truck,[_shift,_distance,_Eheight],"flatbed_middle"];
        _distance = _distance - 0.01;
        _Eheight = _Eheight - 0.002346;
        if (_distance <= -2.2) then {_pushdown = false;_height = _Eheight;};
        sleep 0.01;
    };

    while {_roleoff} do
    {
        waitUntil {_truck animationSourcePhase "truck_flatbed" == 1};
        _towing attachTo [_truck,[_shift,_distance,_height],"flatbed_middle"];
        _towing setvectorUp [0,_angle,1];
        _distance = _distance - 0.012;
        _height = _height - 0.000846;
        _angle = _angle + 0.000846;
        if (_angle >= 0) then {_roleoff = false;};
        sleep 0.01;
    };

    detach _towing;
    _towing setPos getPos _towing;
    _towing setVelocity [0, 0, 1];

    _truck setVariable ["Towing",false,true];
    _towing setVariable ["Towed", false, true];

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_Trailer_Hitch', {

    params [["_trailer",objNull]];

    private _offset = 3;
    private _ramp = false;

    if ((typeOf _trailer) IN ["A3PL_Lowloader"]) then {
        _offset = 5;
        if (_trailer animationPhase "ramp" > 0) then {_ramp = true;};
    };

    if ((typeOf _trailer) IN ["A3PL_Car_Trailer"]) then {
        if (_trailer animationSourcePhase "Ramp" > 0) then {_ramp = true;};
    };

    if (_ramp) exitwith {["Por favor, eleve a rampa antes de pegar o reboque", Color_Red] call A3PL_HUD_Notification;};

    private _TruckArray = nearestObjects [(_trailer modelToWorld [0,_offset,0]), HitchingVehicles, 16.5];
    if ((count _TruckArray) isEqualTo 0) exitwith {["Nenhum veiculo proximo",Color_Red] call A3PL_HUD_Notification;};

    private _truck = _truckArray select 0;

    _truck allowDamage false;
    _trailer allowDamage false;

    if ((!(local _truck)) || (!(local _trailer))) exitWith {
        [_truck,_trailer] remoteExec ["Server_Vehicle_Trailer_Hitch",2];
        ["O veículo não é local - pedido enviado para mudar a localidade - por favor, tente novamente",Color_Yellow] call A3PL_HUD_Notification;
    };

    uiSleep 1;

    _trailer animateSource ["Hitched",20,true];
    _truck animateSource ["Hitched",20,true];

    uiSleep 60;

    _truck allowDamage true;

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_Trailer_Unhitch', {

    params [["_trailer",objNull]];

    private _TruckArray = nearestObjects [(_trailer modelToWorld [0,3,0]), HitchingVehicles, 6.5];
    if ((count _TruckArray) isEqualTo 0) exitwith {["Nenhum veiculo proximo",Color_Red] call A3PL_HUD_Notification;};

    private _Truck = _TruckArray select 0;

    _truck allowDamage false;
    _trailer allowDamage false;

    uiSleep 1;

    _trailer animateSource ["Hitched",0,true];
    _truck animateSource ["Hitched",0,true];

    uiSleep 60;

    _truck allowDamage true;

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_TrailerAttach', {

    private ["_trailer","_boats","_boat"];

    _trailer = param [0,objNull];
    if (typeOf _trailer != "A3PL_Small_Boat_Trailer") exitwith {["Tipo incorreto (tente novamente)", Color_Red] call A3PL_HUD_Notification;};
    _boats = nearestObjects [_trailer, ["Ship"], 6];

    if (count _boats < 1) exitwith
    {
        ["Não parece que nenhum barco esteja perto", Color_Red] call A3PL_HUD_Notification;
    };

    _boat = _boats select 0;

    switch (typeOf _boat) do
    {
        case ("A3PL_RHIB"): {_boat attachTo [_trailer,[0,-0.57,0.9]];};
        default {_boat attachTo [_trailer,[0,-0.25,0.9]]; };
    };

    [_boat] remoteExec ["Server_Vehicle_EnableSimulation", 2];

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_TrailerAttachObjects', {

    private ["_trailer"];
    _trailer = param [0,objNull];

    if (isNull _trailer) exitwith {["Você não está olhando para um reboque", Color_Red] call A3PL_HUD_Notification;};
    if !(_trailer isKindOf "Car") exitwith {["Você não está olhando para um reboque", Color_Red] call A3PL_HUD_Notification;};
    if !(local _trailer) exitwith {
        [_trailer,player] remoteExec ["A3PL_Lib_ChangeLocality",2];
        ["Problema de localidade, você não é o proprietário deste reboque. uma tentativa de alteração de localidade foi iniciada no servidor. Por favor, tente novamente em um segundo", Color_Yellow] call A3PL_HUD_Notification;
    };

    if ((_trailer animationsourcePhase "Ramp") < 0.5) then {
        _trailer animatesource ["Ramp",1];
        [_trailer] spawn {
            private ["_trailer","_t"];
            _trailer = param [0,objNull];
            if (isNull _trailer) exitwith {};
            _t = 0;
            waitUntil {sleep 0.1; _t = _t + 0.1; (_t >= 6) OR ((_trailer animationsourcePhase "Ramp" >= 1))};
            if (_trailer animationsourcePhase "Ramp" < 0.9) exitwith {_trailer animatesource ["Ramp",0]};
            if (!(local _trailer)) exitwith {_trailer animatesource ["Ramp",0]};

            [_trailer] remoteExec ["Server_Vehicle_EnableSimulation", 2];

            {
                detach _x;
            } foreach (attachedObjects _trailer);
        };
    } else {
        private ["_vehicles","_vehiclesTrailer"];

        _vehicles = nearestObjects [_trailer, ["Air","Thing","LandVehicle","Ship"], 10];
        _vehicles = _vehicles - [_trailer];
        _vehiclesTrailer = [];

        {
            if ((getpos _x) inArea [_trailer modelToWorld [0,0,0], 3.1, 1,(getDir _trailer+90), true]) then
            {
                _vehiclesTrailer pushback _x;
            };
        } foreach _vehicles;

        {
            [_x,_trailer] call BIS_Fnc_AttachToRelative;
        } foreach _vehiclesTrailer;

        [_trailer] remoteExec ["Server_Vehicle_EnableSimulation",2];
        _trailer animatesource ["Ramp",0];
    };

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_TrailerRamp', {

    private ["_trailer"];
    _trailer = param [0,objNull];
    if (isNull _trailer) exitwith {["Você não está olhando para um reboque", Color_Red] call A3PL_HUD_Notification;};
    if (!(_trailer isKindOf "Car")) exitwith {["Você não está olhando para um veículo para abaixar/elevar a rampa", Color_Red] call A3PL_HUD_Notification;};
    if (!(local _trailer)) exitwith {["Problema de localidade, você não é o proprietário deste reboque. Volte a ligar o reboque/volte a entrar no veículo e tente novamente", Color_Red] call A3PL_HUD_Notification;};
    _truck = getPos _trailer nearestObject "A3PL_P362";

    if ((_trailer animationPhase "ramp") < 0.5) then
    {
        _trailer animate ["ramp",1];

        [_trailer] spawn
        {
            private ["_trailer","_t"];
            _trailer = param [0,objNull];
            if (isNull _trailer) exitwith {};
            _t = 0;
            waitUntil {sleep 0.1; _t = _t + 0.1; (_t >= 6) OR ((_trailer animationPhase "ramp" >= 1))};
            if (_trailer animationPhase "ramp" < 0.9) exitwith {_trailer animate ["ramp",0]};
            if (!(local _trailer)) exitwith {_trailer animate ["ramp",0]};

            [_trailer] remoteExec ["Server_Vehicle_EnableSimulation", 2];

            {
                detach _x;
            } foreach (attachedObjects _trailer);
        };
    } else
    {
        private ["_vehicles","_vehiclesTrailer"];

        _vehicles = nearestObjects [_trailer, ["Air","Thing","LandVehicle","Ship"], 10];
        _vehicles = _vehicles - [_trailer];
        _vehicles = _vehicles - [_truck];
        _vehiclesTrailer = [];
        {
            if ((getpos _x) inArea [_trailer modelToWorld [0,0,0], 6.1, 1,(getDir _trailer+90), true]) then
            {
                _vehiclesTrailer pushback _x;
            };
        } foreach _vehicles;

        {
            [_x,_trailer] call BIS_Fnc_AttachToRelative;
        } foreach _vehiclesTrailer;

        [_trailer] remoteExec ["Server_Vehicle_EnableSimulation", 2];

        _trailer animate ["ramp",0];
    };

}, false] call Server_Setup_Compile;

/*
    Server
*/
['Server_Vehicle_Spawn', {

    params [
        ["_class",""],
        "_pos",
        ["_id",-1],
        ["_owner",objNull]
    ];

    private _initfunction = !isNil ('Server_Vehicle_Init_' + _class);
    private _veh = objNull;

    if ((typename _pos) isEqualTo 'Object') then {
        _veh = createVehicle [_class, (getPos _pos), [], 0, 'CAN_COLLIDE'];
        _veh allowDamage false;
        _veh setDir (getDir _pos);
        _veh setpos (getPos _pos);
    } else {
        _veh = createVehicle [_class, _pos, [], 0, 'CAN_COLLIDE'];
        _veh allowDamage false;
    };

    if (isNull _veh) exitwith {};

    _veh setVariable ["owner",[(getplayerUID _owner),_id],true];
    [_owner,_veh] spawn Caue_Keys_Add;

    if (_id IN ["WASTE","DELIVER","EXTERMY","KARTING"]) then {
        switch (_class) do {
            case ("A3PL_P362_Garbage_Truck"): {_veh setObjectTextureGlobal [0,"\A3PL_Textures\Peterbilt_Garbage_Truck\Waste_Management_Garbage_Truck.paa"];};
            case ("A3PL_Mailtruck"): {if (_id isEqualTo "EXTERMY") then {_veh setObjectTextureGlobal [0,"\A3PL_Textures\MailTruck\Exterminator_Truck.paa"];};};
        };
        _owner setVariable ["jobVehicle",_veh,true];
    };

    [_veh,_id] call Server_Vehicle_Init_General;

    if (_initfunction) then {
        _veh call (missionNamespace getVariable ('Server_Vehicle_Init_' + _class));
    };

    if ((typeOf _veh) IN HitchingVehicles) then {
        _veh call Server_Vehicle_Init_A3PL_F150;
    };

    _veh;

}, true] call Server_Setup_Compile;

['Server_Vehicle_Despawn', {

    params [["_veh",objNull]];

    {deleteVehicle _x;} foreach (attachedObjects _veh);
    deleteVehicle _veh;

}, true] call Server_Setup_Compile;

['Server_Vehicle_Buy', {

    params [
        ["_player",objNull],
        ["_class",""],
        ["_type",""],
        ["_storage",false]
    ];

    if (isNull _player) exitWith {};

    private _uid = getPlayerUID _player;
    private _id = [7] call Caue_Lib_GenerateID;

    if (_class IN Config_Vehicle_Cars) then {_type = "car"};
    if (_class IN Config_Vehicle_Trucks) then {_type = "truck"};
    if (_class IN Config_Vehicle_Boats) then {_type = "boat"};
    if (_class IN Config_Vehicle_Planes) then {_type = "plane"};

    private _query = "";
    if (_storage) then {
        _query = format["Vehicle_Buy1:%1:%2:%3:%4",_id,_type,_class,_uid];
    } else {
        _query = format["Vehicle_Buy2:%1:%2:%3:%4",_id,_type,_class,_uid];
    };

    [_query,1] spawn Server_Database_Async;

    if (_storage) then {
        private _veh = createVehicle [_class,[(random 5000),(random 5000),3000],[],0,'CAN_COLLIDE'];
        [_veh,_id] call Caue_Vehicle_SaveColor;
        deleteVehicle _veh;
    };

    _id

}, true] call Server_Setup_Compile;

['Server_Vehicle_Sell', {

    params [
        ["_vehicle",objNull]
    ];

    if (isNull _vehicle) exitWith {};

    private _plate = (_vehicle getVariable ["owner",[]]) select 1;

    [format["Vehicle_Sell:%1",_plate],1] spawn Server_Database_Async;
    [_vehicle] call Server_Vehicle_Despawn;

}, true] call Server_Setup_Compile;

['Servet_Vehicle_SetPlate', {

    params [
        ["_plate",""],
        ["_vehicle",objNull]
    ];

    if (isNull _vehicle) exitWith {};

    for "_i" from 0 to (count _plate) do {
        _vehicle setObjectTextureGlobal [_i+1,(format ["A3PL_Cars\Common\Number_Plates\%1.paa",_plate select [_i,1]])];
    };

}, true] call Server_Setup_Compile;




['Server_Vehicle_AtegoHandle', {

    _player = param [0,objNull];
    _truck = param [1,objNull];
    _car = param [2,objNull];

    _oTruck = owner _truck;
    _oPlayer = owner _player;
    _oCar = owner _car;

    if (_oTruck != _oPlayer) then
    {
        _truck setOwner _oPlayer;
    };

    if ((!isNull _car) && (_oCar != _oTruck)) then
    {
        _car setOwner _oPlayer;
    };

    [_truck,_car] remoteExec ["A3PL_Vehicle_AtegoTowResponse", _oPlayer];

}, true] call Server_Setup_Compile;

['Server_Vehicle_EnableSimulation', {

    params [
        ["_veh",objNull],
        ["_force",false],
        ["_forceEnable",false]
    ];

    if (isNull _veh) exitwith {};

    if (_force) exitwith {_veh enableSimulationGlobal _forceEnable;};

    if (simulationEnabled _veh) then {
        _veh enableSimulationGlobal false;
    } else {
        _veh enableSimulationGlobal true;
    };

}, true] call Server_Setup_Compile;



['Server_Vehicle_Siren_Init', {

    private ["_sirenType","_veh","_classname","_Siren","_SoundSource_1","_SoundSource_2","_SoundSource_3","_SoundSource_4"];
    _veh = _this;
    _classname = typeOf _veh;
    switch (true) do
    {
        case (_classname IN ["A3PL_Pierce_Pumper","A3PL_Pierce_Ladder","A3PL_Pierce_Heavy_Ladder"]): {_sirenType = "fire";};
        case (_classname IN ["A3PL_Tahoe_FD"]): {_sirenType = "fire_FR";};
        case (_classname IN ["A3PL_F150_PD","A3PL_Charger_PD","A3PL_Charger_PD_Slicktop","A3PL_Mustang_PD","A3PL_Mustang_PD_Slicktop","A3PL_CVPI_PD_Slicktop","A3PL_Tahoe_PD","A3PL_Tahoe_PD_Slicktop","A3PL_CVPI_PD","A3PL_RBM","A3PL_Motorboat_Rescue","A3PL_Motorboat_Police","A3PL_Silverado_PD","A3PL_VetteZR1_PD"]): {_sirenType = "police";};
        case (_classname IN ["Jonzie_Ambulance","A3PL_E350"]): {_sirenType = "ems";};
        case (_classname IN ["A3PL_P362_TowTruck","A3PL_F150_Marker"]): {_sirenType = "civ";};
        case (_classname IN ["A3PL_Yacht","A3PL_Container_Ship","A3PL_Yacht_Pirate","A3PL_Cutter","A3PL_Motorboat","A3PL_RHIB"]): {_sirenType = "Ship";};
        default {_sirenType = "police";};
    };

    switch (_sirenType) do
    {
        case "police":
        {
            _SoundSource_1 = createSoundSource ["A3PL_FSS_Siren", [0,0,0], [], 0];
            _SoundSource_1 attachTo [_veh, [0,0,0], "SoundSource_1"];
            _SoundSource_2 = createSoundSource ["A3PL_FSS_Phaser", [0,0,0], [], 0];
            _SoundSource_2 attachTo [_veh, [0,0,0], "SoundSource_2"];
            _SoundSource_3 = createSoundSource ["A3PL_FSS_Priority", [0,0,0], [], 0];
            _SoundSource_3 attachTo [_veh, [0,0,0], "SoundSource_3"];
            _SoundSource_4 = createSoundSource ["A3PL_FSS_Rumbler", [0,0,0], [], 0];
            _SoundSource_4 attachTo [_veh, [0,0,0], "SoundSource_4"];
            _Siren = [_SoundSource_1,_SoundSource_2,_SoundSource_3,_SoundSource_4];
            _veh setVariable ["SoundSource",_Siren,true];
        };
        case "fire":
        {
            _SoundSource_1 = createSoundSource ["A3PL_EQ2B_Wail", [0,0,0], [], 0];
            _SoundSource_1 attachTo [_veh, [0,0,0], "SoundSource_1"];
            _SoundSource_2 = createSoundSource ["A3PL_Whelen_Warble", [0,0,0], [], 0];
            _SoundSource_2 attachTo [_veh, [0,0,0], "SoundSource_2"];
            _SoundSource_3 = createSoundSource ["A3PL_AirHorn_1", [0,0,0], [], 0];
            _SoundSource_3 attachTo [_veh, [0,0,0], "SoundSource_3"];
            _Siren = [_SoundSource_1,_SoundSource_2,_SoundSource_3];
            _veh setVariable ["SoundSource",_Siren,true];
        };
        case "fire_FR":
        {
            _SoundSource_1 = createSoundSource ["A3PL_FSUO_Siren", [0,0,0], [], 0];
            _SoundSource_1 attachTo [_veh, [0,0,0], "SoundSource_1"];
            _SoundSource_2 = createSoundSource ["A3PL_Whelen_Priority3", [0,0,0], [], 0];
            _SoundSource_2 attachTo [_veh, [0,0,0], "SoundSource_2"];
            _SoundSource_3 = createSoundSource ["A3PL_FIPA20A_Priority", [0,0,0], [], 0];
            _SoundSource_3 attachTo [_veh, [0,0,0], "SoundSource_3"];
            _SoundSource_4 = createSoundSource ["A3PL_Electric_Horn", [0,0,0], [], 0];
            _SoundSource_4 attachTo [_veh, [0,0,0], "SoundSource_4"];
            _Siren = [_SoundSource_1,_SoundSource_2,_SoundSource_3,_SoundSource_4];
            _veh setVariable ["SoundSource",_Siren,true];
        };
        case "ems":
        {
            _SoundSource_1 = createSoundSource ["A3PL_Whelen_Siren", [0,0,0], [], 0];
            _SoundSource_1 attachTo [_veh, [0,0,0], "SoundSource_1"];
            _SoundSource_2 = createSoundSource ["A3PL_Whelen_Priority", [0,0,0], [], 0];
            _SoundSource_2 attachTo [_veh, [0,0,0], "SoundSource_2"];
            _SoundSource_3 = createSoundSource ["A3PL_Whelen_Priority2", [0,0,0], [], 0];
            _SoundSource_3 attachTo [_veh, [0,0,0], "SoundSource_3"];
            _SoundSource_4 = createSoundSource ["A3PL_Electric_Airhorn", [0,0,0], [], 0];
            _SoundSource_4 attachTo [_veh, [0,0,0], "SoundSource_4"];
            _Siren = [_SoundSource_1,_SoundSource_2,_SoundSource_3,_SoundSource_4];
            _veh setVariable ["SoundSource",_Siren,true];
        };
        case "civ": {};
            case "Ship": {};
    };

}, true] call Server_Setup_Compile;






['Server_Vehicle_Trailer_Hitch', {

    params [
        ["_truck",objNull],
        ["_trailer",objNull]
    ];

    if ((owner _truck) != (owner _trailer)) then {
        _trailer setOwner (owner _truck);
    };

}, true] call Server_Setup_Compile;

['Server_Vehicle_TrailerDetach', {

    private ["_trailer","_boat"];

    _boat = param [0,objNull];
    _trailer = attachedTo _boat;
    if ((isNull _trailer) OR (isNull _boat)) exitwith {};

    _boat allowDamage false;

    if ((owner _trailer) != (owner _boat)) then
    {
        _boat setOwner (owner _trailer);
    };
    [_boat] spawn
    {
        _boat = param [0,objNull];
        [_boat] remoteExec ["Server_Vehicle_EnableSimulation", 2];
        sleep 1.5;
        detach _boat;
        sleep 10;
        _boat allowDamage true;
    };

}, true] call Server_Setup_Compile;



['Caue_Vehicle_SaveColor', {

    params [
        ["_veh",objNull],
        ["_plate",""]
    ];

    private _path = (getObjectTextures _veh) select 0;
    _path = format["%1",_path];
    _path = [_path,"\","\\"] call CBA_fnc_replace;
    [format["Vehicle_SaveColor:%1:%2",_path,_plate],1] spawn Server_Database_Async;

}, true] call Server_Setup_Compile;

['Caue_Vehicle_SaveFuel', {

    {
        if !(isNil {_x getVariable ["keyAccess",nil]}) then {
            private _plate = (_x getVariable ["owner",["","ADMIN"]]) select 1;
            if !(_plate IN ["ADMIN","WASTE","DELIVER","EXTERMY","KARTING"]) then {
                [format["Vehicle_SaveFuel:%1:%2",(fuel _x),_plate],1] spawn Server_Database_Async;
            };
        };
    } forEach (allMissionObjects "Car" + allMissionObjects "Air" + allMissionObjects "Ship" + allMissionObjects "Motorcycle");

}, true] call Server_Setup_Compile;

/*
    Client Inits
*/
["Caue_Vehicle_Setup",{

    A3PL_Vehicle_HandleInitU = toArray (format ["%1",A3PL_Vehicle_HandleInitU]);
    A3PL_Vehicle_HandleInitU deleteAt 0;
    A3PL_Vehicle_HandleInitU deleteAt ((count A3PL_Vehicle_HandleInitU) - 1);
    A3PL_Vehicle_HandleInitU = toString A3PL_Vehicle_HandleInitU;
    A3PL_HandleVehicleInit = compileFinal A3PL_Vehicle_HandleInitU;

    VehiclesReady = true;

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_HandleInitU', {

    if (isDedicated) exitwith {};

    private _veh = ((_this select 0) select 0) select 0;
    private _class = typeOf _veh;

    [_veh] call Caue_Vehicle_HandleDamage;

    if (_veh isKindOf "Car") then {
        switch (typeOf _veh) do {
            case ("A3PL_P362"): {_veh call A3PL_Vehicle_Init_A3PL_Engine;_veh call A3PL_Vehicle_Init_A3PL_F150;};
            case ("A3PL_P362_TowTruck"): {_veh call A3PL_Vehicle_Init_A3PL_Engine;};
            case ("A3PL_MailTruck"): {_veh call A3PL_Vehicle_Init_A3PL_Engine;};
            case ("A3PL_F150"): {_veh call A3PL_Vehicle_Init_A3PL_Engine;};
            case ("A3PL_F150_Marker"): {_veh call A3PL_Vehicle_Init_A3PL_Engine;};
            case ("A3PL_F150_PD"): {_veh call A3PL_Vehicle_Init_A3PL_Engine;};
            case ("A3PL_Ram"): {_veh call A3PL_Vehicle_Init_A3PL_Engine;};
            case ("A3PL_Rover"): {_veh call A3PL_Vehicle_Init_A3PL_Engine;};
            case ("A3PL_Wrangler"): {_veh call A3PL_Vehicle_Init_A3PL_Engine;};
            case ("A3PL_BMW_M3"): {_veh call A3PL_Vehicle_Init_A3PL_Engine;};
            case ("A3PL_Charger"): {_veh call A3PL_Vehicle_Init_A3PL_Engine;};
            case ("A3PL_Charger_PD"): {_veh call A3PL_Vehicle_Init_A3PL_Engine;};
            case ("A3PL_Charger_PD_Slicktop"): {_veh call A3PL_Vehicle_Init_A3PL_Engine;};
            case ("A3PL_Charger69"): {_veh call A3PL_Vehicle_Init_A3PL_Engine;};
            case ("A3PL_Mustang"): {_veh call A3PL_Vehicle_Init_A3PL_Engine;};
            case ("A3PL_Mustang_PD"): {_veh call A3PL_Vehicle_Init_A3PL_Engine;};
            case ("A3PL_Mustang_PD_Slicktop"): {_veh call A3PL_Vehicle_Init_A3PL_Engine;};
            case ("A3PL_CVPI"): {_veh call A3PL_Vehicle_Init_A3PL_Engine;};
            case ("A3PL_CVPI_PD"): {_veh call A3PL_Vehicle_Init_A3PL_Engine;};
            case ("A3PL_CVPI_PD_Slicktop"): {_veh call A3PL_Vehicle_Init_A3PL_Engine;};
            case ("A3PL_CVPI_Taxi"): {_veh call A3PL_Vehicle_Init_A3PL_Engine;};
            case ("A3PL_Tahoe"): {_veh call A3PL_Vehicle_Init_A3PL_Engine;};
            case ("A3PL_Tahoe_PD"): {_veh call A3PL_Vehicle_Init_A3PL_Engine;};
            case ("A3PL_Tahoe_PD_Slicktop"): {_veh call A3PL_Vehicle_Init_A3PL_Engine;};
            case ("A3PL_Tahoe_FD"): {_veh call A3PL_Vehicle_Init_A3PL_Engine;};
            case ("Jonzie_Ambulance"): {_veh call A3PL_Vehicle_Init_A3PL_Engine;};
            case ("A3PL_E350"): {_veh call A3PL_Vehicle_Init_A3PL_Engine;};
            case ("A3PL_Camaro"): {_veh call A3PL_Vehicle_Init_A3PL_Engine;};
            case ("A3PL_VetteZR1"): {_veh call A3PL_Vehicle_Init_A3PL_Engine;};
            case ("A3PL_BMW_X5"): {_veh call A3PL_Vehicle_Init_A3PL_Engine;};
            case ("alr_cadillac"): {_veh call A3PL_Vehicle_Init_A3PL_Engine;};
            case ("A3PL_Gallardo"): {_veh call A3PL_Vehicle_Init_A3PL_Engine;};
            case ("A3PL_Mustang_PD_Slicktop"): {_veh call A3PL_Vehicle_Init_A3PL_Engine;};
            case ("A3PL_Pierce_Ladder"): {_veh call A3PL_Vehicle_Init_A3PL_Engine;};
            case ("A3PL_Pierce_Heavy_Ladder"): {_veh call A3PL_Vehicle_Init_A3PL_Engine;};
            case ("A3PL_Pierce_Pumper"): {_veh call A3PL_Vehicle_Init_A3PL_Engine;};
            case ("A3PL_CVPI_Rusty"): {_veh call A3PL_Vehicle_Init_A3PL_Engine;};
            case ("A3PL_Fuel_Van"): {_veh call A3PL_Vehicle_Init_A3PL_Engine;};
            case ("A3PL_Transport_Van"): {_veh call A3PL_Vehicle_Init_A3PL_Engine;};
            case ("A3PL_Silverado"): {_veh call A3PL_Vehicle_Init_A3PL_Engine;};
            case ("A3PL_911GT2"): {_veh call A3PL_Vehicle_Init_A3PL_Engine;};
            case ("A3PL_CRX"): {_veh call A3PL_Vehicle_Init_A3PL_Engine;};
            case ("A3PL_Silverado_PD"): {_veh call A3PL_Vehicle_Init_A3PL_Engine;};
            case ("A3PL_Challenger_Hellcat"): {_veh call A3PL_Vehicle_Init_A3PL_Engine;};
            case ("A3PL_VetteZR1_PD"): {_veh call A3PL_Vehicle_Init_A3PL_Engine;};
            case ("A3PL_P362_Garbage_Truck"): {_veh call A3PL_Vehicle_Init_A3PL_Engine;};
            case ("A3PL_Ram_Rusty"): {_veh call A3PL_Vehicle_Init_A3PL_Engine;};
            case ("alr_Tesla"): {_veh call A3PL_Vehicle_Init_A3PL_Engine;};
        };
    };

    private _initfunction = !isNil ('A3PL_Vehicle_Init_' + _class);
    if (_initfunction) then {_veh call (missionNamespace getVariable ('A3PL_Vehicle_Init_' + _class));};

    private _canTow = false;
    {
        if (_veh isKindOf _x) then {_canTow = true;};
    } forEach HitchingVehicles;

    if (_canTow) then {_veh call A3PL_Vehicle_Init_A3PL_F150;};

}, false] call Server_Setup_Compile;

["Caue_Vehicle_HandleDamage",{

    params [
        ["_veh",objNull]
    ];

    if (isNull _veh) exitWith {};

    _veh setVariable ["selections", []];
    _veh setVariable ["gethit", []];

    _veh removeAllEventHandlers "HandleDamage";
    _veh addEventHandler ["HandleDamage",{
        params [
            ["_unit",objNull,[objNull]],
            ["_selection","",[""]]
        ];

        _selections = _unit getVariable ["selections", []];
        _gethit = _unit getVariable ["gethit", []];

        if !(_selection in _selections) then {
            _selections set [count _selections, _selection];
            _gethit set [count _gethit, 0];
        };

        _i = _selections find _selection;
        _olddamage = _gethit select _i;
        _damage = _olddamage + ((_this select 2) - _olddamage) * 1;

        if (_selection isEqualTo "" || _selection isEqualTo "engine" || _selection isEqualTo "palivo") then {
            if (_damage > 0.8) then {_damage = 0.8;};
        };

        _gethit set [_i, _damage];
        _damage;
    }];

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_Init_A3PL_Cessna172', {

    private ["_veh"];
    _veh = _this;
    _veh setVariable ["clearance",true,true];

    _veh addEventHandler ["GetIn", {
        _veh = param [0,objNull];
        _position = param [1,""];
        _unit = param [2,objNull];

        if (!local _unit) exitwith {};

        if (_position IN ["gunner","driver"]) then {[_veh] spawn A3PL_ATC_GetInAircraft;};

        if (((_unit getVariable ["job","unemployed"]) isEqualTo "faa") && _position isEqualTo "driver") then {
            _veh removeMagazinesTurret  ["2000Rnd_65x39_Belt_Tracer_Red",[-1]];
            _veh removeWeaponTurret ["LMG_Minigun_Transport",[-1]];
            _veh addWeaponTurret ["LMG_Minigun_Transport",[-1]];
            _veh addMagazineTurret ["2000Rnd_65x39_Belt_Tracer_Red",[-1]];
            _veh addMagazineTurret ["2000Rnd_65x39_Belt_Tracer_Red",[-1]];
            _veh addMagazineTurret ["2000Rnd_65x39_Belt_Tracer_Red",[-1]];
        };
    }];

    _veh addEventHandler ["Engine", {
        if ((((_this select 0) animationSourcePhase "Ignition") < 0.5) && (local (vehicle player))) then {
            (_this select 0) engineOn false;
        };
    }];

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_Init_A3PL_Charger_PD_Slicktop', {

    _this call A3PL_Vehicle_Init_A3PL_Tahoe_PD;

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_Init_A3PL_Charger_PD', {

    _this call A3PL_Vehicle_Init_A3PL_Tahoe_PD;

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_Init_A3PL_Cutter', {

    private ['_veh'];

    _veh = _this;

    if (local _veh) then {_veh allowDamage false};

    _veh addEventHandler ["Local", {if (_this select 1) then {(_this select 0) allowDamage false; };}];

    _veh addEventHandler ["Fired",{
        [(_this select 0)] spawn {
            (_this select 0) animate ["gunback",0.5];

            sleep 0.4;

            (_this select 0) animate ["gunback",0];
        };
    }];

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_Init_CVPI_PD_Slicktop', {

    _this call A3PL_Vehicle_Init_A3PL_Tahoe_PD;

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_Init_CVPI_PD', {

    _this call A3PL_Vehicle_Init_A3PL_Tahoe_PD;

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_Init_A3PL_CVPI_Taxi', {

    private ["_veh"];
    _veh = _this;

    _veh addEventHandler ["GetIn",
    {
        _veh = param [0,objNull];
        _position = param [1,""];
        _unit = param [2,objNull];

        if (!local _unit) exitwith {};

        if (_position == "driver") then
        {
            [_veh] spawn A3PL_JobTaxi_FareLoop;
        };
    }];

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_Init_A3PL_Engine', {

    private ["_veh"];
    _veh = _this;
    _veh addEventHandler ["Engine", {
        private ["_var"];
        _var = (_this select 0) getVariable "ignition";
        if ((isNil "_var") && (local(_this select 0))) then {
            (vehicle player) engineOn false;
        };
    }];

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_Init_A3PL_F150', {

    private ["_veh"];
    _veh = _this;
    _veh addEventHandler ["GetIn",
    {
        private ["_veh","_pos","_unit"];
        _veh = _this select 0;
        _pos = _this select 1;
        _unit = _this select 2;

        if (!local _unit) exitwith {};
        if (_pos != "driver") exitwith {};

        [_veh] spawn
        {
            _veh = param [0,objNull];
            while {player == driver _veh} do
            {
                _trailerArray = nearestObjects [(_veh modelToWorld [0,-4,0]), ["A3PL_Trailer_Base"], 6.5];
                _trailerArray = _trailerArray select 0;
                if (!isNil "_trailerArray") then
                {
                    if (_trailerArray animationSourcePhase "Hitched" > 4 && _veh animationSourcePhase "Throttle" > 0.1 && _veh animationSourcePhase "Speed" < 3) then
                    {
                        _vel = velocity _veh;
                        _dir = getDir _veh;
                        _speed = 0.3;
                        _newVel =
                        [
                            (_vel select 0) + (sin _dir * _speed),
                            (_vel select 1) + (cos _dir * _speed),
                            (_vel select 2)
                        ];
                        _veh setVelocity _newVel;

                        _vel = velocity _trailerArray;
                        _dir = getDir _trailerArray;
                        _newVel =
                        [
                            (_vel select 0) + (sin _dir * _speed),
                            (_vel select 1) + (cos _dir * _speed),
                            (_vel select 2)
                        ];
                        _trailerArray setVelocity _newVel;
                    };

                    if( _veh animationSourcePhase "Gear" == -1 && _trailerArray animationSourcePhase "Hitched" > 4 && _veh animationSourcePhase "Throttle" > 0.1 && _veh animationSourcePhase "Speed" < 3) then
                    {
                        _vel = velocity _veh;
                        _dir = getDir _veh;
                        _speed = -0.3;
                        _newVel =
                        [
                            (_vel select 0) + (sin _dir * _speed),
                            (_vel select 1) + (cos _dir * _speed),
                            (_vel select 2)
                        ];
                        _veh setVelocity _newVel;

                        _vel = velocity _trailerArray;
                        _dir = getDir _trailerArray;
                        _speed = -0.5;
                        _newVel =
                        [
                            (_vel select 0) + (sin _dir * _speed),
                            (_vel select 1) + (cos _dir * _speed),
                            (_vel select 2)
                        ];
                        _trailerArray setVelocity _newVel;
                    };
                };
                sleep 1;
            };
        };
    }];

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_Init_A3PL_Goose_Base', {

    private ["_veh"];
    _veh = _this;
    _veh setVariable ["clearance",true,true];
    _veh addEventHandler ["Local",
    {
        _veh = param [0,objNull];
        _local = param [1,false];

        if (_local) then
        {
            [_veh] spawn A3PL_Goose_Platform;
        };
    }];

    if (getplayerUID player == "_SP_PLAYER_") then {[_veh] spawn A3PL_Goose_Platform;};

    _veh addEventHandler ["GetIn",
    {
        _veh = param [0,objNull];
        _position = param [1,""];
        _unit = param [2,objNull];

        if (!local _unit) exitwith {};

        if (_position IN ["gunner","driver"]) then
        {
            [_veh] spawn A3PL_ATC_GetInAircraft;
        };
    }];

    _veh addEventHandler ["Engine",
    {
        if ((((_this select 0) animationSourcePhase "Ignition") < 0.5) && (local (vehicle player))) then
        {
            (_this select 0) engineOn false;
        };
    }];

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_Init_A3PL_Goose_USCG', {

    _this call A3PL_Vehicle_Init_A3PL_Goose_Base;

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_Init_A3PL_Jayhawk', {

    private ['_veh','_basket'];
    _veh = _this;
    _veh addEventHandler ["GetIn",
    {
        _veh = param [0,objNull];
        _position = param [1,""];
        _unit = param [2,objNull];
        if (!local _unit) exitwith {};
        if (_position IN ["gunner","driver"]) then
        {
            [_veh] spawn A3PL_ATC_GetInAircraft;
        };
    }];

    _veh addEventHandler ["Engine", {
        if ((((_this select 0) animationPhase "ignition_Switch") < 0.5) && (player IN (_this select 0))) then {
            (vehicle player) engineOn false;
        };
    }];

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_Init_A3PL_Miniexcavator', {

    private ["_veh"];
    _veh = _this;
    _veh allowDamage false;
    _veh addEventHandler ["GetIn",
    {
        _veh = vehicle player;
        _position = param [1,""];
        _unit = param [2,objNull];
        player action ["ManualFire", _veh];

        if ((_veh animationPhase "Bucket") > 0.5) then
        {
            _veh removeMagazineTurret  ["A3PL_JackhammerMag",[0]];
            _veh removeWeaponTurret ["A3PL_Machinery_Pickaxe",[0]];
            _veh addWeaponTurret ["A3PL_Machinery_Bucket",[0]];
            _veh addMagazineTurret ["A3PL_BucketMag",[0]];
        };

        if ((_veh animationPhase "Jackhammer") > 0.5) then
        {
            _veh removeMagazineTurret  ["A3PL_BucketMag",[0]];
            _veh removeWeaponTurret ["A3PL_Machinery_Bucket",[0]];
            _veh addWeaponTurret ["A3PL_Machinery_Pickaxe",[0]];
            _veh addMagazineTurret ["A3PL_JackhammerMag",[0]];
        };

        [] spawn
        {
            forksdokeydown =
            {
                _key = _this select 1;
                _return = false;
                switch _key do
                {
                    case 75:
                    {
                        _val = vehicle player animationSourcePhase "Cabin";
                        _valu = _val + 0.01;
                        if (_valu >= 6.3) then {_valu = 6.3};
                        vehicle player animateSource ["Cabin",_valu];
                        _return = true;
                    };
                    case 77:
                    {
                        _val = vehicle player animationSourcePhase "Cabin";
                        _valu = _val - 0.01;
                        if (_valu <= -6.3) then {_valu = -6.3};
                        vehicle player animateSource ["Cabin",_valu];
                        _return = true;
                    };
                    case 72:
                    {
                        _val = vehicle player animationSourcePhase "arm";
                        _valu = _val + 0.01;
                        if (_valu >= 1) then {_valu = 1};
                        vehicle player animateSource ["arm",_valu];
                        _return = true;
                    };
                    case 80:
                    {
                        _val = vehicle player animationSourcePhase "arm";
                        _valu = _val - 0.01;
                        if (_valu <= -1) then {_valu = -1};
                        vehicle player animateSource ["arm",_valu];
                        _return = true;
                    };
                    case 73:
                    {
                        _val = vehicle player animationSourcePhase "frontArm";
                        _valu = _val + 0.01;
                        if (_valu >= 1) then {_valu = 1};
                        vehicle player animateSource ["frontArm",_valu];
                        _return = true;
                    };
                    case 81:
                    {
                        _val = vehicle player animationSourcePhase "frontArm";
                        _valu = _val - 0.01;
                        if (_valu <= -1) then {_valu = -1};
                        vehicle player animateSource ["frontArm",_valu];
                        _return = true;
                    };
                    case 71:
                    {
                        _val = vehicle player animationSourcePhase "attachment";
                        _valu = _val + 0.02;
                        if (_valu >= 1) then {_valu = 1};
                        vehicle player animateSource ["attachment",_valu];
                        _return = true;
                    };
                    case 79:
                    {
                        _val = vehicle player animationSourcePhase "attachment";
                        _valu = _val - 0.02;
                        if (_valu <= -1) then {_valu = -1};
                        vehicle player animateSource ["attachment",_valu];
                        _return = true;
                    };
                };
                _return;
            };

            waituntil {!(IsNull (findDisplay 46))};
            _forkskeys = (FindDisplay 46) DisplayAddEventHandler ["keydown","_this call forksdokeyDown"];
            waitUntil {typeOf vehicle player != "A3PL_MiniExcavator"};
            (finddisplay 46) displayremoveeventhandler ["keydown",_forkskeys];
        };
    }];

    _veh addEventHandler ["Fired",
    {
        _veh = param [0,objNull];
        _wep = param [1,objNull];
        if ((!(_wep IN ["A3PL_Machinery_Bucket","A3PL_Shovel"]))OR((_veh animationPhase "Jackhammer") > 0.5)) exitwith
        {
            _veh removeMagazineTurret  ["A3PL_BucketMag",[0]];
            _veh removeWeaponTurret ["A3PL_Machinery_Bucket",[0,0]];
        };

        [_veh] spawn
        {
            _veh = param [0,objNull];
            while {(_veh animationSourcePhase "attachment") < 0.99} do {_val = _veh animationSourcePhase "attachment";_valu = _val + 0.02;_veh animateSource ["attachment",_valu];};
            _veh removeMagazineTurret  ["A3PL_BucketMag",[0]];
            _veh removeMagazinesTurret ["A3PL_JackhammerMag",[0]];
            waitUntil {(_veh animationSourcePhase "attachment") < -0.9};
            _veh addMagazineTurret ["A3PL_BucketMag",[0]];
        };
    }];

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_Init_A3PL_Mobilecrane', {

    private ["_veh"];
    _veh = _this;

    _veh addEventHandler ["GetIn",
    {
        _veh = param [0,objNull];
        _position = param [1,""];
        _unit = param [2,objNull];

        if (!local _unit) exitwith {};

        if (_position == "driver") then
        {
            [_veh] spawn A3PL_IE_CraneGetIn;
        };
    }];

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_Init_A3PL_Motorboat', {

    private ["_veh"];
    _veh = _this;
    _veh addEventHandler ["HandleDamage",
    {
        private ["_veh","_bullet","_damage"];
        _veh = param [0,objNull];
        _damage = param [2,0];
        _bullet = param [4,""];

        if (_bullet == "B_65x39_Caseless_yellow") then
        {
            _damage = 0;
        };

        _damage
    }];

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_Init_A3PL_Mustang_PD_Slicktop', {

    _this call A3PL_Vehicle_Init_A3PL_Tahoe_PD;

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_Init_A3PL_Mustang_PD', {

    _this call A3PL_Vehicle_Init_A3PL_Tahoe_PD;

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_Init_A3PL_P362_Towtruck', {

    private ["_veh"];
    _veh = _this;
    _veh setVariable ["Towing",false,true];

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_Init_A3PL_Patrol', {

    private ['_veh'];
    _veh = _this;

    if (local _veh) then {_veh allowDamage false};

    _veh addEventHandler ["Local", {
        if (_this select 1) then {
            (_this select 0) allowDamage false;
        };
    }];

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_Init_A3PL_Silverado_PD', {

    _this call A3PL_Vehicle_Init_A3PL_Tahoe_PD;

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_Init_A3PL_CVPI_PD', {

    _this call A3PL_Vehicle_Init_A3PL_Tahoe_PD;

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_Init_A3PL_CVPI_PD_Slicktop', {

    _this call A3PL_Vehicle_Init_A3PL_Tahoe_PD;

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_Init_A3PL_Ski_Base', {

    private ['_veh'];
    _veh = _this;

    if (local _veh) then {_veh allowDamage false};

    _veh addEventHandler ["Local", {
        if (_this select 1) then {
            (_this select 0) allowDamage false;
        };
    }];

    _veh addEventHandler ["GetIn",
    {
        private ["_veh","_pos","_unit"];
        _unit = _this select 2;
        _pos = _this select 1;
        _veh = _this select 0;

        if (_unit == player) then
        {
            _veh animate ["wheel",1];

            [_veh] spawn
            {
                private ["_veh","_bank"];
                _veh = param [0,objNull];
                waituntil {sleep 0.5; player IN _veh};
                while {player IN _veh} do
                {
                    _bank = (_veh call BIS_fnc_getPitchBank) select 1;
                    if ((_bank > 60) OR (_bank < -60)) then
                    {
                        private ["_attachedTo","_dir","_vel","_y","_p","_r"];
                        _attachedTo = (ropeAttachedTo _veh);
                        if (isNull _attachedTo) exitwith {};
                        _dir = getDir _attachedTo;
                        _vel = velocity _veh;
                        _y = getdir _veh;
                        _p = 0;
                        _r = 0;
                        _veh setVectorDirAndUp
                        [
                            [ sin _y * cos _p,cos _y * cos _p,sin _p],
                            [ [ sin _r,-sin _p,cos _r * cos _p],-_y] call BIS_fnc_rotateVector2D
                        ];
                        _veh setVelocity _vel;
                        _veh setDir _dir;
                    };
                    sleep 0.5;
                };
            };
        };
    }];

    _veh addEventHandler ["GetOut",
    {
        private ["_veh","_pos","_unit"];
        _unit = _this select 2;
        _pos = _this select 1;
        _veh = _this select 0;

        if (_unit == player) then
        {
            _veh animate ["wheel",0];
        };
    }];

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_Init_A3PL_Stinger', {

    private ["_veh"];
    _veh = ((_this select 0) select 0) select 0;

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_Init_A3PL_Tahoe_PD_Slicktop', {

    _this call A3PL_Vehicle_Init_A3PL_Tahoe_PD;

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_Init_A3PL_Tahoe_PD', {

    private ["_veh"];
    _veh = _this;

    _veh addEventHandler ["GetIn",
    {
        _veh = param [0,objNull];
        _position = param [1,""];
        _unit = param [2,objNull];

        if (!local _unit) exitwith {};

        if (_position == "driver") then
        {
            [_veh] spawn A3PL_Police_RadarLoop;
        };
    }];

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_Init_A3PL_Vettezr1_PD', {

    _this call A3PL_Vehicle_Init_A3PL_Tahoe_PD;

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_Init_Heli_Medium01_Coastguard', {

    _this call A3PL_Vehicle_Init_Heli_Medium01_H;

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_Init_Heli_Medium01_H', {

    private ['_veh'];
    _veh = _this;
    _veh setVariable ["clearance",true,true];
    _veh setVariable ["Inspection",[],false];
    _veh addEventHandler ["GetIn",
    {
        _veh = param [0,objNull];
        _position = param [1,""];
        _unit = param [2,objNull];
        if (!local _unit) exitwith {};
        if (_position IN ["gunner","driver"]) then
        {
            [_veh] spawn A3PL_ATC_GetInAircraft;
        };
    }];

    _veh addEventHandler ["Engine", {
        if ((((_this select 0) animationPhase "switch_starter") < 1.9) && (player IN (_this select 0))) then {
            (vehicle player) engineOn false;
        };
    }];

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_Init_Heli_Medium01_Luxury_H', {

    _this call A3PL_Vehicle_Init_Heli_Medium01_H;

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_Init_Heli_Medium01_Medic_H', {

    _this call A3PL_Vehicle_Init_Heli_Medium01_H;

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_Init_Heli_Medium01_Military_H', {

    _this call A3PL_Vehicle_Init_Heli_Medium01_H;

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_Init_Heli_Medium01_Sheriff_H', {

    _this call A3PL_Vehicle_Init_Heli_Medium01_H;

}, false] call Server_Setup_Compile;

['A3PL_Vehicle_Init_Heli_Medium01_Veteran_H', {

    _this call A3PL_Vehicle_Init_Heli_Medium01_H;

}, false] call Server_Setup_Compile;


/*
    Server Inits
*/
['Server_Vehicle_Init_General', {

    private ['_veh','_id','_query','_lp','_vars'];
    _veh = param [0,objNull];
    _id = param [1,"-1"];
    _veh lock 2;

    if (_veh isKindOf "LandVehicle") then {
        _veh animate ["Camo1",1];
        _veh animate ["Glass0_destruct",1];



        if !(_id isEqualTo "-1") then {
            [_id,_veh] call Servet_Vehicle_SetPlate;
        };
    };

}, true] call Server_Setup_Compile;

['Server_Vehicle_Init_A3PL_Charger_PD_Slicktop', {

    _this call Server_Vehicle_Init_A3PL_Tahoe_PD_Slicktop;

}, true] call Server_Setup_Compile;

['Server_Vehicle_Init_A3PL_Charger_PD', {

    _this call Server_Vehicle_Init_A3PL_Tahoe_PD;

}, true] call Server_Setup_Compile;

['Server_Vehicle_Init_A3PL_CVPI_PD_Slicktop', {

    _this call Server_Vehicle_Init_A3PL_Tahoe_PD_Slicktop;

}, true] call Server_Setup_Compile;

['Server_Vehicle_Init_A3PL_CVPI_PD', {

    _this call Server_Vehicle_Init_A3PL_Tahoe_PD;

}, true] call Server_Setup_Compile;

['Server_Vehicle_Init_A3PL_E350', {

    _this call Server_Vehicle_Init_Jonzie_Ambulance;

}, true] call Server_Setup_Compile;

['Server_Vehicle_Init_A3PL_F150', {

    private ["_veh"];
    _veh = _this;
    _veh addEventHandler ["GetIn",
    {
        private ["_veh","_unit","_pos"];
        _veh = _this select 0;
        _pos = _this select 1;
        _unit = _this select 2;
        if (_pos != "driver") exitwith {};
        _trailerArray = nearestObjects [(_veh modelToWorld [0,-4,0]), ["A3PL_Trailer_Base"], 6.5];
        if (count _trailerArray > 0) then
        {
            _trailerArray = _trailerArray select 0;

            if (!(owner _trailerArray == owner _unit)) then
            {
                _trailerArray setOwner (owner _unit);
            };
        };
    }];

}, true] call Server_Setup_Compile;

['Server_Vehicle_Init_A3PL_Goose_Base', {

    /* aaaa */

}, true] call Server_Setup_Compile;

['Server_Vehicle_Init_A3PL_JayHawk', {

    private ['_veh'];
    _veh = _this;
    _basket = "A3PL_RescueBasket" createVehicle [0,0,0];
    _basket allowdamage false;
    _basket setVariable ["locked",false,true];
    _basket attachTo [_veh, [0,999999,0] ];
    _veh setVariable ["basket",_basket,true];
    _basket setVariable ["vehicle",_veh,true];

}, true] call Server_Setup_Compile;

['Server_Vehicle_Init_A3PL_Mustang_PD_Slicktop', {

    _this call Server_Vehicle_Init_A3PL_Tahoe_PD_Slicktop;

}, true] call Server_Setup_Compile;

['Server_Vehicle_Init_A3PL_Mustang_PD', {

    _this call Server_Vehicle_Init_A3PL_Tahoe_PD;

}, true] call Server_Setup_Compile;

['Server_Vehicle_Init_A3PL_Patrol', {

    private ['_veh'];
    _veh = _this;

}, true] call Server_Setup_Compile;

['Server_Vehicle_Init_A3PL_Pierce_Heavy_Ladder', {

    _this call Server_Vehicle_Init_A3PL_Pierce_Ladder;

}, true] call Server_Setup_Compile;

['Server_Vehicle_Init_A3PL_Pierce_Ladder', {

    private ["_veh"];
    _veh = _this;
    _this call Server_Vehicle_Siren_Init;
    _light_1 = "A3PL_Floodlight_Double" createVehicle [0,0,0];
    _light_2 = "A3PL_Floodlight_Double" createVehicle [0,0,0];
    _light_3 = "A3PL_Floodlight_Double" createVehicle [0,0,0];
    _light_4 = "A3PL_Floodlight_Double" createVehicle [0,0,0];
    _Ladder = "A3PL_Rear_Ladder" createVehicle [0,0,0];
    _Flag = "A3PL_Mini_Flag_US" createVehicle [0,0,0];
    _light_1 attachTo [_veh, [0, 0, 0], "Floodlight_1"];
    _light_2 attachTo [_veh, [0, 0, 0], "Floodlight_2"];
    _light_3 attachTo [_veh, [0, 0, 0], "Floodlight_3"];
    _light_4 attachTo [_veh, [0, 0, 0], "Floodlight_4"];
    _Ladder attachTo [_veh, [0, -1, -16.1]];
    _Flag attachTo [_veh, [-0.05, 0.39, -2.3], "Flag_Point"];
    _light_3 setdir 180;
    _light_4 setdir 180;
    _Flag setFlagTexture "\A3\Data_F\Flags\Flag_us_CO.paa";

}, true] call Server_Setup_Compile;

['Server_Vehicle_Init_A3PL_Pierce_Pumper', {

    private ["_veh"];
    _veh = _this;
    _this call Server_Vehicle_Siren_Init;
    _light_1 = "A3PL_Floodlight_Double" createVehicle [0,0,0];
    _light_2 = "A3PL_Floodlight_Double" createVehicle [0,0,0];
    _Rotator1 = "A3PL_Red_Rotator" createVehicle [0,0,0];
    _Rotator2 = "A3PL_White_Rotator" createVehicle [0,0,0];
    _Rotator3 = "A3PL_Red_Rotator_off" createVehicle [0,0,0];
    _Rotator4 = "A3PL_White_Rotator_off" createVehicle [0,0,0];
    _Rotator5 = "A3PL_Red_Rotator" createVehicle [0,0,0];
    _Rotator6 = "A3PL_White_Rotator" createVehicle [0,0,0];
    _Rotator7 = "A3PL_Red_Rotator_off" createVehicle [0,0,0];
    _Rotator8 = "A3PL_White_Rotator_off" createVehicle [0,0,0];
    _Rotator9 = "A3PL_Red_Rotator" createVehicle [0,0,0];
    _Rotator10 = "A3PL_White_Rotator" createVehicle [0,0,0];
    _Rotator11 = "A3PL_Red_Rotator_off" createVehicle [0,0,0];
    _Flag = "A3PL_Mini_Flag_US" createVehicle [0,0,0];
    _light_1 attachTo [_veh, [0, 0, 0.79], "Floodlight_1"];
    _light_2 attachTo [_veh, [0, 0, 0.79], "Floodlight_2"];
    _Rotator1 attachTo [_veh, [0, 0.44, 1.01], "Rotator_Light1"];
    _Rotator2 attachTo [_veh, [0, -0.44, 1.01], "Rotator_Light2"];
    _Rotator3 attachTo [_veh, [0, 0.44, 1.01], "Rotator_Light3"];
    _Rotator4 attachTo [_veh, [0, -0.44, 1.01], "Rotator_Light4"];
    _Rotator5 attachTo [_veh, [0, 0.44, 1.01], "Rotator_Light5"];
    _Rotator6 attachTo [_veh, [0, -0.44, 1.01], "Rotator_Light6"];
    _Rotator7 attachTo [_veh, [0, 0.44, 1.01], "Rotator_Light7"];
    _Rotator8 attachTo [_veh, [0, -0.44, 1.01], "Rotator_Light8"];
    _Rotator9 attachTo [_veh, [0, 0.44, 1.01], "Rotator_Light9"];
    _Rotator10 attachTo [_veh, [0, -0.44, 1.01], "Rotator_Light10"];
    _Rotator11 attachTo [_veh, [0, 0.44, 1.01], "Rotator_Light11"];
    _Flag attachTo [_veh, [0.85, -4.59, -2.24]];
    _light_2 setdir 180;
    _Flag setFlagTexture "\A3\Data_F\Flags\Flag_us_CO.paa";
    [_veh,"A3PL_Pierce_Pumper"] call A3PL_FD_SetPumperNumber;
    _veh setVariable ["water",1800,true];
    _veh animate ["Water_Gauge1",1];

}, true] call Server_Setup_Compile;

['Server_Vehicle_Init_A3PL_Silverado_PD', {

    _this call Server_Vehicle_Init_A3PL_Tahoe_PD;

}, true] call Server_Setup_Compile;

['Server_Vehicle_Init_A3PL_Tahoe_PD_Slicktop', {

    _veh = _this;
    _this call Server_Vehicle_Siren_Init;

}, true] call Server_Setup_Compile;

['Server_Vehicle_Init_A3PL_Tahoe_PD', {

    private ["_veh"];
    _veh = _this;
    _this call Server_Vehicle_Siren_Init;
    _light_1 = "A3PL_Floodlight_Level" createVehicle [0,0,0];
    _light_2 = "A3PL_Floodlight_Level" createVehicle [0,0,0];
    _light_1 attachTo [_veh, [0.03, 0, 0.8], "Floodlight_1"];
    _light_2 attachTo [_veh, [-0.03, 0, 0.8], "Floodlight_2"];
    _light_2 setdir 180;
    _veh animate ["Pushbar_Addon",1];
    _veh animate ["Spotlight_Addon",1];

}, true] call Server_Setup_Compile;

['Server_Vehicle_Init_A3PL_Vettezr1_PD', {

    _this call Server_Vehicle_Init_A3PL_Tahoe_PD_Slicktop;

}, true] call Server_Setup_Compile;

['Server_Vehicle_Init_Jonzie_Ambulance', {

    private ["_veh"];
    _veh = _this;
    _this call Server_Vehicle_Siren_Init;
    _light_1 = "A3PL_Floodlight" createVehicle [0,0,0];
    _light_2 = "A3PL_Floodlight" createVehicle [0,0,0];
    _light_3 = "A3PL_Floodlight" createVehicle [0,0,0];
    _light_4 = "A3PL_Floodlight" createVehicle [0,0,0];
    _light_5 = "A3PL_Floodlight" createVehicle [0,0,0];
    _light_6 = "A3PL_Floodlight" createVehicle [0,0,0];
    _light_7 = "A3PL_Interior_light" createVehicle [0,0,0];
    _light_1 attachTo [_veh, [0.03, 0, 0.8], "Floodlight_1"];
    _light_2 attachTo [_veh, [0.03, 0, 0.8], "Floodlight_2"];
    _light_3 attachTo [_veh, [-0.03, 0, 0.8], "Floodlight_3"];
    _light_4 attachTo [_veh, [-0.03, 0, 0.8], "Floodlight_4"];
    _light_5 attachTo [_veh, [0, 0, 0.8], "Floodlight_5"];
    _light_6 attachTo [_veh, [0, 0, 0.8], "Floodlight_6"];
    _light_7 attachTo [_veh, [0, 0, 0], "Interior_Lights"];
    _light_3 setdir 180;
    _light_4 setdir 180;
    _light_5 setdir 270;
    _light_6 setdir 270;

}, true] call Server_Setup_Compile;
