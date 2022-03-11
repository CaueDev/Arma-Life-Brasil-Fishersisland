/*
    Client
*/
['Caue_Mayor_Open', {

    disableSerialization;

    closeDialog 0;
    createDialog "Dialog_Vote";
    private _display = findDisplay 110;

    private _control = _display displayCtrl 1400;
    _control ctrlSetText ((missionNameSpace getVariable ["Mayor",["","Ninguem"]]) select 1);

    private _candidates = missionNameSpace getVariable ["Mayor_Candidates",nil];
    if (isNil "_candidates") exitwith {["Não parece que você pode votar em um novo prefeito neste momento, volte mais tarde!",Color_Red] call A3PL_HUD_Notification};
    _candidates sort true;

    _control = _display displayCtrl 1600;
    _control buttonSetAction "[] call Caue_Mayor_Vote";

    _control = _display displayCtrl 1500;
    {
        private _index = _control lbAdd format ["%1 (Votos: %2)",(_x select 0),(_x select 2)];
        _control lbSetData [_index,(_x select 1)];
    } forEach _candidates;

}, false] call Server_Setup_Compile;

['Caue_Mayor_AddCandidate', {

    if !([] call Caue_Player_AntiSpam) exitWith {};
    if (missionNamespace getVariable ["MayorVoteStarted",false]) exitWith {["Você nao pode fazer isso agora.",Color_Green] call A3PL_HUD_Notification;};

    [player] remoteExec ["Server_Mayor_AddCandidate",2];
    ["Você agora é um candidato para as próximas eleições para prefeito!",Color_Green] call A3PL_HUD_Notification;

}, false] call Server_Setup_Compile;

['Caue_Mayor_Vote', {

    if !([] call Caue_Player_AntiSpam) exitWith {};
    if !(missionNamespace getVariable ["MayorVoteStarted",false]) exitWith {["Voce nao pode votar agora!",Color_Red] call A3PL_HUD_Notification;};

    disableSerialization;

    private _display = findDisplay 110;
    private _control = _display displayCtrl 1500;
    if ((lbCurSel _control) isEqualTo -1) exitwith {["Por favor, selecione um prefeito para votar!",Color_Red] call A3PL_HUD_Notification;};

    private _voting = _control lbData (lbCurSel _control);
    if (isNil "_voting") exitwith {["Erro não pode determinar em quem você está votando.",Color_Red] call A3PL_HUD_Notification;};

    closeDialog 0;

    [player,_voting] remoteExec ["Server_Mayor_AddVote",2];
    ["Você votou em um novo prefeito! Você só pode votar uma vez e esta votação não pode ser alterada novamente!",Color_Green] call A3PL_HUD_Notification;

}, false] call Server_Setup_Compile;

/*
    Server
*/
['Server_Mayor_StartVote', {

    params [
        ["_time",1440]
    ];

    private _candidates = missionNamespace getVariable ["Mayor_Candidates",[]];
    if ((count _candidates) < 1) exitwith {};

    MayorVoteStarted = true;
    publicVariable "MayorVoteStarted";
    [format["As cabines de votação estão abertas, você pode votar em um novo prefeito na Prefeitura. A votação será encerrada em %1 minuto(s).",_time],Color_Green] remoteExec ["A3PL_HUD_Notification",-2];
    Server_Government_Voted = [];

    [_time] spawn {
        params [
            ["_time",1440]
        ];

        uiSleep (_time * 60);

        private _votes = -1;
        private _winner = "";
        private _winnerUID = "";
        {
            private _vot = _x select 2;
            if (_vot > _votes) then {
                _winner = _x select 0;
                _winnerUID = _x select 1;
                _votes = _vot;
            };
        } forEach (missionNameSpace getVariable ["Mayor_Candidates",[]]);

        if !(_winner isEqualTo "") then {
            [format["O novo prefeito foi eleito, o novo prefeito de Fishers Island é: %1",_winner],Color_Green] remoteExec ["A3PL_HUD_Notification",-2];
            Mayor = [_winnerUID,_winner];
            publicVariable "Mayor";
            ["Mayor",true] call Server_Core_SavePersistentVar;
        };

        MayorVoteStarted = nil;
        publicVariable "MayorVoteStarted";
        Server_Government_Voted = nil;
        Mayor_Candidates = [];
        publicVariable "Mayor_Candidates";
        ["Mayor_Candidates",true] call Server_Core_SavePersistentVar;
    };

}, true] call Server_Setup_Compile;

['Server_Mayor_AddCandidate', {

    params [
        ["_player",objNull]
    ];

    if ((!isPlayer _player) || (isNull _player)) exitwith {};

    private _candidates = missionNamespace getVariable ["Mayor_Candidates",[]];
    private _uid = getPlayerUID _player;

    private _exist = false;
    {
        if ((_x select 1) isEqualTo _uid) exitwith {_exist = true};
    } forEach _candidates;

    if (_exist) exitwith {};

    _candidates pushback [(_player getVariable ["name",name _player]),_uid,0];
    Mayor_Candidates = _candidates;
    publicVariable "Mayor_Candidates";
    ["Mayor_Candidates",true] call Server_Core_SavePersistentVar;

}, true] call Server_Setup_Compile;

['Server_Mayor_AddVote', {

    params [
        ["_player",objNull],
        ["_voting",""]
    ];

    if ((!isPlayer _player) || (isNull _player)) exitwith {};

    private _uid = getPlayerUID _player;
    if (_uid IN Server_Government_Voted) exitwith {};

    Server_Government_Voted pushback _uid;

    {
        if ((_x select 1) == _voting) exitwith {
            Mayor_Candidates set [_forEachIndex,[_x select 0,_x select 1,(_x select 2)+1]];
            publicVariable "Mayor_Candidates";
        };
    } foreach (missionNameSpace getVariable ["Mayor_Candidates",[]]);

}, true] call Server_Setup_Compile;
