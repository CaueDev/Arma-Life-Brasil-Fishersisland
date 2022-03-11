/*
    Main
*/
['Caue_Phone_Config', {

    Caue_Phone_Applications = [
        ["Phone","Telefone","\A3PL_Common\phone\icons\phone.paa","\A3PL_Common\phone\icons\selected\phone.paa",[""],"[] call Caue_Phone_AddNmrMenu", ""],
        ["Messages","Mensagens","\A3PL_Common\phone\icons\messages.paa","\A3PL_Common\phone\icons\selected\messages.paa",[""],"[] call Caue_Phone_OpenMessages", ""],
        ["Contacts","Contatos","\A3PL_Common\phone\icons\wantedm.paa","\A3PL_Common\phone\icons\selected\wantedm.paa",[""],"[] call Caue_Phone_OpenContacts", ""],
        ["Uber","Uber","\A3PL_Common\phone\icons\clock.paa","\A3PL_Common\phone\icons\selected\clock.paa",[""],"[] call A3PL_Uber_Open", ""],
        //["Synchronize","Sincronizar","\A3PL_Common\phone\icons\synchronize.paa","\A3PL_Common\phone\icons\selected\synchronize.paa",[""],"closedialog 0; [true] spawn Caue_Gear_Sync", ""],
        ["Settings","Configurações","\A3PL_Common\phone\icons\settings.paa","\A3PL_Common\phone\icons\selected\settings.paa",[""],"[] call Caue_Phone_OpenSettings", ""],
        ["Wiki","Wiki","\A3PL_Common\phone\icons\bank.paa","\A3PL_Common\phone\icons\selected\bank.paa",[""],"[] spawn Caue_Wiki_Open;", ""],
        ["My Faction","Facção","\A3PL_Common\phone\icons\playerm.paa","\A3PL_Common\phone\icons\selected\playerm.paa",[""],"closeDialog 0; [] spawn Caue_FactionSetup_Open;", "[(player getVariable ['faction', 'citizen'])] call Caue_FactionSetup_IsLeader"]
    ];

    Caue_Phone_AppLocations = [
        ["app1",1001,2001,3001],
        ["app2",1002,2002,3002],
        ["app3",1003,2003,3003],
        ["app4",1004,2004,3004],
        ["app5",1005,2005,3005],
        ["app6",1006,2006,3006],
        ["app7",1007,2007,3007],
        ["app8",1008,2008,3008],
        ["app9",1009,2009,3009],
        ["app10",1010,2010,3010],
        ["app11",1011,2011,3011],
        ["app12",1012,2012,3012],
        ["app13",1013,2013,3013],
        ["app14",1014,2014,3014],
        ["app15",1015,2015,3015],
        ["app16",1016,2016,3016],
        ["app17",1017,2017,3017],
        ["app18",1018,2018,3018],
        ["app19",1019,2019,3019],
        ["app20",1020,2020,3020]
    ];

    Caue_Phone_BackGrounds = [
        ["Default","\A3PL_Common\phone\backgrounds\background01.paa"],
        ["Triangles","\A3PL_Common\phone\backgrounds\background02.paa"],
        ["Blue Scratches","\A3PL_Common\phone\backgrounds\background03.paa"],
        ["Town","\A3PL_Common\phone\backgrounds\background04.paa"],
        ["Grand Theft Auto","\A3PL_Common\phone\backgrounds\background05.paa"],
        ["Rainbow Nyan","\A3PL_Common\phone\backgrounds\background06.paa"],
        ["Blue Nyan","\A3PL_Common\phone\backgrounds\background07.paa"],
        ["Star Nyan","\A3PL_Common\phone\backgrounds\background08.paa"],
        ["Tomb Raider","\A3PL_Common\phone\backgrounds\background09.paa"],
        ["Cats","\A3PL_Common\phone\backgrounds\background10.paa"],
        ["Grande","\A3PL_Common\phone\backgrounds\background11.paa"],
        ["Stars","\A3PL_Common\phone\backgrounds\background12.paa"],
        ["Dark-blue clouds","\A3PL_Common\phone\backgrounds\background13.paa"],
        ["Technology","\A3PL_Common\phone\backgrounds\background14.paa"],
        ["Uranus","\A3PL_Common\phone\backgrounds\background15.paa"],
        ["Space Sloth","\A3PL_Common\phone\backgrounds\background16.paa"],
        ["Burning Forest","\A3PL_Common\phone\backgrounds\background17.paa"],
        ["Pink Tree","\A3PL_Common\phone\backgrounds\background18.paa"],
        ["Tiger","\A3PL_Common\phone\backgrounds\background19.paa"],
        ["Counter Strike GO","\A3PL_Common\phone\backgrounds\background20.paa"],
        ["Gandalf","\A3PL_Common\phone\backgrounds\background21.paa"],
        ["Star Heaven","\A3PL_Common\phone\backgrounds\background22.paa"],
        ["Batman","\A3PL_Common\phone\backgrounds\background23.paa"]
    ];

    Caue_Phone_ConfigDone = true;

}, false] call Server_Setup_Compile;

['Caue_Phone_Open', {

    {
        if (["A3PL_Cellphone",_x] call BIS_fnc_inString) exitWith {
            player unassignItem _x;
            player removeItem _x;
            player linkItem "RoleplayRadio";
        };
    } forEach (assignedItems player);

    if !(["RoleplayRadio",format["%1",(call TFAR_fnc_activeSwRadio)]] call BIS_fnc_inString) exitWith {};

    if (isNil "Caue_Phone_ConfigDone") then {[] call Caue_Phone_Config;};

    if ((player getvariable "Caue_Call_Status" select 1) isEqualTo 1) exitWith {
        closeDialog 0;
        createDialog "Dialog_Phone_Active";

        Caue_Call_Status = 1;

        ctrlSetText [1001, (player getvariable "Caue_Call_Status" select 2)];
        ctrlSetText [1002, "Iniciando Chamada..."];
        ((uiNamespace getVariable "cellphone") displayCtrl 5521) ctrlSetText (profilenamespace getVariable ["CellPhone_Background","\A3PL_Common\phone\backgrounds\background01.paa"]);
    };

    if ((player getvariable "Caue_Call_Status" select 1) isEqualTo 2) exitWith {
        closeDialog 0;
        createDialog "Dialog_Phone_Incoming";
        ctrlSetText [1001, (player getvariable "Caue_Call_Status" select 2)];
        ((uiNamespace getVariable "cellphone") displayCtrl 5521) ctrlSetText (profilenamespace getVariable ["CellPhone_Background","\A3PL_Common\phone\backgrounds\background01.paa"]);
    };

    if ((player getvariable "Caue_Call_Status" select 1) isEqualTo 3) exitWith {
        closeDialog 0;
        createDialog "Dialog_Phone_Active";
        ctrlSetText [1001, (player getvariable "Caue_Call_Status" select 2)];
        ctrlSetText [1002, "Ativo..."];
        ((uiNamespace getVariable "cellphone") displayCtrl 5521) ctrlSetText (profilenamespace getVariable ["CellPhone_Background","\A3PL_Common\phone\backgrounds\background01.paa"]);
    };

    createdialog "A3PL_Open_CellPhone";
    ((uiNamespace getVariable "cellphone") displayCtrl 5521) ctrlSetText (profilenamespace getVariable ["CellPhone_Background","\A3PL_Common\phone\backgrounds\background01.paa"]);

    {
        private _can = true;
        private _cond = _x select 6;

        if !(_cond isEqualTo "") then {
            _cond = call compile _cond;

            if (_cond) then {
                _can = true;
            } else {
                _can = false;
            };
        };

        if (_can) then {
            _piclocation = (Caue_Phone_AppLocations select _forEachIndex) select 1;
            _buttonlocation = (Caue_Phone_AppLocations select _forEachIndex) select 2;
            _textlocation = (Caue_Phone_AppLocations select _forEachIndex) select 3;
            _apptext2 = parseText format["<t font='EtelkaNarrowMediumPro' color='#FFFFFF' size='0.6' align='center'>%1</t>", (_x select 1)];
            ((uiNamespace getVariable "cellphone") displayCtrl _buttonlocation) buttonsetAction format ["[] call (compile ((Caue_Phone_Applications select %1) select 5))",_forEachIndex];
            ((uiNamespace getVariable "cellphone") displayCtrl _buttonlocation) ctrlAddEventHandler ["MouseEnter",format ["_var = '%1';((findDisplay 12198) displayCtrl %2) ctrlSetText _var;",(_x select 3),_piclocation]];
            ((uiNamespace getVariable "cellphone") displayCtrl _buttonlocation) ctrlAddEventHandler ["MouseExit",format ["_var = '%1';((findDisplay 12198) displayCtrl %2) ctrlSetText _var;",(_x select 2),_piclocation]];
            ((uiNamespace getVariable "cellphone") displayCtrl _buttonlocation) ctrlAddEventHandler ["MouseExit", {((findDisplay 12198) displayCtrl 1001) ctrlSetText (_x select 3);}];
            ((uiNamespace getVariable "cellphone") displayCtrl _piclocation) ctrlSetText (_x select 2);
            ((uiNamespace getVariable "cellphone") displayCtrl _textlocation) ctrlSetStructuredText _apptext2;
        };
    } forEach Caue_Phone_Applications;

}, false] call Server_Setup_Compile;

['Caue_Phone_HUD', {

    75421 cutRsc ["Dialog_HUD_Cellphone", "PLAIN"];
    ((uiNamespace getVariable "Dialog_Cellphone_HUD") displayCtrl 1201) ctrlSetText (profilenamespace getVariable ["CellPhone_Background","\A3PL_Common\phone\backgrounds\background01.paa"]);

    private _type = _this select 0;

    if ((_type select 0) isEqualTo 0) then {
        private _timer = time;
        while {(player getvariable "Caue_Call_Status" select 1) != 0} do {
            sleep 1;
            if (player getvariable "Caue_Call_Status" select 1 == 1) then {
                ((uiNamespace getVariable "Dialog_Cellphone_HUD") displayCtrl 1100) ctrlSetStructuredText (parseText format ["<t font='PuristaSemiBold' align='center' size='0.6'>Chamando</t><t font='PuristaSemiBold' align='left' size='0.6'><br/>%1</t>",player getvariable "Caue_Call_Status" select 2]);
                _timer = time;
            };

            if (player getvariable "Caue_Call_Status" select 1 == 2) then {
                ((uiNamespace getVariable "Dialog_Cellphone_HUD") displayCtrl 1100) ctrlSetStructuredText (parseText format ["<t font='PuristaSemiBold' align='center' size='0.6'>Chamada Recebida...</t><t font='PuristaSemiBold' align='left' size='0.6'><br/>%1</t>",player getvariable "Caue_Call_Status" select 2]);
                _timer = time;
            };

            if (player getvariable "Caue_Call_Status" select 1 == 3) then {
                _calctimer = round (time - _timer);
                _mins = floor (_calctimer / 60);
                _secs = round (((_calctimer / 60) - _mins) * 60);
                if (_secs < 10) then { _secs = format ["0%1",_secs];};
                ((uiNamespace getVariable "Dialog_Cellphone_HUD") displayCtrl 1100) ctrlSetStructuredText (parseText format ["<t font='PuristaSemiBold' align='center' size='0.6'>Chamada Ativa...</t><t font='PuristaSemiBold' align='left' size='0.6'><br/>%1<br/>%2</t>",player getvariable "Caue_Call_Status" select 2,format ["%1:%2",_mins,_secs]]);
            };
        };

        ((uiNamespace getVariable "Dialog_Cellphone_HUD") displayCtrl 1100) ctrlSetStructuredText (parseText format ["<t font='PuristaSemiBold' align='center' size='0.6'>Chamada Finalizada...</t><t font='PuristaSemiBold' align='left' size='0.6'><br/>%1</t>",player getvariable "Caue_Call_Status" select 2]);
        sleep 3;
    };

    if ((_type select 0) isEqualTo 1) then {
        ((uiNamespace getVariable "Dialog_Cellphone_HUD") displayCtrl 1100) ctrlSetStructuredText (parseText format ["<t font='PuristaSemiBold' align='center' size='0.4'>MSG DE: %1</t><t font='PuristaSemiBold' align='left' size='0.6'><br/>%2</t>",_type select 1, _type select 2]);
        sleep 5;
    };

    75421 cutText ["","PLAIN"];

}, false] call Server_Setup_Compile;

/*
    Phone
*/
['Caue_Phone_AddNmrMenu', {

    disableSerialization;
    createdialog "callmenu";
    ((findDisplay 12194) displayCtrl 6644) buttonsetAction "[1] spawn Caue_Phone_AddNumber;";
    ((findDisplay 12194) displayCtrl 6646) buttonsetAction "[2] spawn Caue_Phone_AddNumber;";
    ((findDisplay 12194) displayCtrl 6648) buttonsetAction "[3] spawn Caue_Phone_AddNumber;";
    ((findDisplay 12194) displayCtrl 6650) buttonsetAction "[4] spawn Caue_Phone_AddNumber;";
    ((findDisplay 12194) displayCtrl 6652) buttonsetAction "[5] spawn Caue_Phone_AddNumber;";
    ((findDisplay 12194) displayCtrl 6654) buttonsetAction "[6] spawn Caue_Phone_AddNumber;";
    ((findDisplay 12194) displayCtrl 6656) buttonsetAction "[7] spawn Caue_Phone_AddNumber;";
    ((findDisplay 12194) displayCtrl 6658) buttonsetAction "[8] spawn Caue_Phone_AddNumber;";
    ((findDisplay 12194) displayCtrl 6661) buttonsetAction "[9] spawn Caue_Phone_AddNumber;";
    ((findDisplay 12194) displayCtrl 6663) buttonsetAction "[0] spawn Caue_Phone_AddNumber;";
    ((findDisplay 12194) displayCtrl 6642) buttonsetAction "[] call Caue_Phone_DialNumber;";

}, false] call Server_Setup_Compile;

['Caue_Phone_AddNumber', {

    params[
        ["_num",-1,[0]]
    ];

    if !(["RoleplayRadio",format["%1",(call TFAR_fnc_activeSwRadio)]] call BIS_fnc_inString) exitWith {};
    if (isNull (findDisplay 12194)) exitWith {};

    _currentNumber = ctrlText 6668;

    if (_num < 0) exitWith {
        if ((count _currentNumber) < 1) exitWith {};
        _currentNumber = _currentNumber select [0,((count _currentNumber)-1)];
        ctrlSetText [6668,_currentNumber];
    };

    if ((count _currentNumber) >= 7) exitWith {
        ["Phone: Max digits reached!", Color_Red] call A3PL_HUD_Notification;
    };

    _currentNumber = format["%1%2",_currentNumber,_num];
    ctrlSetText [6668,_currentNumber];

}, false] call Server_Setup_Compile;

['Caue_Phone_DialNumber', {

    params[
        ["_currentNumber","",[""]]
    ];

    if !(["RoleplayRadio",format["%1",(call TFAR_fnc_activeSwRadio)]] call BIS_fnc_inString) exitWith {};

    if (_currentNumber isEqualTo "") then {
        if (isNull (findDisplay 12194)) exitWith {};
        _currentNumber = ctrlText 6668;
    };

    if (_currentNumber in ["911"]) exitWith {
        [player,"police"] remoteExec ["Server_Police_CallDispatch",2];
        ["911"] spawn Caue_Phone_StartActive;
    };

    if (_currentNumber in ["311"]) exitWith {
        [player,"fifr"] remoteExec ["Server_Police_CallDispatch",2];
        ["311"] spawn Caue_Phone_StartActive;
    };

    private _target = objNull;
    {
        if (_x getVariable ["phone_number",""] == _currentNumber) exitWith {
            _target = _x;
        };
    } forEach allPlayers;

    if (isNull _target) exitWith {
        ["Número de telefone indisponível!", Color_Red] call A3PL_HUD_Notification;
        closeDialog 0;
    };

    if ((_target getvariable "Caue_Call_Status" select 1) != 0) exitwith {
        ["A pessoa já está em uma chamada.", Color_Red] call A3PL_HUD_Notification;
        closeDialog 0;
    };

    _setincontacts = _currentNumber;
    {
        if ((_x select 1) == _setincontacts) then {_setincontacts = _x select 0; };
    } foreach (profilenamespace getVariable ["Caue_PhoneContacts",[]]);

    player setVariable ["Caue_Call_Status",[_target,1,_setincontacts],true];

    [] spawn Caue_Phone_StartActive;
    [[0]] spawn Caue_Phone_HUD;

}, false] call Server_Setup_Compile;

/*
    Messages
*/
['Caue_Phone_OpenMessages', {

    createDialog "smsmenu";

    disableSerialization;
    private _background = uiNamespace getvariable "background";
    ((uiNamespace getVariable "cellphone") displayCtrl 5521) ctrlSetText (profilenamespace getVariable ["CellPhone_Background","\A3PL_Common\phone\backgrounds\background01.paa"]);

    ((findDisplay 75522) displayCtrl 1600) buttonsetAction "[] call Caue_Phone_OpenMessage;";
    ((findDisplay 75522) displayCtrl 1909) buttonsetAction "[] call Caue_Phone_DeleteMessage;";

    {
        _x params [
            "_number",
            "_read",
            "_messageArray"
        ];

        private _name = format ["%1",_number];

        {
            if (_number == (_x select 1)) then {
                _name = format ["%1 (%2)",_x select 0,_number];
            };
        } forEach (profilenamespace getVariable ["Caue_PhoneContacts",[]]);

        private _id = lbAdd [1500,_name];
        lbSetValue [1500,_id,_forEachIndex];

        if (_read) then {
            lbSetPicture [1500,_id,"A3PL_Common\GUI\read.paa"];
        } else {
            lbSetPicture [1500,_id,"A3PL_Common\GUI\new.paa"];
        };
    } forEach (profileNamespace getVariable ["Caue_PhoneMessages",[]]);

}, false] call Server_Setup_Compile;

['Caue_Phone_OpenMessage', {

    params [
        ["_id",-1,[0]]
    ];

    if (_id < 0) then {
        Caue_Phone_OpenMessageID = lbCurSel 1500;
    } else {
        Caue_Phone_OpenMessageID = _id;
    };

    if (Caue_Phone_OpenMessageID < 0) exitWith {["Nenhuma mensagem selecionada!", Color_Red] call A3PL_HUD_Notification;};

    closeDialog 0;
    createDialog "smsmessagemenu";
    disableSerialization;
    private _background = uiNamespace getvariable "background";
    ((uiNamespace getVariable "cellphone") displayCtrl 5521) ctrlSetText (profilenamespace getVariable ["CellPhone_Background","\A3PL_Common\phone\backgrounds\background01.paa"]);

    ((findDisplay 751282) displayCtrl 1601) buttonsetAction "closeDialog 0;";
    ((findDisplay 751282) displayCtrl 1602) buttonsetAction "[] call Caue_Phone_SendMessage;";

    private _messages = profileNamespace getVariable ["Caue_PhoneMessages",[]];
    private _messageLine = _messages select Caue_Phone_OpenMessageID;

    private _texts = "";

    {
        _x params ["_num","_text"];

        if (_num == (player getVariable ["phone_number",""])) then {
            _texts = format["<t color='#00FFFF'><t align='right'>%1</t></t><br />",_text] + _texts;
        } else {
            _texts = format["<t color='#00FF00'><t align='left'>%1</t></t><br />",_text] + _texts;
        };
    } forEach (_messageLine select 2);

    private _display = findDisplay 751282;
    private _ctrl = _display displayCtrl 1100;
    _ctrl ctrlSetStructuredText parseText _texts;

    _messageLine set [1, true];
    _messages set [Caue_Phone_OpenMessageID, _messageLine];
    profileNamespace setVariable ["Caue_PhoneMessages",_messages];

}, false] call Server_Setup_Compile;

['Caue_Phone_TextNumber', {

    params[
        ["_num","",[""]]
    ];

    if (_num isEqualTo "") then {
        _num = ctrlText 1001;
    };

    private _id = [_num] call Caue_Phone_FindMessageInList;

    if (_id > -1) exitWith {
        [_id] call Caue_Phone_OpenMessage;
    };

    private _messages = profileNamespace getVariable ["Caue_PhoneMessages",[]];
    _messages pushBack [_num,true,[]];
    profileNamespace setVariable ["Caue_PhoneMessages",_messages];
    Caue_Phone_OpenMessageID = ((count _messages)-1);

    closeDialog 0;
    createDialog "smsmessagemenu";
    disableSerialization;
    private _background = uiNamespace getvariable "background";
    ((uiNamespace getVariable "cellphone") displayCtrl 5521) ctrlSetText (profilenamespace getVariable ["CellPhone_Background","\A3PL_Common\phone\backgrounds\background01.paa"]);

    ((findDisplay 751282) displayCtrl 1603) buttonsetAction "closeDialog 0;";
    ((findDisplay 751282) displayCtrl 1603) buttonsetAction "[] call Caue_Phone_SendMessage;";

    private _display = findDisplay 751282;
    private _ctrl = _display displayCtrl 1100;
    _ctrl ctrlSetStructuredText parseText "<br /><br /><br /><br /><t color='#FFFFFF'><t align='center'>Nenhuma mensagem ainda!</t></t>";

}, false] call Server_Setup_Compile;

['Caue_Phone_SendMessage', {

    private _newMessage = ctrlText 1400;
    private _messages = profileNamespace getVariable ["Caue_PhoneMessages",[]];
    private _messageLine = _messages select Caue_Phone_OpenMessageID;

    _targetNumber = _messageLine select 0;
    _target = objNull;
    {
        if (_targetNumber == (_x getVariable ["phone_number",""])) exitWith {
            _target = _x;
        };
    } forEach allPlayers;

    if (isNull _target) exitWith {["Número atualmente indisponível!", Color_Red] call A3PL_HUD_Notification;};

    [player,_newMessage] remoteExec ["Caue_Phone_RecieveMessage",_target];

    _curMessages = _messageLine select 2;
    _curMessages pushBack [(player getVariable ["phone_number",""]),_newMessage];
    _messageLine set [2,_curMessages];
    _messages set [Caue_Phone_OpenMessageID, _messageLine];
    profileNamespace setVariable ["Caue_PhoneMessages",_messages];

    closeDialog 0;

}, false] call Server_Setup_Compile;

['Caue_Phone_RecieveMessage', {

    params [
        ["_sender",objNull,[objNull]],
        ["_message","",[""]]
    ];

    private _num = _sender getVariable ["phone_number",""];
    private _messages = profileNamespace getVariable ["Caue_PhoneMessages",[]];

    private _id = [_num] call Caue_Phone_FindMessageInList;
    if (_id > -1) then {
        private _messageLine = _messages select _id;
        private _curMessages = _messageLine select 2;
        _curMessages pushBack [_num,_message];
        _messageLine set [2, _curMessages];
        _messageLine set [1, false];
        _messages set [_id, _messageLine];
    } else {
        _messages pushBack [_num,false,[[_num,_message]]];
    };

    profileNamespace setVariable ["Caue_PhoneMessages",_messages];

    ["Nova mensagem de texto!",Color_Green] call A3PL_HUD_Notification;
    [[1,_num,_message]] spawn Caue_Phone_HUD;

}, false] call Server_Setup_Compile;

['Caue_Phone_FindMessageInList', {

    params[
        ["_num","",[""]]
    ];

    private _id = -1;
    private _messages = profileNamespace getVariable ["Caue_PhoneMessages",[]];

    {
        if ((_x select 0) == _num) exitWith {
            _id = _forEachIndex;
        };
    } forEach _messages;

    _id

}, false] call Server_Setup_Compile;

/*
    Contacts
*/
['Caue_Phone_OpenContacts', {

    createdialog "contactsmenu";
    disableSerialization;
    private _background = uiNamespace getvariable "background";
    ((uiNamespace getVariable "cellphone") displayCtrl 5521) ctrlSetText (profilenamespace getVariable ["CellPhone_Background","\A3PL_Common\phone\backgrounds\background01.paa"]);

    ((findDisplay 7732) displayCtrl 1600) buttonsetAction "closedialog 0; [] call Caue_Phone_AddNmrMenu; ctrlSetText [6668,(((profilenamespace getVariable [""Caue_PhoneContacts"",[]]) select (lbCurSel ((findDisplay 7732) displayCtrl 1500))) select 1)];";
    ((findDisplay 7732) displayCtrl 1601) buttonsetAction "closedialog 0; [(((profilenamespace getVariable [""Caue_PhoneContacts"",[]]) select (lbCurSel ((findDisplay 7732) displayCtrl 1500))) select 1)] call Caue_Phone_TextNumber;";
    ((findDisplay 7732) displayCtrl 1602) buttonsetAction "[] call Caue_Phone_RemContact;";
    ((findDisplay 7732) displayCtrl 1603) buttonsetAction "[] call Caue_Phone_UpdContact;";
    ((findDisplay 7732) displayCtrl 1604) buttonsetAction "[] call Caue_Phone_AddContact;";

    lbClear ((findDisplay 7732) displayCtrl 1500);

    {
        selectedtext = format ["%1 (%2)",_x select 0,_x select 1];
        ((findDisplay 7732) displayCtrl 1500) lbAdd selectedtext;
    } forEach (profilenamespace getVariable ["Caue_PhoneContacts",[]]);

    ((findDisplay 7732) displayCtrl 1001) ctrlSetText format ["%1/50",(count (profilenamespace getVariable ["Caue_PhoneContacts",[]]))];
    ((findDisplay 7732) displayCtrl 1500) lbSetCurSel (count (profilenamespace getVariable ["Caue_PhoneContacts",[]]) + 1);

}, false] call Server_Setup_Compile;

['Caue_Phone_AddContact', {

    private _name = ctrlText ((findDisplay 7732) displayCtrl 1400);
    private _cellphone = ctrlText ((findDisplay 7732) displayCtrl 1401);
    private _notes = ctrlText ((findDisplay 7732) displayCtrl 1403);

    if ((_name isEqualTo "") || ((count _name) > 19)) exitWith {["Você precisa preencher um nome!", Color_Red] call A3PL_HUD_Notification;};
    if ((_cellphone isEqualTo "") || ((count _cellphone) != 7)) exitWith {["Você precisa preencher um número correto!", Color_Red] call A3PL_HUD_Notification;};
    if ((count _notes > 150)) exitWith {["Não pode ter mais de 150 caracteres!", Color_Red] call A3PL_HUD_Notification;};

    private _contacts_list = profilenamespace getVariable ["Caue_PhoneContacts",[]];
    if ((count _contacts_list > 49)) exitWith {["Você não pode ter mais de 50 contatos!", Color_Red] call A3PL_HUD_Notification;};
    _contacts_list = _contacts_list + [[_name,_cellphone,_notes]];
    profilenamespace setVariable ["Caue_PhoneContacts",_contacts_list];

    lbClear ((findDisplay 7732) displayCtrl 1500);
    {
        selectedtext = format ["%1 (%2)",_x select 0,_x select 1];
        ((findDisplay 7732) displayCtrl 1500) lbAdd selectedtext;
    } forEach (profilenamespace getVariable ["Caue_PhoneContacts",[]]);

    ((findDisplay 7732) displayCtrl 1001) ctrlSetText format ["%1/50",(count (profilenamespace getVariable ["Caue_PhoneContacts",[]]))];
    ((findDisplay 7732) displayCtrl 1500) lbSetCurSel (count (profilenamespace getVariable ["Caue_PhoneContacts",[]]) + 1);

}, false] call Server_Setup_Compile;

['Caue_Phone_UpdContact', {

    private _cursel = lbCurSel ((findDisplay 7732) displayCtrl 1500);
    if (_cursel == -1) exitwith {};

    private _name = ctrlText ((findDisplay 7732) displayCtrl 1400);
    private _cellphone = ctrlText ((findDisplay 7732) displayCtrl 1401);
    private _notes = ctrlText ((findDisplay 7732) displayCtrl 1403);

    if ((_name == "") || ((count _name) > 19)) exitWith {["Você precisa preencher um nome!", Color_Red] call A3PL_HUD_Notification;};
    if ((_cellphone == "") || ((count _cellphone) != 7)) exitWith {["Você precisa preencher um número correto!", Color_Red] call A3PL_HUD_Notification;};
    if ((count _notes) > 150) exitWith {["Não pode ter mais de 150 caracteres!", Color_Red] call A3PL_HUD_Notification;};

    private _contacts_list = profilenamespace getVariable ["Caue_PhoneContacts",[]];
    if((count _contacts_list > 19)) exitWith {["Você não pode ter mais de 50 contatos!", Color_Red] call A3PL_HUD_Notification;};
    _contacts_list set [_cursel,[_name,_cellphone,_notes]];
    profilenamespace setVariable ["Caue_PhoneContacts",_contacts_list];

    lbClear ((findDisplay 7732) displayCtrl 1500);

    {
        selectedtext = format ["%1 (%2)",_x select 0,_x select 1];
        ((findDisplay 7732) displayCtrl 1500) lbAdd selectedtext;
    } foreach (profilenamespace getVariable ["Caue_PhoneContacts",[]]);

    ((findDisplay 7732) displayCtrl 1001) ctrlSetText format ["%1/50",(count (profilenamespace getVariable ["Caue_PhoneContacts",[]]))];
    ((findDisplay 7732) displayCtrl 1500) lbSetCurSel _cursel;

}, false] call Server_Setup_Compile;

['Caue_Phone_RemContact', {

    private _cursel = lbCurSel ((findDisplay 7732) displayCtrl 1500);
    if (_cursel == -1) exitwith {};

    private _contacts_list = profilenamespace getVariable ["Caue_PhoneContacts",[]];
    _contacts_list set [_cursel,"deletethis"];
    _contacts_list = _contacts_list - ["deletethis"];
    profilenamespace setVariable ["Caue_PhoneContacts",_contacts_list];

    private _msg = format ["Você excluiu com sucesso: %1 (%2)",(ctrlText ((findDisplay 7732) displayCtrl 1400)),(ctrlText ((findDisplay 7732) displayCtrl 1401))];

    lbClear ((findDisplay 7732) displayCtrl 1500);

    {
        selectedtext = format ["%1 (%2)",_x select 0,_x select 1];
        ((findDisplay 7732) displayCtrl 1500) lbAdd selectedtext;
    } foreach (profilenamespace getVariable ["Caue_PhoneContacts",[]]);

    ((findDisplay 7732) displayCtrl 1001) ctrlSetText format ["%1/50",(count (profilenamespace getVariable ["Caue_PhoneContacts",[]]))];
    ((findDisplay 7732) displayCtrl 1500) lbSetCurSel (count (profilenamespace getVariable ["Caue_PhoneContacts",[]]) + 1);

}, false] call Server_Setup_Compile;

['Caue_Phone_SelContact', {

    private _cursel = lbCurSel ((findDisplay 7732) displayCtrl 1500);
    if (_cursel == -1) exitwith {};

    ((findDisplay 7732) displayCtrl 1400) ctrlSetText (((profilenamespace getVariable ["Caue_PhoneContacts",[]]) select _cursel) select 0);
    ((findDisplay 7732) displayCtrl 1401) ctrlSetText (((profilenamespace getVariable ["Caue_PhoneContacts",[]]) select _cursel) select 1);
    ((findDisplay 7732) displayCtrl 1403) ctrlSetText (((profilenamespace getVariable ["Caue_PhoneContacts",[]]) select _cursel) select 2);

}, false] call Server_Setup_Compile;

/*
    Settings
*/
['Caue_Phone_OpenSettings', {

    disableSerialization;
    createDialog "settingsmenu";

    private _background = uiNamespace getvariable "background";
    ((uiNamespace getVariable "cellphone") displayCtrl 5521) ctrlSetText (profilenamespace getVariable ["CellPhone_Background","\A3PL_Common\phone\backgrounds\background01.paa"]);

    ((findDisplay 751991) displayCtrl 1600) buttonsetAction "[] call Caue_Phone_savesettings;";
    ((findDisplay 751991) displayCtrl 1601) buttonsetAction "closedialog 0;";
    ((findDisplay 751991) displayCtrl 2100) ctrlAddEventHandler ["LBSelChanged","[] call Caue_Phone_changedBgSettings;"];
    (findDisplay 751991) displayAddEventHandler ["unLoad", {waituntil {!isNull (findDisplay 751991)}; [] call Caue_Phone_Open;}];

    ((findDisplay 751991) displayCtrl 1001) ctrlSetText format ["Seu número de celular é: %1",(player getVariable ["phone_number","0"])];

    private _selection = 0;
    {
        params ["_bgname"];
        if (profilenamespace getVariable ["CellPhone_Background","\A3PL_Common\phone\backgrounds\background01.paa"] == (_x select 1)) then {_selection = _forEachIndex};
        ((findDisplay 751991) displayCtrl 2100) lbAdd _bgname;
    } forEach Caue_Phone_BackGrounds;

    ((findDisplay 751991) displayCtrl 2100) lbSetCurSel _selection;
    if (profilenamespace getVariable ["Caue_Twitter_Enabled",true]) then {((findDisplay 751991) displayCtrl 2800) cbSetChecked true;};

    sliderSetRange [1900, 3.125, 50];
    sliderSetPosition [1900,getTerrainGrid];
    ((findDisplay 751991) displayCtrl 1900) ctrlAddEventHandler ["SliderPosChanged","setTerrainGrid (param [1,getTerrainGrid]);"];

    if (profilenamespace getVariable ["A3PL_HUD_Enabled",false]) then {((findDisplay 751991) displayCtrl 2801) cbSetChecked true;};

    if (profilenamespace getVariable ["A3PL_HINT_Enabled",true]) then {((findDisplay 751991) displayCtrl 2802) cbSetChecked true;};

    {
        lbAdd [2102,(_x select 1)];
    } foreach ((player getvariable "twitterprofile") select 3);

    {
        lbAdd [2101,(_x select 1)];
    } foreach ((player getvariable "twitterprofile") select 4);

    lbSetCurSel [2101,0];
    lbSetCurSel [2102,0];

}, false] call Server_Setup_Compile;

['Caue_Phone_SaveSettings', {

    private _selected = lbCurSel ((findDisplay 751991) displayCtrl 2100);
    profilenamespace setVariable ["CellPhone_Background",((Caue_Phone_BackGrounds select _selected) select 1)];
    profilenamespace setVariable ["Caue_Twitter_Enabled",(cbChecked ((findDisplay 751991) displayCtrl 2800))];
    profileNamespace setVariable ["A3PL_HUD_Enabled",(cbChecked ((findDisplay 751991) displayCtrl 2801))];
    profileNamespace setVariable ["A3PL_HINT_Enabled",(cbChecked ((findDisplay 751991) displayCtrl 2802))];

    private _array = player getvariable "twitterprofile";
    private _selectedtag = (((player getvariable "twitterprofile") select 3) select (lbCurSel 2102)) select 0;
    private _selectedtext = (((player getvariable "twitterprofile") select 4) select (lbCurSel 2101)) select 0;
    private _selectedname = "#ed7202";

    {
        if ((_x select 0) == _selectedtag) exitwith {_selectedname = _x select 1;};
    } foreach [
        ["\cauedev.github.io\twitter\chief.paa","#1E90FF"],
        ["\cauedev.github.io\twitter\citizen.paa","#ed7202"],
        ["\cauedev.github.io\twitter\director.paa","#FFFF32"],
        ["\cauedev.github.io\twitter\don_green.paa","#0af326"],
        ["\cauedev.github.io\twitter\executive.paa","#8833a4"],
        ["\cauedev.github.io\twitter\leadchief.paa","#1E90FF"],
        ["\cauedev.github.io\twitter\secretary.paa","#2CCDAB"],
        ["\cauedev.github.io\twitter\sub-director.paa","#ff8e2b"]
    ];

    _array set [0,_selectedtag];
    _array set [1,_selectedname];
    _array set [2,_selectedtext];

}, false] call Server_Setup_Compile;

['Caue_Phone_ChangedBgSettings', {

    private _selected = lbCurSel ((findDisplay 751991) displayCtrl 2100);
    private _selbackground = (Caue_Phone_BackGrounds select _selected) select 1;
    ((uiNamespace getVariable "cellphone") displayCtrl 5521) ctrlSetText (_selbackground);

}, false] call Server_Setup_Compile;

/*
    Calls
*/
['Caue_Phone_StartActive', {

    params [
        ["_num","",[""]]
    ];

    if !(["RoleplayRadio",format["%1",(call TFAR_fnc_activeSwRadio)]] call BIS_fnc_inString) exitWith {};

    closeDialog 0;
    createDialog "Dialog_Phone_Active";

    if (_num != "") then {
        ctrlSetText [1001, _num];
    } else {
        ctrlSetText [1001,(player getvariable "Caue_Call_Status" select 2)];
        [player] remoteExec ["Caue_Phone_IncomingCall",(player getvariable "Caue_Call_Status" select 0)];
    };

    ctrlSetText [1002, "Iniciando Chamada..."];

    uiSleep 15;

    if ((player getvariable "Caue_Call_Status" select 1) isEqualTo 1) exitWith {
        ctrlSetText [1002, "Chamada Falhou..."];
        sleep 3;
        closeDialog 0;
        (player getvariable "Caue_Call_Status" select 0) setvariable ["Caue_Call_Status",[(player getvariable "Caue_Call_Status" select 0),0,""],true];
        player setvariable ["Caue_Call_Status",[player,0,""],true];
    };

}, false] call Server_Setup_Compile;

['Caue_Phone_IncomingCall', {

    params[
        ["_caller",objNull,[objNull]]
    ];

    if !(["RoleplayRadio",format["%1",(call TFAR_fnc_activeSwRadio)]] call BIS_fnc_inString) exitWith {};
    if(isNull _caller) exitWith {};

    private _setincontacts = _caller getVariable ["phone_number","ERROR!"];
    {
        if ((_x select 1) == _setincontacts) then {_setincontacts = _x select 0;};
    } forEach (profileNamespace getVariable ["Caue_PhoneContacts",[]]);

    player setVariable ["Caue_Call_Status",[_caller,2,_setincontacts],true];

    [[0]] spawn Caue_Phone_HUD;

}, false] call Server_Setup_Compile;

['Caue_Phone_AnswerCall', {

    if !(["RoleplayRadio",format["%1",(call TFAR_fnc_activeSwRadio)]] call BIS_fnc_inString) exitWith {};

    closeDialog 0;
    createDialog "Dialog_Phone_Active";

    ctrlSetText [1001, (player getvariable "Caue_Call_Status" select 0) getVariable ["phone_number",""]];
    ctrlSetText [1002, "Ativo..."];

    player setVariable ["Caue_Call_Status",[(player getvariable "Caue_Call_Status" select 0),3,(player getvariable "Caue_Call_Status" select 2)],true];
    [] remoteExec ["Caue_Phone_CallAccepted",(player getvariable "Caue_Call_Status" select 0)];
    OldFreq = (call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getSwFrequency;
    [(call TFAR_fnc_activeSwRadio), 1, (getPlayerUid (player getvariable "Caue_Call_Status" select 0))] call TFAR_fnc_SetChannelFrequency;
    [(call TFAR_fnc_activeSwRadio), 0] call TFAR_fnc_setSwChannel;

}, false] call Server_Setup_Compile;

['Caue_Phone_CallAccepted', {

    if !(["RoleplayRadio",format["%1",(call TFAR_fnc_activeSwRadio)]] call BIS_fnc_inString) exitWith {};

    player setVariable ["Caue_Call_Status",[(player getvariable "Caue_Call_Status" select 0),3,(player getvariable "Caue_Call_Status" select 2)],true];
    ctrlSetText [1002, "Ativo..."];
    OldFreq = (call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getSwFrequency;
    [(call TFAR_fnc_activeSwRadio), 1, (getPlayerUid player)] call TFAR_fnc_SetChannelFrequency;
    [(call TFAR_fnc_activeSwRadio), 0] call TFAR_fnc_setSwChannel;

}, false] call Server_Setup_Compile;

['Caue_Phone_Endcall', {

    if !(["RoleplayRadio",format["%1",(call TFAR_fnc_activeSwRadio)]] call BIS_fnc_inString) exitWith {};

    closeDialog 0;

    [] remoteExec ["Caue_Phone_CallEnded",(player getvariable "Caue_Call_Status" select 0)];

    [(call TFAR_fnc_activeSwRadio), 1, (missionNamespace getVariable ["OldFreq","35"])] call TFAR_fnc_SetChannelFrequency;
    [(call TFAR_fnc_activeSwRadio), 0] call TFAR_fnc_setSwChannel;

    if (player getVariable ["busy",false]) then {
        player setVariable ["busy",false,true];
        [((player getvariable "Caue_Call_Status") select 0)] remoteExec ["Server_Police_EndDispatch",2];
    };

    player setvariable ["Caue_Call_Status",[player,0,""],true];

}, false] call Server_Setup_Compile;

['Caue_Phone_CallEnded', {

    if !(["RoleplayRadio",format["%1",(call TFAR_fnc_activeSwRadio)]] call BIS_fnc_inString) exitWith {};

    if !(isNull (findDisplay 5002)) then {closeDialog 0;};

    player setvariable ["Caue_Call_Status",[player,0,""],true];
    [(call TFAR_fnc_activeSwRadio), 1, (missionNamespace getVariable ["OldFreq","35"])] call TFAR_fnc_SetChannelFrequency;
    [(call TFAR_fnc_activeSwRadio), 0] call TFAR_fnc_setSwChannel;

    if (player getVariable ["busy",false]) then {
        player setVariable ["busy",false,true];
        [((player getvariable "Caue_Call_Status") select 0)] remoteExec ["Server_Police_EndDispatch",2];
    };

}, false] call Server_Setup_Compile;
