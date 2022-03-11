['A3PL_Moonshine_AddItem', {

    if(!([] call Caue_Player_AntiSpam)) exitWith {};
    private ["_dist","_nearby"];
    _dist = param [0,objNull];
    _nearby = nearestObjects [_dist, ["A3PL_Grainsack_Malt","A3PL_Grainsack_Yeast","A3PL_Grainsack_CornMeal"], 2];

    if (count _nearby < 1) exitwith {["Não há malte, fermento ou farinha de milho nas proximidades, mova o item para mais perto da destilaria",Color_Red] call A3PL_HUD_Notification;};
    _nearby = _nearby select 0;
    _item = _nearby getVariable "class";

    _items = _dist getVariable ["items",[]];
    if (_item IN _items) exitwith {["Este item (mais próximo) já foi adicionado na destilaria, adicione um item diferente mais próximo da destilaria",Color_Red] call A3PL_HUD_Notification;};

    deleteVehicle _nearby;
    _items pushback _item;
    _dist setVariable ["items",_items,true];

    [format ["Você adicionou %1 na destilaria",[_item,"name"] call Caue_Config_GetItem],Color_Green] call A3PL_HUD_Notification;

}, false] call Server_Setup_Compile;

['A3PL_Moonshine_CheckStatus', {

    private ["_distillery"];
    _distillery = param [0,objNull];
    if (!(_distillery getVariable ["running",false])) exitwith {["Esta destilaria não está funcionando",Color_Red] call A3PL_HUD_Notification;};

    [format ["Esta destilaria tem %1 segundo(s) restante até a conclusão",(_distillery getVariable ["timeleft",180])],Color_Green] call A3PL_HUD_Notification;

}, false] call Server_Setup_Compile;

['A3PL_Moonshine_Grind', {

    private ["_output","_nearby","_input","_pos","_mixer"];
    _output = param [0,""];
    _mixer = param [1,objNull];
    switch (_output) do
    {
        case ("malt"): {
            _input = objNull;
            _nearby = nearestObjects [_mixer, ["A3PL_Sack"], 2];
            {
                if (_x getVariable "class" == "wheat") exitwith {_input = _x;};
            } foreach _nearby;
            if (isNull _input) exitwith {["Não há trigo por perto para triturar"] call A3PL_HUD_Notification;};

            if ([5,"Triturando trigo...","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa","default"] call Caue_HUD_Progress) then {
                _pos = getposATL _input;
                deleteVehicle _input;
                _malt = createvehicle ["A3PL_Grainsack_Malt", _pos, [], 0, "CAN_COLLIDE"];
                _malt setVariable ["owner",getPlayerUID player,true];
                _malt setVariable ["class","malt",true];
                ["Você triturou o trigo em malte",Color_Green] call A3PL_HUD_Notification;
            } else {
                ["Cancelado",Color_Red] call A3PL_HUD_Notification;
            };
        };
        case ("yeast"): {
            _input = objNull;
            _nearby = nearestObjects [_mixer, ["A3PL_Sack"], 2];
            {
                if (_x getVariable "class" == "wheat") exitwith {_input = _x;};
            } foreach _nearby;
            if (isNull _input) exitwith {["Não há trigo por perto para triturar"] call A3PL_HUD_Notification;};

            if ([5,"Triturando trigo...","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa","default"] call Caue_HUD_Progress) then {
                _pos = getposATL _input;
                deleteVehicle _input;
                _yeast = createvehicle ["A3PL_Grainsack_Yeast", _pos, [], 0, "CAN_COLLIDE"];
                _yeast setVariable ["owner",getPlayerUID player,true];
                _yeast setVariable ["class","yeast",true];
                ["Você triturou o trigo em fermento",Color_Green] call A3PL_HUD_Notification;
            } else {
                ["Cancelado",Color_Red] call A3PL_HUD_Notification;
            };
        };
        case ("cornmeal"): {
            _input = objNull;
            _nearby = nearestObjects [_mixer, ["A3PL_CornCob"], 2];
            {
                if (_x getVariable "class" == "corn") exitwith {_input = _x;};
            } foreach _nearby;
            if (isNull _input) exitwith {["Não há sabugo de milho por perto para triturar"] call A3PL_HUD_Notification;};

            if ([5,"Triturando milho...","\a3\ui_f\data\IGUI\Cfg\Actions\take_ca.paa","default"] call Caue_HUD_Progress) then {
                _pos = getposATL _input;
                deleteVehicle _input;
                _cornmeal = createvehicle ["A3PL_Grainsack_CornMeal", _pos, [], 0, "CAN_COLLIDE"];
                _cornmeal setVariable ["owner",getPlayerUID player,true];
                _cornmeal setVariable ["class","cornmeal",true];
                ["Você triturou o milho em fubá",Color_Green] call A3PL_HUD_Notification;
            } else {
                ["Cancelado",Color_Red] call A3PL_HUD_Notification;
            };
        };
    };

}, false] call Server_Setup_Compile;

['A3PL_Moonshine_InstallHose', {

    if(!([] call Caue_Player_AntiSpam)) exitWith {};
    private ["_dist","_hose","_hoses"];
    _dist = param [0,objNull];
    _hoses = nearestObjects [_dist, ["A3PL_Distillery_Hose"], 2];
    if (count _hoses < 1) exitwith {["Não há uma mangueira de destilaria por perto",Color_Red] call A3PL_HUD_Notification;};
    _hose = _hoses select 0;
    _hose attachto [_dist,[-0.53,0.48,-0.3]];
    ["Mangueira instalada com sucesso",Color_Green] call A3PL_HUD_Notification;

}, false] call Server_Setup_Compile;

['A3PL_Moonshine_InstallJug', {

    if !([] call Caue_Player_AntiSpam) exitWith {};

    private _hose = param [0,objNull];
    private _jugs = nearestObjects [_hose, ["A3PL_Jug","A3PL_Jug_Green"], 2];

    if ((count _jugs) < 1) exitwith {["Nenhum jarro perto",Color_Red] call A3PL_HUD_Notification;};

    private _jug = _jugs select 0;

    if (_jug isEqualTo Player_Item) then {
        ["jug",-1] call Caue_Inventory_Add;
        [false] call Caue_Inventory_PutBack;
        _jug = "A3PL_Jug" createVehicle (getPos player);
        _jug setVariable ["owner",getPlayerUID player,true];
        _jug setVariable ["class","jug",true];
    };

    _jug attachto [_hose,[-0.2,-0.17,-0.57]];

    ["Jarro conectado com sucesso",Color_Green] call A3PL_HUD_Notification;

}, false] call Server_Setup_Compile;

['A3PL_Moonshine_Start', {

    if(!([] call Caue_Player_AntiSpam)) exitWith {};
    private ["_dist","_sound","_items","_timeLeft","_hose","_succes","_posSound"];
    _dist = param [0,objNull];
    if (_dist getVariable ["running",false]) exitwith {["Esta destilaria já está em funcionamento",Color_Red] call A3PL_HUD_Notification;};

    _items = _dist getVariable ["items",[]];
    if (!(("malt" IN _items) && ("yeast" IN _items) && ("cornmeal" IN _items))) exitwith {["Os itens necessários para criar o moonshine não estão nesta destilaria, o malte, o fermento e a fubá são necessários para fazer o moonshine",Color_Red] call A3PL_HUD_Notification;};
    if ((count ([_dist] call A3PL_Lib_AttachedAll)) < 1) exitwith {["Não há mangueira conectada à destilaria",Color_Red] call A3PL_HUD_Notification;};
    _hose = ([_dist] call A3PL_Lib_AttachedAll) select 0;
    if ((count ([_hose] call A3PL_Lib_AttachedAll)) < 1) exitwith {["Não há jarro conectado à mangueira ou o jarro já está cheio",Color_Red] call A3PL_HUD_Notification;};
    _jug = ([_hose] call A3PL_Lib_AttachedAll) select 0;

    _dist setVariable ["running",true];

    _sound = createSoundSource ["A3PL_Boiling", (getpos _dist), [], 0];
    _posSound = getPos _dist;

    _timeLeft = 180;
    _disillery setVariable ["timeleft",_timeLeft,false];
    _succes = false;
    while {(_timeLeft > 0) && (_dist getVariable ["running",false])} do
    {
        if (!([_posSound,(getpos _dist)] call BIS_fnc_areEqual)) then
        {
            _sound setPos (getpos _dist);
            _posSound = getpos _dist;
        };

        if ((count ([_dist] call A3PL_Lib_AttachedAll))< 1) exitwith {["A mangueira foi desconectada, uma de suas destilarias parou de funcionar",Color_Red] call A3PL_HUD_Notification; true;};

        if ((count ([_hose] call A3PL_Lib_AttachedAll)) < 1) exitwith {["O jarro foi removido de uma de suas destilarias",Color_Red] call A3PL_HUD_Notification; true;};

        _timeLeft = _timeLeft - 1;
        _disillery setVariable ["timeleft",_timeLeft,false];
        if (_timeLeft < 1) exitwith {_succes = true; true;};
        sleep 1;
    };
    _dist setVariable ["running",nil,true];
    deleteVehicle _sound;

    if (_succes) then
    {
        _dist setVariable ["items",nil,true];
        _position = getPosATL _jug;
        deleteVehicle _jug;
        _jug = createvehicle ["A3PL_Jug_Corked", _position, [], 0, "CAN_COLLIDE"];
        _jug setVariable ["owner",getPlayerUID player,true];
        _jug setVariable ["class","jug_moonshine",true];
        ["Uma de suas destilarias acabou de criar o moonshine",Color_Green] call A3PL_HUD_Notification;
    } else
    {
        ["Uma de suas destilarias não conseguiu terminar",Color_Red] call A3PL_HUD_Notification;
    };

}, false] call Server_Setup_Compile;
