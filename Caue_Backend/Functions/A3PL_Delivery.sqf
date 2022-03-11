['A3PL_Delivery_Deliver', {

    if(!([] call Caue_Player_AntiSpam)) exitWith {};
    private ["_package","_pos","_label"];
    _package = objNull;
    {
        if ((typeOf _x) isEqualTo "A3PL_DeliveryBox") exitwith {_package = _x; true;};
    } foreach ([player] call A3PL_Lib_AttachedAll);
    if (isNull _package) exitwith {["Você não está carregando um pacote para entregar!",Color_Red] call A3PL_HUD_Notification;};
    _label = _package getVariable ["label",[]];
    _pos = _label select 0;

    if ((player distance _pos) < 10) then
    {
        deleteVehicle _package;
        ["Você ganhou $1000 por entregar este pacote",Color_Green] call A3PL_HUD_Notification;
        player setVariable ["getjobplayerguy",(player getVariable ["getjobplayerguy",0])+1000,true];
        player setVariable ["jobVehicleTimer",(player getVariable ["jobVehicleTimer",0]) + 240,true];
    } else
    {
        ["Você não está perto do local para entregar este pacote, por favor, verifique a etiqueta de entrega!",Color_Red] call A3PL_HUD_Notification;
    };

}, false] call Server_Setup_Compile;

['A3PL_Delivery_GenPackage', {

    private ["_locations","_package","_jobVeh"];
    _locations =
    [
        [[2658.92,5488.49,0],"estas Mangueiras","o Corpo de Bombeiros de Silverton"],
        [[2565.87,5501.98,0],"estas Cartas Legais","a Prefeitura de Silverton"],
        [[2537.62,5605.59,0],"estas Notas","o Banco de Silverton"],
        [[2514.74,5646.93,0],"estes Peixes Frescos","o McDonalds de Silverton"],
        [[2598.32,5432.5,0],"estes Donuts","a Delegacia de Silverton"],
        [[2362.44,5479.82,0],"estas Ferramentas","o Patio de Apreensão de Silverton"],
        [[2621.42,5609.62,0],"estas Latas","a Loja Geral de Silverton"],
        [[3541.06,5158.72,0],"estas Armas de Paintball","a Loja de Paintball"],
        [[3806.26,6226.4,0],"este Dinheiro Sujo","o Lavador de Dinheiro"],

        [[3587.11,7497.87,0],"estes Tacos","o Taco Hell de Stoney Creek"],
        [[3453.14,7515.06,0],"estas Lâmpadas","a Loja de Equipamentos de Stoney Creek"],
        [[3428.95,7485.06,0],"estes Cheques","o Banco de Stoney Creek"],

        [[4171.13,6179.98,0],"estas Revistas Porno","o Posto de Gasolina de Beach Valley"],
        [[4139.38,5689.15,0],"estas Sementes","a Loja de Sementes (Estufas)"],
        [[4766.01,6304.35,0],"estas Correntes","a Prisão"],
        [[6472.46,5515.05,0],"estes Machados","o Bob o Lenhador"],
        [[6961.03,5425.72,0],"estes Tubos","o Moonshine Willy"],

        [[6125.71,7448.82,0],"estes Documentos","o DOJ/DMV em Elk City"],

        [[7120.18,7249.38,0],"estas Joias","a Loja de Joias em Boulder City"],
        [[7147.02,7220.42,0],"esta Ordem de Despejo","a Loja de Moveis em Boulder City"],
        [[7108.02,7199.19,0],"estes Uniformes","o McDonalds de Boulder City"],
        [[6958.67,7015.32,0],"estas Canetas","o Banco de Boulder City"]
    ];

    _attachPoints =
    [
        [-0.7,0,-0.87],[-0.3,0,-0.87],[0.15,0,-0.87],[0.6,0,-0.87],
        [-0.7,-1.9,-0.87],[-0.3,-1.9,-0.87],[0.15,-1.9,-0.87],[0.6,-1.9,-0.87]
    ];

    _attachpoints = _attachPoints call BIS_fnc_arrayShuffle;
    _locations = _locations call BIS_fnc_arrayShuffle;

    _jobVeh = player getVariable ["jobVehicle",objNull];
    if (isNull _jobVeh) exitwith {["Veículo de trabalho não encontrado, tente entrar novamente no seu trabalho",Color_Red] call A3PL_HUD_Notification;};

    private _packages = [];
    for "_i" from 0 to (3 + (round (random 3))) do {
        _package = createVehicle ["A3PL_DeliveryBox", getpos player, [], 0, "CAN_COLLIDE"];
        _package attachTo [_jobVeh,(_attachPoints select (random ((count _attachPoints) - 1)))];
        _package setVariable ["class","mail",true];
        _package setVariable ["owner",getPlayerUID player,true];
        _package setVariable ["label",(_locations select (random ((count _locations) - 1)))];
        _packages pushBack _package;
    };

    _jobVeh setVariable ["packagesdelivery",_packages,true];

    ["Os pacotes estao em seu veiculo, verifique o rótulo para ver onde eles têm que ir!",Color_Green] call A3PL_HUD_Notification;

}, false] call Server_Setup_Compile;

['A3PL_Delivery_Label', {

    private ["_package","_address","_item","_label"];
    _package = param [0,objNull];
    _label = _package getVariable ["label",[]];
    _address = _label select 2;
    _item = _label select 1;
    if (count _label == 0) exitwith {["Não é possível ver o rótulo de entrega",Color_Red] call A3PL_HUD_Notification;};
    [format ["Por favor, entregue %1 para %2",_item,_address],Color_Green] call A3PL_HUD_Notification;

}, false] call Server_Setup_Compile;

['A3PL_Delivery_Pickup', {

    private ["_package"];
    _package = param [0,objNull];
    player playAction "Gesture_carry_box";
    [] call A3PL_Placeables_QuickAction;
    [_package] spawn
    {
        _package = param [0,objNull];
        _package setDir (getDir player);
        while {_package IN (attachedObjects player)} do
        {
            uiSleep 0.5;
            if (isNull _package) exitwith {};
        };
        player playAction "gesture_stop";
    };

}, false] call Server_Setup_Compile;

['A3PL_Delivery_StartJob', {

    if(!([] call Caue_Player_AntiSpam)) exitWith {};
    if ((player getVariable ["job","unemployed"]) isEqualTo "deliver") exitwith {["Você parou de trabalhar como entregador!",Color_Red]; [] call A3PL_NPC_LeaveJob};
    player setVariable ["job","deliver"];
    ["Vá pegar o seu caminhão e entrege os pacotes, verifique o rótulo na embalagem para ver o endereço!",Color_Green] call A3PL_HUD_Notification;
    player adduniform "A3PL_Mailman_Uniform";
    player addHeadGear "A3PL_Mailman_Cap";

    sleep (random 2 + 2);
    ["A3PL_Mailtruck",[4142.04,6319.11,0.0135479],"DELIVER",1800] spawn A3PL_Lib_JobVehicle_Assign;

    sleep (random 2 + 2);
    [] call A3PL_Delivery_GenPackage;

}, false] call Server_Setup_Compile;
