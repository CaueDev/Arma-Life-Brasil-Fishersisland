/*
    Client
*/
['A3PL_JobFarming_Bag', {

    if(!([] call Caue_Player_AntiSpam)) exitWith {};
    disableSerialization;
    private ["_scale","_near","_allGrinded","_display","_ctrl","_grams"];
    _scale = missionNameSpace getVariable ["A3PL_JobFarming_Scale",objNull];
    if (isNull _scale) exitwith {["Não é possível determinar a escala (reporte este bug)",Color_Red] call A3PL_HUD_Notification;};
    _near = nearestObjects [_scale, ["A3PL_Cannabis_Bud"], 2,true];
    _allGrinded = [];

    _display = findDisplay 74;
    _ctrl = _display displayCtrl 1400;
    _grams = parseNumber (ctrlText _ctrl);
    if (!(_grams IN [5,10,15,20,25,30,35,40,45,50,55,60,65,70,75,80,85,90,95,100])) exitwith {["Você digitou um número inválido, o número deve estar em multiplos de 5 (por exemplo, 5,10,15,20,25 etc.) com um máximo de 100 gramas"] call A3PL_HUD_Notification;};

    {
        if ((_x getVariable ["class",""]) == "cannabis_grinded_5g") then {_allGrinded pushback _x;};
    } foreach _near;
    if ((count _allGrinded) < (_grams / 5)) exitwith {["Não há maconha moída proxima para essa quantia! Lembre-se: Cada pedaço moído de maconha é de 5 gramas!",Color_Red] call A3PL_HUD_Notification;};

    for "_i" from 0 to (_grams / 5) do
    {
        deleteVehicle (_allGrinded select _i);
    };

    [format ["Você ensacou %1 grama(s) em um saco de maconha, agora está no seu inventário!",_grams],Color_Green] call A3PL_HUD_Notification;
    [format ["weed_%1g",_grams],1] call Caue_Inventory_Add;
    closeDialog 0;

}, false] call Server_Setup_Compile;

['A3PL_JobFarming_BagOpen', {

    disableSerialization;
    private ["_scale","_near","_allGrinded","_display","_ctrl"];
    _allGrinded = [];
    _scale = param [0,objNull];
    _near = nearestObjects [_scale, ["A3PL_Cannabis_Bud"],2,true];

    {
        if ((_x getVariable ["class",""]) == "cannabis_grinded_5g") then {_allGrinded pushback _x;};
    } foreach _near;
    if (count _allGrinded < 1) exitwith {["Não há maconha moída proxima, coloque maconha moída perto da balança para ensacar!",Color_Red] call A3PL_HUD_Notification;};

    createDialog "Dialog_BagWeed";
    _display = findDisplay 74;
    _ctrl = _display displayCtrl 1000;
    _ctrl ctrlSetText (format ["Digite um número entre 5 e %1 gramas e clique em saco para ensacar a maconha!",(count _allGrinded) * 5]);


    _ctrl = _display displayCtrl 1600;
    _ctrl buttonSetAction "[] call A3PL_JobFarming_Bag";
    A3PL_JobFarming_Scale = _scale;

}, false] call Server_Setup_Compile;

['A3PL_JobFarming_BluntMake', {
    private ["_scale","_near","_allGrinded","_display","_ctrl"];
    _allGrinded = [];
    _scale = param [0,objNull];
    _near = nearestObjects [_scale, ["A3PL_Cannabis_Bud"],2,true];

    {
        if ((_x getVariable ["class",""]) == "cannabis_grinded_5g") then {_allGrinded pushback _x;};
    } foreach _near;

    if (count _allGrinded < 1) exitwith {
        ["Não há maconha moída proxima, coloque maconha moída perto da balança para ensacar a maconha!",Color_Red] call A3PL_HUD_Notification;
    };

    deleteVehicle (_allGrinded select 0);

    ["Você fez 5g maconha, está no seu inventário!",Color_Green] call A3PL_HUD_Notification;
    ["blunt",1] call Caue_Inventory_Add;
}, false] call Server_Setup_Compile;

['A3PL_JobFarming_BuyGreenHouse', {

    if !([] call Caue_Player_AntiSpam) exitWith {};
    private ["_greenHouse","_interDist","_dist","_begPosASL","_endPosASL","_posATL"];
    _greenHouse = param [0,objNull];
    if (isNull _greenHouse) exitwith {["Não foi possível determinar a estufa",Color_Red] call A3PL_HUD_Notification;};
    _timeLeft = serverTime - (_greenHouse getVariable ["buyTime",serverTime]);
    if ((_timeLeft < 1800) && (_timeLeft != 0)) exitwith { [format ["Esta estufa já pertence a alguém, aguarde mais minuto(s) %1",(1800 - _timeLeft)/60],Color_Red] call A3PL_HUD_Notification;};
    if ((player getVariable ["getjobplayerguy",0]) < 350) exitwith {["Você não tem dinheiro suficiente para alugar esta estufa",Color_Red] call A3PL_HUD_Notification;};

    player setVariable ["getjobplayerguy",((player getVariable ["getjobplayerguy",0]) - 350),true];
    _greenHouse setVariable ["owner",[getPlayerUID player],true];
    _greenHouse setVariable ["buyTime",serverTime,true];
    [player,_greenHouse,"",false] remoteExec ["Server_Housing_CreateKey", 2];
    ["Você comprou esta estufa por $350, agora você possui esta estufa por 30 minutos.",Color_Green] call A3PL_HUD_Notification;

}, false] call Server_Setup_Compile;

['A3PL_JobFarming_CheckCured', {

    private ["_cured","_bud","_near"];
    _bud = param [0,objNull];
    _cured = _bud getVariable ["cured",0];
    if ((_bud getVariable ["class",""]) == "cannabis_bud_cured") exitwith {["Esta erva ja esta pronta! Agora você pode usar essa erva no moedor!",Color_Green] call A3PL_HUD_Notification;};
    if ((_bud getVariable ["class",""]) == "cannabis_grinded_5g") exitwith {["Esta maconha esta pronta para ser ensacada!",Color_Green] call A3PL_HUD_Notification;};
    _near = nearestObjects [_bud, ["A3PL_Fan"], 2,true];
    if ((_bud IN (missionNameSpace getVariable ["A3PL_Cannabis_Buds",[]])) && (count _near > 0)) then
    {
        [format ["Esta erva está secando, esta em %1%2 do processo",_cured,"%"],Color_Green] call A3PL_HUD_Notification;
    } else
    {
        [format ["Esta erva não está secando (esse item foi colocado em uma bancada de trabalho?, e tem um ventilador apontado para as ervas?), esta %1%2 seca",_cured,"%"],Color_Green] call A3PL_HUD_Notification;
    };

}, false] call Server_Setup_Compile;

['A3PL_JobFarming_CureLoop', {

    private ["_bud"];
    _bud = param [0,objNull];

    A3PL_Cannabis_Buds = missionNameSpace getVariable ["A3PL_Cannabis_Buds",[]];
    A3PL_Cannabis_Buds pushback _bud;

    ["Você colocou uma erva na mesa para secar, esse processo leva cerca de 10 minutos e requer que um ventilador seja apontado para a erva. Depois de secar as ervas, você pode usá-las no moedor!"] call A3PL_HUD_Notification;

    if (!isNil "A3PL_Cannabis_CureLoop") exitwith {};
    A3PL_Cannabis_CureLoop = true;

    [] spawn
    {
        while {(count A3PL_Cannabis_Buds) > 0} do
        {
            uiSleep 60;

            private ["_toDelete","_near"];
            _toDelete = [ObjNull];

            {
                if ((isNull (attachedTo _x)) OR (isNull _x)) then
                {
                    _toDelete pushback _x;
                    systemchat "added to delete array";
                } else
                {
                };
                _near = nearestObjects [_x, ["A3PL_Fan"], 2,true];
                if (count _near > 0) then
                {
                    _x setVariable ["cured",(_x getVariable ["cured",0]) + 10,true];
                };

                if ((_x getVariable ["cured",0]) >= 100) then
                {
                    _x setVariable ["class","cannabis_bud_cured",true];
                    _toDelete pushback _x;
                };
            } foreach (missionNameSpace getVariable ["A3PL_Cannabis_Buds",[]]);

            {
                A3PL_Cannabis_Buds = A3PL_Cannabis_Buds - [_x];
            } foreach _toDelete;
        };
        A3PL_Cannabis_CureLoop = nil;
    };

}, false] call Server_Setup_Compile;

['A3PL_JobFarming_GreenHousePlant', {

    if(!([] call Caue_Player_AntiSpam)) exitWith {};
    private ["_greenHouse","_interDist","_dist","_begPosASL","_endPosASL","_posATL","_class","_amountPlants"];
    _greenHouse = param [0,objNull];
    if (isNull _greenHouse) exitwith {["Não foi possível determinar a estufa",Color_Red] call A3PL_HUD_Notification;};
    _class = player_itemClass;

    _timeLeft = serverTime - (_greenHouse getVariable ["buyTime",serverTime]);
    if (_timeLeft > 1800) exitwith {["O aluguel desta estufa expirou, por favor, alugue de novo"] call A3PL_HUD_Notification;};

    _amountPlants = count (nearestObjects [player,["A3PL_Wheat","A3PL_Corn","A3PL_Cannabis","A3PL_Lettuce","A3PL_Coco_Plant","A3PL_Sugarcane_Plant"],5]);
    if (_amountPlants >= 10) exitwith {["Você só pode plantar 10 plantas em uma estufa",Color_Red] call A3PL_HUD_Notification};

    _interDist = [_greenHouse, "FIRE"] intersect [positionCameraToWorld [0,0,0],positionCameraToWorld [0,0,1000]];
    if (count _interDist < 1) exitwith {["Incapaz de determinar onde colocar a semente", Color_Red] call A3PL_HUD_Notification;};
    _dist = (_interDist select 0) select 1;
    _begPosASL = AGLToASL positionCameraToWorld [0,0,0];
    _endPosASL = AGLToASL positionCameraToWorld [0,0,1000];
    _posATL = ASLToATL (_begPosASL vectorAdd ((_begPosASL vectorFromTo _endPosASL) vectorMultiply _dist));

    [player,_class,_posATL] remoteExec ["Server_JobFarming_Plant", 2];
    ["Você plantou uma semente nesta estufa",Color_Green] call A3PL_HUD_Notification;

}, false] call Server_Setup_Compile;

['A3PL_JobFarming_Grind', {

    if(!([] call Caue_Player_AntiSpam)) exitWith {};
    private ["_near","_bud","_grinder"];
    _grinder = param [0,objNull];
    _near = nearestObjects [_grinder, ["A3PL_Cannabis_Bud"], 2,true];
    _bud = objNull;
    {
        if ((_x getVariable "class") == "cannabis_bud_cured") exitwith {_bud = _x;};
    } foreach _near;
    if (isNull _bud) exitwith {["Incapaz de encontrar uma erva pronta por perto",Color_Green] call A3PL_HUD_Notification;};

    deleteVehicle _bud;
    ["Uma erva foi colocada no moedor, levará cerca de 30 segundos para ser concluído!"] call A3PL_HUD_Notification;
    [_grinder] spawn
    {
        _grinder = param [0,objNull];
        uiSleep 30;
        ["Uma erva terminou de moer (5 gramas), você pode coletar do moedor.",Color_Green] call A3PL_HUD_Notification;
        _grinder setVariable ["grindedweed",(_grinder getVariable ["grindedweed",0]) + 5,true];
    };

}, false] call Server_Setup_Compile;

['A3PL_JobFarming_GrindCollect', {

    if(!([] call Caue_Player_AntiSpam)) exitWith {};
    private ["_grinder","_value","_amount"];
    _grinder = param [0,objNull];
    _value = _grinder getVariable ["grindedweed",0];
    if (_value < 5) exitwith
    {
        ["Não há maconha moída neste moedor para ser coletada",Color_Red] call A3PL_HUD_Notification;
    };
    _amount = _value / 5;
    _grinder setVariable ["grindedweed",nil,true];
    [format ["Você pegou %1 maconha(s) triturada(s) (%2 gramas)",_amount,_value],Color_Green] call A3PL_HUD_Notification;
    ["cannabis_grinded_5g",_amount] call Caue_Inventory_Add;

}, false] call Server_Setup_Compile;

['A3PL_JobFarming_Harvest', {

    private ["_plant","_growState"];
    _plant = param [0,objNull];

    if(!([] call Caue_Player_AntiSpam)) exitWith {};

    [player,_plant] remoteExec ["Server_JobFarming_Harvest", 2];
}, false] call Server_Setup_Compile;

['A3PL_JobFarming_Plant', {

    private ["_class","_posATL"];
    _class = player_itemClass;

    if (_class IN ["seed_marijuana"]) exitwith {["Esta semente de maconha precisa ser plantada em uma estufa ou um vaso"] call A3PL_HUD_Notification;};
    if (!(_class IN  ["seed_wheat","seed_marijuana","seed_corn","seed_lettuce","seed_coca","seed_sugar"])) exitwith {["Você não tem uma semente na sua mão para plantar", Color_Red] call A3PL_HUD_Notification;};

    if(!([] call Caue_Player_AntiSpam)) exitWith {};

    _posATL = getPosATL player;
    if ((surfaceType _posATL) != "#cype_plowedfield") exitwith {["Você não está em uma fazenda", Color_Red] call A3PL_HUD_Notification;};

    [player,_class,_posATL] remoteExec ["Server_JobFarming_Plant", 2];
    ["Pedido enviado ao servidor para plantar uma semente neste local", Color_Yellow] call A3PL_HUD_Notification;

}, false] call Server_Setup_Compile;

['A3PL_JobFarming_PlanterPlant', {

    if(!([] call Caue_Player_AntiSpam)) exitWith {};
    private ["_planter","_interDist","_dist","_begPosASL","_endPosASL","_posATL","_class","_amountPlants"];
    _planter = param [0,objNull];
    if (isNull _planter) exitwith {["Não foi possível determinar o vaso",Color_Red] call A3PL_HUD_Notification;};
    _class = player_itemClass;

    _amountPlants = count ([_planter] call A3PL_Lib_AttachedAll);
    if (_amountPlants >= 2) exitwith {["Você só pode plantar 2 plantas em um vaso",Color_Red] call A3PL_HUD_Notification};

    _interDist = [_planter, "FIRE"] intersect [positionCameraToWorld [0,0,0],positionCameraToWorld [0,0,1000]];
    if (count _interDist < 1) exitwith {["Incapaz de determinar onde colocar a semente", Color_Red] call A3PL_HUD_Notification;};
    _dist = (_interDist select 0) select 1;
    _begPosASL = AGLToASL positionCameraToWorld [0,0,0];
    _endPosASL = AGLToASL positionCameraToWorld [0,0,1000];
    _posATL = ASLToATL (_begPosASL vectorAdd ((_begPosASL vectorFromTo _endPosASL) vectorMultiply _dist));

    if (_class == "seed_marijuana") then
    {
        _plant = createVehicle ["A3PL_Cannabis",[_posATL select 0,_posATL select 1,((_posATL select 2) - 0.05)], [], 0, "CAN_COLLIDE"];
        _plant setDir (random 360);
        [_plant, _planter] call BIS_fnc_attachToRelative;
        _plant animateSource ["plant_growth",1];
        A3PL_Cannabis_Plants = missionNameSpace getVariable ["A3PL_Cannabis_Plants",[]];
        A3PL_Cannabis_Plants pushback _plant;

        if ((random 10) >= 5) then { _plant setVariable ["female",true,true]; };

        ["seed_marijuana",-1] call Caue_Inventory_Add;
        [] call Caue_Inventory_Clear;
        ["Você plantou uma semente neste vaso",Color_Green] call A3PL_HUD_Notification;

        if (!isNil "A3PL_Cannabis_Loop") exitwith {};
        A3PL_Cannabis_Loop = true;
        [] spawn
        {
            while {(count A3PL_Cannabis_Plants) > 0} do
            {
                private ["_plantsToDelete"];
                _plantsToDelete = [objNull];
                {
                    if ((isNull _x) OR ((_x animationSourcePhase "plant_growth") > 0.99)) then
                    {
                        _plantsToDelete = _plantsToDelete + [_x];
                    };

                    private ["_near","_lightValue","_plantsToDelete"];

                    _lightValue = 0;
                    _near = nearestObjects [_x, ["A3PL_Cannabis_Lamp_200W","A3PL_Cannabis_Lamp_500W","A3PL_Cannabis_Lamp_1000W"], 2,true];
                    if (count _near < 1) then {_near = objNull;} else
                    {
                        _near = _near select 0;
                    };
                    switch (typeOf _near) do
                    {
                        case ("A3PL_Cannabis_Lamp_200W"): {_lightValue = 2;};
                        case ("A3PL_Cannabis_Lamp_500W"): {_lightValue = 4;};
                        case ("A3PL_Cannabis_Lamp_1000W"): {_lightValue = 6;};
                    };
                    _x setVariable ["lightValue",(_x getVariable ["lightValue",0]) + _lightValue,true];
                } foreach (missionNameSpace getVariable ["A3PL_Cannabis_Plants",[]]);

                {
                    A3PL_Cannabis_Plants = A3PL_Cannabis_Plants - [_x];
                } foreach _plantsToDelete;
                uiSleep 60;
            };
            A3PL_Cannabis_Loop = nil;
        };
    } else
    {
        [player,_class,_posATL] remoteExec ["Server_JobFarming_Plant", 2];
        ["Você plantou uma semente neste vaso",Color_Green] call A3PL_HUD_Notification;
    };

}, false] call Server_Setup_Compile;

['A3PL_JobFarming_PlantReceive', {

    private ["_r","_msg"];
    _r = param [0,-1];

    switch (_r) do
    {
        case -1: {_msg = ["Erro desconhecido ao tentar plantar uma semente",Color_Red];};
        case 0: {_msg = ["Você plantou com sucesso uma semente",Color_Green];};
        case 1: {_msg = ["Esta estufa já tem dono",Color_Red];};
        case 2: {_msg = ["Você já possui uma estufa",Color_Red];};
        case 3: {_msg = ["Você alugou uma estufa por 35 minutos por $250",Color_Green];};
        case 4: {_msg = ["Coleta negada, esta planta não pode ser colhida",Color_Red];};
        case 5: {_msg = [format ["Você colheu %1 %2(s)",param [2,1],([param [1,""], 'name'] call Caue_Config_GetItem)],Color_Green];};
        case 6: {_msg = ["Não é possível adicionar itens ao seu inventário, por favor, verifique se você tem espaço suficiente para caber o(s) item(s) colhido(s)",Color_Red];};
    };

    if (_r == 0) then
    {
        [] call Caue_Inventory_Clear;
    };

    _msg call A3PL_HUD_Notification;

}, false] call Server_Setup_Compile;

['A3PL_JobFarming_SearchSeeds', {

    private ["_random","_found","_timeLeft"];
    if (!(player getVariable ["job","unemployed"] == "farmer")) exitwith {["Você não é um fazendeiro, então você não pode procurar por sementes", Color_Red] call A3PL_HUD_Notification;};

    _timeLeft = missionNameSpace getVariable ["A3PL_JobFarming_SeedTimer",(diag_ticktime-5)];
    if ((animationState player) == "acts_terminalopen") exitwith {["Você já está procurando!",Color_Red] call A3PL_HUD_Notification;};
    if (_timeLeft > diag_ticktime) exitwith {[format ["Por favor, espere %1 segundos antes de procurar outra semente",round(_timeLeft-diag_ticktime)],Color_Red] call A3PL_HUD_Notification;};
    missionNameSpace setVariable ["A3PL_JobFarming_SeedTimer",(diag_ticktime + 20)];

    [player,"Acts_TerminalOpen"] remoteExec ["A3PL_Lib_SyncAnim", 0];

    uiSleep 10;

    _random = round (random 100);
    _found = "";
    switch (true) do {
        case (_random > 40): {["Você não encontrou nada",Color_Red] call A3PL_HUD_Notification;};
        case (_random >= 0):
        {
            private ["_seeds","_seed"];
            _seeds = ["seed_wheat","seed_corn","seed_lettuce","seed_coca","seed_sugar"];
            _seed = _seeds select (floor (random (count _seeds)));
            [format ["Você encontrou uma semente! (%1)",([_seed,"name"] call Caue_Config_GetItem)],Color_Green] call A3PL_HUD_Notification;
            [_seed,1] call Caue_Inventory_Add;
        };
    };
    [player,""] remoteExec ["A3PL_Lib_SyncAnim", 0];

}, false] call Server_Setup_Compile;
/*
    Server
*/
['Server_JobFarming_Plant', {

    private ["_class","_pos","_player","_plant","_plantClass","_plants","_ATLChange"];
    _player = param [0,objNull];
    _class = param [1,""];
    _pos = param [2,[]];

    if ((isNull _player) or (_class == "")) exitwith {};

    if (!([_class,1,_player] call Caue_Inventory_Has)) exitwith {};

    [_player,_class,-1] call Server_Inventory_Change;

    _plantClass = "";
    _ATLChange = 0;

    switch (_class) do
    {
        case "seed_wheat": {_plantClass = "A3PL_Wheat";};
        case "seed_corn": {_plantClass = "A3PL_Corn";};
        case "seed_marijuana": {_plantClass = "A3PL_Cannabis";};
        case "seed_lettuce": {_plantClass = "A3PL_Lettuce"; _ATLChange = -0.15;};
        case "seed_coca": {_plantClass = "A3PL_Coco_Plant";};
        case "seed_sugar": {_plantClass = "A3PL_Sugarcane_Plant";};
    };

    if (_plantClass == "") exitwith {};
    _plant = createVehicle [_plantClass,[_pos select 0,_pos select 1, (_pos select 2) + _ATLChange], [], 0, "CAN_COLLIDE"];
    _plant animateSource ["plant_growth",1];

    [0] remoteExec ["A3PL_JobFarming_PlantReceive", (owner _player)];
}, true] call Server_Setup_Compile;

['Server_JobFarming_DrugDealerPos', {

    private ["_areas","_area","_pos"];
    _objects = [DrugDealerHouse];
    _areas = ["Area_DrugDealer1","Area_DrugDealer3","Area_DrugDealer6","Area_DrugDealer7","Area_DrugDealer8","Area_DrugDealer9","Area_DrugDealer10","Area_DrugDealer11","Area_DrugDealer12","Area_DrugDealer14"];

    _area = _areas select (floor (random (count _areas)));

    _pos = [_area] call CBA_fnc_randPosArea;
    _pos = _pos findEmptyPosition [0, 25,(typeOf DrugDealerHouse)];
    if (count _pos == 0) exitwith {[] call Server_JobFarming_DrugDealerPos};

    if ((count (_pos nearRoads 50)) > 0) exitwith {[] call Server_JobFarming_DrugDealerPos};

    {
        _x setDir (floor (random 360));
        _x setpos _pos;
    } foreach _objects;

    npc_drugsdealer setDir (getDir DrugDealerHouse + 90);
    npc_drugsdealer setpos (DrugDealerHouse modelToWorld [-4,-0.2,-0.4]);

    DrugDealerRelative1 setDir (getDir DrugDealerHouse);
    DrugDealerRelative1 setpos (DrugDealerHouse modelToWorld [-3,-0.2,-0.4]);

}, true] call Server_Setup_Compile;

['Server_JobFarming_Harvest', {

    private ["_player","_plant","_greenhouse","_growstate","_plants","_itemClass","_amount"];
    _player = param [0,objNull];
    _plant = param [1,objNull];
    if ((isNull _player) or (isNull _plant) or (isNull _greenhouse)) exitwith {};
    _growstate = _plant getVariable ["growState",0];

    if ((_plant animationSourcePhase "plant_growth") < 1) exitwith {
        [4] remoteExec ["A3PL_JobFarming_PlantReceive", (owner _player)];
    };


    if (_plant getVariable ["inuse",false]) exitwith {};
    _plant setVariable ["inuse",true,false];

    _itemClass = "";
    _amount = 0;
    switch (typeOf _plant) do {
        case "A3PL_Wheat": {_amount = 10; _itemClass = "wheat";};
        case "A3PL_Corn": {_amount = 2; _itemClass = "corn";};
        case "A3PL_Cannabis": {
            private ["_lightValue","_plants"];
            _itemClass = "cannabis_bud";
            _lightValue = _plant getVariable ["lightValue",0];
            switch (true) do
            {
                case (!(_plant getVariable ["female",false])): {_amount = 0;};
                case (_lightValue > 80): {_amount = 30;};
                case (_lightValue > 50): {_amount = 18;};
                case (_lightValue > 20): {_amount = 6;};
                default {_amount = 1;};
            };

            if (_plant getVariable ["female",false]) then
            {
                _plants = nearestObjects [_plant, ["A3PL_Cannabis"], 5];
                {
                    if (!(_x getVariable ["female",false])) exitwith {_amount = _amount + 5;};
                } foreach _plants;
            };
        };
        case "A3PL_Lettuce": {_amount = 4; _itemClass = "lettuce";};
        case "A3PL_Coco_Plant": {_amount = 2; _itemClass = "coca";};
        case "A3PL_Sugarcane_Plant": {_amount = 2; _itemClass = "sugarcane";};
    };

    if (_itemClass == "") exitwith {};

    if (([player,[[_itemClass,_amount]]] call Caue_Inventory_TotalWeight) > (player getVariable ["MaxWeight",100])) exitwith {
        [6] remoteExec ["A3PL_JobFarming_PlantReceive", (owner _player)];
    };

    deleteVehicle _plant;

    [_player,_itemClass,_amount] call Server_Inventory_Change;

    [5, _itemClass, _amount] remoteExec ["A3PL_JobFarming_PlantReceive", (owner _player)];

    [getPlayerUID _player,"PickupItem",["Harvested Crop",_plant,_itemClass,_amount]] call Caue_Log_Misc;

}, true] call Server_Setup_Compile;
