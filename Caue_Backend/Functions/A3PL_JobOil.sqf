/*
    Client
*/
['A3PL_JobOil_Pump_Animation', {

    private ["_pump"];
    _pump = param [1,objNull];
    sleep 2;
    while {(_pump getVariable ["pumping",false])} do
    {
        if (_pump animationSourcePhase "pump" < 0.5) then
        {
            _pump animateSource ["pump",1];
            waitUntil {_pump animationSourcePhase "pump" >= 0.98};
        } else
        {
            _pump animateSource ["pump",0,true];
            waitUntil {_pump animationSourcePhase "pump" < 0.1};
        };
    };

}, false] call Server_Setup_Compile;

['A3PL_JobOil_PumpReceive', {

    private ["_r","_notify"];
    _r = param [0,0];
    _notify = ["Uma de suas bombas parou devido a um erro de servidor desconhecido", Color_Red];

    switch (_r) do
    {
        case 1: { _notify = ["Um dos seus extratores parou porque não há mais petróleo nessa área.", Color_Red]; };
        case 2: { _notify = ["Um dos seus extratores parou porque o servidor não conseguiu encontrar um buraco perto do extrator", Color_Red]; };
        case 3: { _notify = ["Um dos seus extratores parou porque o servidor detectou que vários extratores estao no mesmo buraco, mova um extrator para longe do buraco", Color_Red]; };
        case 4: { _notify = ["Um dos seus extratores parou porque o servidor detectou que o extrator não está conectado corretamente ao buraco", Color_Red]; };
        case 5: { _notify = ["Um dos seus extratores parou porque o servidor não conseguiu detectar um barril de óleo perto do extrator que não está cheio", Color_Red]; };
        case 6: { _notify = ["Uma dos seus extratores não foi iniciado porque o servidor determinou que ele já está em execução", Color_Red]; };
        case 7: { _notify = ["Este extrator já está ligado", Color_Red]; };
    };

    _notify call A3PL_HUD_Notification;

}, false] call Server_Setup_Compile;

['A3PL_JobOil_PumpStart', {

    private ["_pump","_pumpjacks","_hole","_holes"];
    _pump = param [0,objNull];

    if (!local _pump) exitwith {["Somente o dono do extrator pode liga-lo", Color_Red] call A3PL_HUD_Notification;};

    _pumpjacks = nearestObjects [_pump, ["A3PL_Pumpjack"], 3];
    _holes = nearestObjects [_pump, ["A3PL_DrillHole"], 3];
    if (count _holes < 1) exitwith {["Não parece que há um buraco perto deste extrator", Color_Red] call A3PL_HUD_Notification;};
    if (count _pumpjacks > 1) exitwith {["Parece que um extrator já está colocado nesse buraco", Color_Red] call A3PL_HUD_Notification;};
    _hole = _holes select 0;
    if (((_pump modelToWorld (_pump selectionPosition "holePosition")) distance _hole) > 0.2) exitwith {["Por favor posicione o extrator corretamente no buraco", Color_Red] call A3PL_HUD_Notification;};

    _oil = [getpos _hole] call A3PL_JobWildcat_CheckForOil;
    _containsOil = _oil select 0;
    _oilLocation = _oil select 1;
    if (!_containsOil) exitwith {["Esta área não contém mais petróleo bruto", Color_Red] call A3PL_HUD_Notification;};

    _oilAmount = [_oilLocation] call A3PL_JobOil_CheckAmountOil;
    if (_oilAmount <= 0) exitwith {["Este poço de petróleo está esgotado, você precisa encontrar outro poço", Color_Red] call A3PL_HUD_Notification;};

    if ((_pump animationSourcePhase "drill") != 0) exitwith {["Parece que este extrator já está ligado", Color_Red] call A3PL_HUD_Notification;};

    if(!([] call Caue_Player_AntiSpam)) exitWith {};
    ["Pedido enviado ao servidor para iniciar a extração", Color_Yellow] call A3PL_HUD_Notification;
    [player,_pump] remoteExec ["Server_JobOil_PumpStart", 2];
    [_pump] spawn  A3PL_JobOil_Pump_Animation;

}, false] call Server_Setup_Compile;

['A3PL_JobOil_CheckAmountOil', {

    private ["_pos","_return"];
    _pos = param [0,[0,0,0]];
    _return = 0;

    {
        if (((_x select 0) distance2D _pos) < 1) exitwith
        {
            _return = _x select 1;
        };
    } foreach Server_JobWildCat_Oil;

    _return;

}, false] call Server_Setup_Compile;

['A3PL_JobOil_Drill', {

    private ["_s","_pump","_drilling","_a"];
    _pump = param [0,objNull];

    if ((_pump animationPhase "Pin") > 0) exitwith {
        ["Você não pode usar a furadeira quando o veículo ainda estiver engatilhado, por favor desarme-o primeiro",Color_Red] call A3PL_HUD_Notification;
    };

    if ((_pump animationSourcePhase "drill_arm_position") != 1) exitwith {["Parece que a posição do braço da broca não esta estendida",Color_Red] call A3PL_HUD_Notification;};

    _a = _pump animationSourcePhase "drill";
    uisleep 0.2;
    if (_a != _pump animationSourcePhase "drill") exitwith {["Parece que a broca já está ligada",Color_Red] call A3PL_HUD_Notification;};

    if (_pump animationSourcePhase "drill" > 0) exitwith {_pump animateSource ["drill",0]; ["Parece que a broca está estendida, agora está sendo recolhida de volta à sua posição original",Color_Red] call A3PL_HUD_Notification;};

    ["Perfuração iniciada, um buraco aparecerá no chão, alguém com o trabalho de recuperação de petróleo pode colocar um extrator no buraco",Color_Green] call A3PL_HUD_Notification;
    _drilling = true;
    _pump animateSource ["drill",1];
    _s = false;
    _pos = getpos _pump;
    while {_drilling} do
    {
        if ((_pos distance (getpos _pump)) > 1) exitwith {_pump animateSource ["drill",0,true]; ["Perfuração cancelada, o extrator foi movido, a broca foi movida de volta à sua posição original",Color_Red] call A3PL_HUD_Notification;};
        if (_pump animationSourcePhase "drill" == 1) exitwith {_s = true};
        if (isNull _pump) exitwith {};
        uiSleep 1;
    };

    if (_s) then
    {
        ["Um buraco foi criado nesta posição, alguém pode agora instalar um extrator nesta posição",Color_Green] call A3PL_HUD_Notification;

        _hole = createVehicle ["A3PL_Drillhole",_pump modelToWorld [0,-1.8,-1.1], [], 0, "CAN_COLLIDE"];
    } else
    {
        ["Perfuração cancelada, você moveu a broca ou a broca apreendida?",Color_Red] call A3PL_HUD_Notification;
    };

}, false] call Server_Setup_Compile;


/*
    Server
*/
['Server_JobOil_PumpStart', {

    private ["_pump","_player"];

    _player = param [0,objNull];
    _pump = param [1,objNull];

    if ((isNull _player) OR (isNull _pump)) exitwith {};

    _oil = [getpos _pump] call A3PL_JobWildcat_CheckForOil;
    _containsOil = _oil select 0;
    _oilLocation = _oil select 1;
    if (!_containsOil) exitwith {};

    if ((_pump animationSourcePhase "drill") != 0) exitwith {[6] remoteExec ["A3PL_JobOil_PumpReceive", (owner _player)];};
    if (_pump getVariable ["pumping",false]) exitwith {[7] remoteExec ["A3PL_JobOil_PumpReceive", (owner _player)];};
    _pump setVariable ["pumping",true,true];
    while {(_pump getVariable ["pumping",false])} do
    {
        _oilAmount = [_oilLocation] call A3PL_JobOil_CheckAmountOil;
        if (_oilAmount <= 0) exitwith {[1] remoteExec ["A3PL_JobOil_PumpReceive", (owner _player)];};

        _pumpjacks = nearestObjects [_pump, ["A3PL_PumpJack"], 2];
        _holes = nearestObjects [_pump, ["A3PL_DrillHole"], 3];
        if (count _holes < 1) exitwith {[2] remoteExec ["A3PL_JobOil_PumpReceive", (owner _player)];};
        _hole = _holes select 0;
        if (count _pumpjacks > 1) exitwith {[3] remoteExec ["A3PL_JobOil_PumpReceive", (owner _player)];};
        if (((_pump modelToWorld (_pump selectionPosition "holePosition")) distance _hole) > 0.2) exitwith {[4] remoteExec ["A3PL_JobOil_PumpReceive", (owner _player)];};

        _pump setVariable ["crudeOil",(_pump getVariable ["crudeOil",0]) + 1,false];

        if ((_pump getVariable ["crudeOil",0]) >= 42) then
        {
            _pos = (getpos _pump) findEmptyPosition [1,10,"A3PL_OilBarrel"];
            if (count _pos == 0) then {_pos = getpos _pump};
            _barrel = createVehicle ["A3PL_OilBarrel",(getpos _pump), [], 0, "None"];
            _barrel setVariable ["class","Crude_Oil",true];
            _barrel setVariable ["owner",(getPlayerUID _player),true];
            {
                if ([(_x select 0),_oilLocation] call Bis_Fnc_AreEqual) exitwith
                {
                    _x set [1,(_x select 1) - 42];
                    Server_JobWildCat_Oil set [_forEachIndex,_x];
                    publicVariable "Server_JobWildCat_Oil";
                };
            } foreach Server_JobWildCat_Oil;
            _pump setVariable ["crudeOil",nil,false];
        };
        uiSleep 0.26;
    };
    _pump setVariable ["pumping",nil,false];
    _pump animateSource ["pump",0,true];

}, true] call Server_Setup_Compile;
