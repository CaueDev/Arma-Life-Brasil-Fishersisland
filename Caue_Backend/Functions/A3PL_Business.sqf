['A3PL_Business_Buy', {

    disableSerialization;
    private ["_display","_control","_name","_business"];

    _business = param [0,cursorObject];
    if (typeOf _business == "Land_A3PL_BusinessSign") then
    {
        _business = (nearestObjects [_business,["Land_A3PL_Showroom","Land_A3PL_Garage","Land_A3PL_Cinema","Land_A3PL_Gas_Station","land_smallshop_ded_smallshop_02_f","land_smallshop_ded_smallshop_01_f"],50]) select 0;
    };

    if (_business getVariable ["bOwner",""] != "") exitwith {["Este negócio já é propriedade de alguém",Color_Red] call A3PL_HUD_Notification;};
    if (isNil "_business") exitwith {["System Error: _business isNil in Business_Buy (Unable to determine business object)"] call A3PL_HUD_Notification;};
    if (isNull _business) exitwith {["System Error: _business isNull in Business_Buy (Unable to determine business object)"] call A3PL_HUD_Notification;};

    [format ["Aqui você pode alugar este lugar por até %1 minutos, você só pode alugar um lugar de cada vez",720],Color_Green] call A3PL_HUD_Notification;

    createDialog "Dialog_BusinessRent";
    _display = findDisplay 57;
    _display displayAddEventHandler ["KeyUp",{_this call A3PL_Business_BuySlider}];
    _control = _display displayCtrl 1900;
    _control sliderSetRange [1, 720];
    _control ctrlAddEventHandler ["SliderPosChanged",{_this call A3PL_Business_BuySlider}];

    _control = _display displayCtrl 1600;
    _control buttonSetAction "[] call A3PL_Business_Rent";
    _control = _display displayCtrl 1601;
    _control buttonSetAction "closeDialog 0;";

}, false] call Server_Setup_Compile;

['A3PL_Business_BuyItem', {

    disableSerialization;
    private ["_display","_control","_obj","_bItem"];
    _obj = param [0,cursorobject];
    if (isNull _obj) exitwith {["System: Object is null in _BuyItem (Couldn't find item)",Color_Red] call A3PL_HUD_Notification;};
    _bItem = _obj getVariable ["bitem",nil];
    if (isNil "_bItem") exitwith {["Este item não está sendo vendido", Color_Red] call A3PL_HUD_Notification;};
    createDialog "Dialog_ItemBuy";
    _display = findDisplay 59;
    _price = _bItem select 0;
    _name = _bItem select 1;

    _control = _display displayCtrl 1100;
    _control ctrlSetStructuredText parseText format ["<t font='PuristaSemiBold' align='center'>%1</t>",_name];
    _control = _display displayCtrl 1101;
    _control ctrlSetStructuredText parseText format ["<t font='PuristaSemiBold' align='center'>$%1</t>",([_price] call Caue_Lib_NumberText)];

    _control = _display displayCtrl 1601;
    _control ButtonSetAction format ["['%1'] call A3PL_Business_BuyItemBuy",_obj];
    _control = _display displayCtrl 1602;
    _control ButtonSetAction format ["['%1',true] call A3PL_Business_BuyItemBuy",_obj];

}, false] call Server_Setup_Compile;

['A3PL_Business_BuyItemBuy', {

    disableSerialization;
    if(!([] call Caue_Player_AntiSpam)) exitWith {};

    private ["_display","_control","_obj","_bItem","_hasMoney","_businessItem","_correctLoc","_factionItem"];
    _obj = [(param [0,""])] call A3PL_Lib_vehStringToObj;
    _factionBuy = param [1,false];
    if (typeName _obj == "STRING") exitwith {["System Error: Unable to determine object in _BuyItemBuy (report this)",Color_Red] call A3PL_HUD_Notification;};
    _bItem = _obj getVariable ["bitem",nil];
    if (isNil "_bItem") exitwith {["Este item não está sendo vendido", Color_Red] call A3PL_HUD_Notification;};
    _price = _bItem select 0;
    _name = _bItem select 1;
    _businessItem = _bItem select 2;
    _itemOwner = _bItem select 3;
    _finv = _obj getVariable ["finv",nil];
    _factionItem = !isNil "_finv";

    _hasMoney = false;

    if (_factionBuy) exitwith {["A compra de itens com orçamento de facção está temporariamente desativada",Color_Red] call A3PL_HUD_Notification;};
    if (_factionBuy) then
    {
        if (_price <= ([player] call A3PL_Government_MyFactionBalance)) then {_hasMoney = true;};
    } else
    {
        if (_price <= (player getVariable ["getjobplayerguy",0])) then {_hasMoney = true;};
    };
    if (!_hasMoney && !_factionBuy) exitwith {["Você não tem dinheiro suficiente para comprar este item", Color_Red] call A3PL_HUD_Notification;};
    if (!_hasMoney && _factionBuy) exitwith {["Sua facção não tem saldo suficiente para comprar este item", Color_Red] call A3PL_HUD_Notification;};

    _correctLoc = false;
    if (_factionBuy) then
    {
        switch (player getVariable ["faction","citizen"]) do
        {
            case ("ems"): {if ((count (nearestObjects [player, ["Land_A3PL_Clinic"], 20])) > 0) then {_correctLoc = true;};};
            case ("police"): {if ((count (nearestObjects [player, ["Land_A3PL_Sheriffpd"], 20])) > 0) then {_correctLoc = true;};};
            case ("fifr"): {if ((count (nearestObjects [player, ["Land_A3PL_Firestation"], 20])) > 0) then {_correctLoc = true;};};
        };
    } else
    {
        if (_businessItem) then
        {
            {
                if ((getPlayerUID player) == (_x getVariable ["bOwner","0"])) exitwith {_correctLoc = true};
            } foreach (nearestObjects [player, ["Land_A3PL_Showroom","Land_A3PL_Garage","Land_A3PL_Cinema","Land_A3PL_Gas_Station","land_smallshop_ded_smallshop_02_f","land_smallshop_ded_smallshop_01_f"], 20]);
        } else
        {
            {
                if (_itemOwner == (_x getVariable ["bOwner","0"])) exitwith {_correctLoc = true};
            } foreach (nearestObjects [player, ["Land_A3PL_Showroom","Land_A3PL_Garage","Land_A3PL_Cinema","Land_A3PL_Gas_Station","land_smallshop_ded_smallshop_02_f","land_smallshop_ded_smallshop_01_f"], 20]);
        };
    };

    if (!_correctLoc && _factionBuy) exitwith {["Você não está perto de nenhum dos seus edifícios de facção para comprar este item", Color_Red] call A3PL_HUD_Notification;};
    if (!_correctLoc && !_factionBuy && _businessItem && !_factionItem) exitwith {["Você não está perto da loja do proprietário, você só pode comprar itens perto da loja do proprietário",Color_Red] call A3PL_HUD_Notification;};
    if (!_correctLoc && !_factionBuy && !_businessItem) exitwith {["Você não está perto de sua loja, você só pode comprar itens de negócios perto de sua loja",Color_Red] call A3PL_HUD_Notification;};

    [player,_obj,_factionBuy] remoteExec ["Server_Business_BuyItem", 2];
    ["Pedido enviado ao servidor para comprar este item",Color_Yellow] call A3PL_HUD_Notification;
    closeDialog 0;

}, false] call Server_Setup_Compile;

['A3PL_Business_BuyItemRecieve', {

    private ["_reply","_msg"];
    _reply = param [0,-1];
    _msg = ["Error: Undefined _reply in _BuyItemReceive",Color_Red];
    switch (_reply) do
    {
        case (0): {_msg = [format ["Você vendeu um item por $%1",(param [1,0])],Color_Green];};
        case (1): {_msg = ["Você comprou este item com sucesso",Color_Green];};
    };
    _msg call A3PL_HUD_Notification;

}, false] call Server_Setup_Compile;

['A3PL_Business_BuySlider', {

    disableSerialization;
    private ["_display","_control","_sControl"];
    _display = findDisplay 57;
    _sControl = _display displayCtrl 1900;
    _control = _display displayCtrl 1400;
    _name = ctrlText _control;
    _rentTime = round (sliderPosition _sControl);
    _rentCost = _rentTime * 20;

    _control = _display displayCtrl 1100;
    _control ctrlSetStructuredText parseText format ["<t align='center'>%1<br/>Tempo: %2 min<br/>Preço do aluguel: $%3</t>",_name,_rentTime,_rentCost];

}, false] call Server_Setup_Compile;

['A3PL_Business_Rent', {

    disableSerialization;
    if(!([] call Caue_Player_AntiSpam)) exitWith {};
    private ["_display","_control","_name","_business","_sign","_sControl","_rentTime","_rentCost"];
    _sign = param [0,cursorObject];

    if ((typeOf _sign) == "Land_A3PL_BusinessSign") then {
        _business = (nearestObjects [_sign,["Land_A3PL_Showroom","Land_A3PL_Garage","Land_A3PL_Cinema","Land_A3PL_Gas_Station","land_smallshop_ded_smallshop_02_f","land_smallshop_ded_smallshop_01_f"],50]) select 0;
    };

    if (isNil "_business") exitwith {["System Error: _business isNil in Business_Rent (Unable to determine business object)"] call A3PL_HUD_Notification;};
    if (isNull _business) exitwith {["System Error: _business isNull in Business_Rent (Unable to determine business object)"] call A3PL_HUD_Notification;};
    _display = findDisplay 57;
    _control = _display displayCtrl 1400;
    _name = ctrlText _control;

    if (count _name < 5) exitwith {["Por favor, insira um nome comercial válido de pelo menos 5 caracteres"] call A3PL_HUD_Notification;};
    if (count _name > 30) exitwith {["Insira um nome comercial válido com no máximo 30 caracteres"] call A3PL_HUD_Notification;};

    _display = findDisplay 57;
    _sControl = _display displayCtrl 1900;
    _rentTime = round (sliderPosition _sControl);
    _rentCost = _rentTime * 20;

    if (((player getVariable ["getjobplayerguy",0]) - _rentcost) < 0) exitwith {["Você não tem dinheiro suficiente para alugar este local",Color_Red] call A3PL_HUD_Notification};
    if (_business getVariable ["bOwner",""] != "") exitwith {["Este local já é propriedade de alguém",Color_Red] call A3PL_HUD_Notification;};

    [player,_business,_name,_rentTime,_rentCost,_sign] remoteExec ["Server_Business_Buy", 2];
    closeDialog 0;
    ["Solicitação enviada ao servidor para a compra de um negócio, o nome da empresa aparecerá na porta se for bem-sucedido (certifique-se de não possuir outra empresa que ainda não tenha expirado)",Color_Yellow] call A3PL_HUD_Notification;

}, false] call Server_Setup_Compile;

['A3PL_Business_Sell', {

    disableSerialization;
    private ["_display","_control","_obj","_min","_max","_owner"];

    _obj = param [0,cursorObject];
    if (isNull _obj) exitwith {["System Error: _business isNull in Business_Buy (Unable to determine business object)"] call A3PL_HUD_Notification;};

    _owner = _obj getVariable ["owner",nil];
    if (isNil "_owner") exitwith {["Este item não é de propriedade de ninguém",Color_Red] call A3PL_HUD_Notification; };
    if (typeName _owner == "ARRAY") then
    {
        _owner = _owner select 0;
    };
    if ((getPlayerUID player) != _owner) exitwith {["Você não pode vender este item porque ele não é seu",Color_Red] call A3PL_HUD_Notification;};

    createDialog "Dialog_ItemSale";
    _display = findDisplay 58;
    _display displayAddEventHandler ["KeyUp",{_this call A3PL_Business_SellSlider}];
    _display displayAddEventHandler ["Unload",{A3PL_MinBPrice = nil; A3PL_MaxBPrice = nil; A3PL_BMaxBPrice = nil; A3PL_BMinBPrice = nil; }];

    _control = _display displayCtrl 1600;
    _control buttonSetAction format ["['%1'] call A3PL_Business_SellItem;",_obj];
    _control = _display displayCtrl 1601;
    _control buttonSetAction format ["['%1'] call A3PL_Business_SellItemStop;",_obj];

    _control = _display displayCtrl 2801;
    _control cbSetChecked true;

    _control = _display displayCtrl 1900;
    A3PL_MinBPrice = [typeOf _obj,"min"] call A3PL_Config_GetBusinessItem;
    A3PL_MaxBPrice = [typeOf _obj,"max"] call A3PL_Config_GetBusinessItem;
    A3PL_BMinBPrice = [typeOf _obj,"bmin"] call A3PL_Config_GetBusinessItem;
    A3PL_BMaxBPrice = [typeOf _obj,"bmax"] call A3PL_Config_GetBusinessItem;
    if ((typeName A3PL_MinBPrice) == "BOOL") then {A3PL_MinBPrice = 0; A3PL_MaxBPrice = 900000; A3PL_BMinBPrice = 0; A3PL_BMaxBPrice = 900000; };
    _control sliderSetRange [A3PL_MinBPrice,A3PL_MaxBPrice];
    _control ctrlAddEventHandler ["SliderPosChanged",{_this call A3PL_Business_SellSlider}];

    _control = _display displayCtrl 2800;
    _control ctrlAddEventHandler ["CheckedChanged",
    {
        disableSerialization;
        private ["_display","_control","_state"];
        _state = param [1,1];
        _display = findDisplay 58;
        if (_state == 1) then
        {
            _control = _display displayCtrl 2801;
            _control cbSetChecked false;
            _control = _display displayCtrl 1900;
            _control sliderSetRange [A3PL_BMinBPrice, A3PL_BMaxBPrice];
        } else
        {
            _control = _display displayCtrl 2800;
            _control cbSetChecked true;
        };
        call A3PL_Business_SellSlider;
    }];

    _control = _display displayCtrl 2801;
    _control ctrlAddEventHandler ["CheckedChanged",
    {
        disableSerialization;
        private ["_display","_control","_state"];
        _state = param [1,1];
        _display = findDisplay 58;
        if (_state == 1) then
        {
            _control = _display displayCtrl 2800;
            _control cbSetChecked false;
            _control = _display displayCtrl 1900;
            _control sliderSetRange [A3PL_MinBPrice, A3PL_MaxBPrice];
        } else
        {
            _control = _display displayCtrl 2801;
            _control cbSetChecked true;
        };
        call A3PL_Business_SellSlider;
    }];

    call A3PL_Business_SellSlider;

}, false] call Server_Setup_Compile;

['A3PL_Business_SellItem', {

    disableSerialization;
    private ["_obj","_price","_display","_sControl","_name","_bFound","_bdist","_type","_bchecked"];

    _obj = param [0,objNull];

    if (typeName _obj == "STRING") then
    {
        {
            _check = format ["%1",_x];
            if (_check == _obj) exitwith
            {
                _obj = _x;
            };
        } foreach (nearestObjects [player, [], 20]);
    };

    if (typeName _obj == "STRING") exitwith {["System: Error occured in Business_SellItem, could not retrieve object", Color_Red] call A3PL_HUD_Notification;};

    _display = findDisplay 58;
    _control = _display displayCtrl 1400;
    _name = ctrlText _control;
    _sControl = _display displayCtrl 1900;
    _price = round (sliderPosition _sControl);
    if (count _name < 3) exitwith {["Por favor, insira uma descrição de item válida de pelo menos 3 caracteres",Color_Red] call A3PL_HUD_Notification;};
    if (count _name > 30) exitwith {["Por favor, insira uma descrição de item válida com no máximo 30 caracteres",Color_Red] call A3PL_HUD_Notification;};

    {
        if ((_x getVariable ["bOwner","0"]) == (getPlayerUID player)) exitwith {_bfound = _x};
    } foreach nearestObjects [player,[],40];

    _control = _display displayCtrl 2800;
    _bchecked = cbChecked _control;

    if (isNil "_bfound" && !_bChecked) exitwith {["Você não parece ter uma empresa nas proximidades para vender este item",Color_Red] call A3PL_HUD_Notification;};

    if (_bChecked && isNil "_bFound") then
    {
        {
            if ((_x getVariable ["bOwner","0"]) != "0") exitwith {_bFound = _x;};
            if ((typeOf _x) IN ["Land_A3PL_Sheriffpd","Land_A3PL_Clinic","Land_A3PL_Firestation"]) exitwith {_bFound = _x;};
        } foreach nearestObjects [player,[],40];
    };

    if (isNil "_bFound") exitwith {["Você não parece estar perto o suficiente de um negócio para vender isso",Color_Red] call A3PL_HUD_Notification;};

    switch (typeOf _bfound) do
    {
        case ("Land_A3PL_Showroom"): {_bDist = (player distance _bfound) < 40};
        case ("land_smallshop_ded_smallshop_02_f"): {_bDist = (player distance _bfound) < 10.1};
        case ("land_smallshop_ded_smallshop_01_f"): {_bDist = (player distance _bfound) < 10.1};
        default {_bDist = (player distance _bfound) < 30};
    };

    if (!_bDist) exitwith {["Você não parece estar perto o suficiente de um negócio para vender isso",Color_Red] call A3PL_HUD_Notification;};

    _type = [typeOf _obj,"type"] call A3PL_Config_GetBusinessItem;
    [player,_obj,_type,_bchecked,_name,_price] remoteExec ["Server_Business_Sellitem", 2];
    closeDialog 0;
    ["Agora você está vendendo este item",Color_Green] call A3PL_HUD_Notification;

}, false] call Server_Setup_Compile;

['A3PL_Business_SellItemStop', {

    disableSerialization;
    private ["_obj","_bItem"];
    _obj = param [0,objNull];
    if (typeName _obj == "STRING") then
    {
        {
            _check = format ["%1",_x];
            if (_check == _obj) exitwith
            {
                _obj = _x;
            };
        } foreach (nearestObjects [player, [], 20]);
    };

    if (typeName _obj == "STRING") exitwith {["System: Error occured in Business_SellItem, could not retrieve object", Color_Red] call A3PL_HUD_Notification;};
    _bItem = _obj getVariable ["bitem",nil];

    if (isNil "_bItem") exitwith {["Este item não está sendo vendido", Color_Red] call A3PL_HUD_Notification;};
    if ((getPlayerUID player) != (_bItem select 3)) exitwith {["Você não e o dono deste item", Color_Red] call A3PL_HUD_Notification;};

    [_obj] remoteExec ["Server_Business_Sellitemstop", 2];
    closeDialog 0;
    ["Você não está mais vendendo este item",Color_Green] call A3PL_HUD_Notification;

}, false] call Server_Setup_Compile;

['A3PL_Business_SellSlider', {

    disableSerialization;
    private ["_display","_control","_sControl","_price"];
    _display = findDisplay 58;
    _sControl = _display displayCtrl 1900;
    _control = _display displayCtrl 1400;
    _name = ctrlText _control;
    _price = round (sliderPosition _sControl);

    _control = _display displayCtrl 1100;
    _control ctrlSetStructuredText parseText format ["<t align='center'>Item desc.: %1<br/>Preço min: $%2<br/>Preço max: $%3<br/>Vender por: $%4</t>",_name,(sliderRange _sControl) select 0,(sliderRange _sControl) select 1,_price];

}, false] call Server_Setup_Compile;

['Server_Business_Buy', {

    private ["_player","_playerUID","_business","_taken","_name","_rentTime","_rentCost","_newMoney","_sign"];
    _player = param [0,objNull];
    _playerUID = getPlayerUID _player;
    _business = param [1,objNull];
    if (isNull _player OR isNull _business) exitwith {};
    _name = param [2,""];
    _rentTime = param [3,1] * 60;
    _rentCost = param [4,1];
    _sign = param [5,objNull];
    A3PL_Business_List = missionNameSpace getVariable ["A3PL_Business_List",[]];

    {
        if (_x select 0 == _business) exitwith {_taken = true};
        if (_x select 1 == _playerUID) exitwith {_taken = true};
    } foreach A3PL_Business_List;
    if (!isNil "_taken") exitwith {};

    _newMoney = (_player getVariable ["getjobplayerguy",0]) - _rentcost;
    if (_newMoney < 0) exitwith {};
    _player setvariable ["getjobplayerguy",_newMoney,true];

    _marker = createMarker [format ["business%1",floor random 3000], _business];
    _marker setMarkerShape "ICON";
    _marker setMarkerType "hd_dot";
    _marker setMarkerText _name;

    A3PL_Business_List pushback [_business,_playerUID,diag_tickTime + _rentTime,_marker];
    _business setVariable ["bOwner",_playerUID,true];
    _business setVariable ["bName",_name,true];

    if !(isNull _sign) then {
        _sign setObjectTextureGlobal [0,"\A3PL_Objects\Street\business_sign\business_rented_co.paa"];
    };

    if ((_player getVariable ["job","unemployed"]) != "business") then {
        [_player,"business"] call Server_NPC_RequestJob;
    };

}, true] call Server_Setup_Compile;

['Server_Business_BuyItem', {

    private ["_obj","_factionBuy","_query","_owner","_bItem","_price","_businessItem"];
    _buyer = param [0,objNull];
    _obj = param [1,objNull];
    _factionBuy = param [2,false];
    _buyerUID = getPlayerUID _buyer;
    _bItem = _obj getVariable ["bItem",nil];
    if (isNil "_bItem") exitwith {};
    _price = _bItem select 0;
    _businessItem = _bItem select 2;
    _owner = _bItem select 3;

    switch (true) do
    {
        case (_obj isKindOf "LandVehicle"):
        {
            private ["_query","_id"];
            _id = _obj getVariable ["owner",nil];
            if (isNil "_id") exitwith {};
            _id = _id select 1;
            _query = format ["BusinessBuyItem:%1:%2",_buyerUID,_id];
            [_query,1] spawn Server_Database_Async;
            if ((!_businessItem) OR (_factionBuy)) then
            {

            };
            _obj setVariable ["owner",[_buyerUID,_id],true];
            [_buyer,_obj] spawn Caue_Keys_Add;
        };

        case (!isNil {_obj getVariable ["class",nil]}):
        {
            _obj setVariable ["owner",_buyerUID,true];
        };
    };
    [_obj] call Server_Business_Sellitemstop;

    if (_factionBuy) then {
        private ["_balance"];
        _balance = [_buyer,true] call A3PL_Government_MyFactionBalance;
        [_balance,_price] call Server_Government_AddBalance;
    } else {
        private ["_cash"];
        _cash = _buyer getVariable ["getjobplayerguy",0];
        _buyer setVariable ["getjobplayerguy",(_cash - _price),true];
    };

    if (!isNil "_owner") then {
        private _ownerObj = [_owner] call Caue_Lib_UIDToObject;
        if !(isNull _ownerObj) then {
            _ownerObj setVariable ["getjobplayerguy",((_ownerObj getVariable ["getjobplayerguy",0]) + _price),true];
            [0,_price] remoteExec ["A3PL_Business_BuyItemReceive", (owner _ownerObj)];
        };
    };

    [1] remoteExec ["A3PL_Business_BuyItemReceive",(owner _buyer)];

}, true] call Server_Setup_Compile;

['Server_Business_Loop', {

    private _delete = [];
    {
        params [
            "_business",
            "_uid",
            "_rentTime",
            "_marker"
        ];

        if (diag_tickTime > _rentTime) then {
            deleteMarker _marker;
            _business setVariable ["bOwner",nil,true];
            _business setVariable ["bName",nil,true];
            A3PL_Business_List deleteAt _forEachIndex;
        };
    } forEach (missionNameSpace getVariable ["A3PL_Business_List",[]]);

}, true] call Server_Setup_Compile;

['Server_Business_SellItem', {

    private ["_player","_obj","_type","_bChecked","_name","_price"];
    _player = param [0,objNull];
    _obj = param [1,objNull];
    _type = param [2,""];
    _bChecked = param [3,false];
    _name = param [4,""];
    _price = param [5,0];
    if (isNull _player OR isNull _obj) exitwith {};

    _obj setVariable ["bItem",[_price,_name,_bChecked,getPlayerUID _player],true];

}, true] call Server_Setup_Compile;

['Server_Business_SellItemStop', {

    private ["_obj"];
    _obj = param [0,objNull];
    _obj setVariable ["bItem",nil,true];

}, true] call Server_Setup_Compile;
