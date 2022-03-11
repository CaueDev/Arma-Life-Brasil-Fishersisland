/*
    Client
*/
['A3PL_Garage_Open', {

    disableSerialization;
    private ["_veh","_typeOf","_display","_logic","_cam","_control","_allHitPoints","_hitArray","_dmghitArray","_textures","_upgrades","_file","_cnt"];
    params [
        ["_garage",objNull]
    ];

    if (_garage IN [AircraftPaint1,AircraftPaint2]) then {
        _veh = (nearestObjects [player,["Plane","Helicopter"],25]) select 0;
    } else {
        _veh = (nearestObjects [player,["Car_F","Ship_F"],10]) select 0;
    };

    if (isNil "_veh") exitwith {["Não é possível encontrar um veículo próximo, aproxime-se do veículo",Color_Red] call A3PL_HUD_Notification;};
    if ((isNull _garage) || (isNull _veh)) exitwith {};

    _typeOf = typeOf _veh;

    createDialog "Dialog_Garage";
    _display = findDisplay 62;

    _logic = "logic" createvehicleLocal [0,0,0];
    _logic setposASL [(getPosWorld _veh) select 0,(getposWorld _veh) select 1,((getposWorld _veh) select 2) - 1];
    _logic setDir (getDir _veh + 20);
    _cam = "camera" camCreate [0,0,0];
    _cam camSetTarget _logic;
    _cam camSetPos (positionCameraToWorld [0,0,0]);
    _cam camCommit 0;
    _cam cameraEffect ["internal", "BACK"];
    if (_garage IN [AircraftPaint1,AircraftPaint2]) then {
        _cam camSetRelPos [7,-3,0.9];
    } else {
        _cam camSetRelPos [0.3,5.2,0.9];
    };
    _cam camCommit 1;

    _control = _display displayCtrl 1502;
    _allHitPoints = getAllHitPointsDamage _veh;
    _hitArray = _allHitPoints select 1;
    _dmghitArray = _allHitPoints select 2;
    {
        if !(_x isEqualTo "") then {
            private _name = [_x,"title"] call Caue_Config_GetGarageRepair;
            if (_name isEqualType true) then {_name = _x};
            _i = _control lbAdd _name;
            _control lbSetData [_i,_x];
        };
    } forEach _hitArray;

    _control = _display displayCtrl 1504;
    _textures = ["all",_typeOf] call Caue_Config_GetGaragePaint;
    {
        private _i = _control lbAdd (_x select 2);
        _control lbSetData [_i,(_x select 0)];
    } foreach _textures;

    _control = _display displayCtrl 1500;
    _upgrades = ["all",_typeOf,""] call Caue_Config_GetGarageUpgrade;
    {
        private _i = _control lbAdd (_x select 3);
        _control lbSetData [_i,(_x select 0)];
    } foreach _upgrades;

    _control = _display displayCtrl 1500;
    _control ctrlAddEventhandler ["LBSelChanged","_this call A3PL_Garage_ClickUpgrade"];

    _control = _display displayCtrl 1502;
    _control ctrlAddEventhandler ["LBSelChanged",format ["['%1'] call A3PL_Garage_LBRepair;",_veh]];

    _control = _display displayCtrl 1504;
    _control ctrlAddEventhandler ["LBSelChanged",format ["['%1','tex'] call A3PL_Garage_SetSliderColour",_veh]];

    _control = _display displayCtrl 1900;
    _control sliderSetRange [0,1];
    _control ctrlAddEventhandler ["SliderPosChanged",format ["['%1'] call A3PL_Garage_SetSliderColour",_veh]];
    _control = _display displayCtrl 1901;
    _control sliderSetRange [0,1];
    _control ctrlAddEventhandler ["SliderPosChanged",format ["['%1'] call A3PL_Garage_SetSliderColour",_veh]];
    _control = _display displayCtrl 1902;
    _control sliderSetRange [0,1];
    _control ctrlAddEventhandler ["SliderPosChanged",format ["['%1'] call A3PL_Garage_SetSliderColour",_veh]];

    _control = _display displayCtrl 1600;
    _control buttonSetAction "['No upgrade selected',Color_Red] call A3PL_HUD_Notification;";
    _control = _display displayCtrl 1601;
    _control buttonSetAction format ["['%1'] call A3PL_Garage_Repair",_veh];
    _control = _display displayCtrl 1602;
    _control buttonSetAction format ["['tex','%1'] call A3PL_Garage_ColourSet",_veh];
    _control = _display displayCtrl 1603;
    _control buttonSetAction "call A3PL_Garage_ColourSet";

    A3PL_Garage_Veh = _veh;
    A3PL_Garage_Cam = _cam;
    A3PL_Garage_Logic = _logic;
    A3PL_Garage_MyColor = ((getObjectTextures _veh) select 0);

    while {!isNull _display} do{uiSleep 0.01;};

    camDestroy _cam;
    A3PL_Garage_Cam = nil;
    A3PL_Garage_Veh = nil;
    A3PL_Garage_Logic = nil;

    if ((missionNameSpace getVariable ["A3PL_Garage_NewColor",A3PL_Garage_MyColor]) != A3PL_Garage_MyColor) then {
        _file = A3PL_Garage_NewColor;
        _cnt = count _file;
        if (_cnt == 1) then {_file1 = _file select 0;_veh setObjectTextureGlobal [0,_file1]};
        if (_cnt == 2) then {_file1 = _file select 0;_file2 = _file select 1;_veh setObjectTextureGlobal [0,_file1];_veh setObjectTextureGlobal [1,_file2]};
        if (_cnt == 3) then {_file1 = _file select 0;_file2 = _file select 1;_file3 = _file select 2;_veh setObjectTextureGlobal [0,_file1];_veh setObjectTextureGlobal [1,_file2];_veh setObjectTextureGlobal [2,_file3]};
        if (_cnt == 4) then {_file1 = _file select 0;_file2 = _file select 1;_file3 = _file select 2;_file4 = _file select 3;_veh setObjectTextureGlobal [0,_file1];_veh setObjectTextureGlobal [1,_file2];_veh setObjectTextureGlobal [2,_file3];_veh setObjectTextureGlobal [3,_file4]};

    } else {
        _veh setObjectTextureGlobal [0,A3PL_Garage_MyColor];
    };

    if ((missionNameSpace getVariable ["A3PL_Garage_tUpgrade",""]) != "") then {
        [_veh,A3PL_Garage_tUpgrade,0] call A3PL_Garage_Upgrade;
    };

    A3PL_Garage_tUpgrade = nil;
    A3PL_Garage_MyColor = nil;
    A3PL_Garage_NewColor = nil;
    deleteVehicle _logic;
    player cameraEffect ["terminate", "BACK"];

}, false] call Server_Setup_Compile;

['A3PL_Garage_Repair', {

    private ["_veh","_selHit"];
    _veh = param [0,objNull];
    if (typeName _veh == "STRING") then
    {
        _veh = [_veh] call A3PL_Lib_vehStringToObj;
    };

    if (!local _veh) exitwith {["Você não pode reparar um veículo que não é seu, entre de motorista para consertar isso",Color_Red] call A3PL_HUD_Notification;};

    _display = findDisplay 62;
    _control = _display displayCtrl 1502;
    _selHit = _control lbData (lbCurSel _control);
    _veh setHit [_selHit,0];

    _title = [_selHit,"title"] call Caue_Config_GetGarageRepair;
    [format ["Você reparou este componente (%1)",_title],Color_Green] call A3PL_HUD_Notification;

    _control = _display displayCtrl 1100;
    _control ctrlSetStructuredText parseText format ["<t align='center' size ='1.4'> %1%2 </t>",0,"%"];

}, false] call Server_Setup_Compile;

['A3PL_Garage_LBRepair', {

    private ["_veh","_allHitPoints","_hitArray","_dmgHitArray","_display","_control","_selHit","_selHiti","_dmgValue"];
    _veh = param [0,objNull];
    _display = findDisplay 62;
    if (typeName _veh == "STRING") then
    {
        _veh = [_veh] call A3PL_Lib_vehStringToObj;
    };

    _allHitPoints = getAllHitPointsDamage _veh;
    _hitArray = _allHitPoints select 1;
    _dmghitArray = _allHitPoints select 2;

    _control = _display displayCtrl 1502;
    _selHit = _control lbData (lbCurSel _control);
    _selHiti = _hitArray find _selHit;
    _dmgValue = _dmgHitArray select _selHiti;

    _control = _display displayCtrl 1100;
    _control ctrlSetStructuredText parseText format ["<t align='center' size ='1.4'> %1%2 </t>",round(_dmgValue*100),"%"];

}, false] call Server_Setup_Compile;

['A3PL_Garage_SetSliderColour', {

    private ["_texture","_control","_display","_rSlider","_gSlider","_bSlider","_veh","_text"];
    _veh = param [0,objNull];
    _texture = param [1,""];
    _display = findDisplay 62;

    if (typeName _veh == "STRING") then
    {
        _veh = [_veh] call A3PL_Lib_vehStringToObj;
    };
    if (isNull _veh) exitwith {};

    if (_texture != "") exitwith
    {
        private ["_id","_file"];
        _control = _display displayCtrl 1504;
        _id = _control lbData (lbCurSel _control);
        _file = [_id,typeOf _veh,"file"] call Caue_Config_GetGaragePaint;
        if (typeName _file == "BOOL") exitwith {};
        if (typeName _file == "ARRAY") then
        {
            _cnt = count _file;
            if (_cnt == 1) then {_file1 = _file select 0;_veh setObjectTextureGlobal [0,_file1]};
            if (_cnt == 2) then {_file1 = _file select 0;_file2 = _file select 1;_veh setObjectTextureGlobal [0,_file1];_veh setObjectTextureGlobal [1,_file2]};
            if (_cnt == 3) then {_file1 = _file select 0;_file2 = _file select 1;_file3 = _file select 2;_veh setObjectTextureGlobal [0,_file1];_veh setObjectTextureGlobal [1,_file2];_veh setObjectTextureGlobal [2,_file3]};
            if (_cnt == 4) then {_file1 = _file select 0;_file2 = _file select 1;_file3 = _file select 2;_file4 = _file select 3;_veh setObjectTextureGlobal [0,_file1];_veh setObjectTextureGlobal [1,_file2];_veh setObjectTextureGlobal [2,_file3];_veh setObjectTextureGlobal [3,_file4]};
        };
    };

    _control = _display displayCtrl 1900;
    _rSlider = sliderPosition _control;
    _control = _display displayCtrl 1901;
    _gSlider = sliderPosition _control;
    _control = _display displayCtrl 1902;
    _bSlider = sliderPosition _control;
    systemchat format ["RGB: %1 %2 %3",round(255 * _rSlider),round (255 * _gSlider),round (255 * _bSlider)];
    _text = format ["#(argb,8,8,3)color(%1,%2,%3,1.0,CO)",_rSlider,_gSlider,_bSlider];
    _veh setObjectTextureGlobal [0,_text];

}, false] call Server_Setup_Compile;

['A3PL_Garage_Upgrade', {

    private ["_veh","_id","_typeOf","_isInstalled","_upgradeType","_upgradeClass","_forceInstall"];
    _veh = param [0,objNull,[objNull,""]];
    _id = param [1,""];
    _forceInstall = param [2,-1];
    if (typeName _veh == "STRING") then
    {
        _veh = [_veh] call A3PL_Lib_vehStringToObj;
    };
    _typeOf = typeOf _veh;
    _upgradeType = [_id,_typeOf,"type"] call Caue_Config_GetGarageUpgrade;
    _upgradeClass = [_id,_typeOf,"class"] call Caue_Config_GetGarageUpgrade;
    if (isNil "_veh") exitwith {["System: Unable to return object in Garage_Upgrade (report this)",Color_Red] call A3PL_HUD_Notification;};

    _isInstalled = [_veh,_id] call A3PL_Garage_isInstalled;
    switch (_upgradeType) do
    {
        case ("addon"):
        {
            if (_forceInstall == -1) exitwith
            {
                if (!_isInstalled) then { [_veh, nil, [_upgradeClass, 1]] call A3PL_Garage_InstallUpgrades; } else { [_veh, nil, [_upgradeClass, 0]] call A3PL_Garage_InstallUpgrades; };
            };
            if ((_veh animationSourcePhase _upgradeClass) != _forceInstall) then
            {
                [_veh, nil, [_upgradeClass, _forceInstall]] call A3PL_Garage_InstallUpgrades;
            };
            if (_forceInstall == 1) then
            {
                A3PL_Garage_tUpgrade = nil;
            } else
            {
                A3PL_Garage_tUpgrade = _id;
            };
        };
    };

    private _plate = (_veh getVariable ["owner",["","ADMIN"]]) select 1;
    [_veh,_plate] remoteExecCall ["Server_Garage_Tuning",2];

}, false] call Server_Setup_Compile;

['A3PL_Garage_isInstalled', {

    private ["_veh","_id","_typeOf","_installed","_upgradeType"];
    _veh = param [0,objNull,[objNull,""]];
    if (typeName _veh == "STRING") then
    {
        _veh = [_veh] call A3PL_Lib_vehStringToObj;
    };
    if (isNull _veh) exitwith {["System: Unable to return object in Garage_Upgrade (report this)",Color_Red] call A3PL_HUD_Notification;};
    _id = param [1,""];
    _typeOf = typeOf _veh;
    _upgradeType = [_id,_typeOf,"type"] call Caue_Config_GetGarageUpgrade;

    _installed = false;
    switch (_upgradeType) do
    {
        case ("addon"):
        {
            private ["_animation"];
            _animation = [_id,_typeOf,"class"] call Caue_Config_GetGarageUpgrade;
            if (_veh animationSourcePhase _animation > 0.5) then
            {
                _installed = true;
            };
        };
    };
    _installed;

}, false] call Server_Setup_Compile;

['A3PL_Garage_ClickUpgrade', {

    disableSerialization;
    private ["_display","_control","_veh","_typeOf","_tpos","_tOffset","_logic","_upgradeType","_title"];
    _display = findDisplay 62;
    _control = param [0,controlNull];
    _i = param [1,0];
    _veh = missionNameSpace getVariable ["A3PL_Garage_Veh",ObjNull];
    _cam = missionNameSpace getVariable ["A3PL_Garage_Cam",ObjNull];
    _logic = missionNameSpace getVariable ["A3PL_Garage_Logic",ObjNull];
    _typeOf = typeOf _veh;
    _id = _control lbData _i;

    _upgradeType = [];
    _title = [_id,_typeOf,"title"] call Caue_Config_GetGarageUpgrade;
    _tPos = [_id,_typeOf,"camTarget"] call Caue_Config_GetGarageUpgrade;
    if (typeName _tPos == "string") then {_tPos = _veh selectionPosition [_tPos,"memory"];};
    _tOffset = [_id,_typeOf,"camOffset"] call Caue_Config_GetGarageUpgrade;

    _logic setpos (_veh modelToWorld _tPos);
    _cam camSetTarget _logic;
    _cam camSetRelPos _tOffset;
    _cam camCommit 2;

    _control = _display displayCtrl 1101;
    _control ctrlSetStructuredText parseText format ["<t align='center' size ='1'>%1</t>",([_id,_typeOf,"desc"] call Caue_Config_GetGarageUpgrade)];

    _control = _display displayCtrl 1102;
    _control ctrlSetStructuredText parseText format ["<t align='center' size ='1.2'>$%1</t>",([_id,_typeOf,"price"] call Caue_Config_GetGarageUpgrade)];

    _control = _display displayCtrl 1600;
    _control buttonSetAction format ["
    	private ['_installed'];
    	if(!([] call Caue_Player_AntiSpam)) exitWith {};
    	_installed = isNil 'A3PL_Garage_tUpgrade';
    	if (_installed) then {_installed = 0;} else {_installed = 1};
    	['%1','%2',_installed] call A3PL_Garage_Upgrade;
    	['System: Você instalou/desinstalou com sucesso uma atualização (%3)','%4'] call A3PL_HUD_Notification;
    ",_veh,_id,_title,Color_Green];

    if ((missionNameSpace getVariable ["A3PL_Garage_tUpgrade",""]) != "") then {
        [_veh,A3PL_Garage_tUpgrade,0] call A3PL_Garage_Upgrade;
    };

    if !([_veh,_id] call A3PL_Garage_isInstalled) then {
        [_veh,_id] call A3PL_Garage_Upgrade;
        A3PL_Garage_tUpgrade = _id;
    } else {
        A3PL_Garage_tUpgrade = nil;
    };

}, false] call Server_Setup_Compile;

['A3PL_Garage_ColourSet', {

    private ["_display","_control","_rSlider","_gSlider","_bSlider","_veh","_text","_texture"];
    if(!([] call Caue_Player_AntiSpam)) exitWith {};
    _texture = param [0,""];
    _veh = param [1,objNull];
    if (typeName _veh == "STRING") then
    {
        _veh = [_veh] call A3PL_Lib_vehStringToObj;
    };
    _display = findDisplay 62;

    if (_texture != "") exitwith
    {
        private ["_id","_file"];
        _control = _display displayCtrl 1504;
        _id = _control lbData (lbCurSel _control);
        _file = [_id,typeOf _veh,"file"] call Caue_Config_GetGaragePaint;

        if (typeName _file == "ARRAY") then
        {
            _cnt = count _file;
            if (_cnt == 1) then {_file1 = _file select 0;_veh setObjectTextureGlobal [0,_file1]};
            if (_cnt == 2) then {_file1 = _file select 0;_file2 = _file select 1;_veh setObjectTextureGlobal [0,_file1];_veh setObjectTextureGlobal [1,_file2]};
            if (_cnt == 3) then {_file1 = _file select 0;_file2 = _file select 1;_file3 = _file select 2;_veh setObjectTextureGlobal [0,_file1];_veh setObjectTextureGlobal [1,_file2];_veh setObjectTextureGlobal [2,_file3]};
            if (_cnt == 4) then {_file1 = _file select 0;_file2 = _file select 1;_file3 = _file select 2;_file4 = _file select 3;_veh setObjectTextureGlobal [0,_file1];_veh setObjectTextureGlobal [1,_file2];_veh setObjectTextureGlobal [2,_file3];_veh setObjectTextureGlobal [3,_file4]};
        };

        A3PL_Garage_NewColor = _file select 0;
        A3PL_Garage_NewColorArry = _file;
        ["Você deu ao seu veículo uma nova cor!",Color_Green] call A3PL_HUD_Notification;
        private _id = ((_veh getVariable "owner") select 1);
        [_veh,_id] remoteExecCall ["Caue_Vehicle_SaveColor",2];
    };

    _control = _display displayCtrl 1900;
    _rSlider = sliderPosition _control;
    _control = _display displayCtrl 1901;
    _gSlider = sliderPosition _control;
    _control = _display displayCtrl 1902;
    _bSlider = sliderPosition _control;
    _text = format ["#(argb,8,8,3)color(%1,%2,%3,1.0,CO)",_rSlider,_gSlider,_bSlider];
    A3PL_Garage_NewColor = _text;

    ["Você deu ao seu veículo uma nova cor!",Color_Green] call A3PL_HUD_Notification;

}, false] call Server_Setup_Compile;

['A3PL_Garage_InstallUpgrades', {

    private ["_vehicle","_variant","_animations", "_bChangeMass"];
    _vehicle 	= param [0, objNull, [objNull]];
    _variant 	= param [1, false, ["STRING", false, 0, []]];
    _animations 	= param [2, false, [[], false, "STRING"]];
    _bChangeMass 	= param [3, false, [false, 0]];

    private ["_vehicleType", "_listToSkip", "_addMass","_isCampaign"];
    _vehicleType = typeOf _vehicle;
    _skipRandomization = ({(_vehicleType isEqualTo _x) || (_vehicleType isKindOf _x) || (format ["%1", _vehicle] isEqualTo _x)} count (getArray(missionConfigfile >> "disableRandomization")) > 0 || !(_vehicle getVariable ["BIS_enableRandomization", true]));

    if (_bChangeMass isEqualType 0) then {
        _addMass = _bChangeMass;
        _bChangeMass = true;
    } else {
        _addMass = 0;
    };

    if (getNumber(missionConfigfile >> "CfgVehicleTemplates" >> "disableMassChange") == 1) then {
        _bChangeMass = false;
    };

    _isCampaign = isClass(campaignConfigFile >> "CfgVehicleTemplates");

    if !(_variant isEqualTo false) then {
        private ["_texturesToApply","_textureList","_textureSources","_textureSource","_probabilities","_materialsToApply"];
        _texturesToApply = [];
        _materialsToApply = [];
        _textureList = getArray(configFile >> "CfgVehicles" >> _vehicleType >> "TextureList");

        if (_variant isEqualType []) then {
            _textureList = _variant;
            _variant = "";
        };

        if (_variant isEqualType true) Then {
            if (count _textureList > 0) Then {
                _variant = _textureList select 0;
            } else {
                _variant = "";
            };
        };

        if (_variant isEqualType 0) then {
            _variant = if ((_variant >= 0) && ((_variant * 2) <= (count _textureList) -2)) then {_textureList select (_variant * 2)} else {""};
        };

        if (_vehicleType in ([(configFile >> "CfgVehicles" >> _variant), true] call BIS_fnc_returnParents)) then {
            private ["_cfgRoot"];
            _textureList = getArray(configFile >> "CfgVehicles" >> _variant >> "TextureList");
            _textureSources = [];
            _probabilities = [];
            for "_i" from 0 to (count _textureList -1) step 2 do {
                _textureSources append [_textureList select _i];
                _probabilities append [_textureList select (_i +1)];
            };
            _cfgRoot = (configFile >> "CfgVehicles" >> _variant >> "textureSources" >> ([_textureSources, _probabilities] call bis_fnc_selectRandomWeighted));
            _texturesToApply = getArray(_cfgRoot >> "textures");
            _materialsToApply = getArray(_cfgRoot >> "materials");
        };

        if (count _texturesToApply == 0 && {isClass (configfile >> "CfgVehicles" >> _vehicleType >> "textureSources" >> _variant)}) then {
            _texturesToApply = getArray(configfile >> "CfgVehicles" >> _vehicleType >> "textureSources" >> _variant >> "textures");
            _materialsToApply = getArray(configfile >> "CfgVehicles" >> _vehicleType >> "textureSources" >> _variant >> "materials");
        };

        if (_isCampaign && {isClass (campaignConfigFile >> "CfgVehicleTemplates" >> _variant)}) then {
            if (count (getArray(campaignConfigFile >> "CfgVehicleTemplates" >> _variant >> "textures")) >= 1) then {
                _texturesToApply = getArray(campaignConfigFile >> "CfgVehicleTemplates" >> _variant >> "textures");
                _materialsToApply = getArray(campaignConfigFile >> "CfgVehicleTemplates" >> _variant >> "materials");
            } else {
                _texturesToApply = [];
                _materialsToApply = [];
                _textureList = getArray(campaignConfigFile >> "CfgVehicleTemplates" >> _variant >> "textureList")
            };
        };

        if (isClass (missionConfigFile >> "CfgVehicleTemplates" >> _variant)) then {
            if (count (getArray(missionConfigFile >> "CfgVehicleTemplates" >> _variant >> "textures")) >= 1) then {
                _texturesToApply = getArray(missionConfigFile >> "CfgVehicleTemplates" >> _variant >> "textures");
                _materialsToApply = getArray(missionConfigFile >> "CfgVehicleTemplates" >> _variant >> "materials");
            } else {
                _texturesToApply = [];
                _materialsToApply = [];
                _textureList = getArray(missionConfigFile >> "CfgVehicleTemplates" >> _variant >> "textureList")
            };
        };

        if (!(_skipRandomization) && {count _texturesToApply == 0 && {count _textureList >= 2}}) then {
            private ["_cfgRoot"];
            _textureSources = [];
            _probabilities = [];
            for "_i" from 0 to (count _textureList -1) step 2 do {
                _textureSources append [_textureList select _i];
                _probabilities append [_textureList select (_i +1)];
            };
            _cfgRoot = configFile >> "CfgVehicles" >> _vehicleType >> "textureSources" >> ([_textureSources, _probabilities] call bis_fnc_selectRandomWeighted);
            _texturesToApply = getArray(_cfgRoot >> "textures");
            _materialsToApply = getArray(_cfgRoot >> "materials");
        };

        {_vehicle setObjectTextureGlobal [_forEachindex, _x];} forEach _texturesToApply;

        {if (_x != "") then {_vehicle setObjectMaterialGlobal [_forEachindex, _x];};} forEach _materialsToApply;
    };

    if !(_animations isEqualTo false) then {
        private ["_animationList","_resetAnimationSources"];
        _animationList = getArray(configFile >> "CfgVehicles" >> _vehicleType >> "animationList");

        _resetAnimationSources = if (_animations isEqualType [] && {count _animations > 0 && {(_animations select 0) isEqualType true}}) then
        {
            [_animations] call bis_fnc_arrayShift
        } else {
            true
        };

        if (_resetAnimationSources) then {
            {
                if (_x isEqualType "") then {
                    _vehicle animatesource [_x, getNumber(configFile >> "CfgVehicles" >> _vehicleType >> "animationSources" >> _x >> "initPhase"), true];
                };
            } forEach _animationList;
        };

        if (_animations isEqualTo true) exitWith {};

        if (!(_skipRandomization) && {(_animations isEqualType "" || _variant isEqualType "")}) then {

            if ((_variant isEqualType "") && {isClass (configFile >> "CfgVehicles" >> _variant) && {_animations isEqualTo "" || _animations isEqualTo []}}) then {
                _animationList = getArray(configFile >> "CfgVehicles" >> _variant >> "animationList");
            };

            if (_isCampaign && {(_variant isEqualType "") && {(_animations isEqualTo "" || _animations isEqualTo []) && {isClass (campaignConfigFile >> "CfgVehicleTemplates" >> _variant)}}}) then
            {
                _animationList = getArray(campaignConfigFile >> "CfgVehicleTemplates" >> _variant >> "animationList");
            };

            if ((_variant isEqualType "") && {isClass (missionConfigFile >> "CfgVehicleTemplates" >> _variant) && {_animations isEqualTo "" || _animations isEqualTo []}}) then {
                _animationList = getArray(missionConfigFile >> "CfgVehicleTemplates" >> _variant >> "animationList");
            };

            if (_animations isEqualType "" && {isArray (configFile >> "CfgVehicles" >> _animations >> "animationList")}) then {
                _animationList = getArray(configFile >> "CfgVehicles" >> _animations >> "animationList");
            };

            if (_isCampaign && {_animations isEqualType "" && {isArray (campaignConfigFile >> "CfgVehicleTemplates" >> _animations >> "animationList")}}) then {
                _animationList = getArray(campaignConfigFile >> "CfgVehicleTemplates" >> _animations >> "animationList");
            };


            if (_animations isEqualType "" && {isArray (missionConfigFile >> "CfgVehicleTemplates" >> _animations >> "animationList")}) then {
                _animationList = getArray(missionConfigFile >> "CfgVehicleTemplates" >> _animations >> "animationList");
            };
        };

        if (_animations isEqualType [] && {count _animations > 1 && {count _animations mod 2 == 0 && {(_animations select 1) isEqualType 0}}}) then {
            _animationList = _animations;
        };

        _vehicle setvariable ["bis_fnc_initVehicle_animations",_animationList];
        if (count _animationList > 1) then {
            private ["_CfgPath"];
            _CfgPath = (configfile >> "CfgVehicles" >> _vehicleType >> "AnimationSources");

            for "_i" from 0 to (count _animationList -1) step 2 do {
                private ["_source", "_lockCargoAnimationPhase", "_lockCargo", "_chance", "_rand", "_bLockCargo", "_bLockTurret", "_forceAnimatePhase", "_forceAnimate", "_phase", "_lockTurretAnimationPhase", "_lockTurret"];
                _source = _animationList select _i;
                _lockCargoAnimationPhase = getNumber(_CfgPath >> _source >> "lockCargoAnimationPhase");
                _lockCargo = getArray(_CfgPath >> _source >> "lockCargo");
                _forceAnimatePhase = getNumber(_CfgPath >> _source >> "forceAnimatePhase");
                _forceAnimate = getArray(_CfgPath >> _source >> "forceAnimate");
                _chance = _animationList select (_i+1);

                _phase = if ((random 1) <= _chance) then {1} else {0};

                _vehicle animatesource [_source, _phase, true];

                if (_forceAnimatePhase == _phase) then {
                    for "_i" from 0 to (count _forceAnimate -1) step 2 do {
                        _vehicle animatesource [(_forceAnimate select _i), (_forceAnimate select (_i +1)), true];
                    };
                };

                _blockCargo = (_lockCargoAnimationPhase == _phase);
                {_vehicle lockCargo [_x, _blockCargo];} forEach _lockCargo;

                [_vehicle, _phase] call compile (getText(configfile >> "CfgVehicles" >> _vehicleType >> "AnimationSources" >> _source >> "onPhaseChanged"));
            };
        };
    };

    if (_bChangeMass) then {
        _bChangeMass = [_vehicle, _bChangeMass, _addMass] call bis_fnc_setVehicleMass;
    };

}, false] call Server_Setup_Compile;

/*
    Server
*/
['Server_Garage_Tuning', {

    params [
        ["_vehicle",objNull],
        ["id",""]
    ];

    if ((isNull _vehicle) || (_id isEqualTo "")) exitWith {};
    if (_id IN ["ADMIN","WASTE","DELIVER","EXTERMY","KARTING"]) exitWith {};

    private _animMods = ([_vehicle] call BIS_fnc_getVehicleCustomization) select 1;
    private _modsFormat = [_animMods] call Server_Database_Array;

    [format["Vehicle_SaveTuning:%1:%2",_modsFormat,_id],1] spawn Server_Database_Async;

}, true] call Server_Setup_Compile;
