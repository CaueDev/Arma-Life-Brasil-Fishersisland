['A3PL_Waste_CheckNear', {

    private ["_nearTrucks","_truck","_bin","_bin1pos","_bin2pos","_bin1dist","_bin2dist"];
    _bin = param [0,objNull];
    _nearTrucks = nearestObjects [_bin, ["A3PL_P362_Garbage_Truck"], 10];

    if (count _nearTrucks == 0) exitwith {false;};
    _truck = _nearTrucks select 0;

    _bin1pos = _truck modelToWorld [-0.731541,-4.48728,-1.12253];
    _bin2pos = _truck modelToWorld [0.298429,-4.48728,-1.12253];
    _bin1dist = _bin1pos distance _bin;
    _bin2dist = _bin2pos distance _bin;

    if ((_bin1dist < 0.85) OR (_bin2dist < 0.85)) then
    {
        true;
    } else
    {
        false;
    };

}, false] call Server_Setup_Compile;

['A3PL_Waste_FlipBin', {

    private ["_anim","_truck"];
    _truck = param [0,objNull];
    _anim = param [1,""];
    _truck animateSource [_anim, 1];
    [] spawn
    {
        sleep 2;
        _near = false;
        {if (player distance _x < 10) exitWith {_near = true;};} forEach WasteBins;
        if (_near) exitWith {["Você ja limpou esta lixeira recentemente!",Color_Red] call A3PL_HUD_Notification;};
        {WasteBins pushback _x;} forEach nearestObjects [player,["A3PL_WheelieBin"],10];
        ["Você ganhou $400 para descarregar a lixeira",Color_Green] call A3PL_HUD_Notification;
        player setVariable ["getjobplayerguy",(player getVariable ["getjobplayerguy",0])+400,true];
        player setVariable ["jobVehicleTimer",(player getVariable ["jobVehicleTimer",0]) + 120,true];
        if ((count WasteBins) > 6) then {WasteBins deleteAt 0;};
    };

}, false] call Server_Setup_Compile;

['A3PL_Waste_LoadBin', {

    private ["_bin","_nearTrucks","_truck"];
    _bin = param [0,objNull];
    _nearTrucks = nearestObjects [_bin, ["A3PL_P362_Garbage_Truck"], 10];
    if (count _nearTrucks == 0) exitwith {["Não há caminhão proximo",Color_Red] call A3PL_HUD_Notification;};
    _truck = _nearTrucks select 0;

    _bin1pos = _truck modelToWorld [-0.731541,-4.48728,-1.12253];
    _bin2pos = _truck modelToWorld [0.298429,-4.48728,-1.12253];
    _bin1dist = _bin1pos distance _bin;
    _bin2dist = _bin2pos distance _bin;

    if ((_bin1dist < 0.85) OR (_bin2dist < 0.85)) then
    {
        [_bin] remoteExec ['A3PL_Lib_HideObject', 2];
        ["A lixeira foi carregada com sucesso no caminhão de lixo!",Color_Green] call A3PL_HUD_Notification;

        if (_bin1dist < _bin2dist) then
        {
            _truck animateSource  ["Bin1", 0.1,true];
            _truck setVariable ["bin1",_bin,true];
        } else
        {
            _truck animateSource  ["Bin2", 0.1,true];
            _truck setVariable ["bin2",_bin,true];
        };
    } else {};

}, false] call Server_Setup_Compile;

['A3PL_Waste_StartJob', {

    if(!([] call Caue_Player_AntiSpam)) exitWith {};
    if (player getVariable ["job","unemployed"] == "waste") exitwith {["Você parou de trabalhar como lixeiro!",Color_Red]; [] call A3PL_NPC_LeaveJob};
    player setVariable ["job","waste"];
    ["Vá e procure por lixeiras ao redor da ilha e esvazie o lixo em seu caminhão!",Color_Green] call A3PL_HUD_Notification;
    player adduniform "A3PL_Waste_Manage_Uni_Uniform";
    player addVest "A3PL_Waste_Manage_Vest";
    player addHeadGear "A3PL_Waste_Manage_Cap";

    sleep (random 2 + 2);
    ["A3PL_P362_Garbage_Truck",[6059.44,7502.32,0],"waste",1800] spawn A3PL_Lib_JobVehicle_Assign;

}, false] call Server_Setup_Compile;

['A3PL_Waste_UnloadBin', {

    private ["_truck","_name","_bin"];
    _truck = param [0,objNull];
    _name = param [1,""];

    switch (_name) do
    {
        case ("bin1"):
        {
            _bin = _truck getVariable ["bin1",objNull];
            [_bin,false] remoteExec ['A3PL_Lib_HideObject', 2];
            _truck animateSource  ["Bin1", 0,true];
        };
        case ("bin2"):
        {
            _bin = _truck getVariable ["bin2",objNull];
            [_bin,false] remoteExec ['A3PL_Lib_HideObject', 2];
            _truck animateSource  ["Bin2", 0,true];
        };
    };

}, false] call Server_Setup_Compile;
