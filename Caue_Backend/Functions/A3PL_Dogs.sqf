['A3PL_Dogs_BuyReceive', {

    private ["_class","_dog"];

    _class = param [0,"Alsatian_Sand_F"];

    _dog = createAgent [_class, getPosATL player, [], 1, "CAN_COLLIDE"];
    _dog allowDamage false;
    _dog setposATL (getposATL player);
    _dog setVariable ["BIS_fnc_animalBehaviour_disable", true];

    _dog playMove "Dog_Sprint";

    0 = [_dog] spawn
    {
        private ["_set","_setSit","_dog","_attachPoint","_doDrugsCheck"];
        _dog = param [0,objNull];

        _set = false;
        _setSit = true;
        _doDrugsCheck = 0;

        while {alive _dog} do
        {
            sleep 0.5;
            if (vehicle player != player) then
            {
                if (!(attachedTo _dog == (vehicle player))) then
                {
                    _attachPoint = [0,-0.2,-0.6];
                    switch (typeOf (vehicle player)) do
                    {
                        case ("A3PL_Tahoe_FD"): {_attachPoint = [0,0.2,-1.1]};
                        case ("A3PL_Tahoe_PD"): {_attachPoint = [0,0.2,-1.1]};
                        case ("A3PL_Tahoe_PD_Slicktop"): {_attachPoint = [0,0.2,-1.1]};
                        case ("A3PL_CVPI_PD"): {_attachPoint = [0,-0.3,-1.1]};
                        case ("A3PL_CVPI_PD_Slicktop"): {_attachPoint = [0,-0.3,-1.1]};
                        case ("A3PL_Mustang_PD"): {_attachPoint = [0,0.2,-1.1]};
                        case ("A3PL_Mustang_PD_Slicktop"): {_attachPoint = [0,0.2,-1.1]};
                        case ("A3PL_Charger_PD"): {_attachPoint = [0,0.2,-1.1]};
                        case ("A3PL_Charger_PD_Slicktop"): {_attachPoint = [0,0.2,-1.1]};
                    };
                    _dog attachto [vehicle player,_attachPoint];
                };
            };

            if (vehicle player == player) then
            {
                if (!isNull (attachedTo _dog)) then
                {
                    detach _dog;
                };
            };

            if ((player distance _dog) > 4) then
            {
                if (_set) then
                {
                    _dog playMoveNow "Dog_Sprint";
                    _set = false;
                    _setSit = true;
                };
                _dog moveTo (getpos player);
            } else
            {
                if (_setSit) then
                {
                    _dog playMoveNow "Dog_Sit";
                    _set = true;
                    _setSit = false;
                };
            };

            _doDrugsCheck = _doDrugsCheck + 0.5;
            if (_doDrugsCheck >= 6) then
            {
                private ["_nearbyPlayers","_foundDrugs"];
                _doDrugsCheck = 0;
                _foundDrugs = false;

                _nearbyPlayers = [];
                {
                    if ((_dog distance2D _x) < 10) then
                    {
                        _nearbyPlayers pushback _x;
                    };
                } foreach allPlayers;

                {
                    private ["_player"];
                    _player = _x;
                    {
                        if ([_x,1,_player] call Caue_Inventory_Has) exitwith {_foundDrugs = true;};
                    } foreach Config_Items_Illegal;
                } foreach _nearbyPlayers;

                if ((count (nearestObjects [_dog,["A3PL_Cannabis_Bud","A3PL_MarijuanaBag","A3PL_PowderedMilk","A3PL_TacticalBacon","A3PL_Marijuana","A3PL_Seed_Marijuana","A3PL_Jug_Corked","A3PL_Jug_Green_Corked"], 10])) > 0) then {_foundDrugs = true; };

                if (_foundDrugs && ((vehicle player) isEqualTo player)) then {playSound3D ["A3PL_Common\effects\dogbark.ogg", _dog, true, _dog, 7, 1, 50];};
            };
        };
    };

    ["Você comprou um cachorro com sucesso, o cachorro vai atrás de você e late quando ele cheira alguma droga por perto (seja um jogador, um item, etc.)",Color_Green] call A3PL_HUD_Notification;
    [_dog] remoteExec ["Server_Dogs_HandleLocality", 2];

}, false] call Server_Setup_Compile;

['A3PL_Dogs_BuyRequest', {

    private ["_class"];
    _class = lbData [1500,(lbCurSel 1500)];
    _dogprice = 1000;

    if !(["k9cop"] call Caue_DMV_Check) exitWith {["Você não tem ração para o K-9",Color_Red] call A3PL_HUD_Notification;};
    if ((player getvariable ["getjobplayerguy",0]) < _dogprice) exitwith {["Você não tem dinheiro suficiente para comprar este cachorro",Color_Red] call A3PL_HUD_Notification;};
    ["Pedido enviado ao servidor para comprar este cão",Color_Green] call A3PL_HUD_Notification;

    [player,_class] remoteExec ["Server_Dogs_BuyRequest", 2];
    closeDialog 0;

}, false] call Server_Setup_Compile;

['A3PL_Dogs_OpenMenu', {

    createDialog "Dialog_Kane9";
    buttonSetAction [1600, "[] call A3PL_Dogs_BuyRequest"];
    _dogs = ["Alsatian_Sand_F","Alsatian_Black_F","Alsatian_Sandblack_F"];

    {
        _i = lbAdd [1500,_x];
        lbSetData [1500,_i,_x];
    } foreach _dogs;

}, false] call Server_Setup_Compile;

['Server_Dogs_BuyRequest', {

    private ["_player","_dogprice","_playercash"];

    _player = param [0,objNull];
    _class = param [1,""];

    _dogprice = 1000;
    _playercash = _player getvariable ["getjobplayerguy",0];

    if (_playercash < _dogprice) exitwith {};
    [_player,"getjobplayerguy",(_playercash - _dogprice)] call Server_Core_ChangeVar;

    [_class] remoteExec ["A3PL_Dogs_BuyReceive", (owner _player)];
}, true] call Server_Setup_Compile;

['Server_Dogs_HandleLocality', {

    _dog = param [0,objNull];
    if (isNull _dog) exitwith {};

    _dog addEventHandler ["Local",
    {
        _dog = _this select 0;
        _local = _this select 1;

        if (_local) then {deleteVehicle _dog};
    }];

}, true] call Server_Setup_Compile;
