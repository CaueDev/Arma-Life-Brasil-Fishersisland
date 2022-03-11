['Caue_HUD_Init', {

    showHUD [true,true,true,true,false,false,false,true,true];

    disableSerialization;

    ("A3PL_Hud_Overlay" call BIS_fnc_rscLayer) cutRsc ["Dialog_HUD_Overlay","PLAIN"];

    Caue_nameTags = addMissionEventHandler ["Draw3D", {[] call Caue_HUD_NameTags}];

    [] spawn Caue_Twitter_Init;

    A3PL_HUD_Text = "";

    ["Sistema de mensagens iniciado"] call A3PL_HUD_Message;

    HudReady = true;

}, false] call Server_Setup_Compile;

['Caue_HUD_NameTags', {

    if (missionNamespace getVariable ["NameTagsOff",false]) exitWith {};

    private _nearP = nearestObjects [player,["Man"],15] select {isPlayer _x && {!(_x isEqualTo player)} && {!isObjectHidden _x} && {[objNull,"VIEW"] checkVisibility [eyePos player, eyePos _x] > 0}} apply {[_x,(getPlayerUID _x)]};
    {
        _x params ["_player","_uid"];

        private _pos = _player modelToWorldVisual ([0, 0, ((_player selectionPosition "head") select 2) + 0.6] vectorAdd [0, 0, (player distance _player) * 0.03]);
        private _color = [1, 1, 1, 1];

        private _name = "Desconhecido";

        {
            if(_uid isEqualTo (_x select 0)) exitWith {
                _name = _x select 1;
            };
        } forEach (profileNamespace getVariable ["Caue_Tags1",[]]);

        if ((headgear _player) in Config_Masks || (goggles _player) in Config_Masks || (uniform _player) in Config_Masks) then {_name = "Desconhecido";};

        _name = format["%1 - %2",(_player getVariable ["db_id",-1]),_name];

        if (_uid IN VIPS) then {
            _color = [1,0.65,0,1];
            _name = _name + " [VIP]"
        };

        if (_player getVariable ["speaking",false]) then {
            _color = [0.925,0.267,0.141,1];
        };

        if (_player getVariable ["speaking_radio",false]) then {
            _name = _name + " [RADIO]"
        };

        if (_player getVariable ["inadminform",false]) then {
            _color = [0.22,0.753,1,1];
            _name = format["Administrador - %1",(_player getVariable ["name",(name _player)])];
        };

        drawIcon3D ["", _color, _pos, 0, 1.3, 0, _name, 0, 0.035, "RobotoCondensed", "center"];
    } forEach _nearP;

    private _nearB = nearestObjects [player,["Land_A3PL_Showroom","Land_A3PL_Cinema","Land_A3PL_Gas_Station","Land_A3PL_Garage","land_smallshop_ded_smallshop_01_f","land_smallshop_ded_smallshop_02_f"],50] select {(!((_x getVariable ["bName",""]) isEqualTo ""))} apply {[_x,(_x getVariable ["bName",""])]};
    {
        _x params [
            "_obj",
            "_bName"
        ];

        private _pos = [];

        _pos = switch (typeOf _obj) do {
            case ("Land_A3PL_Showroom"): {_obj modelToWorld [10,0,0];};
            case ("land_smallshop_ded_smallshop_02_f"): {_obj modelToWorld [8,0,0];};
            case ("land_smallshop_ded_smallshop_01_f"): {_obj modelToWorld [8,0,0];};
            case ("Land_A3PL_Garage"): {_obj modelToWorld [6,2,-1];};
            case ("Land_A3PL_Cinema"): {_obj modelToWorld [0,9,-1];};
            case ("Land_A3PL_Gas_Station"): {_obj modelToWorld [-3.5,-0.65,-1];};
        };

        drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Actions\open_door_ca.paa",[1,1,1,1],_pos,0.5,0.5,45,_bName,1,0.03,"EtelkaNarrowMediumPro"];
    } forEach _nearB;

    private _nearI = nearestObjects [player,[],10] select {((count (_x getVariable ["bItem",[]])) > 0)} apply {[_x,(_x getVariable ["bItem",[]])]};
    {
        _x params [
            "_obj",
            "_bItem"
        ];

        private _icon = "";
        if (_obj isKindOf "LandVehicle") then {
            _icon = "\A3\ui_f\data\map\VehicleIcons\iconcar_ca.paa";
        } else {
            _icon = "\A3\ui_f\data\map\VehicleIcons\iconcratewpns_ca.paa";
        };

        private _pos = _obj modelToWorld [0,0,0.75];
        private _name = format ["$%1 - %2",_bItem select 0,_bItem select 1];

        drawIcon3D [_icon,[1,1,1,1],_pos, 0.5,0.5,45,_name,1,0.03,"EtelkaNarrowMediumPro"];
    } forEach _nearI;

}, false] call Server_Setup_Compile;

['Caue_Hud_Prompt', {

    params [
        ["_title", "", [""]],
        ["_text", "", [""]],
        ["_textOK", "", [""]],
        ["_textCancel", "", [""]],
        ["_display", findDisplay 46, [displayNull]],
        ["_useSmall", true, [true]]
    ];

    /* Error checks */
    if (_title isEqualTo "" || {_text isEqualTo ""} || {_textOK isEqualTo ""} || {_textCancel isEqualTo ""}) exitWith {false};

    closeDialog 0;

    /* Declare and define some default variables */
    Caue_Prompt_Return = nil;
    private _emptyDisplay = _display createDisplay "RscDisplayEmpty";
    private _ctrlName = ["Caue_ctrlPrompt", "Caue_ctrlPromptSmall"] select _useSmall;
    private _ctrl = _emptyDisplay ctrlCreate [_ctrlName, -1];
    private _ctrlTitle = _ctrl controlsGroupCtrl 3;
    private _ctrlText = _ctrl controlsGroupCtrl 4;
    private _ctrlButtonCancel = _ctrl controlsGroupCtrl 1;
    private _ctrlButtonOK = _ctrl controlsGroupCtrl 2;

    /* Block ESC */
    _emptyDisplay displaySetEventHandler ["KeyDown","if ((_this select 1) isEqualTo 1) then {true}"];

    /* Button to deny */
    _ctrlButtonCancel ctrlRemoveAllEventHandlers "ButtonClick";
    _ctrlButtonCancel ctrlAddEventHandler ["ButtonClick", {
        params [["_ctrl", controlNull, [controlnull]]];
        private _display = ctrlParent _ctrl;

        Caue_Prompt_Return = false;
        _display closeDisplay 2
    }];

    /* Button to accept */
    _ctrlButtonOK ctrlRemoveAllEventHandlers "ButtonClick";
    _ctrlButtonOK ctrlAddEventHandler ["ButtonClick", {
        params [["_ctrl", controlNull, [controlNull]]];
        private _display = ctrlParent _ctrl;

        Caue_Prompt_Return = true;
        _display closeDisplay 2
    }];

    /* Set text */
    _ctrlButtonCancel ctrlSetText _textCancel;
    _ctrlButtonOK ctrlSetText _textOK;
    _ctrlTitle ctrlSetText _title;
    _ctrlText ctrlSetText _text;

    /* Wait until an option is selected */
    waitUntil {!isNil "Caue_Prompt_Return"};
    Caue_Prompt_Return

}, false] call Server_Setup_Compile;

['Caue_HUD_Trunk', {

    params [
        ["_change",{}],
        ["_update",{}]
    ];

    closeDialog 0;
    createDialog "Caue_Trunk";
    private _display = findDisplay 8005003;

    TrunkChange = _change;

    /* Lists and filters */
    private _ctrlListMyInventory = _display displayCtrl 37;
    private _ctrlListFilterMyInventory = _display displayCtrl 36;
    private _ctrlListVehicleInventory = _display displayCtrl 45;
    private _ctrlListFilterVehicleInventory = _display displayCtrl 44;

    /* Footer */
    private _ctrlControlsGroupFooter = _display displayCtrl 46;
    private _ctrlButtonTake = _ctrlControlsGroupFooter controlsGroupCtrl 49;
    private _ctrlButtonStore = _ctrlControlsGroupFooter controlsGroupCtrl 50;
    private _ctrlButtonPlusAmount = _display displayCtrl 40;
    private _ctrlButtonMinusAmount = _display displayCtrl 41;


    /* Add eventhandlers */
    _ctrlButtonTake ctrlAddEventHandler ["ButtonClick", {
        private _display = ctrlParent param [0, controlNull, [controlNull]];
        [_display,true] spawn TrunkChange;
    }];
    _ctrlButtonStore ctrlAddEventHandler ["ButtonClick", {
        private _display = ctrlParent param [0, controlNull, [controlNull]];
        [_display,false] spawn TrunkChange;
    }];

    _ctrlButtonPlusAmount ctrlAddEventHandler ["ButtonClick", {
        private _display = ctrlParent param [0, controlNull, [controlNull]];
        private _plus = true;

        private _ctrlEditAmount = _display displayCtrl 39;
        private _ctrlText = ctrlText _ctrlEditAmount;
        private _currentAmount = parseNumber _ctrlText;
        private _newAmount = 0;

        _newAmount = [(_currentAmount - 1), (_currentAmount + 1)] select _plus;
        if (_newAmount < 1) then { _newAmount = 1; };

        _ctrlEditAmount ctrlSetText str _newAmount;
    }];
    _ctrlButtonMinusAmount ctrlAddEventhandler ["ButtonClick", {
        private _display = ctrlParent param [0, controlNull, [controlNull]];
        private _plus = false;

        private _ctrlEditAmount = _display displayCtrl 39;
        private _ctrlText = ctrlText _ctrlEditAmount;
        private _currentAmount = parseNumber _ctrlText;
        private _newAmount = 0;

        _newAmount = [(_currentAmount - 1), (_currentAmount + 1)] select _plus;
        if (_newAmount < 1) then { _newAmount = 1; };

        _ctrlEditAmount ctrlSetText str _newAmount;
    }];

    [_ctrlListFilterVehicleInventory, _ctrlListVehicleInventory] call BIS_fnc_initListNBoxSorting;
    [_ctrlListFilterMyInventory, _ctrlListMyInventory] call BIS_fnc_initListNBoxSorting;

    /* Update */
    [_display] spawn _update;

}, false] call Server_Setup_Compile;

["Caue_HUD_Progress",{

    if !(canSuspend) exitWith {false;};

    params [
        ["_duration",0],
        ["_text",""],
        ["_icon",""],
        ["_anim",""],
        ["_condition",{true}]
    ];

    if (isNil "Caue_Progress_Active") then {Caue_Progress_Active = false;};
    if (Caue_Progress_Active) exitWith {false;};

    Caue_Progress_Active = true;
    Caue_Progress_Ready = nil;
    private _return = false;

    [_duration,_text,_icon,_anim,_condition] spawn {
        params [
            ["_duration",0],
            ["_text",""],
            ["_icon",""],
            ["_anim",""],
            ["_condition",{true}]
        ];

        if (_duration isEqualTo 0) exitWith {Caue_Progress_Ready = false;};

        ("Caue_Progress" call BIS_fnc_rscLayer) cutRsc ["Caue_Progress","PLAIN"];
        private _display = uiNamespace getVariable "Caue_Progress";

        {
            _x ctrlSetFade 1;
            _x ctrlCommit 0;
        } forEach (allControls _display);

        uiSleep 0.3;

        {
            _x ctrlSetFade 0;
            _x ctrlCommit 1;
        } forEach (allControls _display);

        if (((currentWeapon player) != "") && (isNil "Caue_InterruptedDisabled")) then {
            Weapon_Holster = currentWeapon player;
            player action ["SwitchWeapon",player,player,100];
            player switchCamera cameraView;
        };

        if (_anim isEqualTo "default") then {
            _anim = "AinvPknlMstpSnonWnonDnon_medic_1";
        };

        if !(_anim isEqualTo "") then {
            [player,_anim,true] remoteExecCall ["A3PL_Lib_SyncAnim",-2];
            player switchMove _anim;
            player playMoveNow _anim;
        };

        private _ctrlControlsGroup = _display displayCtrl 1;
        private _ctrlStrucutredText = _ctrlControlsGroup controlsGroupCtrl 2;
        private _ctrlProgress = _ctrlControlsGroup controlsGroupCtrl 3;
        private _structuredText = [
            "<img image='%2' size='%4' shadow='0' align='left' /><t shadow='0' align='left'> </t><t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>",
            "<t shadow='0' font='RobotoCondensedLight' align='left'>%1</t><t shadow='0' font='RobotoCondensedLight' align='right'>%3</t>"
        ] select (_icon isEqualTo "");

        private _time = 0;
        private _ready = true;
        _duration = _duration / 3;
        while {_time < _duration} do {
            if (Caue_Interrupted) exitWith {
                Caue_Interrupted = false;
                _ready = false;
            };
            if !(call _condition) exitWith {
                _ready = false;
            };
            if (!(_anim isEqualTo "") && (animationState player != _anim)) then {
                [player,_anim,true] remoteExecCall ["A3PL_Lib_SyncAnim",-2];
     			player switchMove _anim;
     			player playMoveNow _anim;
     		};
            _percent = _time / _duration;
            _ctrlStrucutredText ctrlSetStructuredText parseText format [
                _structuredText,
                _text,
                _icon,
                (str round(_percent * 100) + "%"),
                (100 * (pixelH * pixelGrid * 0.50))
            ];
            _ctrlProgress progressSetPosition _percent;
            _random = 0.01 + random (0.005);
            uiSleep _random;
            _time = _time + _random;
        };

        {
            _x ctrlSetFade 1;
            _x ctrlCommit 1;
        } forEach (allControls _display);

        uiSleep 0.3;

        Caue_Progress_Ready = _ready;
        ("Caue_Progress" call BIS_fnc_rscLayer) cutText ["","PLAIN"];
        player playActionNow "stop";
    };

    waitUntil {!isNil "Caue_Progress_Ready"};

    _return = Caue_Progress_Ready;
    Caue_Progress_Ready = nil;
    Caue_Progress_Active = false;

    _return;

}, false] call Server_Setup_Compile;

['Caue_HUD_Loop', {

    if (isNil "LoadReady") exitWith {};

    disableSerialization;

    private _display = uiNamespace getVariable ["A3PL_HUDDisplay",displayNull];
    private _isHudEnabled = profileNamespace getVariable ["A3PL_HUD_Enabled",true];
    private _ctrl = controlNull;
    private _control = controlNull;

    if (isNull _display && _isHudEnabled) then {
        ("A3PL_Hud" call BIS_fnc_rscLayer) cutRsc ["Dialog_HUD","PLAIN"];
        _display = uiNamespace getVariable ["A3PL_HUDDisplay",displayNull];
        _ctrl = _display displayCtrl 9520;
        _ctrl ctrlSetFade 1;
        _ctrl ctrlCommit 0;
        _ctrl = _display displayCtrl 9521;
        _ctrl ctrlSetFade 1;
        _ctrl ctrlCommit 0;
    };

    if (!isNull _display && !_isHudEnabled) then {
        ("A3PL_Hud" call BIS_fnc_rscLayer) cutText ["","PLAIN"];
        uiNamespace setVariable ["A3PL_HUDDisplay",nil];
    };

    if (isNull _display) exitwith {};

    if ((player getVariable ["jail",0]) > 0) then {
        _control = _display displayCtrl 1000;
        _control ctrlShow true;
        _control ctrlSetText format["%1 Minuto(s) Restante(s)",(player getVariable ["jail",0])];
    } else {
        _control = _display displayCtrl 1000;
        _control ctrlShow false;
    };

    /* Health */
    _control = _display displayCtrl 1201;
    private _bloodLvl = (player getVariable ["Caue_MedicalVars",[5000]]) select 0;
    private _imgnr = round(((_bloodLvl/5000))*45);
    if (_imgnr < 1) then {
        _control ctrlSetText "";
    } else {
        _control ctrlSetText format ["A3PL_Common\HUD\New\MBLoad_%1.paa",_imgnr];
    };

    /* Hunger */
    _control = _display displayCtrl 1204;
    _imgnr = round(((player getVariable ["Player_Hunger",100])*45)/100);
    if (_imgnr < 1) exitwith {_control ctrlSetText "";};
    _control ctrlSetText format ["A3PL_Common\HUD\New\MBLoad_%1.paa",_imgnr];

    /* Thirst */
    _control = _display displayCtrl 1205;
    _imgnr = round (((player getVariable ["Player_Thirst",100])*45)/100);
    if (_imgnr < 1) exitwith {_control ctrlSetText "";};
    _control ctrlSetText format ["A3PL_Common\HUD\New\MBLoad_%1.paa",_imgnr];

    /* Name */
    _control = _display displayCtrl 1600;
    _control ctrlSetStructuredText parseText format ["<t font='PuristaBold' align='right'>%1</t>",toUpper (player getVariable ["name",(name player)])];

    /* Job */
    _control = _display displayCtrl 1601;
    _control ctrlSetStructuredText parseText format ["<t font='PuristaMedium' align='right'>%1</t>",toUpper ([(player getVariable ["job","unemployed"]),"name"] call Caue_Config_GetJob)];

    /* Stats */
    _control = _display displayCtrl 1602;
    private _text = missionNamespace getVariable ["HUD_STATSTIME",0];
    if (_text < 5) then {_control ctrlSetStructuredText parseText format ["<t font='PuristaSemiBold' align='left'>GRANA</t><t font='PuristaSemiBold' align='right' size=1>$%1</t>",([(player getVariable ["getjobplayerguy",0])] call Caue_Lib_NumberText)];};
    if (_text > 4 && _text < 10) then {_control ctrlSetStructuredText parseText format ["<t font='PuristaSemiBold' align='left'>BANCO</t><t font='PuristaSemiBold' align='right' size=1>$%1</t>",([(player getVariable ["getrankplayerguy",0])] call Caue_Lib_NumberText)];};
    if (_text > 9 && _text < 15) then {_control ctrlSetStructuredText parseText format ["<t font='PuristaSemiBold' align='left'>SALÁRIO</t><t font='PuristaSemiBold' align='right' size=1>%1 MIN</t>",(20 - (missionNameSpace getVariable ["player_paychecktime",0]))]};

    HUD_STATSTIME = _text + 1;
    if (HUD_STATSTIME > 14) then {HUD_STATSTIME = 0};

    _control = _display displayCtrl 1603;
    private _itemName = [player_itemClass,"name"] call Caue_Config_GetItem;
    if ((typeName _itemName) == "BOOL") then {_itemName = "Carregando nada";};
    _control ctrlSetStructuredText parseText format ["<t font='PuristaSemiBold' align='center' size='0.85'>%1<br/>FPS: %2<br/>Players: %3/90</t>",_itemName,round diag_fps,count allPlayers];

    private _tfmode = call {
        private _speakvolume = missionNamespace getVariable ["TF_speak_volume_level","normal"];
        if (_speakvolume isEqualTo "whispering") exitWith {"SUSSURRANDO"};
        if (_speakvolume isEqualTo "normal") exitWith {"NORMAL"};
        if (_speakvolume isEqualTo "yelling") exitWith {"GRITANDO"};
    };
    (_display displayCtrl 1251) ctrlSetText _tfmode;

}, false] call Server_Setup_Compile;

['Caue_HUD_IDCard', {

    disableSerialization;
    params [["_target",objNull]];

    if (isNull _target) exitWith {};

    ("Caue_IDCard" call BIS_fnc_rscLayer) cutRsc ["Caue_IDCard","PLAIN"];
    private _display = uiNamespace getVariable "Caue_IDCard";

    for "_i" from 1000 to 1014 do {
        (_display displayCtrl _i) ctrlSetFade 1;
        (_display displayCtrl _i) ctrlCommit 0;
    };

    (_display displayCtrl 1002) ctrlSetText (_target getVariable ["name",""]);
    (_display displayCtrl 1004) ctrlSetText (_target getVariable ["age",""]);
    (_display displayCtrl 1006) ctrlSetText format ["%1",(_target getVariable ["db_id",""])];
    (_display displayCtrl 1008) ctrlSetText (_target getVariable ["gender",""]);
    (_display displayCtrl 1010) ctrlSetText ([_target getVariable "date"] call Caue_Lib_FormatDate);
    (_display displayCtrl 1012) ctrlSetText (_target getVariable ["faction",""]);

    _licenses = "";
    {
        if (_forEachIndex isEqualTo 0) then {
            _licenses = format ["%1 ",([_x,"short"] call Caue_Config_GetLicense)];
        } else {
            _licenses = format ["%2, %1 ",_licenses,([_x,"short"] call Caue_Config_GetLicense)];
        };
    } foreach (_target getVariable ["licenses",[]]);
    (_display displayCtrl 1014) ctrlSetText _licenses;

    for "_i" from 1000 to 1014 do {
        (_display displayCtrl _i) ctrlSetFade 0;
        (_display displayCtrl _i) ctrlCommit 1.5;
    };

    uiSleep 15;

    for "_i" from 1000 to 1014 do {
        (_display displayCtrl _i) ctrlSetFade 1;
        (_display displayCtrl _i) ctrlCommit 1.5;
    };

    ("Caue_IDCard" call BIS_fnc_rscLayer) cutText ["","PLAIN"];
    uiNamespace setVariable ["Caue_IDCard",nil];

}, false] call Server_Setup_Compile;





['A3PL_HUD_Notification', {

    private _isHudEnabled = profileNamespace getVariable ["A3PL_HUD_Enabled",true];
    if (!_isHudEnabled) exitWith {};

    params [
        ["_msg",""],
        ["_color",Color_Red]
    ];

    [_msg,_color] call A3PL_HUD_Message;

    private _i = 0;
    private _title = "<t align = 'center' shadow = '1' size='1.1' font='PuristaBold'>Notificações</t>";
    private _final = "";

    Player_Notifications = [[_msg,_color]] + Player_Notifications;

    {
        if (_i <= 4) then {
            _final = format["<br /><br /><t align='center' color='%2'>%1</t>", (_x select 0), (_x select 1)] + _final;
            _i = _i + 1;
        };
    } forEach Player_Notifications;

    if (profilenamespace getVariable ["A3PL_HINT_Enabled",true]) then {
        hint parseText (_title + _final);
    };

    if ((count(Player_Notifications)) > 4) then {
        Player_Notifications deleteAt 5;
    };

}, false] call Server_Setup_Compile;

['A3PL_HUD_Message', {

    if (isNil "LoadReady") exitWith {};

    private _isHudEnabled = profileNamespace getVariable ["A3PL_HUD_Enabled",true];
    if (!_isHudEnabled) exitWith {
        ("A3PL_Hud" call BIS_fnc_rscLayer) cutText ["","PLAIN"];
        uiNameSpace setVariable ["A3PL_HUDDisplay",nil];
    };

    disableSerialization;
    params [
        ["_txt",""],
        ["_color",Color_Red],
        ["_time",20]
    ];

    private _display = uiNamespace getVariable "A3PL_HUDDisplay";
    private _control = _display displayCtrl 1104;

    private _text = format ["<t color='%1' font='RobotoCondensed' align='left'>%2</t><br />",_color,_txt];
    _control ctrlSetStructuredText parseText (A3PL_HUD_Text + _text);
    A3PL_HUD_Text = (A3PL_HUD_Text + _text);

    [_time] spawn {
        params [["_time",20]];
        uiSleep _time;
        [] call A3PL_HUD_Clear;
    };

}, false] call Server_Setup_Compile;







['A3PL_HUD_Clear', {

    if (isNil "LoadReady") exitWith {};

    disableSerialization;
    private ["_text","_display","_control","_delete"];
    _text = toArray A3PL_HUD_Text;
    {
        _delete = false;
        if (_x == 60) then
        {
            _index = _forEachIndex;

            if ((_text select (_index+1) == 98) && (_text select (_index+2) == 114) && (_text select (_index+3) == 32) && (_text select (_index+4) == 47) && (_text select (_index+5) == 62)) exitwith
            {
                _text deleteRange [0,_index+6];
                _display = uiNamespace getVariable "A3PL_HUDDisplay";
                _control = _display displayCtrl 1104;
                _control ctrlSetStructuredText parseText (toString _text);
                A3PL_HUD_Text = (toString _text);
                _delete = true;
            };
        };
        if (_delete) exitwith {};
    } foreach _text;

}, false] call Server_Setup_Compile;

['A3PL_HUD_SetOverlay', {

    if (isNil "LoadReady") exitWith {};

    disableSerialization;
    params [
        ["_path",""],
        ["_order",0],
        ["_opacity",1]
    ];

    private _idc = (uiNamespace getVariable "A3PL_Hud_Overlay") displayCtrl (1200 + _order);
    _idc ctrlSetText _path;
    _idc ctrlSetFade _opacity;
    _idc ctrlCommit 0;

}, false] call Server_Setup_Compile;
