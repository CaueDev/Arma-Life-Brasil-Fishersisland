/*
    Client
*/
['Caue_Player_Variables', {

    player setVariable ["Player_Hunger",100,true];
    player setVariable ["Player_Thirst",100,true];

    Player_Paycheck = 0;
    Player_PaycheckTime = 0;

    player setVariable ["MaxWeight",100,true];

    A3PL_MedicalVar_Unconscious = false;
    player setVariable ["canExecute",false,true];

    Player_ActionCompleted = true;
    Player_ActionDoing = false;

    Player_Item = objNull;
    Player_ItemClass = "";

    Player_Notifications = [];

    Caue_TwitterChatLog = [];
    Caue_TwitterMsg_Array = [];
    Caue_TwitterMsg_Counter = 0;
    player_Twitteradminpwr = false;

    A3PL_FishingBuoy_Local = [];
    WasteBins = [];

    A3PL_Uber_JobActive = false;
    A3PL_Uber_ActiveRequest = objNull;

    Color_Yellow = '#E1BB00';
    Color_White = '#ffffff';
    Color_Red = '#FD1703';
    Color_Green = '#17ED00';
    Color_Blue = '#20a6f9';
    Color_Orange = '#ff9d00';

    player setVariable ["Caue_Call_Status",[player,0,""],true];

    A3PL_Jobroadworker_Impounds = [Shop_ImpoundRetrieve1,Shop_ImpoundRetrieve2,Shop_ImpoundRetrieve3,Shop_ImpoundRetrieve4];
    A3PL_Jobroadworker_MarkBypass = [
        "K_F450_normal","A3PL_BoatTrailer_Normal","A3PL_VNL_Black","A3PL_VNL_Blue","A3PL_VNL_White","A3PL_VNL_Red","A3PL_VNL_Purple","A3PL_Lowloader_Default","A3PL_DrillTrailer_Default",
        "A3PL_Pierce_Ladder","A3PL_Tanker_Normal","A3PL_Boxtrailer_Normal",
        "A3PL_Atego_Yellow","A3PL_Atego_Yellow","A3PL_Atego_Orange","A3PL_Atego_Green","A3PL_Atego_Red","A3PL_Atego_Black",
        "K_Scooter_Black","K_Scooter_DarkBlue","K_Scooter_Green","K_Scooter_Grey","K_Scooter_LightBlue","K_Scooter_Orange","K_Scooter_Pink","K_Scooter_Red","K_Scooter_White","K_Scooter_Stickers"
    ];

    Player_NameIntersect = "";
    Player_ObjIntersect = player;
    Player_selectedIntersect = 0;

    HitchingVehicles = ["A3PL_Car_Base","A3PL_Truck_Base"];

    private _uid = getPlayerUID player;
    private _num = _uid select [(count _uid)-7,count _uid];
    player setVariable ["phone_number",_num,true];

    [] spawn {
        uiSleep 20;
        Player_Paycheck = 0;
        TF_MAX_ASIP_FREQ = 130;
    };

    setSystemOfUnits 0;
    TF_MAX_ASIP_FREQ = 130;
    showChat false;
    enableSentences false;
    enableRadio false;
    setTerrainGrid 50;

    player setvariable ["drugs_array",[[["alcohol",0],["cocaine",0],["shrooms",0],["weed",0]],false],true];
    BLUNT = objNull;
    player setVariable ["Cuffed",false,true];
    player setVariable ["Tied",false,true];
    player_vehicles = [];

    private _import = profileNamespace getVariable ["player_importing",[]];
    private _export = profileNamespace getVariable ["player_exporting",[]];
    player setVariable ["player_importing",_import,true];
    player setVariable ["player_exporting",_export,true];

    player setVariable ["profilenamegear",(profileNamespace getVariable ["mainmenu_gear",[[],[],[],["A3PL_Eatsleep_Uniform",[]],[],[],"","",[],["ItemMap","","RoleplayRadio","ItemCompass","tf_microdagr",""]]]),true];
    player setUnitLoadout [[],[],[],[],[],[],"","",[],["","","","","",""]];
    player setVariable ["caralhodedupefilhadaputa",[],true];

    VarsReady = true;

}, false] call Server_Setup_Compile;

['Caue_Player_AntiSpam', {

    if (missionNamespace getVariable ["Caue_AntiSpam",false]) exitWith {
        ["Anti-spam, mais devagar!", Color_Red] call A3PL_HUD_Notification;
        false
    };

    Caue_AntiSpam = true;

    [] spawn {
        uiSleep 1.25;
        Caue_AntiSpam = false;
    };

    true

}, false] call Server_Setup_Compile;

['Caue_Player_AntiListBoxSpam', {

    if (missionNamespace getVariable ["Caue_AntiListBoxSpam",false]) exitWith {
        false
    };

    Caue_AntiListBoxSpam = true;

    [] spawn {
        uiSleep 0.01;
        Caue_AntiListBoxSpam = false;
    };

    true

}, false] call Server_Setup_Compile;

['Caue_Player_OpenNameTag', {

    params[
        ["_target",objNull]
    ];

    if (isNull _target) exitWith {};

    NameTag_Target = _target;
    private _name = [_target] call Caue_Player_GetNameTag;

    createDialog "Dialog_Nametag";
    ctrlSetText [1400,_name];

}, false] call Server_Setup_Compile;

['Caue_Player_GetNameTag', {

    params[
        ["_target",objNull]
    ];

    if (isNull _target) exitWith {"Desconhecido"};

    private _uid = getPlayerUID _target;

    private _name = "Desconhecido";
    {
        _x params [
            "_sUID",
            "_sNAME"
        ];

        if (_uid isEqualTo _sUID) exitWith {_name = _sNAME;};
    } forEach (profileNamespace getVariable ["Caue_Tags1",[]]);

    _name

}, false] call Server_Setup_Compile;

['Caue_Player_SetNameTag', {

    private _saved = profileNamespace getVariable ["Caue_Tags1",[]];
    private _name = ctrlText 1400;
    private _tUID = getPlayerUID NameTag_Target;

    private _id = -1;
    {
        _x params ["_sUID"];
        if (_tUID isEqualTo _sUID) exitWith {_id = _forEachIndex;};
    } forEach _saved;

    if (_id > -1) then {
        _saved set [_id,[_tUID,_name]];
    } else {
        _saved pushBack [_tUID,_name];
    };

    profileNamespace setVariable ["Caue_Tags1",_saved];
    saveProfileNamespace;

}, false] call Server_Setup_Compile;

['Caue_Player_TakeHostage', {

    params [
        ["_target",objNull]
    ];

    if (isNull _target) exitWith {};

    if !(_target IN allPlayers) exitWith {["Você não está olhando para um jogador válido",Color_Red] call A3PL_HUD_Notification;};
    if (((handgunWeapon player) isEqualTo "") || ((handgunWeapon player) IN ["A3PL_Pickaxe","A3PL_Shovel","A3PL_High_Pressure"])) exitwith {["Você não está carregando uma pistola",Color_Red] call A3PL_HUD_Notification;};
    if (!isNil "EnableHostage") exitwith {["Você não está olhando para um jogador válido",Color_Red] call A3PL_HUD_Notification;};

    EnableHostage = true;
    HostageMode = "hostage";
    HostageTarget = _target;
    HostageReloading = false;

    private _ehFired = player addEventHandler ["Fired",{
        if (HostageMode isEqualTo "hostage") exitwith {
            if ((!isNull HostageTarget) && ((handgunWeapon player) !="A3PL_Taser")) then {[] remoteExec ["Caue_Medical_Die",HostageTarget]};
            EnableHostage = false;
        };
    }];

    private _ehReload = (findDisplay 46) displayAddEventHandler ["KeyDown",{
        if ((_this select 1) in actionKeys "ReloadMagazine") then {
            [] spawn {
                HostageReloading = true;
                uiSleep 3.5;
                if (!isNil "HostageReloading") then {HostageReloading = false};
            };
            false;
        };
    }];

    player playAction "gesture_takehostage";
    [_target,"A3PL_TakenHostage"] remoteExec ["A3PL_Lib_SyncAnim",-2];
    _target attachto [player,[-0.05,0.2,-0.02]];
    uiSleep 2;

    while {EnableHostage} do {
        if (HostageMode isEqualTo "hostage" && !HostageReloading) then {player playAction "gesture_takehostageloop";};
        if (HostageMode isEqualTo "shoot" && !HostageReloading) then {player playAction "gesture_takehostageshootloop";};
        uiSleep 2;
        if ((isNull HostageTarget) || (([_target,"blood"] call Caue_Medical_GetVar) < 1)) exitwith {};
    };

    player playaction "gesture_stop";
    player removeEventHandler ["Fired",_ehFired];
    (findDisplay 46) displayRemoveEventHandler ["KeyDown",_ehReload];
    EnableHostage = nil;
    HostageMode = nil;
    HostageTarget = nil;
    HostageReloading = nil;

    if (([_target,"blood"] call Caue_Medical_GetVar) > 0) then {
        [_target,"A3PL_ReleasedHostage"] remoteExec ["A3PL_Lib_SyncAnim",-2];
        if (([player,"blood"] call Caue_Medical_GetVar) > 0) then {[player,"A3PL_ReleaseHostage"] remoteExec ["A3PL_Lib_SyncAnim",-2];};
        sleep 3;
        detach _target;
        if (([_target,"blood"] call Caue_Medical_GetVar) > 0) then {[_target,""] remoteExec ["A3PL_Lib_SyncAnim",-2];};
        if (([player,"blood"] call Caue_Medical_GetVar) > 0) then {[player,""] remoteExec ["A3PL_Lib_SyncAnim",-2];};
    } else {
        detach _target;
    };

}, false] call Server_Setup_Compile;

['Caue_Player_Surrender', {

    params [
        ["_player",objNull],
        "_upDown"
    ];

    if (isNull _player) exitWith {};

    private _anim = [(animationState _player),_upDown] call {
        params ["_state","_downup"];
        if (_state == "amovpercmstpsnonwnondnon") exitwith {1};
        if ((_state IN ["a3pl_idletohandsup","a3pl_kneeltohandsup"]) && (_downup)) exitwith {2};
        if ((_state IN ["a3pl_idletohandsup","a3pl_kneeltohandsup"]) && (!_downup)) exitwith {3};
        if ((_state == "a3pl_handsuptokneel") && (_downup)) exitwith {4};
        if (_state IN ["amovpknlmstpsnonwnondnon","amovppnemstpsnonwnondnon"]) exitwith {5};
    };

    [_player,_anim] remoteExec ["Caue_Player_SurrenderAnim",-2];

}, false] call Server_Setup_Compile;

['Caue_Player_SurrenderAnim', {

    private ['_civ','_number'];
    _civ = _this select 0;
    _number = _this select 1;
    params [
        ["_player",objNull],
        ["_number",100]
    ];

    if ((isNull _player) || (_number isEqualTo 100)) exitWith {};

    switch (_number) do {
        case 1: {
            if (local _civ) then {
                if (!isPlayer _civ) exitwith {
                    _civ setdir ((getDir _civ) + 50);
                };
                player setdir ((getDir player) + 50);
            };
            _civ switchmove "A3PL_IdleToHandsup";
        };

        case 2: {
            if (local _civ) then {
                if (!isPlayer _civ) exitwith {
                    _civ setdir ((getDir _civ) - 50);
                };
                player setdir ((getDir player) - 50);
            };
            _civ switchmove "";
        };

        case 3: {_civ switchmove "A3PL_HandsupToKneel";};
        case 4: {_civ switchmove "A3PL_KneelToHandsup";};

        case 5: {
            if (local _civ) then {
                if (!isPlayer _civ) exitwith {
                    _civ setdir ((getDir _civ) - 50);
                };
                player setdir ((getDir player) - 50);
            };
            _civ switchmove "A3PL_HandsupKneel";
        };
    };

}, false] call Server_Setup_Compile;

['Caue_Player_Backpack', {

    sleep 1;

    if ((player getVariable ["MaxWeight",100]) isEqualTo 400) exitWith {};
    player setVariable ["MaxWeight",400,true];

    /*
    private _bp = backpack player;

    if (_bp isEqualTo "") exitWith {
        player setVariable ["MaxWeight",100,true];
    };

    if (_bp IN ["A3PL_Backpack_Drill","A3PL_Backpack_Money","A3PL_LR","tf_anarc164"]) exitWith {
        player setVariable ["MaxWeight",300,true];
    };

    player setVariable ["MaxWeight",(100 + ((round(getNumber(configFile >> "CfgVehicles" >> _bp >> "maximumload"))) / 1.5)),true];
    */

}, false] call Server_Setup_Compile;

['Caue_Player_PickupPaycheck', {

    private _paycheckAmount = Player_Paycheck;

    if (_paycheckAmount < 1) exitWith {["Não parece haver um salário para coletar",Color_Red] call A3PL_HUD_Notification;};

    Player_Paycheck = 0;

    [player,'getrankplayerguy',((player getVariable 'getrankplayerguy') + _paycheckAmount)] remoteExec ['Server_Core_ChangeVar',2];

    [format["Eu assinei meu cheque de pagamento e recebi $%1 em minha conta bancária",[_paycheckAmount] call Caue_Lib_NumberText], Color_Green] call A3PL_HUD_Notification;

}, false] call Server_Setup_Compile;

['Caue_Player_Disconnect', {

    disableSerialization;
    player allowDamage false;
    disableUserInput true;
    showChat false;
    hint "";
    1 fadeSound 0;
    1 fadeSpeech 0;
    [] spawn Caue_Gear_Sync;
    _outroCam = "camera" camCreate (player modelToWorldVisual [-5,0,1.85]);
    _outroCam cameraEffect ["internal","back"];
    _outroCam camSetFov 2.000;
    _outroCam camSetTarget vehicle player;
    _outroCam camSetRelPos [0,-1,1.85];
    _outroCam camCommit 0;
    waitUntil {camCommitted _outroCam};
    _outroCam camSetFov 2;
    _outroCam camSetRelPos [0,-5,1.85];
    _outroCam camCommit 1;
    8 cutFadeOut 3;
    waitUntil {camCommitted _outroCam};
    _outroCam camSetFov 9;
    _outroCam camSetRelPos [0,-5,1050.85];
    _outroCam camCommit 1.5;
    waitUntil {camCommitted _outroCam};
    cutText ["","BLACK",1];
    sleep 1;
    4 cutRsc ["SplashNoise","BLACK"];
    sleep 0.25;

    ["<t size='1.3' color='#00C10D'>Obrigado por Jogar!</t>",0,0.2,10,0,0,8] spawn BIS_fnc_dynamicText;

    sleep 4;
    showChat true;
    disableUserInput false;
    ["",0,0.2,10,0,0,8] spawn BIS_fnc_dynamicText;
    failMission "Left";
    _outroCam cameraEffect ["terminate","back"];
    camDestroy _outroCam;

}, false] call Server_Setup_Compile;
