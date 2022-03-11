/*
    Basic
*/
['Caue_Medical_Init', {

    Config_Medical_Wounds = [
        ["bullet_minor","Pequeno ferimento por bala","orange",1500,30,"med_bandage",false,"med_kit"],
        ["bullet_major","Grande ferida por arma de fogo","red",2500,6,"med_bandage",false,"med_kit"],
        ["wound_minor","Ferida pequena","orange",500,20,"med_bandage",true,""],
        ["wound_major","Ferida grande","red",800,50,"med_bandage",false,"med_kit"],
        ["bruise","Ematoma","orange",200,0,"med_icepack",true,""],
        ["cut","Corte","orange",150,10,"med_bandage",true,""],
        ["bone_broken","Osso quebrado","red",750,20,"med_splint",false,"med_cast"],
        ["concussion_minor","Concussão pequena","orange",500,0,"med_painkillers",true,""],
        ["concussion_major","Concussão grande","red",1000,0,"",false,"med_icepack"],
        ["taser","Dardo de taser","orange",0,0,"",true,""],
        ["smoke_minor","Inalação de fumaça pequena","orange",0,0,"med_painkillers",true,""],
        ["smoke_medium","Inalação de fumaça media","orange",0,0,"",false,"med_oxygenmask"],
        ["smoke_major","Inalação de fumaça grande","red",0,0,"",false,"med_endotracheal"],
        ["burn_first","Queimadura de primeiro grau","orange",0,0,"med_icepack",true,""],
        ["burn_second","Queimadura de segundo grau","orange",0,0,"med_icepack",true,""],
        ["burn_third","Queimadura de terceiro grau","red",300,30,"med_icepack",false,"med_autograft"],
        ["burn_fourth","Queimadura de quarto grau","red",500,50,"med_icepack",false,"med_autograft"],
        ["burn_fifth","Queimadura de quinto grau","red",700,70,"",false,"med_bandage"]
    ];

    Config_Medical_PartNames = [
        ["head","Cabeça"],
        ["chest","Peito"],
        ["torso","Tronco"],
        ["pelvis","Pélvis"],
        ["left upper leg","Perna esquerda superior"],
        ["left lower leg","Perna esquerda inferior"],
        ["right upper leg","Perna direita superior"],
        ["right lower leg","Perna esquerda inferior"],
        ["right upper arm","Braço direito superior"],
        ["left upper arm","Braço esquerdo superior"],
        ["left lower arm","Braço esquerdo inferior"],
        ["right lower arm","Braço direito inferior"]
    ];

    if (([player,"blood"] call Caue_Medical_GetVar) < 1) then {
        [] spawn Caue_Medical_Die;
    };

    if ([] call Caue_Medical_LegBroken) then {[false] call Caue_Medical_BrokeLeg;};

    MedicalReady = true;

}, false] call Server_Setup_Compile;

['Caue_Medical_Hit', {

    if (isNil "Config_Medical_Wounds") then {[] call Caue_Medical_Init;};

    private ["_sHit","_sDamage","_sBullet","_sSource"];
    params [
        ["_unit",objNull]
    ];

    sleep 0.1;

    private _getHit = _unit getVariable ["getHit",[]];
    Caue_HitTime = nil;
    _unit setVariable ["getHit",nil,false];

    private _tmpDmg = 0;
    {
        _x params [
            "_sel",
            "_dmg",
            "_bullet",
            "_source"
        ];

        if (_bullet isEqualTo "") then {
            if (_dmg > _tmpDmg) then {
                _sHit = _sel;
                _sDamage = _dmg;
                _sBullet = _bullet;
                _tmpDmg = _dmg;
                _sSource = _source;
            };
        } else {
            if ((_dmg > _tmpDmg) && !(_sel isEqualTo "")) then {
                _sHit = _sel;
                _sDamage = _dmg;
                _sBullet = _bullet;
                _tmpDmg = _dmg;
                _sSource = _source;
            };
        };
    } forEach _getHit;

    if (isNil "_sHit") exitwith {};

    if ((_sHit IN ["spine1","spine2","spine3"]) && (_sBullet isEqualTo "") && (isBurning player)) then {
        _sBullet = "FireDamage";
    };

    if ((_sBullet isEqualTo "non_Swing") && ((vehicle player) isEqualTo player) && ((vehicle _sSource) isEqualTo _sSource) && ((player distance _sSource) < 10)) exitWith {
        [] call A3PL_Lib_Ragdoll;
    };

    if (_sBullet isEqualTo "A3PL_Paintball_Bullet") exitwith {
        if ((missionNameSpace getVariable ["A3PL_Medical_PaintballHit",false]) || (_sSource isEqualTo player)) exitwith {};
        A3PL_Medical_PaintBallHit = true;
        player playAction "gestureFreeze";
        [] spawn {sleep 0.6; A3PL_Medical_PaintBallHit = nil;};
    };

    [_sHit,_sDamage,_sBullet] call Caue_Medical_GenerateWounds;

}, false] call Server_Setup_Compile;

['Caue_Medical_GenerateWounds', {

    if (player getVariable ["inadminform",false]) exitwith {};

    params [
        ["_sHit",""],
        ["_sDamage",0],
        ["_sBullet",""]
    ];

    if (_sBullet IN ["A3PL_High_Pressure_Water_Ball","B_408_Ball","A3PL_Predator_Bullet","B_762x51_Ball","A3PL_3006"]) exitWith {};

    if (_sBullet isEqualTo "A3PL_TaserBullet") exitWith {
        [] call A3PL_Lib_Ragdoll;
        [player,([_sHit] call Caue_Medical_GetHitPart),"taser"] call Caue_Medical_ApplyWound;
    };

    if (_sBullet IN ["A3PL_Scythe_Bullet","A3PL_PickAxe_Bullet","A3PL_Shovel_Bullet","A3PL_Fireaxe_Bullet","A3PL_Machete_Bullet","A3PL_Knife_Bullet","A3PL_Shank_Bullet","A3PL_Axe_Bullet"]) exitWith {
        if ((round(random 2)) isEqualTo 1) then {
            [player,([_sHit] call Caue_Medical_GetHitPart),"cut"] call Caue_Medical_ApplyWound;
        };
    };

    if ((_sHit isEqualTo "") && (_sBullet isEqualTo "") && !((vehicle player) isEqualTo player)) exitWith {
        if ((_sDamage > 0.005) && (_sDamage < 0.015)) then {
            for "_i" from 1 to (round(random 3)) do {
                _part = selectRandom ["torso","pelvis","left upper leg","left lower leg","right upper leg","head","chest","right lower leg","right upper arm","left upper arm","left lower arm","right lower arm"];
                if (_part isEqualTo "head") then {
                    if !([player,_part,"concussion_minor"] call Caue_Medical_HasWound) then {[player,"head","concussion_minor"] call Caue_Medical_ApplyWound;};
                } else {
                    [player,_part,(selectRandom ["cut","bruise","wound_minor"])] call Caue_Medical_ApplyWound;
                };
            };
        };

        if (_sDamage >= 0.016) then {
            for "_i" from 1 to (round(random 3)) do {
                _part = selectRandom ["torso","pelvis","left upper leg","left lower leg","right upper leg","chest","right lower leg","head","right upper arm","left lower arm","right lower arm","left upper arm"];
                if (_part isEqualTo "head") then {
                    if !([player,_part,"concussion_major"] call Caue_Medical_HasWound) then {[player,"head","concussion_major"] call Caue_Medical_ApplyWound;};
                } else {
                    [player,_part,(selectRandom ["cut","bruise","wound_minor","wound_major","bone_broken"])] call Caue_Medical_ApplyWound;
                };
            };
        };
    };

    if ((_sHit IN ["pelvis","head"]) && (_sBullet isEqualTo "") && ((vehicle player) isEqualTo player)) exitWith {
        if ((count(nearestObjects [player,["A3PL_Goose_Default"],5])) > 0) exitwith {};
        if ((count(nearestObjects [player,["Land_Pier_F"],50])) > 0) exitwith {};

        if ((_sDamage >= 0.1) && (_sDamage < 0.25)) then {
            for "_i" from 1 to (round(random 2)) do {
                _part = selectRandom ["left lower leg","right upper leg","left lower leg","pelvis","left upper leg","right upper leg","left upper leg","right lower leg","left lower leg","left upper leg","head","right upper leg","right lower leg","head","head","right lower leg"];
                if (_part isEqualTo "head") then {
                    [player,"head","concussion_minor"] call Caue_Medical_ApplyWound;
                } else {
                    [player,_part,(selectRandom ["cut","bruise","wound_minor"])] call Caue_Medical_ApplyWound;
                };
            };
        };

        if ((_sDamage >= 0.25) && (_sDamage < 0.9)) then {
            for "_i" from 1 to (1 + (round(random 1))) do {
                _part = selectRandom ["left lower leg","right upper leg","left lower leg","left upper leg","pelvis","left upper leg","right lower leg","left lower leg","left upper leg","head","right upper leg","right upper leg","right lower leg","head","head","right lower leg"];
                if (_part isEqualTo "head") then {
                    [player,"head","concussion_major"] call Caue_Medical_ApplyWound;
                } else {
                    [player,_part,(selectRandom ["cut","bruise","wound_major","bone_broken"])] call Caue_Medical_ApplyWound;
                };
                if ((round(random 100)) > 60) then {[true] call Caue_Medical_BrokeLeg;};
            };
        };

        if (_sDamage >= 0.9) then {
            for "_i" from 1 to (6 + (round(random 4))) do {
                _part = selectRandom ["left lower leg","right upper leg","left lower leg","left upper leg","pelvis","left upper leg","right lower leg","left lower leg","left upper leg","head","right upper leg","right upper leg","right lower leg","head","head","right lower leg"];
                [player,_part,(selectRandom ["concussion_major","wound_major","bone_broken"])] call Caue_Medical_ApplyWound;
            };
            [] spawn Caue_Medical_Die;
        };
    };

    if (_sBullet isEqualTo "FireDamage") exitWith {
        _fireDamage = (player getVariable ["A3PL_FireDamage",0]) + 1;
        player setVariable ["A3PL_FireDamage",_fireDamage,false];

        if ((_fireDamage > 6 && _fireDamage < 10)) then {
            _part = selectRandom ["torso","torso","torso","pelvis","left upper leg","left lower leg","right upper leg","chest","right lower leg","right upper arm","torso","right lower arm","left lower arm","left upper arm","right lower arm","left lower arm","head","right lower arm","head","head","head"];
            if (_part isEqualTo "chest") then {
                _wound = selectRandom ["smoke_minor","smoke_medium","burn_second","burn_first","burn_second"];
                if !([player,_part,_wound] call Caue_Medical_HasWound) then {
                    [player,_part,_wound] call Caue_Medical_ApplyWound;
                };
            } else {
                [player,_part,(selectRandom ["burn_first","burn_second"])] call Caue_Medical_ApplyWound;
            };

            [] spawn {
                if (missionNameSpace getVariable ["A3PL_MedicalVar_BurnLoop",false]) exitwith {};
                A3PL_MedicalVar_BurnLoop = true;
                uiSleep 2;
                if (!isBurning player) then {player setVariable ["A3PL_FireDamage",nil,false]};
                A3PL_MedicalVar_BurnLoop = nil;
            };
        };

        if (_fireDamage > 13) then {
            _part = selectRandom ["torso","torso","torso","pelvis","left upper leg","left lower leg","right upper leg","chest","right lower leg","right upper arm","torso","right lower arm","left lower arm","left upper arm","right lower arm","left lower arm","head","right lower arm","head","head","head"];
            if (_part isEqualTo "chest") then {
                _wound = selectRandom ["smoke_medium","smoke_major","burn_second","burn_third"];
                if !([player,_part,_wound] call Caue_Medical_HasWound) then {
                    [player,_part,_wound] call Caue_Medical_ApplyWound;
                };
            } else {
                [player,_part,(selectRandom ["burn_second","burn_third","burn_fourth"])] call Caue_Medical_ApplyWound;
            };
            player setVariable ["A3PL_FireDamage",nil,false];
        };
    };

    if ((_sHit IN ["face_hub","head"]) && !(_sBullet isEqualTo "")) exitWith {
        if (_sDamage > 3.8) then {
            [player,"head","bullet_major"] call Caue_Medical_ApplyWound;
            [] spawn Caue_Medical_Die;
        } else {
            [player,"head","bullet_major"] call Caue_Medical_ApplyWound;
        };
    };

    if ((_sHit IN ["pelvis","spine1"]) && !(_sBullet isEqualTo "")) exitWith {
        [player,"pelvis",(selectRandom ["bullet_minor","bullet_major"])] call Caue_Medical_ApplyWound;
    };

    if ((_sHit == "spine2") && !(_sBullet isEqualTo "")) exitWith {
        [player,"torso",(selectRandom ["bullet_minor","bullet_major"])] call Caue_Medical_ApplyWound;
    };

    if ((_sHit IN ["neck","spine3","body"]) && !(_sBullet isEqualTo "")) exitWith {
        [player,"chest",(selectRandom ["bullet_minor","bullet_major"])] call Caue_Medical_ApplyWound;
    };

    if ((_sHit IN ["arms","hands"]) && !(_sBullet isEqualTo "")) exitWith {
        [player,(selectRandom ["right upper arm","right lower arm","left lower arm","left upper arm"]),(selectRandom ["bullet_minor","bullet_major"])] call Caue_Medical_ApplyWound;
    };

    if ((_sHit isEqualTo "legs") && !(_sBullet isEqualTo "")) exitWith {
        [player,(selectRandom ["right upper leg","right lower leg","left lower leg","left upper leg"]),(selectRandom ["bullet_minor","bullet_major"])] call Caue_Medical_ApplyWound;
        if ((round(random 100)) > 60) then {[true] call Caue_Medical_BrokeLeg;};
    };

}, false] call Server_Setup_Compile;

['Caue_Medical_ApplyWound', {

    params [
        ["_player",objNull],
        ["_part",""],
        ["_wound",""]
    ];

    private _partF = false;
    private _set = true;
    private _wounds = _player getVariable ["Caue_Wounds",[]];

    {
        if ((_x select 0) isEqualTo _part) then {
            if ((count _x) > 5) exitwith {
                _partF = true;
                _set = false;
            };
            _x pushback [_wound,false];
            _partF = true;
        };
    } forEach _wounds;

    if !(_partF) then {
        _wounds pushback [_part,[_wound,false]];
    };

    if (_set) then {
        _player setVariable ["Caue_Wounds",_wounds,true];
        private _bloodLoss = [_wound,"bloodLossInstant"] call Caue_Medical_GetWound;
        if (_bloodLoss > 0) then {[_player,[-(_bloodLoss)]] call Caue_Medical_ApplyVar;};
    };

}, false] call Server_Setup_Compile;

['Caue_Medical_GetWound', {

    params [
        ["_class",""],
        ["_search",""]
    ];

    private _config = [];
    private _return = "";

    if (_class isEqualTo "") exitWith {false;};

    {
        if ((_x select 0) == _class) then {_config = _x;};
    } forEach Config_Medical_Wounds;

    if ((count _config) isEqualTo 0) exitwith {false;};

    _return = switch (_search) do {
        case "class": {_config select 0;};
        case "name": {_config select 1;};
        case "color": {_config select 2;};
        case "bloodLossInstant": {_config select 3;};
        case "bloodLoss": {_config select 4;};
        case "itemTreat": {_config select 5;};
        case "doesTreatHeal": {_config select 6;};
        case "itemHeal": {_config select 7;};
        default {_config;};
    };

    _return

}, false] call Server_Setup_Compile;

['Caue_Medical_HasWound', {

    params [
        ["_player",objNull],
        ["_part",""],
        ["_woundsCheck","",["",[]]]
    ];

    private _hasWound = false;

    if (_woundsCheck isEqualType "") then {
        _woundsCheck = [_woundsCheck];
    };

    {
        private _wound = _x;
        {
            if ((_x select 0) isEqualTo _part) exitwith {
                for "_i" from 1 to ((count _x) - 1) do {
                    private _woundArr = _x select _i;
                    if ((_woundArr select 0) isEqualTo _wound) exitwith {
                        _hasWound = true;
                    };
                };
            };
        } forEach (_player getVariable ["Caue_Wounds",[]]);
    } forEach _woundsCheck;

    _hasWound;

}, false] call Server_Setup_Compile;

/*
    Die
*/
['Caue_Medical_Die', {

    if (A3PL_MedicalVar_Unconscious) exitWith {};
    A3PL_MedicalVar_Unconscious = true;

    private _effect = ["DynamicBlur",[5]] call A3PL_Lib_PPEffect;
    moveOut player;
    player setVariable ["tf_voiceVolume",0,true];

    [] call A3PL_Lib_Ragdoll;
    sleep 1;

    [] spawn {
        uiSleep 5;
        player setVariable ["canExecute",true,true];
    };

    if (([player,"blood"] call Caue_Medical_GetVar) > 0) then {[player,[-(5000)]] call Caue_Medical_ApplyVar;};

    [] remoteExecCall ["Caue_Medical_DieNotification",(["fifr"] call A3PL_Lib_FactionPlayers)];

    [] spawn {
        while {A3PL_MedicalVar_Unconscious} do {
            if ((animationState player) != "UnconsciousReviveBody_A") then {
                [player,"UnconsciousReviveBody_A",true,true] remoteExecCall ["A3PL_Lib_SyncAnim",-2];
                player switchMove "UnconsciousReviveBody_A";
                player playMoveNow "UnconsciousReviveBody_A";
            };
        };
    };

    private _timer = 900;
    private _died = false;
    while {([player,"blood"] call Caue_Medical_GetVar) < 500} do {
        titleText [format ["Você está inconsciente devido ao seu nível sanguíneo, seu coração vai parar em %1 segundo(s)",_timer],"PLAIN"];
        uiSleep 1;
        _timer = _timer - 1;
        if (_timer isEqualTo 0) exitwith {_died = true; [] spawn Caue_Medical_Respawn;};
    };

    _effect ppEffectEnable false;
    ppEffectDestroy _effect;

    if (_died) exitWith {};

    A3PL_MedicalVar_Unconscious = false;
    player setVariable ["tf_voiceVolume",1,true];
    player setVariable ["canExecute",false,true];
    sleep 1;
    player switchMove "amovppnemstpsnonwnondnon";

}, false] call Server_Setup_Compile;

['Caue_Medical_DieNotification', {

    ["Temos uma ocorrência de paciente ferido, a localização está marcada no mapa.",Color_Green] call A3PL_HUD_Notification;
    playSound "fifrdispatch";

}, false] call Server_Setup_Compile;

['Caue_Medical_Respawn', {

    if !(A3PL_MedicalVar_Unconscious) exitWith {};
    A3PL_MedicalVar_Unconscious = false;
    player setVariable ["canExecute",false,true];

    closeDialog 0;

    player setVariable ["Player_Hunger",100,true];
    player setVariable ["Player_Thirst",100,true];
    player setVariable ["player_inventory",[],true];
    player setVariable ["getjobplayerguy",0,true];

    player setVariable ["Cuffed",false,true];
    player setVariable ["Tied",false,true];

    player setUnitLoadout [[],[],[],[],[],[],"","",[],["","","","","",""]];
    player addUniform (selectRandom ["A3PL_featherlite_blue_Uniform","A3PL_featherlite_green_Uniform","A3PL_featherlite_pink_Uniform","A3PL_featherlite_red_Uniform"]);
    player linkItem "ItemMap";
    player linkItem "ItemWatch";
    player addItem "RoleplayRadio";

    player setPos [2506.33,5456.31,0.001441];
    player setDir 180;
    player switchMove "";

    player setVariable ["Caue_Wounds",[],true];
    player setVariable ["Caue_MedicalVars",[5000],true];
    if ((count (player getVariable ["Caue_MedicalLog",[]])) > 0) then {[player] call Caue_Medical_ClearLog;};

    [] spawn Caue_Gear_Sync;

    sleep 1;

    player setVariable ["Caue_Wounds",[],true];
    player setVariable ["Caue_MedicalVars",[5000],true];

}, false] call Server_Setup_Compile;

/*
    Vars
*/
['Caue_Medical_ApplyVar', {

    params [
        ["_player",player],
        ["_change",[]]
    ];

    private _medicalVar = _player getVariable ["Caue_MedicalVars",[5000]];
    {
        private _newValue = (_medicalVar select _forEachIndex) + _x;
        if (_newValue < 0) then {_newValue = 0;};

        if (_forEachIndex isEqualTo 0) then {
            if (_player isEqualTo player) then {
                private _newBloodLvl = (_medicalVar select 0) + _x;
                if (_newBloodLvl <= 0) then {
                    _newBloodLvl = 0;
                    if !(A3PL_MedicalVar_Unconscious) then {[] spawn Caue_Medical_Die;};
                };
                ["\A3PL_Common\GUI\medical\overlay_blood.paa",1,(_newBloodLvl/5000)] call A3PL_HUD_SetOverlay;
            };
        };

        if (_newValue > 5000) then {_newValue = 5000;};
        _medicalVar set [_forEachIndex,_newValue];
    } forEach _change;

    _player setVariable ["Caue_MedicalVars",_medicalVar,true];
    [(findDisplay 73)] call Caue_Medical_LoadParts;

}, false] call Server_Setup_Compile;

['Caue_Medical_GetVar', {

    params [
        ["_player",objNull],
        ["_var",""]
    ];

    private _return = 0;
    private _vars = _player getVariable ["Caue_MedicalVars",[5000]];

    if (_var isEqualTo "blood") then {_return = _vars select 0;};

    _return;

}, false] call Server_Setup_Compile;

/*
    Menu
*/
['Caue_Medical_Open', {

    disableSerialization;
    params [["_unit",player]];

    closeDialog 0;
    createDialog "Caue_Medical";
    private _display = findDisplay 73;

    A3PL_MedicalVar_CurrentPart = "chest";
    A3PL_MedicalVar_Target = _unit;
    ["chest"] call Caue_Medical_SelectPart;

    _display displayAddEventHandler ["unLoad",{
        A3PL_MedicalVar_CurrentPart = nil;
        A3PL_MedicalVar_Controls = nil;
    }];

    private _control = _display displayCtrl 1100;
    if (_unit isEqualTo player) then {
        _control ctrlSetStructuredText parseText format ["<t size='1.4' align='center' font='PuristaSemiBold'>%1</t>",toUpper(player getVariable ["name",name player])];
    } else {
        _control ctrlSetStructuredText parseText format ["<t size='1.4' align='center' font='PuristaSemiBold'>%1</t>",toUpper([_unit] call Caue_Player_GetNameTag)];
    };

    {
        buttonSetAction [(1602 + _forEachIndex),format["['%1'] call Caue_Medical_SelectPart;",_x]];
    } forEach ["head","chest","torso","pelvis","left upper leg","left lower leg","right upper leg","right lower leg","right upper arm","left upper arm","left lower arm","right lower arm"];

    buttonSetAction [1601,"[] call Caue_Medical_TreatWoundButton"];
    buttonSetAction [1600,"[] call Caue_Medical_ClearLog"];

    [_display,_unit] call Caue_Medical_LoadParts;

    while {!isNull _display} do {
        uiSleep 0.2;
        [] call Caue_Medical_LoadItems;
    };

}, false] call Server_Setup_Compile;

['Caue_Medical_LoadParts', {

    disableSerialization;
    params [
        ["_display",(findDisplay 73)],
        ["_player",missionNameSpace getVariable ["A3PL_MedicalVar_Target",objNull]]
    ];

    if (isNull _display) exitwith {};

    private _vars = _player getVariable ["Caue_MedicalVars",[5000]];
    private _control = _display displayCtrl 1103;
    _control ctrlSetStructuredText parseText format ["<t size='1.3' align='center' font='PuristaSemiBold'>%1</t>",(_vars select 0)];

    private _log = [] + (_player getVariable ["Caue_MedicalLog",[]]);
    reverse _log;
    _control = _display displayCtrl 1500;
    lbClear _control;
    {
        private _index = _control lbAdd (_x select 0);
        _control lbSetColor [_index,(_x select 1)];
    } forEach _log;

    if !(isNil {missionNameSpace getVariable ["A3PL_MedicalVar_Controls",nil]}) then {
        {ctrlDelete _x;} forEach A3PL_MedicalVar_Controls;
    };

    private _wounds = _player getVariable ["Caue_Wounds",[]];
    if ((count _wounds) > 0) then {
        A3PL_MedicalVar_Controls = [];
        {
            private _img = "";
            switch (_x select 0) do {
                case ("head"): {_img = "head"};
                case ("chest"): {_img = "spine03"};
                case ("torso"): {_img = "spine02"};
                case ("pelvis"): {_img = "spine01"};
                case ("left upper leg"): {_img = "right_leg_upper"};
                case ("left lower leg"): {_img = "right_leg_lower"};
                case ("right upper leg"): {_img = "left_leg_upper"};
                case ("right lower leg"): {_img = "left_leg_lower"};
                case ("left upper arm"): {_img = "right_arm_upper"};
                case ("left lower arm"): {_img = "right_arm_lower"};
                case ("right upper arm"): {_img = "left_arm_upper"};
                case ("right lower arm"): {_img = "left_arm_lower"};
            };

            if (_img isEqualTo "") exitwith {};

            private _color = "";
            for "_i" from 1 to ((count _x) - 1) do {
                private _woundArr = _x select _i;
                if (_woundArr select 1) then {
                    if !(_color IN ["red","orange"]) then {_color = "green";};
                } else {
                    _color = [(_woundArr select 0),"color"] call Caue_Medical_GetWound;
                };
                if (_color isEqualTo "red") exitwith {};
            };

            private _control = _display ctrlCreate ["RscPicture",-1];
            _control ctrlSetPosition (ctrlPosition (_display displayCtrl 1201));
            _control ctrlCommit 0;
            _control ctrlSetText format ["\A3PL_Common\GUI\medical\man_%1_%2.paa",_img,_color];
            A3PL_MedicalVar_Controls pushback _control;
        } forEach (_player getVariable ["Caue_Wounds",[]]);
    };

}, false] call Server_Setup_Compile;

['Caue_Medical_LoadItems', {

    disableSerialization;

    private _player = missionNamespace getVariable ["A3PL_MedicalVar_Target",objNull];
    private _part = missionNamespace getVariable ["A3PL_MedicalVar_CurrentPart","chest"];

    private _display = findDisplay 73;
    private _control = _display displayCtrl 1502;
    private _lbArray = [];

    switch (true) do {
        case ([_player,_part,"taser"] call Caue_Medical_HasWound): {_lbArray pushback ["Retirar o dardo de taser","pull_taser"];};
        case (_part IN ["right upper arm","left upper arm","left lower arm","right lower arm"]): {
            private _itemName = "medS_bloodbag";
            private _itemAmount = [_itemName] call Caue_Inventory_Return;
            if ([_itemName,1] call Caue_Inventory_Has) then {
                _lbArray pushback [(format ["%1 (x%2)",([_itemName,"name"] call Caue_Config_GetItem),_itemAmount]),_itemName];
            };
        };
    };

    {
        _x params ["_itemName","_itemAmount"];
        if ((_itemName find "med_") isEqualTo 0) then {
            _lbArray pushback [(format ["%1 (x%2)",[_itemName,"name"] call Caue_Config_GetItem,_itemAmount]),_itemName];
        };
    } forEach (player getVariable ["player_inventory",[]]);

    lbClear _control;
    {
        private _index = _control lbAdd (_x select 0);
        _control lbSetData [_index,(_x select 1)];
    } forEach _lbArray;

}, false] call Server_Setup_Compile;

['Caue_Medical_SelectPart', {

    disableSerialization;
    params [["_part",A3PL_MedicalVar_CurrentPart]];

    private _player = missionNameSpace getVariable ["A3PL_MedicalVar_Target",objNull];
    A3PL_MedicalVar_CurrentPart = _part;

    private _display = findDisplay 73;

    private _partname = "";
    {
        if ((_x select 0) isEqualTo _part) exitWith {_partname = _x select 1;};
    } forEach Config_Medical_PartNames;

    private _control = _display displayCtrl 1104;
    _control ctrlSetStructuredText parseText format ["<t size='1.3' align='center' font='PuristaSemiBold'>%1</t>",toUpper _partname];

    _control = _display displayCtrl 1501;
    lbClear _control;
    {
        if ((_x select 0) isEqualTo _part) then {
            for "_i" from 1 to ((count _x) - 1) do {
                private _woundClass = (_x select _i) select 0;
                private _woundState = (_x select _i) select 1;
                _index = _control lbAdd ([_woundClass,"name"] call Caue_Medical_GetWound);
                _control lbSetData [_index,_woundClass];
                private _color = [_woundClass,"color"] call Caue_Medical_GetWound;
                if (_woundState) then {_color = "green";};
                _color = switch (_color) do {
                    case ("red"): {[1, 0, 0, 1];};
                    case ("orange"): {[0.5, 0.5, 0, 1];};
                    case ("green"): {[0, 1, 0, 1];};
                };
                if (_color isEqualType []) then {_control lbSetColor [_index,_color];};
            };
        };
    } forEach (_player getVariable ["Caue_Wounds",[]]);

}, false] call Server_Setup_Compile;

['Caue_Medical_TreatWoundButton', {

    disableSerialization;

    private _display = findDisplay 73;

    private _player = missionNameSpace getVariable ["A3PL_MedicalVar_Target",objNull];
    if (isNull _player) exitwith {["Incapaz de identificar o alvo, o jogador saiu do servidor?"] call A3PL_HUD_Notification;};

    private _part = missionNameSpace getVariable ["A3PL_MedicalVar_CurrentPart",nil];
    if (isNil "_part") exitwith {["Não é possível determinar a parte do corpo selecionada"] call A3PL_HUD_Notification;};

    private _control = _display displayCtrl 1502;
    if ((lbCurSel _control) isEqualTo -1) exitwith {["Você não tem nenhum tratamento/item selecionado!"] call A3PL_HUD_Notification;};

    private _item = _control lbData (lbCurSel _control);
    private _isEMS = (player getVariable ["job","unemployed"]) isEqualTo "fifr";
    private _exit = false;

    switch (_item) do {
        case ("med_kit"): {
            if ((nearestObjects [player,["Land_A3PL_Clinic"],10]) isEqualTo []) exitWith {_exit = true; ["Você precisa estar em uma clinica para usar este item",Color_Yellow] call A3PL_HUD_Notification;};
        };
        case ("medS_bloodbag"): {
            if !([_item,1] call Caue_Inventory_Has) exitWith {["Você não tem esse item"] call A3PL_HUD_Notification; _exit = true;};
            if (_isEMS) then {
                if !([] call Caue_Player_AntiSpam) exitWith {_exit = true;};
                if (([_player,"blood"] call Caue_Medical_GetVar) >= 5000) exitwith {["Este paciente já tem o máximo de sangue"] call A3PL_HUD_Notification;};
                if (((nearestObjects [player,["Land_A3PL_Clinic"],10]) isEqualTo []) && (([_player,"blood"] call Caue_Medical_GetVar) >= 1000)) exitWith {["Você precisa estar em uma clinica para aplicar mais sangue neste paciente",Color_Yellow] call A3PL_HUD_Notification;};
                if (player_itemClass == _item) then {[] call Caue_Inventory_Clear;};
                if (_player getVariable ["canExecute",false]) then {
                    ["Foi cobrado $2000 pelo serviço do medico",Color_Yellow] remoteExec ["A3PL_HUD_Notification",_player];
                    [_player,'getrankplayerguy',((_player getVariable 'getrankplayerguy') - 2000)] remoteExec ["Server_Core_ChangeVar",2];
                    ["Você recebeu $2000 por resgatar este paciente",Color_Green] call A3PL_HUD_Notification;
                    [player,'getrankplayerguy',((player getVariable 'getrankplayerguy') + 2000)] remoteExec ["Server_Core_ChangeVar",2];
                    ["FD_BUDGET",2000,true] remoteExec ["Server_Government_UpdateBalance",2];
                };
                player action ["heal",_player];
                ["medS_bloodbag",-1] call Caue_Inventory_Add;
                [_player,[1000]] call Caue_Medical_ApplyVar;
                ["Você aplicou uma bolsa de sangue neste paciente!",Color_Green] call A3PL_HUD_Notification;
                [_player,format ["%1 aplicou uma bolsa de sangue",(player getVariable ["name",name _player])],[0, 1, 0, 1]] call Caue_Medical_AddLog;
                [(findDisplay 73),_player] call Caue_Medical_LoadParts;
            } else {
                ["Você não está de plantão como um Medico e não pode aplicar uma bolsa de sangue"] call A3PL_HUD_Notification;
            };
            _exit = true;
        };
        case ("pull_taser"): {
            if ([_player,_part,"taser"] call Caue_Medical_HasWound) then {[_player,_part,"taser",""] call Caue_Medical_Treat;};
            player action ["heal",_player];
            _exit = true;
        };
    };

    if (_exit) exitwith {};

    _control = _display displayCtrl 1501;
    if ((lbCurSel _control) isEqualTo -1) exitwith {["Você não selecionou uma ferida"] call A3PL_HUD_Notification;};
    private _wound = _control lbData (lbCurSel _control);

    if ((_item isEqualTo ([_wound,"itemTreat"] call Caue_Medical_GetWound)) || ((_item isEqualTo ([_wound,"itemHeal"] call Caue_Medical_GetWound)) && _isEMS)) then {
        [_player,_part,_wound,_item] call Caue_Medical_Treat;
        player action ["heal",_player];
        if !(_item isEqualTo "") then {
            if (player_itemClass == _item) then {[] call Caue_Inventory_Clear;};
            [_item,-1] call Caue_Inventory_Add;
        };
    } else {
        if (_isEMS) then {
            ["Este item não pode ser usado para tratar esta ferida (ou você não está de plantão como um Medico)"] call A3PL_HUD_Notification;
        } else {
            ["Este item não pode ser usado para tratar esta ferida"] call A3PL_HUD_Notification;
        };
    };

}, false] call Server_Setup_Compile;

['Caue_Medical_Treat', {

    params [
        ["_player",objNull],
        ["_part",""],
        ["_wound",""],
        ["_item",""]
    ];

    private _woundName = [_wound,"name"] call Caue_Medical_GetWound;
    private _isEMS = (player getVariable ["job","unemployed"]) isEqualTo "fifr";
    private _wounds = _player getVariable ["Caue_Wounds",[]];

    {
        if ((_x select 0) isEqualTo _part) exitWith {
            for "_i" from 1 to ((count _x) - 1) do {
                private _woundArr = _x select _i;

                if (((_woundArr select 0) isEqualTo _wound) && (_item == ([_wound,"itemHeal"] call Caue_Medical_GetWound)) && _isEMS) exitWith {
                    [format ["Você curou um(a) %1",_woundName],Color_Green] call A3PL_HUD_Notification;
                    [_player,format["%1 curou um(a) %2",(player getVariable ["name",name player]),_woundName],[0, 1, 0, 1]] call Caue_Medical_AddLog;
                    _x deleteAt _i;

                    if ((_wound isEqualTo "bone_broken") && (_part in ["left upper leg","left lower leg","right upper leg","right lower leg"]) && ((_player getHit "legs") > 0)) then {
                        if !([_player] call Caue_Medical_LegBroken) then {_player setHit ["legs",0];};
                    };
                };

                if (((_woundArr select 0) isEqualTo _wound) && !(_woundArr select 1)) exitWith {
                    if ([_wound,"doesTreatHeal"] call Caue_Medical_GetWound) then {
                        [format ["Você tratou um(a) %1",_woundName],Color_Green] call A3PL_HUD_Notification;
                        [_player,format ["%1 tratou um(a) %2 no(a) %3",(player getVariable ["name",name player]),_woundName,_part],[0, 1, 0, 1]] call Caue_Medical_AddLog;
                        _x deleteAt _i;
                    } else {
                        [_player,format ["%1 tratou um(a) %2 no(a) %3",(player getVariable ["name",name player]),_woundName,_part],[0, 1, 0, 1]] call Caue_Medical_AddLog;
                        [format ["Você tratou um(a) %1, você ainda pode precisar de atendimento médico",_woundName],Color_Yellow] call A3PL_HUD_Notification;
                        _woundArr set [1,true];
                    };
                };
            };
            if ((count _x) < 2) then {(_player getVariable ["Caue_Wounds",[]]) deleteAt _forEachIndex;};
        };
    } forEach _wounds;

    [(findDisplay 73),_player] call Caue_Medical_LoadParts;
    [] call Caue_Medical_SelectPart;
    _player setVariable ["Caue_Wounds",_wounds,true];

}, false] call Server_Setup_Compile;

/*
    Log
*/
['Caue_Medical_AddLog', {

    params [
        ["_player",player],
        ["_text",""],
        ["_color",""]
    ];

    private _log = _player getVariable ["Caue_MedicalLog",[]];
    if ((count _log) >= 12) then {_log deleteAt 0;};
    _log pushback [format["%2:%3 - %1",_text,(date select 3),(date select 4)],_color];
    _player setVariable ["Caue_MedicalLog",_log,true];

}, false] call Server_Setup_Compile;

['Caue_Medical_ClearLog', {

    if !((player getVariable ["job","unemployed"]) isEqualTo "fifr") exitWith {["Apenas um medico pode limpar o registro"] call A3PL_HUD_Notification;};

    params [["_player",A3PL_MedicalVar_Target]];
    if (isNull _player) exitwith {};
    _player setVariable ["Caue_MedicalLog",nil,true];
    [(findDisplay 73),_player] call Caue_Medical_LoadParts;

}, false] call Server_Setup_Compile;

/*
    Misc
*/
['Caue_Medical_Heal', {

    if ((player getVariable ["getjobplayerguy",0]) < 100) exitwith {[format["Você não tem $%1 para ser curado.",100],Color_Red] call A3PL_HUD_Notification;};
    player setVariable ["getjobplayerguy",((player getVariable ["getjobplayerguy",0]) - 100),true];
    player setVariable ["Caue_Wounds",[],true];
    player setVariable ["Caue_MedicalVars",[5000],true];
    player setHit ["legs",0];
    ['fifr_healdone'] call A3PL_NPC_Start;

}, false] call Server_Setup_Compile;

['Caue_Medical_Loop', {

    private _bloodLevel = [player,"blood"] call Caue_Medical_GetVar;
    if (_bloodLevel > 0) then {
        private _bloodChange = 0;
        {
            for "_i" from 1 to ((count _x) - 1) do {
                private _woundArr = _x select _i;
                private _wound = _woundArr select 0;
                private _isTreated = _woundArr select 1;
                if (!_isTreated) then {
                    _bloodChange = _bloodChange - ([_wound,"bloodLoss"] call Caue_Medical_GetWound);
                };
            };
        } forEach (player getVariable ["Caue_Wounds",[]]);
        if !(_bloodChange isEqualTo 0) then {[player,[_bloodChange]] call Caue_Medical_ApplyVar;};
    };

    {
        if (_forEachIndex isEqualTo 0) then {
            ["\A3PL_Common\GUI\medical\overlay_blood.paa",1,(_x/5000)] call A3PL_HUD_SetOverlay;
        };
    } forEach (player getVariable ["Caue_MedicalVars",[5000]]);

}, false] call Server_Setup_Compile;

['Caue_Medical_GetHitPart', {

    params [["_sHit",""]];
    private _mHit = "head";

    switch (true) do {
        case (_sHit IN ["face_hub","head"]): {_mHit = "head";};
        case (_sHit IN ["pelvis","spine1"]): {_mHit = "pelvis";};
        case (_sHit isEqualTo "spine2"): {_mHit = "torso";};
        case (_sHit IN ["neck","spine3","body"]): {_mHit = "chest";};
        case (_sHit IN ["arms","hands"]): {_mHit = selectRandom ["right upper arm","right lower arm","left lower arm","left upper arm"];};
        case (_sHit isEqualTo "legs"): {_mHit = selectRandom ["right upper leg","right lower leg","left lower leg","left upper leg"];};
    };

    _mHit;

}, false] call Server_Setup_Compile;

['Caue_Medical_BrokeLeg', {

    if ((player getHit "legs") isEqualTo 1) exitWith {};

    player setHit ["legs",1];

    if (_this select 0) then {
        [player,(selectRandom ["left upper leg","left lower leg","right upper leg","right lower leg"]),"bone_broken"] call Caue_Medical_ApplyWound;
    };

}, false] call Server_Setup_Compile;

['Caue_Medical_LegBroken', {

    params [["_player",player]];

    private _return = false;

    {
        if ([_player,_x,"bone_broken"] call Caue_Medical_HasWound) exitWith {_return = true;};
    } forEach ["left upper leg","left lower leg","right upper leg","right lower leg"];

    _return

}, false] call Server_Setup_Compile;
