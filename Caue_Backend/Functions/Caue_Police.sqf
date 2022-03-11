/*
    Client
*/
['Caue_Police_Cuff', {

    params [
        ["_obj",objNull],
        ["_type",""]
    ];

    if ((isNull _obj) || (_type isEqualTo "")) exitWith {};

    private _var = if (_type isEqualTo "handcuffs") then {"Cuffed";} else {"Tied";};
    if (_obj getVariable [_var,false]) exitWith {};

    private _anim = 100;
    _anim = [_obj] call {
        private _state = animationState (_this select 0);
        if (_state IN ["amovpercmstpsnonwnondnon","amovpercmstpsraswrfldnon","amovpercmstpsraswpstdnon","amovpercmstpsraswlnrdnon"]) exitwith {1};
        if (_state == "a3pl_idletohandsup") exitwith {2};
        if (_state == "a3pl_handsuptokneel") exitwith {3};
        if (_state IN ["amovpknlmstpsnonwnondnon","amovpknlmstpsraswpstdnon","amovpknlmstpsraswrfldnon","amovpknlmstpsraswlnrdnon"]) exitwith {4};
        if (_state IN ["amovppnemstpsnonwnondnon","amovppnemstpsraswrfldnon","amovppnemstpsraswpstdnon"]) exitwith {5};
        if (_state == "unconscious") exitwith {5};
        if (true) exitWith {1};
    };

    if (_anim isEqualTo 100) exitWith {};

    [player,_obj,_anim] remoteExec ["Caue_Police_CuffAnim",-2];
    [false] call Caue_Inventory_PutBack;
    [_type,-1] call Caue_Inventory_Add;
    _obj setVariable [_var,true,true];

    if (_var isEqualTo "Cuffed") then {
        playSound3D ["cauedev.github.io\sounds\police\handcuffson.ogg", player, false, getPos player, 3, 1, 15];
    } else {
        playSound3D ["cauedev.github.io\sounds\crime\tieup.ogg", player, false, getPos player, 3, 1, 15];
    };

}, false] call Server_Setup_Compile;

['Caue_Police_UnCuff', {

    params [
        ["_obj",objNull],
        ["_type",""]
    ];

    if ((isNull _obj) || (_type isEqualTo "")) exitWith {};

    private _var = if (_type isEqualTo "handcuffs") then {"Cuffed";} else {"Tied";};
    if !(_obj getVariable [_var,false]) exitWith {};

    [player,_obj,7] remoteExec ["Caue_Police_CuffAnim",-2];
    [_type,1] call Caue_Inventory_Add;
    _obj setVariable [_var,false,true];

    if (_var isEqualTo "Cuffed") then {
        playSound3D ["cauedev.github.io\sounds\police\handcuffsoff.ogg", player, false, getPos player, 3, 1, 15];
    } else {
        playSound3D ["cauedev.github.io\sounds\crime\tieup.ogg", player, false, getPos player, 3, 1, 15];
    };

}, false] call Server_Setup_Compile;

['Caue_Police_CuffAnim', {

    params [
        ["_cop",objNull],
        ["_civ",objNull],
        ["_number",100]
    ];

    if ((isNull _cop) || (isNull _civ) || (_number isEqualTo 100)) exitWith {};

    switch (_number) do {
        case 1: {
            if (local _civ) then {
                if (!isPlayer _civ) exitwith {
                    _civ setdir ((getDir _civ) + 50);
                };
                player setdir ((getDir player) + 50);
            };

            [_cop,_civ] spawn {
                params ["_cop","_civ"];

                _civ switchmove "A3PL_HandsupToKneel";
                sleep 5;
                _civ switchmove "A3PL_HandsupKneelGetCuffed";
                _cop switchmove "A3PL_Cuff";
                if (local _cop) then {
                    _cop attachTo [_civ,[0,0,0]];
                };
                sleep 4;
                if (local _cop) then {
                    detach _cop;
                };
                _civ switchmove "A3PL_HandsupKneelCuffed";
                _cop switchmove "";
            };
        };
        case 2: {
            [_cop,_civ] spawn {
                params ["_cop","_civ"];

                _civ switchmove "A3PL_HandsupToKneel";
                sleep 5;
                _civ switchmove "A3PL_HandsupKneelGetCuffed";
                _cop switchmove "A3PL_Cuff";
                if (local _cop) then {
                    _cop attachTo [_civ,[0,0,0]];
                };
                sleep 4;
                if (local _cop) then {
                    detach _cop;
                };
                _civ switchmove "A3PL_HandsupKneelCuffed";
                _cop switchmove "";
            };
        };
        case 3: {
            [_cop,_civ] spawn {
                params ["_cop","_civ"];

                _civ switchmove "A3PL_HandsupKneelGetCuffed";
                _cop switchmove "A3PL_Cuff";
                if (local _cop) then {
                    _cop attachTo [_civ,[0,0,0]];
                };
                sleep 4;
                if (local _cop) then {
                    detach _cop;
                };
                _civ switchmove "A3PL_HandsupKneelCuffed";
                _cop switchmove "";
            };
        };
        case 4: {
            if (local _civ) then {
                if (!isPlayer _civ) exitwith {
                    _civ setdir ((getDir _civ) + 50);
                };
                player setdir ((getDir player) + 50);
            };

            [_cop,_civ] spawn {
                private ["_cop","_civ"];
                _cop = _this select 0;
                _civ = _this select 1;

                _civ switchmove "A3PL_HandsupKneelGetCuffed";
                _cop switchmove "A3PL_Cuff";
                if (local _cop) then {
                    _cop attachTo [_civ,[0,0,0]];
                };
                sleep 4;
                if (local _cop) then {
                    detach _cop;
                };
                _civ switchmove "A3PL_HandsupKneelCuffed";
                _cop switchmove "";
            };
        };
        case 5: {
            if (local _civ) then {
                if (!isPlayer _civ) exitwith {
                    _civ setdir ((getDir _civ) + 50);
                };
                player setdir ((getDir player) + 50);
            };
            _civ switchmove "A3PL_HandsupKneelKicked";
        };
        case 6: {
            [_cop,_civ] spawn {
                params ["_cop","_civ"];

                _cop switchmove "A3PL_CuffKickDown";
                if (local _cop) then {
                    _cop attachTo [_civ,[0,0,0]];
                };
                sleep 1;
                _civ switchmove "A3PL_HandsupKneelKicked";
                sleep 3;
                _cop switchmove "";
                if (local _cop) then {
                    detach _cop;
                };
                if (local _civ) then {
                    if (!isPlayer _civ) exitwith {
                        _civ setdir ((getDir _civ) - 50);
                    };
                    player setdir ((getDir player) - 50);
                };
            };
        };
        case 7: {
            _civ spawn {
                if (local _this) then {
                    _this setdir ((getDir _this) - 50);
                };
                if (animationState _this == "a3pl_handsupkneelcuffed") then {
                    _this switchmove "amovpknlmstpsnonwnondnon";
                } else {
                    _this switchmove "amovppnemstpsnonwnondnon";
                };
            };
        };
    };

}, false] call Server_Setup_Compile;

['Caue_Police_CuffKick', {

    params ["_obj"];

    if (animationState _obj IN ["a3pl_handsupkneelcuffed"]) exitwith {
        [player,_obj,6] remoteExec ["Caue_Police_CuffAnim",-2];
    };

}, false] call Server_Setup_Compile;

['Caue_Police_Drag', {

    params ["_unit"];

    if (isNull (player getVariable ["dragged",objNull])) then {
        _unit setVariable ["isdragged",true,true];
        player setVariable ["dragged",_unit];
        _unit attachTo [player,[0.1,1.1,0]];
        player reveal _unit;
    } else {
        _unit = player getVariable ["dragged",objNull];
        detach _unit;
        player setVariable ["dragged",objNull];
        _unit setVariable ["isdragged",false,true];
    };

}, false] call Server_Setup_Compile;

['Caue_Police_Detain', {

    params [
        ["_unit",objNull]
    ];

    if (isNull _unit || !isPlayer _unit) exitWith {};

    _nearestVehicle = nearestObjects[getPosATL player,["Car","Ship","Submarine","Air"],10] select 0;
    if (isNil "_nearestVehicle") exitWith {["Não há nenhum veiculo por perto", Color_Red] call A3PL_HUD_Notification;};

    detach _unit;
    [_unit,""] remoteExec ["A3PL_Lib_SyncAnim",-2];
    [_nearestVehicle] remoteExec ["A3PL_Lib_MoveInPass",_unit];

}, false] call Server_Setup_Compile;

['Caue_Police_UnDetain', {

    params [
        ["_vehicle",objNull]
    ];

    if (isNull _vehicle) exitWith {};
    if ((player distance _vehicle) > 5) exitWith {};
    if ((speed _vehicle) >= 4) exitWith {};

    {
        _x action ["getOut",_vehicle];
        [_x,_vehicle] spawn {
            params [
                ["_pass",objNull],
                ["_vehicle",objNull]
            ];

            if ((isNull _pass) || (isNull _vehicle)) exitWith {};

            if ((_pass getVariable ["Cuffed",false]) || (_pass getVariable ["Tied",false])) then {
                sleep 1.5;
                _pass setVelocityModelSpace [0,3,1];
                [_pass,"a3pl_handsupkneelcuffed"] remoteExec ["A3PL_Lib_SyncAnim",-2];
            };
        };
    } forEach (crew _vehicle);

    ["Todos os passageiros foram ejetados",Color_Red] call A3PL_HUD_Notification;

}, false] call Server_Setup_Compile;

['Caue_Police_TicketOpen', {

    disableSerialization;

    Ticket_Amount = Nil;
    Ticket_Ready = Nil;

    closeDialog 0;
    createDialog "Caue_Edit";
    ctrlSetText [8323,"Escrever"];
    ctrlSetText [8322,"1"];
    buttonSetAction [8323,"Ticket_Ready = true;"];

    waitUntil {(!(isNil "Ticket_Ready") || (isNull (findDisplay 8320)))};

    if (isNull (findDisplay 8320)) exitWith {};

    private _amount = round(parseNumber (ctrlText 8322));
    if (_amount < 1) exitwith {["Por favor, insira um valor de multa válido", Color_Red] call A3PL_HUD_Notification;};

    closeDialog 0;
    Player_Item = "A3PL_Ticket" createVehicle (getPos player);
    Player_Item attachTo [player,[0,0,0],"RightHand"];
    Player_ItemClass = "ticket";
    Ticket_Amount = _amount;
    ["Você criou uma multa, agora olhe para um jogador para dar a ele", Color_Green] call A3PL_HUD_Notification;
    Ticket_Ready = Nil;

}, false] call Server_Setup_Compile;

['Caue_Police_TicketGive', {

    params [
        ["_player",objNull]
    ];

    if (isNull _player) exitWith {["Você não está olhando para um jogador", Color_Red] call A3PL_HUD_Notification;};
    if (!isPlayer _player) exitwith {["Você não está olhando para um jogador", Color_Red] call A3PL_HUD_Notification;};
    if (isNil "Ticket_Amount") exitwith {["Não é possível dar a multa, o valor da multa não está definido", Color_Red] call A3PL_HUD_Notification;};

    [Player_Item] call Caue_Inventory_Clear;
    [format["Você deu uma multa para %1",(_player getVariable ["name",name _player])],Color_Green] call A3PL_HUD_Notification;
    [Ticket_Amount,player] remoteExec ["Caue_Police_TicketReceive",_player];
    player playMove 'AmovPercMstpSnonWnonDnon_AinvPercMstpSnonWnonDnon_Putdown';
    Ticket_Amount = Nil;

}, false] call Server_Setup_Compile;

['Caue_Police_TicketReceive', {

    params [
        ["_price",1],
        ["_cop",objNull]
    ];

    if (["Multa",format["Valor da multa $%1 você deseja pagar?",([_price] call Caue_Lib_NumberText)],"Sim","Não"] call Caue_Hud_Prompt) then {
        closeDialog 0;
        private _cash = player getVariable ["getjobplayerguy",0];
        private _bank = player getVariable ["getrankplayerguy",0];
        if ((_price > _cash) && (_price > _bank)) exitwith {
            ["O cidadão não tem dinheiro suficiente para pagar a multa",Color_Red] remoteExec ["A3PL_HUD_Notification",_cop];
            ["Você não tem dinheiro suficiente para pagar esta multa",Color_Red] call A3PL_HUD_Notification;
        };
        private _pricecop = (_price / 100) * 25;

        [_price,player] remoteExec ["Server_Police_TicketPay",2];
        [format["O cidadão pagou a multa, e voce recebeu $%1",_pricecop],Color_Green] remoteExec ["A3PL_HUD_Notification",_cop];
        ["Você pagou a multa",Color_Green] call A3PL_HUD_Notification;
    } else {
        closeDialog 0;
        ["O cidadão recusou-se a pagar a multa",Color_Red] remoteExec ["A3PL_HUD_Notification",_cop];
        ["Você se recusou a pagar a multa",Color_Red] call A3PL_HUD_Notification;
    };

}, false] call Server_Setup_Compile;

['Caue_Police_JailOpen', {

    disableSerialization;
    params[["_target",objNull,[objNull]]];

    Jail_Ready = nil;

    closeDialog 0;
    createDialog "Caue_Edit";
    private _text = if ((_target getVariable ["jail",0]) > 0) then {"Atualizar"} else {"Prender"};
    private _texttime = if ((_target getVariable ["jail",0]) > 0) then {str(_target getVariable "jail")} else {"1"};
    ctrlSetText [8323,_text];
    ctrlSetText [8322,_texttime];
    buttonSetAction [8323,"Jail_Ready = true;"];

    waitUntil {(!(isNil "Jail_Ready") || (isNull (findDisplay 8320)))};

    if (isNull (findDisplay 8320)) exitWith {};

    private _time = round(parseNumber (ctrlText 8322));
    if (_time < 1) exitwith {["Por favor, insira um valor válido", Color_Red] call A3PL_HUD_Notification;};
    if (_time > 1440) exitWith {["Incapaz de prender por mais de 24 horas!",Color_Red] call A3PL_HUD_Notification;};

    _target setVariable ["jail",_time,true];
    [] remoteExec ["Caue_Police_JailLoop",_target];
    closeDialog 0;

}, false] call Server_Setup_Compile;

['Caue_Police_JailLoop', {

    private _timejail = 0;
    for "_i" from 0 to 1 step 0 do {
        uiSleep 60;
        _timejail = player getVariable ["jail",0];
        if (_timejail isEqualTo 0) exitWith {
            if ((count (nearestObjects[player,["Land_A3PL_Prison"],50])) > 0) then {
                player setPosATL [4754.44,6311.55,0.0928328];
                player setDir 160;
                removeUniform player;
            } else {

            };
            player setVariable ["jail",0,true];
            ["Sentença de prisão completada!",Color_Green] call A3PL_HUD_Notification;
        };
        player setVariable ["jail",(_timejail - 1),true];
    };

}, false] call Server_Setup_Compile;

['Caue_Police_DatabaseOpen', {

    if !(player getVariable ["job","unemployed"] in ["police","dmv","doj","fifr"]) exitWith {["Você não está de plantão como um policial",Color_Red] call A3PL_HUD_Notification;};

    private _text = "<t align='center'>F.I.S.T. Computador Policial</t><br /><t align='center'>Digite 'help' para ver todos os comandos</t><br />> please login";
    player setVariable ["PoliceDatabaseStruc",_text,false];
    player setVariable ["PoliceDatabaseLogin",false,false];
    disableSerialization;
    closeDialog 0;
    createDialog "Dialog_PoliceDatabase";
    private _display = findDisplay 211;
    _display displayAddEventHandler ["KeyDown", "if ((_this select 1) == 28) then {[] call Caue_Police_DatabaseEnter;}"];

    [_text] call Caue_Police_UpdateComputer;

}, false] call Server_Setup_Compile;

['Caue_Police_UpdateComputer', {

    params[
        ["_input","",[""]],
        ["_new",false,[false]]
    ];

    private _display = findDisplay 211;
    private _control = _display displayCtrl 1100;

    private _array = [_input, "<br />"] call CBA_fnc_split;

    if ((count _array) > 21) then {
        private _remove = (count _array) - 21;
        for "_i" from 0 to (_remove - 1) do {
            _array deleteAt 0;
        };
    };

    private _text = [_array, "<br />"] call CBA_fnc_join;
    player setVariable ["PoliceDatabaseStruc",_text,false];
    _control ctrlSetStructuredText parseText _text;

}, false] call Server_Setup_Compile;

['Caue_Police_DatabaseEnter', {

    disableSerialization;
    private _display = findDisplay 211;

    private _control = _display displayCtrl 1401;
    private _edit = ctrlText _control;

    private _newstruct = format["%1<br />%2",(player getVariable "PoliceDatabaseStruc"),"> "+_edit];
    player setVariable ["PoliceDatabaseStruc",_newstruct,false];

    [_newstruct] call Caue_Police_UpdateComputer;

    _control = _display displayCtrl 1401;
    _control ctrlSetText "";

    private _edit0 = [_edit,0] call Caue_Police_DatabaseArgu;
    if ((_edit0 IN A3PL_Police_DatabaseRequireLogin) && (!(player getVariable "PoliceDatabaseLogin"))) exitwith {
        _newstruct = format["%1<br />%2",(player getVariable "PoliceDatabaseStruc"),"Você não tem permissão para usar este comando"];
        player setVariable ["PoliceDatabaseStruc",_newstruct,false];
        [_newstruct] call Caue_Police_UpdateComputer;
    };

    private _output = "";
    switch (_edit0) do {
        case "help": {
            _output = "
            	<t align='center'>help - Exibir todos os comandos</t><br />
            	<t align='center'>clear - Limpar a tela</t><br />
            	<t align='center'>login [senha] - Login para usar comandos</t><br />
            	<t align='center'>lookup [nome] [sobrenome] - Mostrar informações sobre a pessoa</t><br />
            	<t align='center'>lookuplicense [placa] - Mostrar informações sobre a placa</t><br />
            	<t align='center'>warrantlist [nome] [sobrenome] - Lista de pessoas procuradas</t><br />
            	<t align='center'>warrantinfo [nome] [sobrenome] [numero do mandato] - Informações de procurado</t><br />
            	<t align='center'>removewarrant [nome] [sobrenome] [numero do mandato] - Remover procurado</t><br />
            	<t align='center'>ticketlist [nome] [sobrenome] - Exibir histórico de multas</t><br />
            	<t align='center'>warninglist [nome] [sobrenome] - Exibir histórico de avisos</t><br />
            	<t align='center'>arrestlist [nome] [sobrenome] - Exibir histórico de detenção</t><br />
            	<t align='center'>insertwarrant [nome] [sobrenome] [título] [descrição] - Inserir procura</t><br />
            	<t align='center'>insertticket [nome] [sobrenome] [quantia] [descrição] - Inserir multa</t><br />
            	<t align='center'>insertwarning [nome] [sobrenome] [título] [descrição] - Inserir aviso</t><br />
            	<t align='center'>insertarrest [nome] [sobrenome] [tempo] [descrição] - Inserir prisão</t><br />
            ";
        };

        case "clear": {_output = "<t align='center'>F.I.S.T. Computador Policial</t><br /><t align='center'>Digite 'help' para ver todos os comandos disponíveis</t>";};

        case "login": {
            private _pass = [_edit,1] call Caue_Police_DatabaseArgu;
            if (_pass isEqualTo "cowboy") then {
                player setVariable ["PoliceDatabaseLogin",true,false];
                _output = "Agora você está logado";
            } else {
                _output = "Erro: login inválido";
            };
        };

        case "lookup": {
            private _name = ([_edit,1] call Caue_Police_DatabaseArgu) + " " + ([_edit,2] call Caue_Police_DatabaseArgu);
            [player,_name,_edit0] remoteExec ["Server_Police_Database",2];
            _output = format ["Buscando cidadão no banco de dados...",_name];
        };

        case "lookuplicense": {
            private _license = [_edit,1] call Caue_Police_DatabaseArgu;
            [player,_license,_edit0] remoteExec ["Server_Police_Database", 2];
            _ouput = format["Procurando pela placa %1...",_license];
        };

        case "warrantlist": {
            private _name = ([_edit,1] call Caue_Police_DatabaseArgu) + " " + ([_edit,2] call Caue_Police_DatabaseArgu);
            [player,_name,_edit0] remoteExec ["Server_Police_Database", 2];
            _output = format ["Procurando no banco de dados por mandatos ativos..",_name];
        };

        case "warrantinfo": {
            private _name = ([_edit,1] call Caue_Police_DatabaseArgu) + " " + ([_edit,2] call Caue_Police_DatabaseArgu);
            private _offset = (parseNumber ([_edit,3] call Caue_Police_DatabaseArgu)) - 1;

            if (_offset < 0) exitwith {_output = format ["Syntax Incorreta, consulte o manual de operação",_name];};

            [player,_name,_edit0,_offset] remoteExec ["Server_Police_Database", 2];
            _output = format ["Pesquisando no banco de dados por este número de mandato...",_name];
        };

        case "removewarrant": {
            private _name = ([_edit,1] call Caue_Police_DatabaseArgu) + " " + ([_edit,2] call Caue_Police_DatabaseArgu);
            private _offset = (parseNumber ([_edit,3] call Caue_Police_DatabaseArgu)) - 1;

            if (_offset < 0) exitwith {_output = format ["Syntax Incorreta, consulte o manual de operação",_name];};

            [player,_name,_edit0,_offset] remoteExec ["Server_Police_Database", 2];
            _output = format ["Pesquisando no banco de dados por este número de mandato...",_name];
        };

        case "ticketlist": {
            private _name = ([_edit,1] call Caue_Police_DatabaseArgu) + " " + ([_edit,2] call Caue_Police_DatabaseArgu);
            [player,_name,_edit0] remoteExec ["Server_Police_Database", 2];
            _output = format ["Pesquisando no banco de dados por este historico de multas...",_name];
        };

        case "arrestlist": {
            private _name = ([_edit,1] call Caue_Police_DatabaseArgu) + " " + ([_edit,2] call Caue_Police_DatabaseArgu);
            [player,_name,_edit0] remoteExec ["Server_Police_Database", 2];
            _output = format ["Pesquisando no banco de dados por este histórico de prisão...",_name];
        };

        case "warninglist": {
            private _name = ([_edit,1] call Caue_Police_DatabaseArgu) + " " + ([_edit,2] call Caue_Police_DatabaseArgu);
            [player,_name,_edit0] remoteExec ["Server_Police_Database", 2];
            _output = format ["Pesquisando no banco de dados por este histórico de avisos...",_name];
        };

        case "insertwarrant": {
            private _name = ([_edit,1] call Caue_Police_DatabaseArgu) + " " + ([_edit,2] call Caue_Police_DatabaseArgu);
            private _title = ([_edit,3] call Caue_Police_DatabaseArgu);

            private _array = _edit splitString " ";
            for "_i" from 1 to 4 do {
                _array deleteAt 0;
            };

            private _info = [_array," "] call CBA_fnc_join;
            private _issuedBy = player getVariable ["name",name player];

            [player,[_name,_title,_info,_issuedBy],_edit0] remoteExec ["Server_Police_Database",2];
            _output = format ["Inserindo mandato no banco de dados..."];
        };

        case "insertticket": {
            private _name = ([_edit,1] call Caue_Police_DatabaseArgu) + " " + ([_edit,2] call Caue_Police_DatabaseArgu);
            private _amount = parseNumber ([_edit,3] call Caue_Police_DatabaseArgu);

            private _array = _edit splitString " ";
            for "_i" from 1 to 4 do {
                _array deleteAt 0;
            };

            private _info = [_array," "] call CBA_fnc_join;
            private _issuedBy = player getVariable ["name",name player];

            [player,[_name,_amount,_info,_issuedBy],_edit0] remoteExec ["Server_Police_Database",2];
            _output = format ["Inserindo multa no banco de dados..."];
        };

        case "insertwarning": {
            private _name = ([_edit,1] call Caue_Police_DatabaseArgu) + " " + ([_edit,2] call Caue_Police_DatabaseArgu);
            private _title = ([_edit,3] call Caue_Police_DatabaseArgu);

            private _array = _edit splitString " ";
            for "_i" from 1 to 4 do {
                _array deleteAt 0;
            };

            private _info = [_array," "] call CBA_fnc_join;
            private _issuedBy = player getVariable ["name",name player];

            [player,[_name,_title,_info,_issuedBy],_edit0] remoteExec ["Server_Police_Database",2];
            _output = format ["Inserindo aviso no banco de dados..."];
        };

        case "insertreport": {
            private _name = ([_edit,1] call Caue_Police_DatabaseArgu) + " " + ([_edit,2] call Caue_Police_DatabaseArgu);
            private _title = ([_edit,3] call Caue_Police_DatabaseArgu);

            private _array = _edit splitString " ";
            for "_i" from 1 to 4 do {
                _array deleteAt 0;
            };

            private _info = [_array," "] call CBA_fnc_join;
            private _issuedBy = player getVariable ["name",name player];

            [player,[_name,_title,_info,_issuedBy],_edit0] remoteExec ["Server_Police_Database", 2];
            _output = format ["Inserindo relatorio no banco de dados..."];
        };

        case "insertarrest": {
            private _name = ([_edit,1] call Caue_Police_DatabaseArgu) + " " + ([_edit,2] call Caue_Police_DatabaseArgu);
            private _time = ([_edit,3] call Caue_Police_DatabaseArgu);

            private _array = _edit splitString " ";
            for "_i" from 1 to 4 do {
                _array deleteAt 0;
            };

            private _info = [_array," "] call CBA_fnc_join;
            private _issuedBy = player getVariable ["name",name player];

            [player,[_name,_time,_info,_issuedBy],_edit0] remoteExec ["Server_Police_Database", 2];
            _output = format ["Inserindo prisão no banco de dados..."];
        };

        default {_output = "Erro: Comando Desconhecido"};
    };

    _control = _display displayCtrl 1100;

    if (_edit0 == "clear") then {
        _newstruct = _output;
    } else {
        _newstruct = format["%1<br />%2",(player getVariable "PoliceDatabaseStruc"),_output];
    };

    player setVariable ["PoliceDatabaseStruc",_newstruct,false];
    [_newstruct] call Caue_Police_UpdateComputer;

}, false] call Server_Setup_Compile;

['Caue_Police_DatabaseArgu', {

    params[
        ["_edit","",[""]],
        ["_index",0,[0]]
    ];

    private _array = _edit splitString " ";
    private _return = _array select _index;

    _return

}, false] call Server_Setup_Compile;

['Caue_Police_DatabaseEnterReceive', {

    disableSerialization;

    params[
        "_name",
        "_command",
        ["_return",""]
    ];

    private _output = "";

    switch (_command) do {
        case "lookup": {
            if ((count _return) > 0) then {
                private _warrantCount = "Não";
                if ((_return select 2) > 0) then {
                    _warrantCount = "<t color='#ff0000'>Sim</t>";
                };
                _output = format ["<t align='center'>Nome: %1</t><br /><t align='center'>Sexo: %2</t><br /><t align='center'>Idade: %3</t><br /><t align='center'>Data de emissão do passaporte: %9</t><br /><t align='center'>Mandato ativo: %4</t><br /><t align='center'>Contagem do histórico de avisos: %5</t><br /><t align='center'>Contagem do histórico de multas: %6</t><br /><t align='center'>Contagem do histórico de prisão: %7</t><br /><t align='center'>Contagem do histórico de relatórios: %8</t><br />",_name,(_return select 0),(_return select 1),_warrantCount,(_return select 5),(_return select 4),(_return select 3),(_return select 6),([_return select 7] call Caue_Lib_FormatDate)];
            } else {
                _output = format ["Incapaz de achar %1 no banco de dados criminal. (Registro Limpo)",_name];
            };
        };

        case "lookuplicense": {
            if ((count _return) > 1) then {
                _return params [
                    "_name",
                    "_carstoled",
                    "_class",
                    "_plate"
                ];

                private _vehName = getText(configFile >>  "CfgVehicles" >>  _class >> "displayName");

                private _stolen = "Não";
                if (_carstoled > 0) then {
                    _stolen = "<t color='#ff0000'>Sim</t>";
                };

                _output = format["
                	<t align='center'>Placa: %1</t><br />
                	<t align='center'>Tipo: %3</t><br />
                	<t align='center'>Dono: %2</t><br />
                	<t align='center'>Reportado roubado: %4</t><br />",
                _plate,_name,_vehName,_stolen];
            } else {
                _output = format ["Nenhuma informação disponível para placa %1",_name];
            };
        };

        case "warrantlist": {
            if ((count _return) > 0) then {
                {
                    _output = _output + (format ["<t align='center'>%1. %2 - Emitido: %3 - Emitido por: %4</t><br />",_forEachIndex+1,_x select 0,_x select 1,_x select 2]);
                } forEach _return;
                _output = (_output + "Use warrantinfo para informação detalhada do mandato<br />");
            } else {
                _output = format ["Não é possível encontrar mandatos ativos para %1",_name];
            };
        };

        case "warrantinfo": {
            if ((count _return) > 0) then {
                _output = format ["<t align='center'>Mandato: %1</t><br /><t align='center'>Data de emissão: %2</t><br /><t align='center'>Emitido por: %3</t><br /><t align='center'>Info:</t><br /><t align='center'>%4</t><br />",_name,_return select 0,_return select 1,_return select 2];
            } else {
                _output = format ["Este mandato não existe",_name];
            };
        };

        case "removewarrant": {
            _output = _return;
        };

        case "ticketlist": {
            if ((count _return) > 0) then {
                {
                    _output = _output + (format ["<t align='center'>%1 - %2 - Emitido por: %3</t><br />",_x select 0,_x select 1,_x select 2]);
                } forEach _return;
                _output = _output;
            } else {
                _output = format ["Não há histórico de multas disponível para %1",_name];
            };
        };

        case "arrestlist": {
            if ((count _return) > 0) then {
                {
                    _output = _output + (format ["<t align='center'>%1 - %2 - Inserido por: %3</t><br />",_x select 0,_x select 1,_x select 2]);
                } forEach _return;
                _output = _output;
            } else {
                _output = format ["Nenhum histórico de prisão disponível para %1",_name];
            };
        };

        case "warninglist": {
            if ((count _return) > 0) then {
                {
                    _output = _output + (format ["<t align='center'>%1 - %2 - Inserido por: %3</t><br />",_x select 0,_x select 1,_x select 2]);
                } foreach _return;
                _output = _output;
            } else {
                _output = format ["Nenhum histórico de aviso disponível para %1",_name];
            };
        };

        case "insertwarrant": {
            _output = _return;
        };

        case "insertticket": {
            _output = _return;
        };

        case "insertwarning": {
            _output = _return;
        };

        case "insertreport": {
            _output = _return;
        };

        case "insertarrest": {
            _output = _return;
        };

        default {_output = "Erro desconhecido - Entre em contato com o desenvolvedor"};
    };

    private _newstruct = format["%1<br />%2",(player getVariable "PoliceDatabaseStruc"),_output];
    player setVariable ["PoliceDatabaseStruc",_newstruct,false];
    [_newstruct] call Caue_Police_UpdateComputer;

}, false] call Server_Setup_Compile;

['Caue_Police_AcceptDispatch', {

    params[
        ["_target",objNull,[objNull]]
    ];

    Caue_Phone_Caller = _target;

    closeDialog 0;
    createDialog "Dialog_Dispatch";

}, false] call Server_Setup_Compile;

['Caue_Police_StartDispatch', {

    player setVariable ["busy",true,true];
    player setvariable ["Caue_Call_Status",[Caue_Phone_Caller,3,format["Chamada de Emergencia DE: %1",Caue_Phone_Caller getVariable ["phone_number","ERROR!"]]],true];

    [Caue_Phone_Caller] remoteExec ["Server_Police_AcceptDispatch",2];

    [] call Caue_Phone_AnswerCall;
    [[0]] spawn Caue_Phone_HUD;

}, false] call Server_Setup_Compile;

['Caue_Police_Impound', {

    if !([] call Caue_Player_AntiSpam) exitWith {};
    if !([] call Caue_Lib_InputAccess) exitWith {};

    params [["_veh",objNull]];

    if (isNull _veh) exitwith {["Não foi possível encontrar um veículo para apreender, você está olhando para ele?", Color_Red] call A3PL_HUD_Notification;};
    if (_veh distance player > 7) exitWith {["Você está muito longe do veículo para apreende-lo", Color_Red] call A3PL_HUD_Notification;};

    if ([10,"Apreendendo...","A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa","default"] call Caue_HUD_Progress) then {
        [_veh,player] remoteExec ["Server_Police_Impound",2];
    } else {
        ["Cancelado",Color_Red] call A3PL_HUD_Notification;
    };

}, false] call Server_Setup_Compile;

['Caue_Police_Spikes', {

    private _veh = vehicle player;
    private _spike = nearestObjects [player,["A3PL_Stinger"],3];

    if ((count _spike) < 1) exitwith {};

    private _wheelLF = lineIntersectsWith [AGLToASL (_veh modelToWorldVisual [-1,1.1,-1]),AGLToASL (_veh modelToWorldVisual [-1,1.1,-3]),_veh];
    private _wheelRF = lineIntersectsWith [AGLToASL (_veh modelToWorldVisual [1,1.1,-1]),AGLToASL (_veh modelToWorldVisual [1,1.1,-3]),_veh];
    private _wheelLB = lineIntersectsWith [AGLToASL (_veh modelToWorldVisual [-1,-2.4,-1]),AGLToASL (_veh modelToWorldVisual [-1,-2.4,-3]),_veh];
    private _wheelRB = lineIntersectsWith [AGLToASL (_veh modelToWorldVisual [1,-2.4,-1]),AGLToASL (_veh modelToWorldVisual [1,-2.4,-3]),_veh];

    _spike = _spike select 0;
    private "_hit";

    if (_spike IN _wheelLF) then {
        _hit = _veh getVariable "wheelLFSpiked";
        if (!isNil "_hit") exitwith {};
        _veh setVariable ["wheelLFSpiked",true,false];
        _veh setHit ["wheel_1_1_steering",1];
        [_veh] spawn {
            _veh = _this select 0;
            sleep 20;
            _veh setVariable ["wheelLFSpiked",nil,false];
        };
    };

    if (_spike IN _wheelRF) then {
        _hit = _veh getVariable "wheelRFSpiked";
        if (!isNil "_hit") exitwith {};
        _veh setVariable ["wheelRFSpiked",true,false];
        _veh setHit ["wheel_2_1_steering",1];
        [_veh] spawn {
            _veh = _this select 0;
            sleep 20;
            _veh setVariable ["wheelRFSpiked",nil,false];
        };
    };

    if (_spike IN _wheelLB) then {
        _hit = _veh getVariable "wheelLBSpiked";
        if (!isNil "_hit") exitwith {};
        _veh setVariable ["wheelLBSpiked",true,false];
        _veh setHit ["wheel_1_2_steering",1];
        [_veh] spawn {
            _veh = _this select 0;
            sleep 20;
            _veh setVariable ["wheelLBSpiked",nil,false];
        };
    };

    if (_spike IN _wheelRB) then {
        _hit = _veh getVariable "wheelRBSpiked";
        if (!isNil "_hit") exitwith {};
        _veh setVariable ["wheelRBSpiked",true,false];
        _veh setHit ["wheel_2_2_steering",1];
        [_veh] spawn {
            _veh = _this select 0;
            sleep 20;
            _veh setVariable ["wheelRBSpiked",nil,false];
        };
    };

}, false] call Server_Setup_Compile;

['A3PL_Police_RadarSet', {

    params [
        ["_veh",objNull],
        ["_type","target"],
        ["_number",0],
        ["_global",false]
    ];

    private _selStart = switch (_type) do {
        case ("target"): {8};
        case ("lockfast"): {11};
        case ("patrol"): {14};
        default {8};
    };

    _number = [_number, 3] call CBA_fnc_formatNumber;
    if ((count _number) > 3) then {
        _number = toArray _number;
        _number deleteAt 0;
        _number = toString _number;
    };

    for "_i" from _selStart to (_selStart + 2) do {
        if (_global) then {
            _veh setObjectTextureGlobal [_i,format["\a3pl_cars\common\textures\numbers\%1.paa",(_number select [(_i - _selStart),1])]];
        } else {
            _veh setObjectTexture [_i,format["\a3pl_cars\common\textures\numbers\%1.paa",(_number select [(_i - _selStart),1])]];
        };
    };

}, false] call Server_Setup_Compile;

['A3PL_Police_RadarLoop', {

    params [["_veh",objNull]];

    [_veh] spawn A3PL_Police_RadarLoopSync;

    private _Beam = "Land_HelipadEmpty_F" createVehicleLocal getpos _veh;
    _Beam attachTo [_veh,[0.0,50.0,0.75]];
    private _Beam2 = "Land_HelipadEmpty_F" createVehicleLocal getpos _veh;
    _Beam2 attachTo [_veh,[0.0,150.0,0.75]];
    private _radardir = "Front";

    while {player IN _veh} do {
        if (_veh animationPhase "Radar_Master" > 0.5) then {
            private ["_inter","_target","_speed","_forward","_dist"];
            _forward = _veh getVariable ["forward",true];

            if (_veh animationPhase "Radar_Front" >= 0.5) then {
                _Beam attachTo [_veh,[0.0,50.0,0.75 ]];
                _Beam2 attachTo [_veh,[0.0,150.0,0.75]];
                _radardir = "Front";
            } else {
                _Beam attachTo [_veh,[0.0,-60.0,0.75]];
                _Beam2 attachTo [_veh,[0.0,-150.0,0.75]];
                _radardir = "Rear";
            };

            _tag2 = nearestObject [_Beam2,"LandVehicle"];
            _tag = nearestObject [_Beam,"LandVehicle"];

            if (isNull _tag) then {
                _tag = _tag2;
            };

            if (isNull _tag2) then {
                _tag2 = _tag;
            };

            if !(isNull _tag) then {
                private _target = _tag;
                private _speed = speed _target;

                [_veh,"target",_speed] call A3PL_Police_RadarSet;
                if ((_speed > (_veh getVariable ["lockfast",-1000])) && (_veh getVariable ["locktarget",_target] == _target)) then {
                    [_veh,"lockfast",_speed] call A3PL_Police_RadarSet;
                    _veh setvariable ["lockfast",_speed,false];
                    _veh setvariable ["locktarget",_target,false];
                };
            };

            _speed = speed _veh;
            [_veh,"patrol",_speed] call A3PL_Police_RadarSet;
        };
        uiSleep 0.1;
    };
    deleteVehicle _Beam;
    deleteVehicle _Beam2;

}, false] call Server_Setup_Compile;

['A3PL_Police_RadarLoopSync', {

    private ["_veh","_tempVar"];
    _veh = param [0,objNull];
    _tempVar = _veh getVariable ["radar_prev",["","","","","","","","",""]];
    if (!isNil "RadarLoopSyncRunning") exitwith {["Debug: RadarLoopSync not started, already running",Color_Red] call A3PL_HUD_Notification;};
    RadarLoopSyncRunning = true;
    while {player IN _veh} do
    {
        if (_veh animationPhase "Radar_Master" > 0.5) then
        {
            private ["_tex"];
            _tex = getObjectTextures _veh;
            for "_i" from 8 to 16 do
            {
                private ["_newTex"];
                _newTex = _tex select _i;
                if ((_tempVar select (_i-8)) != _newTex) then
                {
                    _veh setObjectTextureGlobal [_i,_newTex];
                    _tempVar set [_i,_newTex];
                };
            };
            _veh setVariable ["radar_prev",_tempVar,false];
        };
        uiSleep 1.5;
    };
    RadarLoopSyncRunning = nil;

}, false] call Server_Setup_Compile;

['Caue_Police_SeizeItems', {

    if !([] call Caue_Player_AntiSpam) exitWith {};

    private _clear = nearestObjects [player,["weaponholder"],3];
    _clear = _clear + nearestObjects [player,["groundWeaponHolder"],3];

    private _destroyed = 0;

    for "_i" from 0 to ((count _clear) - 1) do {
        _destroyed = _destroyed + 1;
        _item = _clear select _i;
        _mags = getMagazineCargo _item;
        _items = getItemCargo _item;
        _weapons = getWeaponCargo _item;
        clearBackpackCargo _item;

        if (count (_mags select 0) > 0) then {{evidence_locker addMagazineCargoGlobal [_mags select 0 select _forEachIndex,_mags select 1 select _forEachIndex]} forEach (_mags select 0); clearMagazineCargo _item;};
        if (count (_weapons select 0) > 0) then {{evidence_locker addWeaponCargoGlobal [_weapons select 0 select _forEachIndex,_weapons select 1 select _forEachIndex]} forEach (_weapons select 0); clearWeaponCargo _item;};
        deleteVehicle (_clear select _i);
        uiSleep 0.056;
    };

    _destroyed = _destroyed - 1;
    [format["%1 item(s) apreendido(s) e colocado(s) na caixa de evidencias.",_destroyed],Color_Blue] call A3PL_HUD_Notification;

}, false] call Server_Setup_Compile;

['Caue_Police_Locker', {

    if !([] call Caue_Player_AntiSpam) exitWith {};
    if !([] call Caue_Lib_InputAccess) exitWith {};

    private _locker = missionNamespace getVariable ["Player_Locker",objNull];
    if (isNull _locker) then {
        private _pitems = profileNamespace getVariable ["Caue_LockerItems",[[],[],[],[]]];

        profileNamespace setVariable ["Caue_LockerItems",[[],[],[],[]]];
        saveProfileNamespace;

        private _box = createVehicle ["A3PL_Police_Locker",(getPosATL player),[],0,"CAN_COLLIDE"];
        Player_Locker = _box;
        clearItemCargoGlobal _box;
        clearWeaponCargoGlobal _box;
        clearMagazineCargoGlobal _box;

        private _weapons = _pitems select 0;
        private _magazines = _pitems select 1;
        private _actualitems = _pitems select 2;
        private _backpacks = _pitems select 3;

        {_box addWeaponCargoGlobal [_x,1]} foreach _weapons;
        {_box addMagazineCargoGlobal [_x,1]} foreach _magazines;
        {_box addItemCargoGlobal [_x,1]} foreach _actualitems;
        {_box addBackpackCargoGlobal [_x,1]} foreach _backpacks;
    } else {
        if (isNull _locker) exitWith {};
        profileNamespace setVariable ["Caue_LockerItems",[weaponCargo _locker, magazineCargo _locker, itemCargo _locker, backpackCargo _locker]];
        saveProfileNamespace;
        deleteVehicle _locker;
    };

}, false] call Server_Setup_Compile;

/*
    Server
*/
['Server_Police_TicketPay', {

    params [
        ["_price",1],
        ["_player",objNull]
    ];

    if (isNull _player) exitwith {};

    private _cash = _player getVariable ["getjobplayerguy",0];
    private _bank = _player getVariable ["getrankplayerguy",0];

    if ((_price > _cash) && (_price > _bank)) exitwith {};

    if (_price <= _cash) then {
        [_player,"getjobplayerguy",(_cash - _price)] call Server_Core_ChangeVar;
    } else {
        [_player,"getrankplayerguy",(_bank - _price)] call Server_Core_ChangeVar;
    };

    ["PD_BUDGET",(_price * 3),true] remoteExec ["Server_Government_UpdateBalance",2];
    ["DMV_BUDGET",(_price * 3),true] remoteExec ["Server_Government_UpdateBalance",2];

}, true] call Server_Setup_Compile;

['Server_Police_Database', {

    params [
        "_player",
        "_name",
        "_call"
    ];

    private _output = "";
    private _return = "";

    switch (_call) do {
        case "lookup": {
            _return = [format["Police_LookUp:%1:%1:%1:%1:%1:%1:%1:%1:%1",_name],2] call Server_Database_Async;
            [_name,_call,_return] remoteExec ["Caue_Police_DatabaseEnterReceive",(owner _player)];
        };

        case "lookuplicense": {
            _return = [format["Police_LookUpLicense:%1:%1:%1",_name],2] call Server_Database_Async;
            _return pushBack _name;
            [_name,_call,_return] remoteExec ["Caue_Police_DatabaseEnterReceive",(owner _player)];
        };

        case "warrantlist": {
            _return = [format["Police_WarrantList:%1",_name],2,true] call Server_Database_Async;
            [_name,_call,_return] remoteExec ["Caue_Police_DatabaseEnterReceive",(owner _player)];
        };

        case "warrantinfo": {
            _return = [format["Police_WarrantInfo:%1:%2",_name,(_this select 3)], 2] call Server_Database_Async;
            [_name,_call,_return] remoteExec ["Caue_Police_DatabaseEnterReceive",(owner _player)];
        };

        case "removewarrant": {
            _return = [format["Police_RemoveWarrantSelect:%1:%2",_name,(_this select 3)],2] call Server_Database_Async;

            if ((count _return) > 0) exitWith {
                _return = [format["Police_RemoveWarrant:%1",(_return select 0)],2] call Server_Database_Async;
                _output = format["Mandato excluído com sucesso para %1",_name];
                [_name,_call,_output] remoteExec ["Caue_Police_DatabaseEnterReceive",(owner _player)];
            };

            _output = "ID do Mandato Inválido - Use o warrantlist para obter o ID!";
            [_name,_call,_output] remoteExec ["Caue_Police_DatabaseEnterReceive",(owner _player)];
        };

        case "ticketlist": {
            _return = [format["Police_TicketList:%1",_name],2,true] call Server_Database_Async;
            [_name,_call,_return] remoteExec ["Caue_Police_DatabaseEnterReceive",(owner _player)];
        };

        case "arrestlist": {
            _return = [format["Police_ArrestList:%1",_name],2,true] call Server_Database_Async;
            [_name,_call,_return] remoteExec ["Caue_Police_DatabaseEnterReceive",(owner _player)];
        };

        case "warninglist": {
            _return = [format["Police_WarningList:%1",_name],2,true] call Server_Database_Async;
            [_name,_call,_return] remoteExec ["Caue_Police_DatabaseEnterReceive",(owner _player)];
        };

        case "insertwarrant": {
            _title = _name select 1;
            _info = _name select 2;
            _issuedBy = _name select 3;
            _name = _name select 0;

            _return = [format["Police_GetPlayerUID:%1",_name],2,true] call Server_Database_Async;

            if ((count _return) < 1) then {
                [_name,_call,"Nome do cidadão inválido"] remoteExec ["Caue_Police_DatabaseEnterReceive",(owner _player)];
            } else {
                _return = [format["Police_InsertWarrant:%1:%2:%3:%4",((_return select 0) select 0),_info,_title,_issuedBy,_name],2,true] call Server_Database_Async;
                [_name,_call,format["Mandato inserido com sucesso para %1",_name]] remoteExec ["Caue_Police_DatabaseEnterReceive",(owner _player)];
            };
        };

        case "insertticket": {
            _amount = _name select 1;
            _info = _name select 2;
            _issuedBy = _name select 3;
            _name = _name select 0;

            _return = [format["Police_GetPlayerUID:%1",_name],2,true] call Server_Database_Async;

            if ((count _return) < 1) then {
                [_name,_call,"Nome do cidadão inválido"] remoteExec ["Caue_Police_DatabaseEnterReceive",(owner _player)];
            } else {
                _return = [format["Police_InsertTicket:%1:%2:%3:%4",((_return select 0) select 0),_info,_amount,_issuedBy,_name],2,true] call Server_Database_Async;
                [_name,_call,format["Multa inserida com sucesso para %1",_name]] remoteExec ["Caue_Police_DatabaseEnterReceive",(owner _player)];
            };
        };

        case "insertwarning": {
            _title = _name select 1;
            _info = _name select 2;
            _issuedBy = _name select 3;
            _name = _name select 0;

            _return = [format["Police_GetPlayerUID:%1",_name],2,true] call Server_Database_Async;

            if ((count _return) < 1) then {
                [_name,_call,"Nome do cidadão inválido"] remoteExec ["Caue_Police_DatabaseEnterReceive",(owner _player)];
            } else {
                _return = [format["Police_InsertWarning:%1:%2:%3:%4",((_return select 0) select 0),_info,_title,_issuedBy,_name],2,true] call Server_Database_Async;
                [_name,_call,format["Aviso inserido com sucesso para %1",_name]] remoteExec ["Caue_Police_DatabaseEnterReceive",(owner _player)];
            };
        };

        case "insertreport": {
            _title = _name select 1;
            _info = _name select 2;
            _issuedBy = _name select 3;
            _name = _name select 0;

            _return = [format["Police_GetPlayerUID:%1",_name],2,true] call Server_Database_Async;

            if ((count _return) < 1) then {
                [_name,_call,"Nome do cidadão inválido"] remoteExec ["Caue_Police_DatabaseEnterReceive",(owner _player)];
            } else {
                _return = [format["Police_InsertReport:%1:%2:%3:%4",((_return select 0) select 0),_info,_title,_issuedBy,_name],2,true] call Server_Database_Async;
                [_name,_call,format["Relatório inserido com sucesso para %1",_name]] remoteExec ["Caue_Police_DatabaseEnterReceive",(owner _player)];
            };
        };

        case "insertarrest": {
            _time = _name select 1;
            _info = _name select 2;
            _issuedBy = _name select 3;
            _name = _name select 0;

            _return = [format["Police_GetPlayerUID:%1",_name],2] call Server_Database_Async;

            if ((count _return) < 1) then {
                [_name,_call,"Nome do cidadão inválido"] remoteExec ["Caue_Police_DatabaseEnterReceive",(owner _player)];
            } else {
                _return = [format["Police_InsertArrest:%1:%2:%3:%4",(_return select 0),_info,_time,_issuedBy,_name],2,true] call Server_Database_Async;
                [_name,_call,format["Prisão inserida com sucesso para %1",_name]] remoteExec ["Caue_Police_DatabaseEnterReceive",(owner _player)];
            };
        };

        default {};
    };

}, true] call Server_Setup_Compile;

['Server_Police_CallDispatch', {

    params[
        ["_player",objNull,[objNull]],
        ["_type","",[""]]
    ];

    Server_Dispatch_Active pushBack [_player,false];

    private _monkeys = [];
    {
        if !(_x getVariable ["busy",false]) then {_monkeys pushBack _x;};
    } forEach ([_type] call A3PL_Lib_FactionPlayers);

    [_player] remoteExec ["Caue_Police_AcceptDispatch",(selectRandom _monkeys)];

}, true] call Server_Setup_Compile;

['Server_Police_AcceptDispatch', {

    params[
        ["_target",objNull,[objNull]]
    ];

    _id = Server_Dispatch_Active find [_target,false];
    if (_id < 0) exitWith {};

    Server_Dispatch_Active set [_id,[_target,true]];

    [] remoteExec ["Caue_Phone_CallAccepted",_target];

}, true] call Server_Setup_Compile;

['Server_Police_EndDispatch', {

    params[
        ["_target",objNull,[objNull]]
    ];

    _id = Server_Dispatch_Active find [_target,false];
    if (_id < 0) exitWith {};

    Server_Dispatch_Active deleteAt _id;

}, true] call Server_Setup_Compile;

['Server_Police_Impound', {

    params [
        ["_veh",objNull],
        ["_player",objNull]
    ];

    if (isNull _veh) exitwith {};

    private _var = _veh getVariable ["owner",nil];

    if (isNil "_var") exitWith {};

    if !((_var select 1) IN ["ADMIN","WASTE","DELIVER","EXTERMY","KARTING"]) then {
        [format["Police_Impound:%2:%1",(_var select 1),(fuel _veh)],1] spawn Server_Database_Async;
    };

    [_veh] call Server_Vehicle_Despawn;

    _player setVariable ["getrankplayerguy",((_player getVariable ["getrankplayerguy",0]) + 200),true];
    ["Você recebeu $200 por apreender um veiculo.",Color_Green] remoteExec ["A3PL_HUD_Notification",_player];

}, true] call Server_Setup_Compile;

['Server_Police_LockerLoad', {

    waitUntil {!isNil "evidence_locker_items"};

    private _box = evidence_locker;
    private _items = evidence_locker_items;

    private _weapons = _items select 0;
    private _magazines = _items select 1;
    private _actualitems = _items select 2;
    private _backpacks = _items select 3;
    private _vitems = _items select 4;

    {_box addWeaponCargoGlobal [_x,1]} foreach _weapons;
    {_box addMagazineCargoGlobal [_x,1]} foreach _magazines;
    {_box addItemCargoGlobal [_x,1]} foreach _actualitems;
    {_box addBackpackCargoGlobal [_x,1]} foreach _backpacks;

    _box setVariable ["vitems",_vitems,true];

}, true] call Server_Setup_Compile;

['Server_Police_LockerSave', {

    waitUntil {!isNil "evidence_locker_items"};

    private _box = evidence_locker;

    evidence_locker_items = [(weaponCargo _box), (magazineCargo _box), (itemCargo _box), (backpackCargo _box), (_box getVariable ["vitems",[]])];
    ["evidence_locker_items",true] call Server_Core_SavePersistentVar;

}, true] call Server_Setup_Compile;
