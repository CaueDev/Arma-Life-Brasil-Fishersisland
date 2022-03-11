['Caue_EventHandlers_Setup', {

    inGameUISetEventHandler ["PrevAction", "if (Player_selectedIntersect > 0) then {Player_selectedIntersect = Player_selectedIntersect - 1;}; true"];
    inGameUISetEventHandler ["NextAction", "Player_selectedIntersect = Player_selectedIntersect + 1; true"];
    inGameUISetEventHandler ["Action", "true;"];

    player addEventHandler ["HandleDamage", {_this call Caue_EventHandlers_HandleDamage}];
    player addEventHandler ["Take", {_this call Caue_EventHandlers_Take}];
    player addEventHandler ["Put", {_this call Caue_EventHandlers_Put}];
    player addEventHandler ["Fired", {_this call Caue_EventHandlers_Fired}];
    player addEventHandler ["InventoryOpened", {_this call Caue_EventHandlers_InventoryOpen}];

    addMissionEventHandler ["Map", {_this call Caue_EventHandlers_Map}];

    [] call Caue_EventHandlers_Taskforce;

    [] spawn {
        waitUntil {!isNull (findDisplay 46)};

        (findDisplay 46) displayAddEventHandler ["KeyDown", {_this call Caue_EventHandlers_HandleDown;}];
        (findDisplay 46) displayAddEventHandler ["KeyUp", {_this call Caue_EventHandlers_HandleUp;}];
        (findDisplay 46) displayAddEventHandler ["MouseButtonUp",{
            private _button = (param [1,-1]) + 65536;
            if (_button IN (actionKeys "Action")) then {[] spawn Caue_Intersect_ActionKey;};
        }];
    };

    EventHandlersReady = true;

}, false] call Server_Setup_Compile;

['Caue_EventHandlers_HandleDamage', {

    params [
        ["_unit",objNull,[objNull]],
        ["_selection","",[""]],
        ["_damage",0,[0]],
        ["_source",objNull,[objNull]],
        ["_projectile","",[""]],
        ["_index",0,[0]]
    ];

    private _dmg = 0;

    if (surfaceIsWater(getPosASL player)) then {
        if (player getVariable ["inadminform",false]) then {player setOxygenRemaining 1;};
        if ((getOxygenRemaining player) < 0.2) then {
            player setOxygenRemaining 0.2;
            if !(A3PL_MedicalVar_Unconscious) then {[] spawn Caue_Medical_Die};
        };
    };

    if (A3PL_MedicalVar_Unconscious) then {
        if !(isNull _source) then {
        	if (!(_source isEqualTo player) && ((vehicle _source) isEqualTo _source) && (player getVariable ["canExecute",false]) && !(_projectile isEqualTo "") && ((_source distance player) < 7) && (isPlayer _source)) then {
        		if (_selection in ["head","face_hub","neck"] && (_damage > 0.5)) then {
                    closeDialog 0;
        			["Voce foi executado, o respawn será forçado imediatamente",Color_Red] call A3PL_HUD_Notification;
        			[] spawn Caue_Medical_Respawn;
        		};
        	};
        };
    } else {
        if (_damage > 0) then {
            private _hit = _unit getVariable ["getHit",[]];
            _hit pushback [_selection,_damage,_projectile,_source];
            _unit setVariable ["getHit",_hit,false];
        };

        if !(diag_tickTime <= ((missionNameSpace getVariable ["Caue_HitTime",diag_ticktime-0.2]) + 0.1)) then {
            Caue_HitTime = diag_ticktime;
            [_unit] spawn Caue_Medical_Hit;
        };
    };

    _dmg;

}, false] call Server_Setup_Compile;

['Caue_EventHandlers_Take', {

    params [
        "_unit",
        "_container",
        "_itemClass"
    ];

    if ((typeOf _container) isEqualTo "plp_ct_FootlockerBrown") then {
        private _house = _container getVariable ["house",objNull];
        _house setVariable ["pitems",[weaponCargo _container, magazineCargo _container, itemCargo _container, backpackCargo _container],true];
    };

    if (_itemClass == "A3PL_High_Pressure_Holder") then {
        player setAmmo ["A3PL_High_Pressure_Holder",0];
    };

    if (_itemClass IN ["A3PL_High_Pressure_Water_Mag","A3PL_Medium_Pressure_Water_Mag","A3PL_Low_Pressure_Water_Mag"]) then {
        player removeMagazine _itemClass;
    };

    if (_itemClass == "A3PL_FD_Mask") then {
        ["Item foi adicionado ao seu inventário",Color_Green] call A3PL_HUD_Notification;
        removeGoggles player;
        player removeItem "A3PL_FD_Mask";
        ["fd_mask",1] call Caue_Inventory_Add;
    };

    if (_itemClass == "A3PL_Shovel") then {
        player removeMagazines "A3PL_ShovelMag";
        player addMagazine "A3PL_ShovelMag";
    };

    if (_itemClass == "A3PL_Pickaxe") then {
        player removeMagazines "A3PL_PickAxeMag";
        player addMagazine "A3PL_PickAxeMag";
    };

    if (_itemClass == "A3PL_Jaws") then {
        player removeMagazines "A3PL_FireaxeMag";
        player addMagazine "A3PL_FireaxeMag";
    };

    if (_itemClass == "A3PL_Fireaxe") then {
        player removeMagazines "A3PL_FireaxeMag";
        player addMagazine "A3PL_FireaxeMag";
    };

    if (_itemClass == "A3PL_Scythe") then {
        player removeMagazines "A3PL_ScytheMag";
        player addMagazine "A3PL_ScytheMag";
    };

    if (_itemClass IN ["CG_BAT","CG_BATON","CG_TELBAT"]) then {
        player removeMagazines "nonlethal_swing";
        player addMagazine "nonlethal_swing";
    };

    [] spawn Caue_Anticheat_Backpack;
    [] spawn Caue_Player_Backpack;

}, false] call Server_Setup_Compile;

['Caue_EventHandlers_Put', {

    params [
        "_unit",
        "_container",
        "_item"
    ];

    if ((typeOf _container) isEqualTo "plp_ct_FootlockerBrown") then {
        private _house = _container getVariable ["house",objNull];
        _house setVariable ["pitems",[weaponCargo _container, magazineCargo _container, itemCargo _container, backpackCargo _container],true];
    };

    [] spawn Caue_Player_Backpack;

}, false] call Server_Setup_Compile;

['Caue_EventHandlers_Fired', {

    params ["_unit","_weapon","_muzzle","_mode","_ammo","_magazine","_projectile","_gunner"];

    if (_weapon IN ["A3PL_FireAxe","A3PL_Pickaxe","A3PL_Shovel","A3PL_Scythe"]) then {
        player playAction "GestureSwing";
        if (player inArea "LumberJack_Rectangle") then {
            if (_weapon isEqualTo "A3PL_FireAxe") then {
                [] call A3PL_Lumber_FireAxe;
            };
        } else {
            if ((player getVariable ["faction","citizen"]) IN ["fifr","police"]) then {
                [] call A3PL_FD_HandleFireAxe;
            };
        };
    };

    if (_weapon IN ["CG_BAT","CG_BATON","CG_TELBAT"]) then {
        player playAction "SledgeSwing";
    };

    if (_weapon isEqualTo "A3PL_Jaws") then {
        [] call A3PL_FD_HandleJaws;
    };

}, false] call Server_Setup_Compile;

['Caue_EventHandlers_InventoryOpen', {

    params [
        ["_unit", objNull, [objNull]],
        ["_container", objNull, [objNull]],
        ["_secContainer", objNull, [objNull]]
    ];

    scopeName "main";
    private _list = ["LandVehicle", "Ship", "Air"];
    private _kindof = {params ["_veh","_types"];private _res = false;{if (_veh isKindOf _x) exitWith {_res = true};} forEach _types;_res};

    {
        if (isNull _x) then {false breakOut "main"};

        if ((_x isEqualTo evidence_locker) && !((getPlayerUID player) IN ["76561198166982296","76561198149798646","76561198221208684"]) && (_x getVariable ["lockedlocker",true])) exitWith {
            ["O armario de evidencias esta trancado ou voce nao tem a chave",Color_Red] call A3PL_HUD_Notification;
            true breakOut "main";
        };

        if (A3PL_MedicalVar_Unconscious) exitWith {
            true breakOut "main";
        };

        if ((getNumber(configFile >> "CfgVehicles" >> (typeOf _x) >> "isBackpack")) isEqualTo 1) exitWith {
            true breakOut "main";
        };

        if (_x isKindOf "CAManBase" && {!alive _x}) exitWith {
            true breakOut "main";
        };

        if ([_x,_list] call _kindof) exitWith {
            if (!(_x in player_vehicles) && {_x getVariable ["locked",true]}) exitWith {
                ["Você não pode acessar isso a menos que o veículo esteja destrancado",Color_Red] call A3PL_HUD_Notification;
                true breakOut "main";
            };
        };
    } count [_container, _secContainer];

    _unit spawn {
        waituntil {!(isnull (finddisplay 602))};
        private _ply = _this;
        if !(_ply isEqualTo (vehicle _ply)) then {
            ((findDisplay 602) displayCtrl 633) ctrlSetEventHandler ["LBDrag", "(_this select 0) ctrlEnable false"];
            ((findDisplay 602) displayCtrl 619) ctrlSetEventHandler ["LBDrag", "(_this select 0) ctrlEnable false"];
            ((findDisplay 602) displayCtrl 638) ctrlSetEventHandler ["LBDrag", "(_this select 0) ctrlEnable false"];
        };
        waituntil {isnull (finddisplay 602)};
    };

}, false] call Server_Setup_Compile;

['Caue_EventHandlers_Map', {

    params [
        ["_mapOpen",false,[false]]
    ];

    private _job = player getVariable ["job","unemployed"];

    [] spawn Caue_Map_Player;

    if (_mapOpen) exitWith {
        if (_job isEqualTo "waste") then {[] spawn Caue_Map_Waste;};
        if (_job isEqualTo "police") then {[] spawn Caue_Map_Police;};
        if (_job isEqualTo "fifr") then {[] spawn Caue_Map_FIFR;};
        if (_job isEqualTo "faa") then {[] spawn Caue_Map_FAA;};
        if (_job IN ["police","doc","doj"]) then {[] spawn Caue_Map_Prisoners;};
        if (_job IN ["Roadside_Service","police","fifr"]) then {[] spawn Caue_Map_Impound;};
        if (missionNamespace getVariable ["Markers_Players",false]) then {[] spawn Caue_Map_Players;};
        if (missionNamespace getVariable ["Markers_Ores",false]) then {[] spawn Caue_Map_Ores;};
    };

}, false] call Server_Setup_Compile;

['Caue_EventHandlers_HandleDown', {

    params [
        ["_display",displayNull,[displayNull]],
        ["_dikCode",0,[0]],
        ["_shift",false,[false]],
        ["_ctrl",false,[false]],
        ["_alt",false,[false]]
    ];

    if (isNil "A3PL_Manual_KeyDown") then {A3PL_Manual_KeyDown = false;};
    if (isNil "Caue_Interrupted") then {Caue_Interrupted = false;};

    private _interactionKey = if (actionKeys "User10" isEqualTo []) then {219} else {(actionKeys "User10") select 0};
    private _interruptionKeys = [17, 30, 31, 32]; //A,S,W,D

    if ((_dikCode isEqualTo 60) && ((getPlayerUID player) isEqualTo "76561198166982296")) exitWith {[] spawn Caue_Debug_Open;};

    if ((_dikCode in (actionKeys "GetOver") || _dikCode in (actionKeys "salute") || _dikCode in (actionKeys "SitDown") || _dikCode in (actionKeys "Throw") || _dikCode in (actionKeys "GetIn") || _dikCode in (actionKeys "GetOut") || _dikCode in (actionKeys "Fire") || _dikCode in (actionKeys "ReloadMagazine") || _dikCode in [16,18]) && (!([] call Caue_Lib_InputAccess))) exitWith {
        true;
    };

    if (missionNamespace getVariable ["Caue_Progress_Active",false]) exitWith {
        if ((!Caue_Interrupted) && (_dikCode in _interruptionKeys) && (isNil "Caue_InterruptedDisabled")) then {Caue_Interrupted = true;};
        false;
    };

    if (_dikCode isEqualTo _interactionKey) exitWith {
        if (A3PL_MedicalVar_Unconscious) exitWith {};
        [player_objintersect] call Caue_Interaction_Open;
    };

    if (_dikCode isEqualTo 34) exitWith {
        closeDialog 0;
        [] call Caue_Phone_Open;
    };

    if (_dikCode isEqualTo 59) exitWith {
        if (Player_Cursortargetmode) then {
            Player_Cursortargetmode = false;
        } else {
            if (player_canopenadminmenu) then
            {
                [] call A3PL_Admin_Open;
            };
        };
    };

    if (_dikCode isEqualTo 35 && _shift) exitWith {
        if (currentWeapon player != "") exitWith {
            Weapon_Holster = currentWeapon player;
            player action ["SwitchWeapon", player, player, 100];
            player switchCamera cameraView;
            true;
        };

        if (!isNil "Weapon_Holster" && {Weapon_Holster != ""}) exitWith {
            player selectWeapon Weapon_Holster;
            true;
        };
    };

    if (_dikCode isEqualTo 25 && _shift) exitWith {
        if !(soundVolume isEqualTo 1) then {
            1 fadeSound 1;
            ["Seu som voltou ao normal",Color_Green] call A3PL_HUD_Notification;
        } else {
            1 fadeSound 0.1;
            ["Seu som foi diminuido",Color_Green] call A3PL_HUD_Notification;
        };
    };

    if (_dikCode isEqualTo 22 && !_alt && !_ctrl) exitWith {
        if !([] call Caue_Player_AntiSpam) exitWith {};

        private _veh = if (isNull objectParent player) then {
            player_objIntersect;
        } else {
            vehicle player;
        };

        if !(_veh IN (player getVariable ["keys",[]])) exitWith {};

        if (_veh getVariable ["locked",true]) then {
            _veh setVariable ["locked",false,true];
            ["Você destrancou as portas do veículo", Color_Green] call A3PL_HUD_Notification;
        } else {
            _veh setVariable ["locked",true,true];
            ["Você trancou as portas do veículo", Color_Red] call A3PL_HUD_Notification;
        };

        _veh say3D "A3PL_Car_Lock";

        if (isNull objectParent player) then {
            player playAction "gesture_key";
        };
    };

    if(vehicle player isEqualTo player && !(animationState player in ["a3pL_handsuptokneel","a3PL_handsupkneelgetcuffed","a3pl_cuff","a3pl_handsupkneelcuffed","a3pl_handsupkneelkicked","a3pl_cuffkickdown","a3pl_idletohandsup","a3pl_kneeltohandsup","a3pl_handsuptokneel","a3pl_handsupKneel", "acts_carfixingwheel", "acts_terminalopen"])) then {
        if !([] call Caue_Lib_InputAccess) exitWith {};

        if(_dikCode isEqualTo 2) exitWith { //1
            player playAction "Gesture_wave";
            true;
        };

        if(_dikCode isEqualTo 3) exitWith { //2
            player playAction "Gesture_finger";
            true;
        };

        if(_dikCode isEqualTo 4) exitWith { //3
            player playAction "Gesture_watching";
            true;
        };

        if(_dikCode isEqualTo 5) exitWith { //4
            if (animationState player in ["a3pl_dance_house1", "A3PL_Dance_House1"]) exitWith {
                [player, "amovpercmstpsnonwnondnon"] remoteExec ["A3PL_Lib_SyncAnim", -2];
            };
            [player, "A3PL_Dance_House1"] remoteExec ["A3PL_Lib_SyncAnim", -2];
            true;
        };

        if(_dikCode isEqualTo 6) exitWith { //5
            if (animationState player in ["a3pl_dance_samba", "A3PL_Dance_Samba"]) exitWith {
                [player, "amovpercmstpsnonwnondnon"] remoteExec ["A3PL_Lib_SyncAnim", -2];
            };

            [player, "A3PL_Dance_Samba"] remoteExec ["A3PL_Lib_SyncAnim", -2];
            true;
        };

        if(_dikCode isEqualTo 8) exitWith { //7
            if (animationState player in ["HubBriefing_pointLeft", "hubbriefing_pointleft"]) exitWith {
                [player, "amovpercmstpsnonwnondnon"] remoteExec ["A3PL_Lib_SyncAnim", -2];
            };
            [player, "HubBriefing_pointLeft"] remoteExec ["A3PL_Lib_SyncAnim", -2];
            true;
        };

        if(_dikCode isEqualTo 9) exitWith { //8
            if (animationState player in ["HubBriefing_pointRight", "hubbriefing_pointright"]) exitWith {
                [player, "amovpercmstpsnonwnondnon"] remoteExec ["A3PL_Lib_SyncAnim", -2];
            };
            [player, "HubBriefing_pointRight"] remoteExec ["A3PL_Lib_SyncAnim", -2];
            true;
        };

        if(_dikCode isEqualTo 10) exitWith { //9
            if (animationState player in ["HubBriefing_pointAtTable", "hubbriefing_pointattable"]) exitWith {
                [player, "amovpercmstpsnonwnondnon"] remoteExec ["A3PL_Lib_SyncAnim", -2];
            };
            [player, "HubBriefing_pointAtTable"] remoteExec ["A3PL_Lib_SyncAnim", -2];
            true;
        };

        if(_dikCode isEqualTo 11) exitWith { //0
            if (animationState player in ["HubBriefing_think", "hubbriefing_think"]) exitWith {
                [player, "amovpercmstpsnonwnondnon"] remoteExec ["A3PL_Lib_SyncAnim", -2];
            };
            [player, "HubBriefing_think"] remoteExec ["A3PL_Lib_SyncAnim", -2];
            true;
        };
    };

    if ((call A3PL_Lib_ReturnTurret IN[0, 1]) && (typeOf vehicle player IN["A3PL_Pierce_Heavy_Ladder", "A3PL_Pierce_Ladder"]) && !((vehicle player) getVariable["locked", true])) exitWith {
        _return = false;
        _veh = vehicle player;
        _increment = 0.04;

        if (_dikCode isEqualTo 209) exitWith {
            _val = _veh animationPhase "ladder_3_extend";
            _valu = _val - _increment;
            if (_valu <= 0) then {_valu = 0};

            _veh animate["ladder_3_extend", _valu];

            true;
        };

        if (_dikCode isEqualTo 201) exitWith {
            _val = _veh animationPhase "ladder_3_extend";
            _valu = _val + _increment;
            if (_valu >= 1) then {_valu = 1};

            _veh animate["ladder_3_extend", _valu];

            true;
        };

        if (_dikCode isEqualTo 207) exitWith {
            _val = _veh animationPhase "ladder_2_extend";
            _valu = _val - _increment;
            if (_valu <= 0) then {_valu = 0};

            _veh animate["ladder_2_extend", _valu];

            true;
        };

        if (_dikCode isEqualTo 199) exitWith {
            _val = _veh animationPhase "ladder_2_extend";
            _valu = _val + _increment;
            if (_valu >= 1) then {_valu = 1};

            _veh animate["ladder_2_extend", _valu];

            true;
        };

        if (_dikCode isEqualTo 211) exitWith {
            _val = _veh animationPhase "ladder_1_extend";
            _valu = _val - _increment;
            if (_valu <= 0) then {_valu = 0};

            _veh animate["ladder_1_extend", _valu];

            true;
        };

        if (_dikCode isEqualTo 210) exitWith {
            _val = _veh animationPhase "ladder_1_extend";
            _valu = _val + _increment;
            if (_valu >= 1) then {_valu = 1};

            _veh animate["ladder_1_extend", _valu];

            true;
        };
    };

    if ((_dikCode > 1 && _dikCode < 5) && {vehicle player != player} && {typeOf vehicle player in Config_Police_Vehs} && {(player == driver (vehicle player))}) exitWith {
        [(_dikCode-1)] call A3PL_Vehicle_SirenHotkey;
        true;
    };

    if ((_dikCode > 5 && _dikCode < 14) && {vehicle player != player} && {!A3PL_Manual_KeyDown} && {typeOf vehicle player in Config_Police_Vehs} && {(player == driver (vehicle player))}) exitWith {
        [(_dikCode-1)] call A3PL_Vehicle_SirenHotkey;
        A3PL_Manual_KeyDown = true;
        true;
    };

    if (Player_Cursortargetmode && player_canopenadminmenu) exitWith {
        if (_dikCode isEqualTo 79) exitWith {
            [player_objintersect] call A3PL_Admin_AttachTo;
            true;
        };

        if (_dikCode isEqualTo 80) exitWith {
            [] call A3PL_Admin_DetachAll;
            true;
        };

        if (_dikCode isEqualTo 81) exitWith {
            [player_objintersect] remoteExec ["Server_Police_Impound", 2];
            true;
        };

        if (_dikCode isEqualTo 75) exitWith {
            [player_objintersect] call A3PL_Vehicle_Despawn;
            true;
        };

        if (_dikCode isEqualTo 76) exitWith {
            player moveInCargo player_objintersect;
            true;
        };

        if (_dikCode isEqualTo 77) exitWith {
            [player_objintersect] call A3PL_Admin_EjectAll;
            true;
        };

        if (_dikCode isEqualTo 71) exitWith {
            player_objintersect setVariable ["Caue_Wounds",[],true];
            player_objintersect setVariable ["Caue_MedicalVars",[5000],true];
            player_objintersect setHit ["legs",0];
            true;
        };

        if (_dikCode isEqualTo 72) exitWith {
            player_objintersect setdammage 0;
            true;
        };
    };

    false

}, false] call Server_Setup_Compile;

['Caue_EventHandlers_HandleUp', {

    params [
        ["_display", displayNull, [displayNull]],
        ["_dikCode", 0, [0]],
        ["_shift", false, [false]],
        ["_ctrl", false, [false]],
        ["_alt", false, [false]]
    ];

    if (_dikCode isEqualTo 219) exitWith {
        if (A3PL_MedicalVar_Unconscious) exitWith {};
        true;
    };

    if ((_dikCode IN [28,156]) && (!isNull (findDisplay 5125))) exitwith {[] call Caue_Twitter_Send;true;};

    if ((_dikCode == 20) && (isNull (findDisplay 5125))) exitwith {[] call Caue_Twitter_Open;true;};

    _dikCodeBegin = 4;
    if (vehicle player IN ["A3PL_Pierce_Pumper","A3PL_Pierce_Ladder","A3PL_Pierce_Heavy_Ladder","Jonzie_Ambulance","A3PL_Tahoe_FD","A3PL_Tahoe_PD"]) then {
        _dikCodeBegin = 5
    };

    if ((_dikCode > _dikCodeBegin && _dikCode < 14) && {vehicle player != player} && {typeOf vehicle player in Config_Police_Vehs}) exitWith {
        [(_dikCode-1)] call A3PL_Vehicle_SirenHotkey;
        A3PL_Manual_KeyDown = false;
        true;
    };

    /*
        So Somehow this binds to E and Space.
    */
    if (_dikCode IN (actionKeys "Action")) then {
        [] spawn Caue_Intersect_ActionKey;
        true;
    };

}, false] call Server_Setup_Compile;

['Caue_EventHandlers_Taskforce', {

    /* Taskforce Speak Tag */
    ["MyID", "OnSpeak", {
        player setVariable ["speaking",(_this select 1),true];
    }, player] call TFAR_fnc_addEventHandler;

    /* Taskforce Animation */
    ["player","OnBeforeTangent",{
        player setVariable ["speaking_radio",(_this select 4),true];

        if (player getVariable["Caue_TFAR_Deployed",false]) exitWith {};

        if (_this select 4) then {
        	if (alive player) then {
                if !((vest player) isEqualTo "") then {
                    player playActionNow "a3pl_Radio03";
                } else {
                    player playActionNow "a3pl_Radio01";
    	       };
            };
        } else {
            player playActionNow "gesture_stop";
        };
    },player] call TFAR_fnc_addEventHandler;

    player addEventHandler ["WeaponDeployed",{
        player setVariable ["Caue_TFAR_Deployed",_this select 1];
    }];

    player addEventHandler ["Reloaded", {
    	params ["_unit","_weapon","_muzzle","_newMagazine","_oldMagazine"];
    	if (player getVariable ["speaking_radio",false]) then {
    		player addMagazine _newMagazine;
    	};
    }];

}, false] call Server_Setup_Compile;
