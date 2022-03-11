/*
    Client
*/
['A3PL_JobRoadWorker_Impound', {

    if(!([] call Caue_Player_AntiSpam)) exitWith {};
    if !((player getVariable ["job","unemployed"]) IN ["Roadside_Service","police"]) exitwith {["Você não parece estar trabalhando como guincho/mecanico", Color_Red] call A3PL_HUD_Notification;};

    private _cars = nearestObjects [player, ["Car"], 15];
    private _car = objNull;
    {
        if (_x getVariable ["impound",false]) exitwith {_car = _x;};
    } foreach _cars;

    if (isNull _car) exitwith {["Não parece que há um carro proximo que está marcado para apreensão", Color_Red] call A3PL_HUD_Notification;};
    if ((_car getVariable ["Towed",true])) exitwith {["Descarregue o carro antes de apreender", Color_Red] call A3PL_HUD_Notification;};
    ["Enviada solicitação ao servidor para apreender este veículo, você foi recompensado com $2000", Color_Green] call A3PL_HUD_Notification;
    [_car,player] remoteExec ["Server_JobRoadWorker_Impound",2];

}, false] call Server_Setup_Compile;

['A3PL_JobRoadWorker_Loop', {

    player setVariable ["TerrainRepaired",nil,false];

}, false] call Server_Setup_Compile;

['A3PL_JobRoadWorker_MarkResponse', {

    private ["_veh"];
    _veh = param [0,objNull];
    _license = (_veh getvariable ["owner",["0","ERROR"]]) select 1;

    [format ["Um novo veículo está disponível para apreensão, foi marcado no mapa (Licença: %1)",_license], Color_Green] call A3PL_HUD_Notification;

}, false] call Server_Setup_Compile;

['A3PL_JobRoadWorker_RepairTerrain', {

    private ["_tObjects","_obj","_timeLeft"];

    if (!(vehicle player == player)) exitwith {["Você não pode estar em um veículo enquanto reparar objetos", Color_Red] call A3PL_HUD_Notification;};
    _tObjects = nearestTerrainObjects [player, [], 5];
    if (count _tObjects < 1) exitwith {["Não parece haver um objeto proximo", Color_Red] call A3PL_HUD_Notification;};
    _obj = _tObjects select 0;
    if (getDammage _obj < 1) exitwith {["Este objeto não parece estar danificado", Color_Red] call A3PL_HUD_Notification;};
    _obj setDammage 0;

    _timeLeft = missionNameSpace getVariable ["A3PL_JobRoadworker_Timer",(diag_ticktime-2)];
    if (_timeLeft > diag_ticktime) exitwith {[format ["Por favor, espere %1 segundos antes de reparar outro objeto",round(_timeLeft-diag_ticktime)],Color_Red] call A3PL_HUD_Notification;};
    missionNameSpace setVariable ["A3PL_JobRoadworker_Timer",(diag_ticktime + (60 + random 3))];

    ["Você consertou um objeto e ganhou $75", Color_Green] call A3PL_HUD_Notification;
    [player, 'getjobplayerguy', ((player getVariable 'getjobplayerguy') + 75)] remoteExec ["Server_Core_ChangeVar", 2];

}, false] call Server_Setup_Compile;

['A3PL_JobRoadWorker_ToggleMark', {

    if(!([] call Caue_Player_AntiSpam)) exitWith {};
    private ["_veh"];
    _veh = param [0,objNull];

    if (isNull _veh) then
    {
        _veh = player_objintersect;
        if (!(_veh isKindOf "LandVehicle")) then {_veh = cursorobject};
        if (isNull _veh) exitwith {["Não foi possível encontrar um veículo para apreender, você está olhando para ele?", Color_Red] call A3PL_HUD_Notification;};
    };

    if (_veh getVariable ["impound",false]) then {
        [_veh] remoteExec ["Server_JobRoadWorker_UnMark", 2];
        ["Você desmarcou este veículo para apreensão o custo foi $500", Color_Red] call A3PL_HUD_Notification;
        player setVariable ["getrankplayerguy",(player getVariable ["getrankplayerguy",0])-500,true];
    } else {
        [_veh] remoteExec ["Server_JobRoadWorker_Mark", 2];
        ["Você marcou este veículo para ser apreendido e recebeu $200 - a mensagem foi enviada para todos os guinchos/mecanicos disponíveis", Color_Green] call A3PL_HUD_Notification;
        player setVariable ["getrankplayerguy",(player getVariable ["getrankplayerguy",0])+200,true];
    };

}, false] call Server_Setup_Compile;
/*
    Server
*/
['Server_JobRoadWorker_Impound', {

    private ["_veh","_player"];
    _veh = param [0,objNull];
    _player = param [1,objNull];

    if (((_veh getVariable "owner") select 0) != (getPlayerUID _player)) then
    {
        [_player,"getjobplayerguy",((_player getVariable ["getjobplayerguy",0]) + 2000)] call Server_Core_ChangeVar;
    };

    [_veh] call Server_Police_Impound;

}, true] call Server_Setup_Compile;

['Server_JobRoadWorker_Mark', {

    _veh = param [0,objNull];
    if (isNull _veh) exitwith {};

    _veh setVariable ["impound",true,true];

    _roadworkers = ["Roadside_Service",true] call A3PL_Lib_FactionPlayers;

    private _vehs = server getVariable ["Marked_Impound",[]];
    _vehs pushBack _veh;
    server setVariable ["Marked_Impound",_vehs,true];

    [_veh] remoteExec ["A3PL_JobRoadWorker_MarkResponse", _roadworkers];

}, true] call Server_Setup_Compile;

['Server_JobRoadWorker_Unmark', {

    _veh = param [0,objNull];
    if (isNull _veh) exitwith {};

    _veh setVariable ["impound",nil,true];
    private _vehs = server getVariable ["Marked_Impound",[]];

    if (_veh IN (server getVariable ["Marked_Impound",[]])) then {
        _vehs = _vehs - [_veh];
        server setVariable ["Marked_Impound",_vehs,true];
    };

}, true] call Server_Setup_Compile;
