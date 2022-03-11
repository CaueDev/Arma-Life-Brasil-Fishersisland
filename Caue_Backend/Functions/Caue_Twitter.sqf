/*
    Client
*/
['Caue_Twitter_Init', {

    for "_i" from 0 to 7 do {
        Caue_TwitterMsg_Array set [_i,["", -1]];
    };

    waitUntil {!isNull (findDisplay 46)};
    736713 cutRsc ["Dialog_HUD_Twitter","PLAIN"];

    waitUntil {!isNil "Caue_Twitter_MsgDisplay"};
    [] call Caue_Twitter_MsgDisplay;

}, false] call Server_Setup_Compile;

['Caue_Twitter_Open', {

    736713 cutText ["","PLAIN"];
    createDialog "Dialog_Twitter";

    {
        _x params ["_logo","_text"];
        lbAdd [5120,_text];
        lbSetPicture [5120,_forEachIndex,_logo];
    } forEach Caue_TwitterChatLog;

    lbSetCurSel [5120,(count Caue_TwitterChatLog + 1)];

}, false] call Server_Setup_Compile;

['Caue_Twitter_Send', {

    private _msg = ctrlText 1400;
    closedialog 0;

    if ((count _msg) < 1) exitwith {};
    if ((count _msg) > 100) exitwith {["Você não pode escrever mais de 100 caracteres!",Color_Red] call A3PL_HUD_Notification;};
    if !(profilenamespace getVariable ["Caue_Twitter_Enabled",true]) exitwith {["Você tem seu twitter desativado!",Color_Red] call A3PL_HUD_Notification;};

    private _msgcolor = player getvariable ["twitterprofile",["\cauedev.github.io\twitter\citizen.paa","#ed7202","#B5B5B5"]] select 2;
    private _namecolor = player getvariable ["twitterprofile",["\cauedev.github.io\twitter\citizen.paa","#ed7202","#B5B5B5"]] select 1;
    private _namepicture = player getvariable ["twitterprofile",["\cauedev.github.io\twitter\citizen.paa","#ed7202","#B5B5B5"]] select 0;
    private _name = player getvariable ["name",(name player)];
    private _job = player getVariable ["job","unemployed"];

    if (_namepicture == "\cauedev.github.io\twitter\citizen.paa") then {
        if (_job isEqualTo "fifr") then {_namepicture = "\cauedev.github.io\twitter\ems.paa"; _namecolor = "#FF0000";};
        if (_job isEqualTo "police") then {_namepicture = "\cauedev.github.io\twitter\police.paa"; _namecolor = "#556B2F";};
        if (_job isEqualTo "faa") then {_namepicture = "\cauedev.github.io\twitter\faa.paa"; _namecolor = "#34495e";};
        if (_job isEqualTo "dmv") then {_namepicture = "\cauedev.github.io\twitter\dmv.paa"; _namecolor = "#57AEC2";};
        if (_job isEqualTo "doj") then {_namepicture = "\cauedev.github.io\twitter\doj.paa"; _namecolor = "#005BDB";};
        if (_job isEqualTo "gov") then {_namepicture = "\cauedev.github.io\twitter\gov.paa"; _namecolor = "#005BDB";};
        if ((getPlayerUID player) isEqualTo (Mayor select 0)) then {_namepicture = "\cauedev.github.io\twitter\mayor.paa"; _namecolor = "#005BDB";};
    };

    private _messageto = "";
    private _todatabase = true;
    private _commandexec = true;
    private _needcellphone = true;
    private _splitted = _msg splitstring " ";
    if (_msg find "/" == 0) then {_commandexec = false;};

    if (((toLower (_splitted select 0) == "/admin")) && !_commandexec) then {
        _splitted deleteat 0;
        _messageto = "support";
        _todatabase = false;
        _needcellphone = false;
        _commandexec = true;
        _msg = _splitted joinString " ";
        _name = format["Ajuda %1",_name];
        _namecolor = "#FFD700";
        _msgcolor = "#ffbfbf";
    };

    if (player_Twitteradminpwr) then {Caue_Twitter_Cooldown = 0; _needcellphone = false;};
    if ((!([] call A3PL_Lib_HasPhone)) && _needcellphone) exitwith {["Você não tem um celular, então você não pode enviar tweets"] call A3PL_HUD_Notification;};
    if ((player getVariable ["Cuffed",false]) || (player getVariable ["Tied",false]) || ((animationState player) IN ["A3PL_HandsupToKneel","A3PL_HandsupKneelGetCuffed","A3PL_Cuff","A3PL_HandsupKneelCuffed","a3pl_handsupkneelcuffed","A3PL_HandsupKneelKicked","A3PL_CuffKickDown","a3pl_idletohandsup","a3pl_kneeltohandsup","a3pl_handsuptokneel","A3PL_HandsupKneel"])) exitWith {["Você não pode fazer isso algemado/rendido.",Color_Red] call A3PL_HUD_Notification;};
    if (((diag_ticktime-(missionNameSpace getVariable ["Caue_Twitter_Cooldown",-45])) < 45) && _needcellphone) exitwith {[format ["Você precisa esperar mais %1 segundos para o seu próximo tweet",round (45-(diag_ticktime-Caue_Twitter_Cooldown))], Color_Red] call A3PL_HUD_Notification; };
    if (_needcellphone) then {Caue_Twitter_Cooldown = diag_ticktime;};

    if ((_splitted select 0 == "/911") && !_commandexec) then {
        _splitted deleteat 0;
        _messageto = "911";
        _todatabase = false;
        _commandexec = true;
        _msg = _splitted joinString " ";
        _name = format ["911 %1",_name];
        _namecolor = "#1c00db";
        _namepicture = "";
        Caue_Twitter_Cooldown = Caue_Twitter_Cooldown + 35;
    };

    if ((_splitted select 0 == "/311") && !_commandexec) then {
        _splitted deleteat 0;
        _messageto = "311";
        _todatabase = false;
        _commandexec = true;
        _msg = _splitted joinString " ";
        _name = format ["311 %1",_name];
        _namecolor = "#17ED00";
        _namepicture = "";
        Caue_Twitter_Cooldown = Caue_Twitter_Cooldown + 35;
    };

    if (((toLower (_splitted select 0) == "/anuncio")) && !_commandexec) then {
        _splitted deleteat 0;
        _todatabase = true;
        _commandexec = true;
        _msg = _splitted joinString " ";
        _name = format ["[ANUNCIO] %1",_name];
        _msg = _msg + format [" [%1]",(player getVariable ["phone_number","0"])];
        _namecolor = "#00bfbf";
        _msgcolor = "#4cffff";
    };

    if (((toLower (_splitted select 0) == "/deepweb")) && !_commandexec) then {
        _splitted deleteat 0;
        _todatabase = true;
        _commandexec = true;
        _msg = _splitted joinString " ";
        _namecolor = "#6b238e";
        _messageto = "deepweb";
    };

    if ((_splitted select 0 == "/ajuda") && !_commandexec) exitWith {
        Caue_Twitter_Cooldown = 0;
        ["/ajuda [comandos] | /911 [policia] | /311 [medicos] | /admin [admin] | /anuncio [anuncio] | /deepweb [anonimo]","#a3ffc1","","Comandos","#42f47d",""] spawn Caue_Twitter_NewMsg;
    };

    if (!_commandexec) exitwith {
        Caue_Twitter_Cooldown = 0;
        ["Comando não reconhecido (use /ajuda para ver os comandos)","#a3ffc1","","Comandos","#42f47d",""] spawn Caue_Twitter_NewMsg;
    };

    if (_todatabase) then {
        [(getPlayerUID player),_msg,_msgcolor,_namepicture,_name,_namecolor,_messageto] remoteExec ["Caue_Log_Chat",2];
    };

    [_msg,_msgcolor,_namepicture,_name,_namecolor,_messageto] remoteExec ["Caue_Twitter_NewMsg",-2];

}, false] call Server_Setup_Compile;

['Caue_Twitter_NewMsg', {

    disableSerialization;

    if (isNil "Caue_TwitterMsg_Array") exitWith {};
    if !(profilenamespace getVariable ["Caue_Twitter_Enabled",true]) exitwith {};

    params [
        ["_msg",""],
        ["_msgcolor",""],
        ["_msgpicture",""],
        ["_name",""],
        ["_namecolor",""],
        ["_messageto",""]
    ];

    private _msgduration = 20;
    private _maxmsg = 7;

    private _cancelaction = false;

    if (_messageto isEqualTo "support") then {
        if !(player_Twitteradminpwr) then {_cancelaction = true;};
    };

    if (_messageto isEqualTo "911") then {
        if !(player_Twitteradminpwr || ((player getVariable ["job","unemployed"]) IN ["police"])) then {_cancelaction = true;};
    };

    if (_messageto isEqualTo "311") then {
        if !(player_Twitteradminpwr || ((player getVariable ["job","unemployed"]) IN ["fifr"])) then {_cancelaction = true;};
    };

    if (_messageto isEqualTo "deepweb") then {
        _name = "[DEEP WEB] Anonimo";
        _msgpicture = "cauedev.github.io\twitter\deepweb.paa";
    };

    if (_cancelaction) exitWith {};

    _msg = _msg call Caue_Twitter_stripLineBreaks;
    _msg = _msg call Caue_Twitter_replaceAmpersands;

    private _logo = "";
    private _nametext = "";
    private _logname = "";
    private _logchat = "";
    private _messagelog = _msg;

    if !(_msgpicture isEqualTo "") then {
        _logo = format ["<t size='0.5'><img image='%1' /> </t>",_msgpicture];
    };

    if !(_name isEqualTo "") then {
        _nametext = format ["<t color='%1'>%2: </t>",_namecolor,_name];
        _logname = format ["%1",_name];
    };

    if ((_msgcolor find "#") != 0) then {
        switch (_msgcolor) do {
            case "red": {_msgcolor = "#FF0000";};
            case "green": {_msgcolor = "#00DB07";};
            default {_msgcolor = "#FFFFFF";};
        };
    };

    private _messageinfo = format ["<t color='%1'>%2</t>",_msgcolor,_msg];

    if ((count _logname) isEqualTo 0) then {
        _logchat = format ["%1",_messagelog];
    } else {
        _logchat = format ["%1: %2",_logname,_messagelog];
    };

    Caue_TwitterChatLog = Caue_TwitterChatLog + [[_msgpicture,_logchat]];

    while {(count Caue_TwitterChatLog) > 50} do {
        Caue_TwitterChatLog set [0,"delete"];
        Caue_TwitterChatLog = Caue_TwitterChatLog - ["delete"];
    };

    _msg = format ["%1%2%3",_logo,_nametext,_messageinfo];

    private _selmsg = 0;
    while {_selmsg < _maxmsg} do {
        Caue_TwitterMsg_Array set [_selmsg, Caue_TwitterMsg_Array select (_selmsg+1)];
        _selmsg = _selmsg + 1;
    };

    private _id = Caue_TwitterMsg_Counter + 1;
    Caue_TwitterMsg_Counter = Caue_TwitterMsg_Counter + 1;
    Caue_TwitterMsg_Array set [_maxmsg, [_msg, _id]];

    ((uiNamespace getVariable ["Dialog_HUD_Twitter", displayNull]) displayCtrl 1000) ctrlSetText "Twitter";

    call Caue_Twitter_MsgDisplay;

    [_id, _msgduration] spawn {
        params [
            ["_id",0],
            ["_msgduration",20]
        ];

        uiSleep _msgduration;

        {
            if ((_x select 1) == _id) exitWith {
                Caue_TwitterMsg_Array set [_forEachIndex, ["", -1]];
                call Caue_Twitter_MsgDisplay;
            };
        } forEach Caue_TwitterMsg_Array;

        private _last = false;
        {
            if !((_x select 0) isEqualTo "") exitwith {_last = false;};
            if ((_x select 0) isEqualTo "") then {_last = true;} else {_last = false;};
        } foreach Caue_TwitterMsg_Array;

        if (_last) then {((uiNamespace getVariable ["Dialog_HUD_Twitter", displayNull]) displayCtrl 1000) ctrlSetText "";};
    };

}, false] call Server_Setup_Compile;

['Caue_Twitter_MsgDisplay', {

    if (isDedicated) exitWith {};
    if (isNil "Caue_TwitterMsg_Array") exitWith {};

    disableSerialization;

    private _maxmsg = (8 - 1);
    private _block = "";

    for "_i" from 0 to _maxmsg do {
        private _text = (Caue_TwitterMsg_Array select _i) select 0;
        if !(_text isEqualTo "") then {
            _block = _block + _text + "<br />";
        };
    };

    ((uiNamespace getVariable ["Dialog_HUD_Twitter", displayNull]) displayCtrl 100) ctrlSetStructuredText parseText _block;

}, false] call Server_Setup_Compile;


/*
    Client Misc
*/
['Caue_Twitter_StripLineBreaks', {

    private _c_chr_backSlash = 92;
    private _c_chr_space = 32;
    private _c_chr_n = 110;
    private _c_chr_N2 = 78;
    private _c_chr_remove = 990;

    private _aaa = toArray _this;
    for "_i" from 0 to ((count _aaa)-2) do {
        if ((_aaa select _i == _c_chr_backSlash) && (_aaa select (_i+1) in [_c_chr_N2, _c_chr_n])) then {
            _aaa set [_i, _c_chr_space];
            _aaa set [_i+1, _c_chr_remove];
        };
    };

    _aaa = _aaa - [_c_chr_remove];

    toString _aaa

}, false] call Server_Setup_Compile;

['Caue_Twitter_ReplaceAmpersands', {

    private _aaa = toArray _this;
    private _ra = + _aaa;
    private _ja = 0;

    for "_i" from 0 to ((count _aaa)-1) do {
        private _ca = _aaa select _i;
        _ra set [_ja, _ca];

        if (_ca isEqualTo 38) then {
            _ra set [_ja+0, 38];
            _ra set [_ja+1, 97];
            _ra set [_ja+2, 109];
            _ra set [_ja+3, 112];
            _ra set [_ja+4, 59];
            _ja = _ja + 5;
        } else {
            _ja = _ja + 1;
        };
    };

    toString _ra

}, false] call Server_Setup_Compile;

/*
    Server
*/
['Server_Twitter_StripQuotes', {

    params [
        ["_msg",""]
    ];

    _msg = toArray _msg;

    private _del = [];
    {
        if (_x isEqualTo 39) then {_del pushback _forEachIndex;};
    } forEach _msg;

    {
        _msg deleteAt (_x - _forEachIndex);
    } forEach _del;

    _msg = toString _msg;
    _msg;

}, true] call Server_Setup_Compile;
