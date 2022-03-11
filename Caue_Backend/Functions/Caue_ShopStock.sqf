/*
    Client
*/
['Caue_ShopStock_Add', {

    params [
        ["_shop",""],
        ["_index",0],
        ["_amount",1]
    ];

    private _stockVar = server getVariable [_shop,[]];

    private _newStock = (_stockVar select _index) + _amount;
    if (_newStock >= 1000) then {_newStock = 1000;};

    _stockVar set [_index,_newStock];
    server setVariable [_shop,_stockVar,true];

}, false] call Server_Setup_Compile;

['Caue_ShopStock_Decrease', {

    params [
        ["_shop",""],
        ["_index",0],
        ["_amount",1]
    ];

    private _stockVar = server getVariable [_shop,[]];
    _stockVar set [_index,(_stockVar select _index) - _amount];
    server setVariable [_shop,_stockVar,true];

}, false] call Server_Setup_Compile;

/*
    Server
*/
['Server_ShopStock_Load', {

    Config_Shops_StockSystem = [];

    private _stocks = ["Stock_Load",2,true] call Server_Database_Async;
    {
        private _shop = _x select 0;
        private _stock = call compile (_x select 1);

        Config_Shops_StockSystem pushback _shop;
        server setVariable [_shop,_stock,true];
    } forEach _stocks;

    publicVariable "Config_Shops_StockSystem";

}, true] call Server_Setup_Compile;

['Server_ShopStock_Save', {

    {
        [format["Stock_Save:%1:%2",(server getVariable [_x,[]]),_x],1] spawn Server_Database_Async;
        uiSleep 2;
    } forEach Config_Shops_StockSystem;

}, true] call Server_Setup_Compile;
