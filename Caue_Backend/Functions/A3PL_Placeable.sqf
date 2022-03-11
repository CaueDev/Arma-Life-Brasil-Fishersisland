['A3PL_Placeable_AttachedLoop', {

    private ["_obj","_sleep"];
    _obj = param [0,objNull];
    _attach = param [1,[0,0,0]];
    _type = typeOf _obj;
    _distance = player distance _obj;

    player forceWalk true;
    while {(_obj IN (attachedObjects player)) && (!isNull _obj)} do
    {
        _sleep = 0.5;
        if (!alive player) exitwith {detach _obj; [] call Caue_Inventory_Drop;};
        if (!(vehicle player == player)) exitwith
        {
            private ["_isItem"];
            _isItem = false;
            {
                if (_x select 3 == (typeOf _obj)) exitwith
                {
                    [true] call Caue_Inventory_PutBack;
                    _isItem = true;
                };
            } foreach Config_Items;
            if (!(_isItem)) then
            {
                detach _obj;
            } else
            {
                [] call Caue_Inventory_Drop;
            };
        };
        if (Player_NameIntersect IN ["trunkinside","trunkinside1","trunkinside2","trunkinside3","trunkinside4","trunkinside5","trunkinside6","trunkinside7","trunkinside8","trunkinside9","trunkinside10","trunkinside11","lockerbottom","lockertop","mcfishertable","mcfisherstable1","mcfisherstable2","mcfishergrill"]) then
        {
            private ["_interDist","_dist","_begPosASL","_endPosASL","_posAGL"];
            _interDist = [player_objintersect, "FIRE"] intersect [positionCameraToWorld [0,0,0],positionCameraToWorld [0,0,1000]];
            if (count _interDist < 1) exitwith {};
            _dist = (_interDist select 0) select 1;
            _begPosASL = AGLToASL positionCameraToWorld [0,0,0];
            _endPosASL = AGLToASL positionCameraToWorld [0,0,1000];
            _posAGL = ASLToAGL (_begPosASL vectorAdd ((_begPosASL vectorFromTo _endPosASL) vectorMultiply _dist));

            switch (typeOf _obj) do
            {
                case ("A3PL_Stinger"):
                {
                    _obj attachto [player,
                    [
                        (player worldToModel (getposATL _obj)) select 0,
                        (player worldToModel (getposATL _obj)) select 1,
                        ((player worldToModelVisual _posAGL) select 2) + (_obj call A3PL_Placeable_GetZOffset)
                    ]];
                };
                default {_obj attachto [player,[(player worldToModelVisual _posAGL) select 0,(player worldToModelVisual _posAGL) select 1,((player worldToModelVisual _posAGL) select 2) + (_obj call A3PL_Placeable_GetZOffset)]];};
            };
            _sleep = 0.1;

            if (_type == "GroundWeaponHolder") exitwith
            {
                detach _obj;
                _obj attachTo [player, [0, 1.5,
                ((player WorldToModel (Player_ObjIntersect modelToWorld(Player_ObjIntersect selectionPosition player_nameIntersect))) select 2) + (_obj call A3PL_Placeable_GetZOffset)] ];
            };
        } else {
            if (Player_Item == _obj) exitwith
            {
                switch (Player_ItemClass) do
                {
                    case ("popcornBucket"):
                    {
                        if (!isNil "A3PL_EatingPopcorn") exitwith {};
                        Player_Item attachTo [player, [0,0,0], 'LeftHand'];
                    };
                    case ("beer"):
                    {
                        Player_Item attachTo [player, [0,0,0], 'LeftHand'];
                    };
                    case ("coke"):
                    {
                        Player_Item attachTo [player, [0,0,0], 'LeftHand'];
                    };
                    case ("beer_gold"):
                    {
                        Player_Item attachTo [player, [0,0,0], 'LeftHand'];
                    };
                    default {Player_Item attachTo [player, _attach, 'RightHand'];};
                };
            };

            if (_type == "GroundWeaponHolder") then
            {
                _obj attachTo [player, [0.6,0,0.1], 'RightHand'];
                _obj setVectorUp [1,0,0];
            } else
            {
                _obj setposATL [getposATL _obj select 0,getposATL _obj select 1,(getposATL _obj select 2) -+ ([_obj] call A3PL_Placeable_ObjectZFix)];
                _obj attachto [player];

                switch (typeOf _obj) do
                {
                    case ("A3PL_DeliveryBox"): { _obj attachTo [player,[-0.2,0,0],"RightHand"]; };
                    case ("A3PL_RoadCone_x10"): { _obj attachTo [player,[0,0,0],"RightHand"]; };
                };
            };
        };
        sleep _sleep;
    };
    player forceWalk false;

}, false] call Server_Setup_Compile;

['A3PL_Placeable_CarBlackList', {

    private ["_car","_obj","_return"];
    _car = typeOf (_this select 0);
    _obj = (getModelInfo (_this select 1)) select 0;
    _return = false;
    {
        if (_x select 0 == _car) exitwith
        {
            {
                if ((format ["%1.p3d",_x]) == _obj) then
                {
                    _return = true;
                };
            } foreach (_x select 1);
        };
    } foreach Config_CarFurnitureBlacklist;
    _return;

}, false] call Server_Setup_Compile;

['A3PL_Placeable_GetZOffset', {

    private ["_offset","_item"];
    _item = typeOf _this;
    _offset = 0;
    {
        if (_x select 0 == _item) then
        {
            _offset = _x select 1;
        };
    } foreach Config_Items_ZOffset;
    _offset

}, false] call Server_Setup_Compile;

['A3PL_Placeable_ObjectZFix', {

    private ["_obj","_posZ"];
    _obj = _this select 0;
    _posZ = (boundingboxReal _obj) select 0;
    _posZ = _obj modelToWorld _posZ;
    _posZ = (_posZ select 2);

    _posZ = _posZ - ((getposATL player) select 2);
    _posZ;

}, false] call Server_Setup_Compile;

['A3PL_Placeable_ObjectZFixTrunk', {

    private ["_obj","_posZ","_offsetTrunk"];
    _obj = _this select 0;

    _offsetTrunk = (Player_ObjIntersect modelToWorld(Player_ObjIntersect selectionPosition player_nameintersect)) select 2;
    _posZ = _offsetTrunk;
    _posZ;

}, false] call Server_Setup_Compile;
