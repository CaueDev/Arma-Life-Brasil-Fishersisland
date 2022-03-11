/*
    Client
*/
['Caue_Inventory_Open', {

    disableSerialization;
    if !(isNull (findDisplay 8000710)) exitWith {};

    if ((vehicle player isEqualTo player) && (!(animationState player IN ["crew"]))) then {player playMove "AmovPercMstpSnonWnonDnon_AinvPercMstpSnonWnonDnon";};

    closeDialog 0;
    createDialog "Caue_Inventory";

    private _display = findDisplay 8000710;
    private _ctrlGroupFooter = _display displayCtrl 60;
    private _ctrlButtonGive = _ctrlGroupFooter controlsGroupCtrl 35;
    private _ctrlButtonUse = _ctrlGroupFooter controlsGroupCtrl 15;
    private _ctrlButtonDestroy = _ctrlGroupFooter controlsGroupCtrl 25;
    private _ctrlGroupInventory = _display displayCtrl 40;
    private _ctrlFilter = _ctrlGroupInventory controlsGroupCtrl 35;
    private _ctrlList = _ctrlGroupInventory controlsGroupCtrl 36;
    private _ctrlComboPlayers = _ctrlGroupInventory controlsGroupCtrl 90;
    private _ctrlProgress = _ctrlGroupInventory controlsGroupCtrl 70;
    private _ctrlProgressText = _ctrlGroupInventory controlsGroupCtrl 80;

    {
        _x ctrlShow true;
    } forEach [_ctrlFilter,_ctrlProgress,_ctrlProgressText];

    _ctrlButtonDestroy ctrlAddEventHandler ["ButtonClick", {[] call Caue_Inventory_Remove}];
    _ctrlButtonUse ctrlAddEventHandler ["ButtonClick", {[] call Caue_Inventory_Use}];

    _ctrlButtonGive ctrlShow false;
    //_ctrlButtonGive ctrlAddEventHandler ["ButtonClick", {[] spawn Caue_Inventory_Give;}];

    /* Near Players */
    lbClear _ctrlComboPlayers;
    {
        if ((isPlayer _x) && (!isObjectHidden _x)) then {
            private _index = _ctrlComboPlayers lbAdd (format["%1 - %2",(_x getVariable ["db_id",-1]),([_x] call Caue_Player_GetNameTag)]);
            _ctrlComboPlayers lbSetData [_index,(getPlayerUID _x)];
        };
    } forEach ((nearestObjects [player,["CAManBase"],5]) - [player]);

    /* Init listnbox sorting */
    [_ctrlFilter,_ctrlList] call BIS_fnc_initListNBoxSorting;

    [] spawn Caue_Inventory_Load;

}, false] call Server_Setup_Compile;

['Caue_Inventory_Load', {

    private _display = findDisplay 8000710;
    private _ctrlGroupInventory = _display displayCtrl 40;
    private _ctrlList = _ctrlGroupInventory controlsGroupCtrl 36;
    private _ctrlProgress = _ctrlGroupInventory controlsGroupCtrl 70;
    private _ctrlProgressText = _ctrlGroupInventory controlsGroupCtrl 80;
    private _space = (player getVariable ["MaxWeight",100]);
    private _usedSpace = [player] call Caue_Inventory_TotalWeight;

    /* Set text and update progress bar */
    _ctrlProgressText ctrlSetText format ["%1 / %2", _usedSpace, _space];
    _ctrlProgress progressSetPosition (_usedSpace / _space);

    /* Inventoy Setup */
    lnbClear _ctrlList;
    {
        _x params [
            ["_class","",[""]],
            ["_amount",0,[0]]
        ];

        private _displayName = [_class,"name"] call Caue_Config_GetItem;
        private _iconPath = [_class,"icon"] call Caue_Config_GetItem;
        private _weight = [_class,"weight"] call Caue_Config_GetItem;
        private _totalWeight = _amount * _weight;

        /* Add into list and set picture and data */
        private _index = _ctrlList lnbAddRow [_displayName,str _amount,str _totalWeight];
        _ctrlList lnbSetPicture [[_index, 0],_iconPath];
        _ctrlList lnbSetData [[_index, 0],_class];
    } forEach (player getVariable ["player_inventory",[]]);

    /* Add Cash */
    private _cash = player getVariable ["getjobplayerguy",0];
    if (_cash isEqualTo 0) exitWith {};
    private _index = _ctrlList lnbAddRow ["Dinheiro",str _cash,""];
    //_ctrlList lnbSetPicture [[_index, 0], "Textures\icons\cash.paa"];
    _ctrlList lnbSetData [[_index, 0], "taxidriver"];

}, false] call Server_Setup_Compile;

['Caue_Inventory_ToolBox', {

    private _display = findDisplay 8000710;
    private _ctrlGroupFooter = _display displayCtrl 60;
    private _ctrlButtonGive = _ctrlGroupFooter controlsGroupCtrl 35;
    private _ctrlButtonUse = _ctrlGroupFooter controlsGroupCtrl 15;
    private _ctrlButtonDestroy = _ctrlGroupFooter controlsGroupCtrl 25;
    private _ctrlEdit = _ctrlGroupFooter controlsGroupCtrl 45;
    private _ctrlGroupInventory = _display displayCtrl 40;
    private _ctrlFilter = _ctrlGroupInventory controlsGroupCtrl 35;
    private _ctrlList = _ctrlGroupInventory controlsGroupCtrl 36;
    private _ctrlComboPlayers = _ctrlGroupInventory controlsGroupCtrl 90;
    private _ctrlProgress = _ctrlGroupInventory controlsGroupCtrl 70;
    private _ctrlProgressText = _ctrlGroupInventory controlsGroupCtrl 80;
    private _ctrlProgressBack = _ctrlGroupInventory controlsGroupCtrl 5041;

    if ((_this select 1) isEqualTo 1) then {
        {
            _x ctrlShow false;
        } forEach [_ctrlButtonUse,_ctrlButtonDestroy,_ctrlFilter,_ctrlComboPlayers,_ctrlProgress,_ctrlProgressText,_ctrlEdit,_ctrlProgressBack];

        lnbClear _ctrlList;
        {
            _x params [["_class","",[""]]];
            private _displayName = [_class,"name"] call Caue_Config_GetLicense;
            private _index = _ctrlList lnbAddRow [_displayName,"",""];
            _ctrlList lnbSetPicture [[_index, 0], ""];
        } forEach (player getVariable ["licenses",[]]);
    } else {
        {
            _x ctrlShow true;
        } forEach [_ctrlButtonUse,_ctrlButtonDestroy,_ctrlFilter,_ctrlComboPlayers,_ctrlProgress,_ctrlProgressText,_ctrlEdit,_ctrlProgressBack];

        [] spawn Caue_Inventory_Load;
    };

}, false] call Server_Setup_Compile;

['Caue_Inventory_Use', {

    disableSerialization;
    params [
        ["_classname",""]
    ];

    if ((animationState player) isEqualTo "A3PL_TakenHostage") exitwith {["Você não pode usar um item enquanto está sendo refém",Color_Red] call A3PL_HUD_Notification;};
    if !((vehicle player) isEqualTo player) exitwith {["Você não pode retirar itens do seu inventário quando estiver dentro de um veículo", Color_Red] call A3PL_HUD_Notification;};
    if ((animationState player) IN ["a3pl_handsuptokneel","a3pl_handsupkneelgetcuffed","a3pl_cuff","a3pl_handsupkneelcuffed","a3pl_handsupkneelkicked","a3pl_cuffkickdown","a3pl_idletohandsup","a3pl_kneeltohandsup","a3pl_handsuptokneel","a3pl_handsupkneel"]) exitWith {["Você não pode retirar itens do seu inventário quando estiver algemado/rendido", Color_Red] call A3PL_HUD_Notification;};

    private _amount = 0;
    if (_classname isEqualTo "") then {
        private _display = findDisplay 8000710;
        if (isNull _display) exitWith {};
        private _ctrlList = (_display displayCtrl 40) controlsGroupCtrl 36;
        private _selection = lnbCurSelRow _ctrlList;
        if (_selection isEqualTo -1) exitWith {["Você não selecionou nenhum item.",Color_Red] call A3PL_HUD_Notification;};
        _classname = _ctrlList lnbData [_selection,0];
        if (_classname isEqualTo "") exitWith {["Debug: Nenhum _classname definido.",Color_Red] call A3PL_HUD_Notification;};
        private _ctrlAmount = (_display displayCtrl 60) controlsGroupCtrl 45;
        _amount = round(parseNumber(ctrlText _ctrlAmount));
        if (_amount < 1) exitWith {["Coloque uma quantia valida.",Color_Red] call A3PL_HUD_Notification;};
    };

    private _itemClass = [_classname,"class"] call Caue_Config_GetItem;
    private _itemDir = [_classname,"dir"] call Caue_Config_GetItem;

    if !(isNull Player_Item) then {[false] call Caue_Inventory_PutBack;};

    Player_ItemAmount = nil;
    if (_classname isEqualTo "taxidriver") then {
        if (_amount > (player getVariable ["getjobplayerguy",0])) exitWith {["Você não tem essa quantia de dinheiro com você",Color_Red] call A3PL_HUD_Notification;};
        Player_ItemAmount = _amount;
    };

    Player_Item = _itemClass createVehicle (getPos player);

    if (_classname == "popcornbucket") then {
        Player_Item attachTo [player,[0,0,0],'LeftHand'];
    } else {
        Player_Item attachTo [player,[0,0,0],'RightHand'];
    };

    if ((vehicle player isEqualTo player) && (!(animationState player IN ["crew"]))) then {player playMove 'AmovPercMstpSnonWnonDnon_AmovPercMstpSrasWpstDnon';};

    Player_Item setDir _itemDir;

    Player_ItemClass = _classname;

    if (dialog) then {closeDialog 0;};

    [Player_Item,[0,0,0]] spawn A3PL_Placeable_AttachedLoop;

    [format['Você retirou um(a) %1 do seu inventário.',[Player_ItemClass,'name'] call Caue_Config_GetItem],Color_Yellow] call A3PL_HUD_Notification;

}, false] call Server_Setup_Compile;

['Caue_Inventory_Remove', {

    private _display = findDisplay 8000710;
    if (isNull _display) exitWith {};
    private _ctrlList = (_display displayCtrl 40) controlsGroupCtrl 36;
    private _selection = lnbCurSelRow _ctrlList;
    if (_selection isEqualTo -1) exitWith {["Você não selecionou nenhum item.",Color_Red] call A3PL_HUD_Notification;};
    private _classname = _ctrlList lnbData [_selection,0];
    if (_classname isEqualTo "") exitWith {["Debug: Nenhum _classname definido.",Color_Red] call A3PL_HUD_Notification;};
    private _ctrlAmount = (_display displayCtrl 60) controlsGroupCtrl 45;
    private _amount = round(parseNumber(ctrlText _ctrlAmount));
    if (_amount < 1) exitWith {["Coloque uma quantia valida.",Color_Red] call A3PL_HUD_Notification;};

    if !([_classname,_amount] call Caue_Inventory_Has) exitwith {["Você não tem esse valor para soltar",Color_Red] call A3PL_Player_Notification;};

    [] call Caue_Inventory_Use;
    [true,_amount] call Caue_Inventory_Drop;

}, false] call Server_Setup_Compile;

['Caue_Inventory_Drop', {

    params [
        ["_setpos",true],
        ["_amount",1]
    ];

    private _itemClass = Player_ItemClass;
    private _obj = Player_Item;
    private _droppedItems = server getVariable 'droppedObjects';

    if !([_itemClass,_amount] call Caue_Inventory_Has) exitwith {["Você não tem esse valor para soltar",Color_Red] call A3PL_HUD_Notification;};
    if (isNull _obj) exitwith {["Não parece que você tem um item para jogar",Color_Red] call A3PL_HUD_Notification;};
    if !(isNil "Player_isEating") exitwith {["Você está comendo algo no momento e não pode executar esta ação",Color_Red] call A3PL_HUD_Notification;};

    if !(animationState player IN ["crew"]) then {player playMove 'AmovPercMstpSnonWnonDnon_AinvPercMstpSnonWnonDnon_Putdown';};

    if (_setPos) then {
        detach _obj;
        _obj setPosASL (AGLtoASL(player modelToWorld [0,1,0]));
    };

    Player_Item = objNull;
    Player_ItemClass = "";

    switch (_itemclass) do {
        case "taxidriver": {[player,_obj,_itemClass,Player_ItemAmount] remoteExec ["Server_Inventory_Drop",2];};
        default {[player,_obj,_itemClass,_amount] remoteExec ["Server_Inventory_Drop", 2];};
    };

    [format["Você soltou um(a) %1.",[_itemClass,'name'] call Caue_Config_GetItem],Color_Green] call A3PL_HUD_Notification;

}, false] call Server_Setup_Compile;

['Caue_Inventory_PutBack', {

    params [
        ["_displayNotification",true]
    ];

    private _itemClass = Player_ItemClass;
    if (_itemClass isEqualTo "") exitwith {["Não há itemClass atribuído", Color_Red] call A3PL_HUD_Notification;};

    detach Player_Item;
    deleteVehicle Player_Item;

    Player_Item = objNull;
    Player_ItemClass = "";

    if (_displayNotification isEqualTo true) then {
        if (!(animationState player IN ["crew"])) then {player playMove 'AmovPercMstpSnonWnonDnon_AmovPercMstpSrasWpstDnon';};
        [format["Você colocou um %1 de volta no seu inventário.",[_itemClass,'name'] call Caue_Config_GetItem],Color_Yellow] call A3PL_HUD_Notification;
    };

}, false] call Server_Setup_Compile;

['Caue_Inventory_Throw', {

    private _obj = Player_Item;
    private _itemClass = Player_ItemClass;

    if (_itemClass in ["A3PL_BucketFull","A3PL_Bucket","bucket_empty","bucket_full"]) exitWith {["Para de jogar baldes filho da puta!",Color_Red] call A3PL_HUD_Notification;};
    if (isNull _obj) exitwith {["Você não tem um item para jogar",Color_Red] call A3PL_HUD_Notification;};
    if (!isNil "Player_isEating") exitwith {["Você está comendo alguma coisa e não pode executar esta ação",Color_Red] call A3PL_HUD_Notification;};
    if (!isNil "Player_isDrinking") exitwith {["Você está bebendo alguma coisa e não pode executar esta ação",Color_Red] call A3PL_HUD_Notification;};

    player playaction "Gesture_throw";

    sleep 0.5;

    detach _obj;

    private _playerVelocity = velocity player;
    private _playerDir = direction player;

    _obj setVelocity [((_playerVelocity select 0) + (sin _playerDir * 7)), ((_playerVelocity select 1) + (cos _playerDir * 7)), ((_playerVelocity select 2) + 7)];

    switch (_itemClass) do {
        case "taxidriver": {[player,_obj,_itemClass,Player_ItemAmount] remoteExec ["Server_Inventory_Drop", 2];};
        default {[player,_obj,_itemClass] remoteExec ["Server_Inventory_Drop", 2];};
    };

    Player_Item = objNull;
    Player_ItemClass = "";

}, false] call Server_Setup_Compile;

['Caue_Inventory_Pickup', {

    if !([] call Caue_Anticheat_LagSwitch) exitWith {closeDialog 0;};

    params [
        ["_obj",objNull],
        ["_moveToHand",false]
    ];

    if (isNull _obj) exitwith {["Não é possível pegar, objeto é nulo",Color_Red] call A3PL_HUD_Notification;};

    private _classname = _obj getVariable "class";
    if (isNil "_classname") exitwith {["Não é possível pegar, objeto não contém nenhuma classe",Color_Red] call A3PL_HUD_Notification;};
    if !(isNull Player_Item) exitwith {[format["Você já está segurando um objeto"],Color_Red] call A3PL_HUD_Notification;};

    private _attachedTo = attachedTo _obj;
    if !(isNull _attachedTo) then {
        if ((isPlayer _attachedTo) && (!(_attachedTo isKindOf "Car"))) then {_exit = true;};
    };

    if !(isNil "_exit") exitwith {[format["Você não pode pegar um objeto que outro jogador está segurando"],Color_Red] call A3PL_HUD_Notification;};

    private _canPickup = true;
    if !((count (_obj getVariable ["ainv",[]])) isEqualTo 0) exitwith {[_obj] call A3PL_Placeables_Pickup;};

    _canPickup = [_classname,"canPickup"] call Caue_Config_GetItem;
    if (!_canPickup) exitwith {[_obj] call A3PL_Placeables_Pickup;};

    private _amount = _obj getVariable ["amount",1];
    if (([player,[[_classname,_amount]]] call Caue_Inventory_TotalWeight) > (player getVariable ["MaxWeight",100])) exitwith {["Você não pode pegar este item porque excederia o limite que você pode carregar!",Color_Red] call A3PL_HUD_Notification;};

    if ((typeOf _obj) == "A3PL_FD_HoseEnd1_Float") then {
        private _hydrant = (nearestObjects [_obj,["Land_A3PL_FireHydrant"], 1]) select 0;
        if !(isNil "_hydrant") then {_hydrant animateSource ["cap_hide",0];};
    };

    player playMove 'AmovPercMstpSnonWnonDnon_AinvPercMstpSnonWnonDnon_Putdown';

    if (player_objIntersect getVariable ["inUse",false]) exitWith {};
    player_objIntersect setVariable ["inUse",true,true];

    switch (_classname) do {
        case "taxidriver": {[player,_obj] remoteExecCall ["Server_Inventory_Pickup",2];};
        default {[player, _obj,_amount] remoteExecCall ["Server_Inventory_Pickup",2];};
    };

    if (_moveToHand) then {[_classname] call Caue_Inventory_Use;};

    [format["Solicitação enviada ao servidor para pegar um %1",[_classname, "name"] call Caue_Config_GetItem], Color_Yellow] call A3PL_HUD_Notification;

}, false] call Server_Setup_Compile;

['Caue_Inventory_Add', {

    params [
        ["_class",""],
        ["_amount",0]
    ];

    if ((_class isEqualTo "") || (_amount isEqualTo 0)) exitWith {};

    [player,_class,_amount] remoteExec ["Server_Inventory_Change",2];

}, false] call Server_Setup_Compile;

['Caue_Inventory_Clear', {

    params [
        ["_obj",Player_Item],
        ["_delete",true],
        ["_setNull",true]
    ];

    if (_delete) then {
        deleteVehicle _obj;
    };

    if (_setNull) then {
        Player_Item = objNull;
        Player_ItemClass = "";
    };

}, false] call Server_Setup_Compile;

['Caue_Inventory_TotalWeight', {

    params [
        ["_target",player],
        ["_itemToAdd",[]]
    ];

    private _return = 0;
    private _inventory = _target getVariable ["Player_Inventory",[]];

    if ((count _itemToAdd) > 0) then {
        {
            _inventory = [_inventory,(_x select 0),(_x select 1),true] call BIS_fnc_addToPairs;
        } forEach _itemToAdd;
    };

    {
        _x params [
            "_item",
            "_amount"
        ];

        private _itemWeight = ([_item,'weight'] call Caue_Config_GetItem) * _amount;
        _return = _return + _itemWeight;
    } forEach _inventory;

    _return

}, false] call Server_Setup_Compile;

['Caue_Inventory_Has', {

    params [
        ["_class",""],
        ["_amount",1],
        ["_player",player]
    ];

    if (_class isEqualTo "") exitWith {false};

    if (_class isEqualTo "taxidriver") exitwith {if (_player getVariable ["getjobplayerguy",0] >= _amount) then {true;} else {false;};};

    private _inventoryAmount = [_class,_player] call Caue_Inventory_Return;
    if (_inventoryAmount < _amount) exitWith {false};

    true

}, false] call Server_Setup_Compile;

['Caue_Inventory_Return', {

    params [
        ["_class",""],
        ["_player",player]
    ];

    private _amount = [(_player getVariable ["Player_Inventory",[]]),_class,0] call BIS_fnc_getFromPairs;

    _amount

}, false] call Server_Setup_Compile;

['Caue_Inventory_Verify', {

    params [
        ["_player",player]
    ];

    private _change = false;
    {
        if ((_x select 1) < 1) then {
            (_player getVariable "Player_Inventory") set [_forEachIndex,"REMOVE"];
            _change = true;
        };
    } forEach (_player getVariable "Player_Inventory");

    if (_change) then {_player setVariable ["Player_Inventory", ((_player getVariable "Player_Inventory") - ["REMOVE"]), true];};

}, false] call Server_Setup_Compile;
/*
    Server
*/
['Server_Inventory_Change', {

    params [
        ["_player",objNull],
        ["_class",""],
        ["_amount",0]
    ];

    if ((isNull _player) || (_class isEqualTo "")) exitWith {};

    if (_class isEqualTo "taxidriver") exitwith {
        private _playerMoney = _player getVariable ["getjobplayerguy",0];
        [_player,"getjobplayerguy",(_playerMoney + _amount)] call Server_Core_ChangeVar;
    };

    _newArray = [(_player getVariable 'Player_Inventory'),_class,_amount] call BIS_fnc_addToPairs;
    _player setVariable ['Player_Inventory',_newArray,true];
    [_player] call Server_Inventory_Verify;

}, true] call Server_Setup_Compile;

['Server_Inventory_Verify', {

    params [
        ["_player",objNull]
    ];

    if (isNull _player) exitWith {};

    private _change = false;
    {
        if ((_x select 1) < 1) then {
            (_player getVariable "Player_Inventory") set [_forEachIndex,"REMOVE"];
            _change = true;
        };
    } forEach (_player getVariable "Player_Inventory");

    if (_change) then {_player setVariable ["Player_Inventory", ((_player getVariable "Player_Inventory") - ["REMOVE"]), true];};

}, true] call Server_Setup_Compile;

['Server_Inventory_Drop', {

    params [
        ["_player",objNull],
        ["_obj",objNull],
        ["_class",""],
        ["_amount",1]
    ];

    if (isNull _player) exitWith {};

    [_player,_class,-(_amount)] call Server_Inventory_Change;

    [_obj,"class",_class] call Server_Core_ChangeVar;
    if !(_amount isEqualTo 1) then {[_obj,"amount",_amount] call Server_Core_ChangeVar;};
    [_obj,"owner",(getPlayerUID _player)] call Server_Core_ChangeVar;

    switch (_class) do {
        case "taxidriver": {[_obj,"taxidriver",_amount] call Server_Core_ChangeVar;};
    };

    [getPlayerUID _player,"DropItem",[_class,_amount]] call Caue_Log_Misc;

}, true] call Server_Setup_Compile;

['Server_Inventory_Pickup', {

    params [
        ["_player",objNull],
        ["_obj",objNull],
        ["_amount",0]
    ];

    if ((isNull _player) || (isNull _obj)) exitWith {};

    private _class = _obj getVariable ["class",nil];
    if (isNil "_class") exitwith {};

    if (_obj getVariable ["used",false]) exitwith {};
    _obj setVariable ["used",true,false];
    deleteVehicle _obj;

    if (_class in ["cash"]) exitWith {
        [(getPlayerUID _player),"Hack",format["PickupItem BadVar %1-%2",_class,(_obj getVariable [_class,0])]] remoteExec ["Caue_Log_Anticheat",2];
    };

    if (_class isEqualTo "taxidriver") then {
        _amount = _obj getVariable "taxidriver";
    };

    [_player,_class,_amount] call Server_Inventory_Change;

    [getPlayerUID _player,"PickupItem",[_class,_amount]] call Caue_Log_Misc;

}, true] call Server_Setup_Compile;
