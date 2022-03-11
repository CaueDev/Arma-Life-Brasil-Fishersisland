['A3PL_Create_RescueBasket', {

    _veh = vehicle player;
    _basket = "A3PL_RescueBasket" createVehicle [0,0,0];
    _basket allowdamage false;
    _basket setVariable ["locked",false,true];
    _basket attachTo [_veh, [0,999999,0] ];
    _veh setVariable ["basket",_basket,true];
    _basket setVariable ["vehicle",_veh,true];

}, false] call Server_Setup_Compile;
