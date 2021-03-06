['A3PL_Hydrogen_Connect', {

    private ["_intersect","_attached","_hose","_tank","_dir"];
    _intersect = param [0,objNull];

    _attached = [] call A3PL_Lib_Attached;
    if (count _attached == 0) exitwith {["Você não parece estar segurando uma mangueira de combustível", Color_Red] call A3PL_HUD_Notification;};
    _hose = _attached select 0;
    if (!(typeOf _hose IN ["A3PL_Gas_Hose","A3PL_GasHose"])) exitwith {["Você não parece estar segurando uma mangueira de combustível", Color_Red] call A3PL_HUD_Notification;};
    _tank = nearestObjects [player, ["A3PL_Gas_Box"], 30];

    _tank = _tank select 0;

    if ((typeOf _intersect == "Land_A3PL_Gas_Station") && (player_nameintersect IN ["hoseback1","hoseback2","hoseback3","hoseback4"])) exitwith
    {
        detach _hose;
        switch (player_nameintersect) do
        {
            case ("hoseback1"): {_hose attachTo [_tank,[-0.012,-0.09,-1.18]];};
            case ("hoseback2"): {_hose attachTo [_tank,[-0.012,-0.09,-1.18]];};
            case ("hoseback3"): {_hose attachTo [_tank,[-0.006,-0.13,-1.23]];};
            case ("hoseback4"): {_hose attachTo [_tank,[-0.006,-0.13,-1.23]];};
        };
        player_Item = objNull;
    };

    if (!(_intersect isKindOf "All")) exitwith {["Você não está interagindo com um veículo", Color_Red] call A3PL_HUD_Notification;};
    _classname = typeOf player_objintersect;
    _vector = [[0.320857,-0.0197785,-0.946921],[0.946907,0.0282805,0.320261]];
    _attachTo = [-0.1,0,0];
    _maxlength = 0;
    _setdir = 270;

    if (typeOf _hose == "A3PL_Gas_Hose") then
    {
        switch (true) do
        {
            case (_classname IN ["A3PL_P362","A3PL_P362_TowTruck","A3PL_P362_Garbage_Truck"]): {_vector = [[-0.584987,0.000326949,-0.811043],[0.811043,-0.000109344,-0.584987]];_attachTo = [-0.08,0,0.05];};
            case (_classname IN ["A3PL_Rover"]): {_vector = [[-0.213246,-0.0863852,-0.973172],[-0.976888,0.0338489,0.211056]];_attachTo = [-0.1,0,-0.04];};
            case (_classname IN ["A3PL_BMW_M3"]): {_vector = [[-0.213246,-0.0863852,-0.973172],[-0.976888,0.0338489,0.211056]];_attachTo = [-0.04,0,-0.04];};
            case (_classname IN ["A3PL_911GT2"]): {_vector = [[-0.584987,0.000326949,-0.811043],[0.811043,-0.000109344,-0.584987]];_attachTo = [-0.07,0,0.04];};
            case (_classname IN ["A3PL_RBM"]): {_vector = [[-0.213246,-0.0863852,-0.973172],[-0.976888,0.0338489,0.211056]];_attachTo = [0.1,0,0];};
            default {_vector = [[0.320857,-0.0197785,-0.946921],[0.946907,0.0282805,0.320261]];_attachTo = [-0.1,0,0];_maxlength = 7;};
        };
        _hose attachTo [_intersect,_attachTo,"gasTank"];
        uiSleep 0.2;
        _hose setVectorDirAndUp _vector;
        _maxlength = 10;
    };
    if (typeOf _hose == "A3PL_GasHose") then
    {
        switch (true) do
        {
            case (_classname IN ["A3PL_RBM"]): {_setdir = 90;_attachTo = [0.1,0,0];_maxlength = 30;};
            case (_classname IN ["Heli_Medium01_H","Heli_Medium01_Luxury_H","Heli_Medium01_Military_H","Heli_Medium01_Veteran_H","Heli_Medium01_Coastguard_H","Heli_Medium01_Sheriff_H","Heli_Medium01_Medic_H"]): {_setdir = 90;_attachTo = [0.1,0,0];_maxlength = 30;};
            case (_classname IN ["A3PL_Cessna172","A3PL_Goose_Base","A3PL_Goose_Radar","A3PL_Goose_USCG"]): {_setdir = 90;_attachTo = [0,0,-0.07];_maxlength = 30;_vector = [[0.0389273,-0.110648,-0.993097],[0.0389949,-0.992925,0.112158]];};
            case (_classname IN ["A3PL_RHIB","A3PL_Yacht"]): {_setdir = 180;_attachTo = [0,-0.1,0];_maxlength = 30;};
            case (_classname IN ["A3PL_Motorboat"]): {_setdir = 90;_attachTo = [0,0,0.07];_maxlength = 30;_vector = [[0,-0.110648,0.993097],[0,-0.992925,-0.112158]];hint"true";};
            default {_setdir = 270;_attachTo = [-0.1,0,0];_maxlength = 30;};
        };
        _hose attachTo [_intersect,_attachTo,"gasTank"];
        _dir = getDir _hose;
        uiSleep 0.2;
        if (_classname IN ["A3PL_Cessna172","A3PL_Goose_Base","A3PL_Goose_Radar","A3PL_Goose_USCG","A3PL_Motorboat"]) then {_hose setVectorDirAndUp _vector;}else
        {_hose setDir (_dir + (_setdir - (getDir _intersect)));};
        _tank = nearestObject [player, "A3PL_Fuel_Van"];
    };
    ["Você conectou a mangueira de combustível a um veículo", Color_Green] call A3PL_HUD_Notification;
    while {attachedTo _hose == _intersect} do
    {
        uiSleep 0.1;
        if ((_hose distance _tank) > _maxlength) exitwith
        {
            detach _hose;
        };
    };

}, false] call Server_Setup_Compile;

['A3PL_Hydrogen_Grab', {

    private ["_intersect","_tank"];
    _intersect = param [0,objNull];
    if (!(typeOf _intersect IN ["A3PL_Gas_Hose","A3PL_GasHose"])) exitwith {["Você não está olhando para uma mangueira de combustível", Color_Red] call A3PL_HUD_Notification;};
    if ((isPlayer attachedTo _intersect) && (!((attachedTo _intersect) isKindOf "Car"))) exitwith {["Esta mangueira de combustível já está conectada a um jogador", Color_Red] call A3PL_HUD_Notification;};

    _tank = nearestObjects [player, ["A3PL_Gas_Box"], 30];
    if (typeOf _intersect == "A3PL_GasHose") then {_tank = nearestObjects [player, ["A3PL_Fuel_Van"], 30];};
    if (count _tank == 0) exitwith {["Não é possível encontrar um tanque de combustível próximo, você não está perto de um posto de gasolina?", Color_Red] call A3PL_HUD_Notification;};
    _tank = _tank select 0;

    _intersect attachto [player, [0,0,0.2], 'RightHand'];
    if (typeOf _intersect == "A3PL_GasHose") then {_intersect setDir 180};
    sleep 1.5;
    [_tank,player] remoteExec ["A3PL_Lib_ChangeLocality", 2];
    [_intersect,player] remoteExec ["A3PL_Lib_ChangeLocality", 2];

    player_Item = _intersect;
    while {attachedTo _intersect == player} do
    {
        if (((typeOf _tank == "A3PL_Gas_Box") && (_intersect distance _tank > 5))or((typeOf _tank == "A3PL_Fuel_Van") && (_intersect distance _tank > 28))) exitwith {detach _intersect;["A mangueira de combustível caiu porque você andou muito longe do posto de gasolina", Color_Red] call A3PL_HUD_Notification;};
        if (!(vehicle player == player)) exitwith {detach _intersect; ["Você entrou em um veículo e o reabastecimento foi cancelado", Color_Red] call A3PL_HUD_Notification;};
        uisleep 1;
    };
    player_Item = objNull;

}, false] call Server_Setup_Compile;

['A3PL_Hydrogen_LoadKerosene', {

    if(!([] call Caue_Player_AntiSpam)) exitWith {};
    private ["_barrel","_tanker"];
    _barrel = param [0,objNull];
    _tanker = (nearestObjects [player, ["A3PL_Fuel_Van"], 10]) select 0;
    if (isNil "_tanker") exitwith {["Não é possível encontrar um caminhão de combustível nas proximidades",Color_Red] call A3PL_HUD_Notification;};

    deleteVehicle _barrel;
    _tanker setVariable ["petrol",(_tanker getVariable ["petrol",0]) + 42,true];
    [format ["Você carregou este caminhão de combustível com querosene (há %1 galões no tanque agora)",(_tanker getVariable ["petrol",0])],Color_Green] call A3PL_HUD_Notification;

}, false] call Server_Setup_Compile;

['A3PL_Hydrogen_LoadPetrol', {

    if(!([] call Caue_Player_AntiSpam)) exitWith {};
    private ["_barrel","_tanker"];
    _barrel = param [0,objNull];
    _tanker = (nearestObjects [player, ["A3PL_Tanker_Trailer"], 10]) select 0;
    if (isNil "_tanker") exitwith {["Não é possível encontrar um reboque-tanque nas proximidades",Color_Red] call A3PL_HUD_Notification;};

    deleteVehicle _barrel;
    _tanker setVariable ["petrol",(_tanker getVariable ["petrol",0]) + 63,true];
    [format ["Você carregou este tanque com gasolina (agora há %1 galões no tanque)",(_tanker getVariable ["petrol",0])],Color_Green] call A3PL_HUD_Notification;

}, false] call Server_Setup_Compile;

['A3PL_Hydrogen_Open', {

    disableSerialization;
    private ["_display","_station","_gallons","_price"];
    _station = nearestobjects [player,["Land_A3PL_Gas_Station"],30];
    if (count _station < 1) exitwith {["Não foi possível encontrar um posto de gasolina nas proximidades",Color_Red] call A3PL_HUD_Notification;};
    _station = _station select 0;

    createDialog "Dialog_GasStation";

    _display = findDisplay 69;

    buttonSetAction [1600,"[] call A3PL_Hydrogen_SetPrice"];

    (_display displayCtrl 1400) ctrlSetText format ["%1",_station getVariable ["gallonprice",6.2]];

    _gallons = (_station getVariable ["pump1",[0,"0"]]) select 0;
    _price = (_station getVariable ["pump1",[0,"0"]]) select 1;
    (_display displayCtrl 1401) ctrlSetText format ["%1 Galões",_gallons];
    (_display displayCtrl 1402) ctrlSetText format ["%1%2","$",_price];

    _gallons = (_station getVariable ["pump2",[0,"0"]]) select 0;
    _price = (_station getVariable ["pump2",[0,"0"]]) select 1;
    (_display displayCtrl 1403) ctrlSetText format ["%1 Galões",_gallons];
    (_display displayCtrl 1404) ctrlSetText format ["%1%2","$",_price];

    _gallons = (_station getVariable ["pump3",[0,"0"]]) select 0;
    _price = (_station getVariable ["pump3",[0,"0"]]) select 1;
    (_display displayCtrl 1405) ctrlSetText format ["%1 Galões",_gallons];
    (_display displayCtrl 1406) ctrlSetText format ["%1%2","$",_price];

    _gallons = (_station getVariable ["pump4",[0,"0"]]) select 0;
    _price = (_station getVariable ["pump4",[0,"0"]]) select 1;
    (_display displayCtrl 1407) ctrlSetText format ["%1 Galões",_gallons];
    (_display displayCtrl 1408) ctrlSetText format ["%1%2","$",_price];

    (_display displayCtrl 1409) ctrlSetText format ["%1 Galões",(_station getVariable ["petrol",0])];

}, false] call Server_Setup_Compile;

['A3PL_Hydrogen_SetNumbers', {

    private ["_station","_pumpNumber","_gallons","_price","_gallonAD","_gallonBD","_priceAD","_priceBD"];
    _station = param [0,objNull];
    _pumpNumber = param [1,1];
    _gallons = param [2,"0.00"];
    _price = param [3,"0.00"];

    _gallonBD = (_gallons splitstring ".") select 0;
    _gallonAD = (_gallons splitstring ".") select 1;
    _priceBD = (_price splitstring ".") select 0;
    _priceAD = (_price splitstring ".") select 1;

    switch (count _gallonBD) do
    {
        case (1): {_gallonBD = format ["0000%1",_gallonBD]};
        case (2): {_gallonBD = format ["000%1",_gallonBD]};
        case (3): {_gallonBD = format ["00%1",_gallonBD]};
        case (4): {_gallonBD = format ["0%1",_gallonBD]};
        case (5): {_gallonBD = format ["%1",_gallonBD]};
    };

    switch (count _priceBD) do
    {
        case (1): {_priceBD = format ["0000%1",_priceBD]};
        case (2): {_priceBD = format ["000%1",_priceBD]};
        case (3): {_priceBD = format ["00%1",_priceBD]};
        case (4): {_priceBD = format ["0%1",_priceBD]};
        case (5): {_priceBD = format ["%1",_priceBD]};
    };

    _startSel = 2 + ((_pumpNumber - 1) * 16);
    for "_i" from 0 to 7 do
    {
        if (_i == 5) then {_station setObjectTextureGlobal [_startSel,""]};
        if (_i < 5) then { _station setObjectTextureGlobal [_startSel,format ["\A3PL_Common\HydrogenNumbers\%1.paa",_priceBD select [_i,1]]];};
        if (_i > 5) then { _station setObjectTextureGlobal [_startSel,format ["\A3PL_Common\HydrogenNumbers\%1.paa",_priceAD select [(_i-6),1]]];};
        _startSel = _startSel + 1;
    };

    _startSel = 10 + ((_pumpNumber - 1) * 16);
    for "_i" from 0 to 7 do
    {
        if (_i == 5) then {_station setObjectTextureGlobal [_startSel,""]};
        if (_i < 5) then { _station setObjectTextureGlobal [_startSel,format ["\A3PL_Common\HydrogenNumbers\%1.paa",_gallonBD select [_i,1]]] };
        if (_i > 5) then { _station setObjectTextureGlobal [_startSel,format ["\A3PL_Common\HydrogenNumbers\%1.paa",_gallonAD select [(_i-6),1]]] };
        _startSel = _startSel + 1;
    };

}, false] call Server_Setup_Compile;

['A3PL_Hydrogen_SetPrice', {

    disableSerialization;
    private ["_display","_newPrice","_station"];
    _display = findDisplay 69;

    _station = nearestobjects [player,["Land_A3PL_Gas_Station"],30];
    if (count _station < 1) exitwith {["Não foi possível encontrar um posto de gasolina nas proximidades",Color_Red] call A3PL_HUD_Notification;};
    _station = _station select 0;

    if ((_station getVariable ["bOwner","0"]) != (getPlayerUID player)) exitwith {["Apenas o proprietário deste posto pode definir os preços",Color_Red] call A3PL_HUD_Notification;};

    _newPrice = parseNumber (ctrlText (_display displayCtrl 1400));
    if (_newPrice < 6.2) exitwith {[format ["Por favor, digite um número maior que %1",6.2],Color_Red] call A3PL_HUD_Notification};
    if (_newPrice > (6.2 * 25)) exitwith {[format ["Por favor, insira um número menor que %1",6.2*25],Color_Red] call A3PL_HUD_Notification};

    (_display displayCtrl 1400) ctrlSetText format ["%1",_newPrice];
    _station setVariable ["gallonprice",_newPrice,true];

    ["Novo preço do posto de gasolina definido!",Color_Green] call A3PL_HUD_Notification;

}, false] call Server_Setup_Compile;

['A3PL_Hydrogen_StorageSwitch', {

    private ["_station","_i","_adapter","_end","_source","_newSource","_newStorage","_amount"];
    _station = param [0,objNull];

    if (_station animationSourcePhase "hoseSwitch" > 0) exitwith {_station animateSource ["hoseSwitch",0]};

    _adapter = nearestObjects [(_station modelToWorld [-3.76154,3.51953,-2.05121]), ["A3PL_FD_HoseEnd1_Float"], 1];
    _adapter = _adapter select 0;
    if (isNil "_adapter") exitwith {["Nenhum adaptador de mangueira conectado a este tanque de gasolina",Color_Red] call A3PL_HUD_Notification;};
    _end = attachedObjects _adapter;
    _end = _end select 0;
    if (isNil "_end") exitwith {["Nenhuma mangueira conectada ao adaptador da mangueira",Color_Red] call A3PL_HUD_Notification;};
    _source = [_end] call A3PL_FD_FindSource;
    if (isNull _source) exitwith {["Não foi possível encontrar uma fonte válida para bombear gasolina",Color_Red] call A3PL_HUD_Notification;};
    if ((_source getVariable ["petrol",0]) <= 0) exitwith {["Nenhuma gasolina pode ser encontrada dentro do tanque, está vazio?",Color_Red] call A3PL_HUD_Notification;};

    _station animateSource ["hoseSwitch",1];
    _i = 0;
    waitUntil {sleep 0.1; _i = _i + 0.1; if (_i > 5) exitwith {true}; (_station animationSourcePhase "hoseSwitch" > 0)};
    while {((_source getVariable ["petrol",0]) > 0) && (!isNull _source) && (_station animationSourcePhase "hoseSwitch" > 0)} do
    {
        _amount = 1.5;
        if ((_source getVariable ["petrol",0]) < _amount) then {_amount = _source getVariable ["petrol",0]};
        _newSource = (_source getVariable ["petrol",0]) - _amount; if (_newSource < 0) then {_newSource = 0;};
        _newStorage = (_station getVariable ["petrol",0]) + _amount; if (_newStorage < 0) then {_newStorage = 0;};
        _source setVariable ["petrol",_newSource,true];
        _station setVariable ["petrol",_newStorage,true];
        [format ["Bombeando | Tanque Veiculo: %1 | Tanque Posto: %2",_newSource,_newStorage],Color_Green] call A3PL_HUD_Notification;
        uiSleep 2;
        _source = [_end] call A3PL_FD_FindSource;
    };
    ["Bombeamento concluído/interrompido",Color_Green] call A3PL_HUD_Notification;
    _station animateSource ["hoseSwitch",0];

}, false] call Server_Setup_Compile;

['A3PL_Hydrogen_SwitchFuel', {

    private ["_intersect","_tank","_car","_gallonPrice","_myPrice","_station","_gallons","_pumpNumber","_newgas","_totalGallons"];
    _intersect = param [0,objNull];

    if (isNil "CBA_fnc_formatNumber") exitwith {["System: CBA not enabled, you dumb ass!", Color_Red] call A3PL_HUD_Notification;};
    if (!(typeOf _intersect IN ["A3PL_Gas_Hose","A3PL_GasHose"])) exitwith {["Você não parece estar interagindo com uma mangueira de combustível", Color_Red] call A3PL_HUD_Notification;};
    if (typeOf _intersect == "A3PL_Gas_Hose") then
    {
        _tank = nearestObjects [player, ["A3PL_Gas_Box"], 30];
        if (count _tank == 0) exitwith {["Não foi possivel encontrar uma caixa de combustível nas proximidades, você não está perto de uma estação de combustível?", Color_Red] call A3PL_HUD_Notification;};
        _tank = _tank select 0;

        if (_intersect animationPhase "gasTurn" > 0) exitwith
        {
            _intersect animate ["gasTurn",0];
            {
                _type = format["%1",typeOf _x];
                if(_type == "#dynamicsound") then {
                    deleteVehicle _x;
                };
            } foreach nearestObjects [_tank,[],5];
        };

        _car = attachedTo _intersect;
        if ((isNull _car) or (!(_car isKindOf "Car"))) exitwith {["A mangueira de combustível não está conectada a um veículo", Color_Red] call A3PL_HUD_Notification;};

        _station = nearestObjects [_tank,["Land_A3PL_Gas_Station"],10];
        if (count _station < 1) exitwith {["System Error: Couldn't find gas station", Color_Red] call A3PL_HUD_Notification;};
        _station = _station select 0;
        if ((_station getVariable ["petrol",0]) <= 0) exitwith {["Não há gasolina no tanque do posto",Color_Red] call A3PL_HUD_Notification;};
        createSoundSource ["A3PL_GasPump",getpos _tank, [], 0];

        _intersect animate ["gasTurn",1];

        _i = 0;
        waitUntil {sleep 0.1; _i = _i + 0.1; if (_i > 5) exitwith {true}; (_intersect animationPhase "gasTurn" > 0)};

        _gallonPrice = _station getVariable ["gallonprice",6.2];
        _myPrice = 0;
        _totalGallons = 0;
        _pumpNumber = 1;
        switch (format ["%1",_tank]) do
        {
            case ("A3PL_GasBox1"): {_pumpNumber = 1;};
            case ("A3PL_GasBox2"): {_pumpNumber = 1;};
            case ("A3PL_GasBox3"): {_pumpNumber = 1;};
            case ("A3PL_GasBox4"): {_pumpNumber = 1;};
        };

        [_car,player] remoteExec ["A3PL_Lib_ChangeLocality",2];

        while {(_intersect animationPhase "gasTurn" > 0) && (attachedTo _intersect == _car) && ((_station getVariable ["petrol",0]) > 0)} do
        {
            _gallons = 0.25 + random 0.15;
            _totalgallons = _totalGallons + _gallons;
            _myPrice = _gallonPrice * _totalGallons;

            [_station,_pumpNumber,([_totalGallons,1,2] call CBA_fnc_formatNumber),([_myprice,1,2] call CBA_fnc_formatNumber)] call A3PL_Hydrogen_SetNumbers;

            [_car,((fuel _car) + (_totalGallons / 350))] remoteExec ['setfuel',_car];

            if ((fuel _car) >= 1) exitwith {};
            _newgas = (_station getVariable ["petrol",0]) - _gallons;
            if (_newGas < 0) then {_newGas = 0;};
            _station setVariable ["petrol",_newGas,true];

            uiSleep 1;
        };

        if ((_station getVariable ["petrol",0]) <= 0) then {["Não há gasolina no tanque do posto",Color_Red] call A3PL_HUD_Notification;};
        [format ["Enchimento do carro concluido/interrompido, custo total: $%1",_myprice], Color_Green] call A3PL_HUD_Notification;

        _station setVariable [format ["pump%1",_pumpNumber],[[_totalGallons,1,2] call CBA_fnc_formatNumber,[_myprice,1,2] call CBA_fnc_formatNumber],true];

        _intersect animate ["gasTurn",0];
        {
            _type = format["%1",typeOf _x];
            if(_type == "#dynamicsound") then {
                deleteVehicle _x;
            };
        } foreach nearestObjects [_tank,[],5];
    };
    if (typeOf _intersect == "A3PL_GasHose") then
    {
        _tank = nearestObjects [player, ["A3PL_Fuel_Van"], 30];
        if (count _tank == 0) exitwith {["Não é possível encontrar um caminhão de combustível nas proximidades", Color_Red] call A3PL_HUD_Notification;};
        _tank = _tank select 0;
        if (_intersect animationPhase "gasTurn" > 0) exitwith
        {
            _intersect animate ["gasTurn",0];
            {
                _type = format["%1",typeOf _x];
                if(_type == "#dynamicsound") then {
                    deleteVehicle _x;
                };
            } foreach nearestObjects [_tank,[],5];
        };
        _car = attachedTo _intersect;
        _intersect animate ["gasTurn",1];
        _i = 0;
        waitUntil {sleep 0.1; _i = _i + 0.1; if (_i > 5) exitwith {true}; (_intersect animationPhase "gasTurn" > 0)};

        _myPrice = 0;
        _totalGallons = 0;

        if ((isNull _car) or ((_car isKindOf "Land"))) exitwith {["A mangueira de combustível não está conectada a um veículo", Color_Red] call A3PL_HUD_Notification;};

        createSoundSource ["A3PL_GasPump",getpos _tank, [], 0];
        while {(_intersect animationPhase "gasTurn" > 0) && (attachedTo _intersect == _car) && ((_tank getVariable ["petrol",0]) > 0)&& ({(typeOf _x == "a3pl_fd_hoseend1")} forEach attachedObjects _tank)} do
        {
            _gallons = 1 + random 0.60;
            _totalgallons = _totalGallons + _gallons;

            [_car,((fuel _car) + (_totalGallons / 1400))] remoteExec ['setfuel',_car];
            if ((fuel _car) >= 1) exitwith {};
            _newgas = (_tank getVariable ["petrol",0]) - _gallons;
            if (_newGas < 0) then {_newGas = 0;};
            _tank setVariable ["petrol",_newGas,true];

            uiSleep 1;
        };
        _Gas = round (_tank getVariable ["petrol",0]);
        if ((_tank getVariable ["petrol",0]) <= 0) then {["Não há gasolina no caminhão",Color_Red] call A3PL_HUD_Notification;};
        [format ["Enchimento concluido/interrompido, %1 galões restantes no caminhão",_Gas], Color_Green] call A3PL_HUD_Notification;
        _intersect animate ["gasTurn",0];
        {
            _type = format["%1",typeOf _x];
            if(_type == "#dynamicsound") then {
                deleteVehicle _x;
            };
        } foreach nearestObjects [_tank,[],5];
    };

}, false] call Server_Setup_Compile;

['CAUE_Hydrogen_Fuel', {

    hint "rolafasf";

}, false] call Server_Setup_Compile;
