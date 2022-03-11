['Caue_Wiki_Open', {

    closeDialog 0;
    createDialog "Caue_Wiki";

    private _display = uiNamespace getVariable ["Caue_Wiki",displayNull];
    private _ctrlTree = _display displayCtrl 2;
    private _ctrlButtonExpandAll = _display displayCtrl 4;
    private _ctrlButtonCollapseAll = _display displayCtrl 5;
    private _ctrlButtonSearch = _display displayCtrl 3;
    private _ctrlEditSearch = _display displayCtrl 1;

    _ctrlTree ctrlAddEventHandler ["TreeSelChanged", {
        params [
            ["_ctrl", controlNull, [controlNull]],
            ["_path", [], [[]]]
        ];

        private _display = ctrlParent _ctrl;
        private _tvData = _ctrl tvData _path;
        private _controls = _display displayCtrl 6;
        private _ctrlStructuredText = _controls controlsGroupCtrl 84212;

        _ctrlStructuredText ctrlSetStructuredText (parseText _tvData);

        private _posText = ctrlPosition _ctrlStructuredText;
        private _hText = ctrlTextHeight _ctrlStructuredText;
        _ctrlStructuredText ctrlSetPosition [(_posText select 0), (_posText select 1), (_posText select 2), _hText];
        _ctrlStructuredText ctrlCommit 0;
    }];

    _ctrlButtonExpandAll ctrlAddEventHandler ["ButtonClick", {
        params [["_ctrl", controlNull, [controlNull]]];

        private _display = ctrlParent _ctrl;
        private _ctrlTree = _display displayCtrl 2;
        tvExpandAll _ctrlTree;
    }];

    _ctrlButtonCollapseAll ctrlAddEventHandler ["ButtonClick", {
        params [["_ctrl", controlNull, [controlNull]]];

        private _display = ctrlParent _ctrl;
        private _ctrlTree = _display displayCtrl 2;
        tvCollapseAll _ctrlTree;
    }];

    _ctrlEditSearch ctrlAddEventHandler ["KeyUp", {
        params [["_ctrl", controlNull, [controlNull]]];

        private _display = ctrlParent _ctrl;
        private _ctrlButtonSearch = _display displayCtrl 3;

        private _iconPath = [
            "\a3\3DEN\Data\Displays\Display3DEN\search_start_ca.paa",
            "\a3\3DEN\Data\Displays\Display3DEN\search_end_ca.paa"
        ] select !(ctrlText _ctrl isEqualTo "");

        _ctrlButtonSearch ctrlSetText _iconPath;
    }];

    _ctrlButtonSearch ctrlAddEventHandler ["ButtonClick", {
        params [["_ctrl", controlNull, [controlNull]]];

        private _display = ctrlParent _ctrl;
        private _ctrlEditSearch = _display displayCtrl 1;
        private _ctrlTree = _display displayCtrl 2;

        if !(ctrlText _ctrlEditSearch isEqualTo "") then {
            _ctrl ctrlSetText "\a3\3DEN\Data\Displays\Display3DEN\search_start_ca.paa";
            _ctrlEditSearch ctrlSetText "";
        };
    }];

    /* Load all categories */
    {
        _x params [
            ["_categoryName", "", [""]],
            ["_subCategories", [], [[]]]
        ];

        private _treeCategoryEntry = _ctrlTree tvAdd [[], _categoryName];
        _ctrlTree tvSetPicture [[_treeCategoryEntry], "a3\3den\Data\Cfg3DEN\Layer\iconDefault_ca.paa"];

        {
            _treeSubCategoryEntry = _ctrlTree tvAdd [[_treeCategoryEntry], (_x select 0)];
            _ctrlTree tvSetPicture [[_treeCategoryEntry, _treeSubCategoryEntry], "a3\3den\Data\Cfg3DEN\Layer\icon_ca.paa"];
            _ctrlTree tvSetData [[_treeCategoryEntry, _treeSubCategoryEntry],(_x select 1)];
        } forEach _subCategories;
    } forEach Config_Wiki;

    tvExpandAll _ctrlTree;
    _ctrlTree tvSetCurSel [0, 0];

}, false] call Server_Setup_Compile;
