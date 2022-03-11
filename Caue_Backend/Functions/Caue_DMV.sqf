/*
    Client
*/
['Caue_DMV_Open', {

    disableSerialization;

    closeDialog 0;
    createDialog "Dialog_DMV";

    private _display = findDisplay 21;
    private _control = _display displayCtrl 1500;

    _nearPlayers = [];
    {
        if ((isPlayer _x) && (!isObjectHidden _x)) then {_nearPlayers pushback _x};
    } forEach (nearestObjects [player,["CAManBase"],10]);

    {
        private _index = _control lbAdd (format ["%1",(_x getVariable ["name","error"])]);
        _control lbSetData [_index,(getPlayerUID _x)];
    } forEach _nearPlayers;

    _control ctrlAddEventHandler ["LBSelChanged",{_this call Caue_DMV_LbChanged;}];

    _control = _display displayCtrl 1600;
    _control ctrlAddEventHandler ["ButtonDown",{[true] call Caue_DMV_Change;}];
    _control = _display displayCtrl 1601;
    _control ctrlAddEventHandler ["ButtonDown",{[false] call Caue_DMV_Change;}];

    _control = _display displayCtrl 2100;
    private _faction = player getVariable ["faction","citizen"];

    if (_faction isEqualTo "dmv") exitWith {
        _index = _control lbAdd (["driver","name"] call Caue_Config_GetLicense);
        _control lbSetData [_index,"driver"];

        _index = _control lbAdd (["bike","name"] call Caue_Config_GetLicense);
        _control lbSetData [_index,"bike"];

        _index = _control lbAdd (["c3driver","name"] call Caue_Config_GetLicense);
        _control lbSetData [_index,"c3driver"];

        _index = _control lbAdd (["cdl","name"] call Caue_Config_GetLicense);
        _control lbSetData [_index,"cdl"];
    };

    if (_faction isEqualTo "faa") exitWith {
        _index = _control lbAdd (["pilot","name"] call Caue_Config_GetLicense);
        _control lbSetData [_index,"pilot"];

        _index = _control lbAdd (["hpilot","name"] call Caue_Config_GetLicense);
        _control lbSetData [_index,"hpilot"];
    };

    if (_faction isEqualTo "doj") exitWith {
        _index = _control lbAdd (["security","name"] call Caue_Config_GetLicense);
        _control lbSetData [_index,"security"];
    };

    if (_faction isEqualTo "police") exitWith {
        if ((getPlayerUID player) IN ["76561198166982296","76561198149798646","76561198221208684","76561198046050121"]) then {
            _index = _control lbAdd (["pilotcop","name"] call Caue_Config_GetLicense);
            _control lbSetData [_index,"pilotcop"];

            _index = _control lbAdd (["dtu","name"] call Caue_Config_GetLicense);
            _control lbSetData [_index,"dtu"];

            _index = _control lbAdd (["sert","name"] call Caue_Config_GetLicense);
            _control lbSetData [_index,"sert"];

            _index = _control lbAdd (["highway","name"] call Caue_Config_GetLicense);
            _control lbSetData [_index,"highway"];

            _index = _control lbAdd (["uscgcop","name"] call Caue_Config_GetLicense);
            _control lbSetData [_index,"uscgcop"];

            _index = _control lbAdd (["uscgsnipercop","name"] call Caue_Config_GetLicense);
            _control lbSetData [_index,"uscgsnipercop"];

            _index = _control lbAdd (["instructor","name"] call Caue_Config_GetLicense);
            _control lbSetData [_index,"instructor"];

            _index = _control lbAdd (["k9cop","name"] call Caue_Config_GetLicense);
            _control lbSetData [_index,"k9cop"];
        };

        if (["uscgcop"] call Caue_DMV_Check) then {
            _index = _control lbAdd (["fishing","name"] call Caue_Config_GetLicense);
            _control lbSetData [_index,"fishing"];

            _index = _control lbAdd (["boat","name"] call Caue_Config_GetLicense);
            _control lbSetData [_index,"boat"];
        };

        _index = _control lbAdd (["ccp","name"] call Caue_Config_GetLicense);
        _control lbSetData [_index,"ccp"];

        _index = _control lbAdd (["hunting","name"] call Caue_Config_GetLicense);
        _control lbSetData [_index,"hunting"];

        _index = _control lbAdd (["security","name"] call Caue_Config_GetLicense);
        _control lbSetData [_index,"security"];

        _index = _control lbAdd (["driver","name"] call Caue_Config_GetLicense);
        _control lbSetData [_index,"driver"];
    };

}, false] call Server_Setup_Compile;

['Caue_DMV_LbChanged', {

    params [
        ["_control",ctrlNull],
        ["_index",-1]
    ];

    private _display = findDisplay 21;
    private _player = [(_control lbData _index)] call Caue_Lib_UIDToObject;

    if (_index < 0) exitWith {};
    if (isNull _player) exitWith {};

    _control = _display displayCtrl 1501;
    lbClear _control;
    {
        _control lbAdd format ["%1",([_x,"name"] call Caue_Config_GetLicense)];
    } forEach (_player getVariable ["licenses",[]]);

}, false] call Server_Setup_Compile;

['Caue_DMV_Change', {

    if !([] call Caue_Player_AntiSpam) exitWith {};

    params [
        ["_add",true]
    ];

    private _display = findDisplay 21;

    private _control = _display displayCtrl 1500;
    private _index = lbCurSel _control;
    if (_index < 0) exitWith {["Você não selecionou alguem",Color_Red] call A3PL_HUD_Notification;};

    private _target = [(_control lbData _index)] call Caue_Lib_UIDToObject;
    if (isNull _target) exitwith {["Não é possível encontrar este player para emitir/revogar licença",Color_Red] call A3PL_HUD_Notification;};

    private _licenses = _target getVariable ["licenses",[]];

    private _control = _display displayCtrl 2100;
    if ((lbCurSel _control) < 0) exitwith {["Você não selecionou uma licença para emitir/revogar",Color_Red] call A3PL_HUD_Notification;};

    private _license = _control lbData (lbCurSel _control);

    private _unable = false;
    if (_add) then {
        if (_license in _licenses) then {_unable = true;};
    } else {
        if !(_license in _licenses) then {_unable = true;};
    };

    if (_unable) exitWith {["Não é possível emitir/revogar a licença porque o alvo já não tem essa licença",Color_Red] call A3PL_HUD_Notification;};

    if ((_add) && (_license isEqualTo "driver") && ((player getVariable ["job","unemployed"] != "dmv"))) exitWith {["Apenas o DMV pode emitir esta licença",Color_Red] call A3PL_HUD_Notification;};
    if ((_add) && (_license IN ["ccp","hunting","security"]) && (!(["instructor"] call Caue_DMV_Check))) exitWith {["Você não pode emitir esta licença",Color_Red] call A3PL_HUD_Notification;};

    [_target,_license,_add] remoteExec ["Server_DMV_Change",2];

    if (_add) then {
        [format["Você deu a %1 %2",_target getVariable ["name",(name _target)],[_license,"name"] call Caue_Config_GetLicense],Color_Green] call A3PL_HUD_Notification;
    } else {
        [format["Você revogou de %1 %2",_target getVariable ["name",(name _target)],[_license,"name"] call Caue_Config_GetLicense],Color_Green] call A3PL_HUD_Notification;
    };

}, false] call Server_Setup_Compile;

['Caue_DMV_Check', {

    params [
        ["_license","driver"],
        ["_player",player]
    ];

    private _return = false;

    if (_license IN (_player getVariable ["licenses",[]])) then {
        _return = true;
    };

    _return;

}, false] call Server_Setup_Compile;

/*
    Server
*/
['Server_DMV_Change', {

    params [
        ["_target",objNull],
        ["_license","driver"],
        ["_add",true]
    ];

    private _uid = getPlayerUID _target;
    private _licenses = _target getVariable ["licenses",[]];

    if (_add) then {
        if !(_license IN _licenses) then {
            _licenses pushBack _license;
            [format["Você recebeu %1",([_license,"name"] call Caue_Config_GetLicense)],Color_Green] remoteExec ["A3PL_HUD_Notification",_target];
            [_uid,"license_add",_license] call Caue_Log_Misc;
        };
    } else {
        if (_license IN _licenses) then {
            _licenses = _licenses - [_license];
            [format["Você perdeu %1",([_license,"name"] call Caue_Config_GetLicense)], Color_Red] remoteExec ["A3PL_HUD_Notification",_target];
            [_uid,"license_revoke",_license] call Caue_Log_Misc;
        };
    };

    _target setVariable ["licenses",_licenses,true];
    [format["DMV_Change:%2:%1",_uid,([_licenses] call Server_Database_Array)],1] spawn Server_Database_Async;

}, true] call Server_Setup_Compile;
