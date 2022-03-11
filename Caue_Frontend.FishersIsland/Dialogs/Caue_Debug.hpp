class Caue_Debug {
    idd = 9999620;
    movingEnable = 1;
    enableSimulation = 0;
    onLoad = "uiNamespace setVariable ['Caue_Debug',_this select 0];";

    class controlsBackground {
        class HEADER: Caue_ctrlStaticHeaderMoving {
            text = "Debug Console";
            x = "0.29375 * safezoneW + safezoneX";
            y = "0.225 * safezoneH + safezoneY";
            w = "0.412424 * safezoneW";
        };
        class BACKGROUND: Caue_ctrlStaticBackground {
            x = "0.293751 * safezoneW + safezoneX";
            y = "0.243526 * safezoneH + safezoneY";
            w = "0.4125 * safezoneW";
            h = "0.505652 * safezoneH";
        };
        class FOOTER: Caue_ctrlStaticFooter {
            x = "0.29375 * safezoneW + safezoneX";
            y = "0.748615 * safezoneH + safezoneY";
            w = "0.4125 * safezoneW";
        };
        class EXECUTE_TITLE: Caue_ctrlStatic {
            text = "EXECUTE:";
            x = "0.492782 * safezoneW + safezoneX";
            y = "0.535548 * safezoneH + safezoneY";
            w = "0.0525936 * safezoneW";
            h = "5 * (pixelH * pixelGrid * 0.50)";
            colorBackground[] = {0, 0, 0, 0.5};
        };
        class WATCH_TITLE: EXECUTE_TITLE {
            text = "WATCH:";
            x = "0.492782 * safezoneW + safezoneX";
            y = "0.614622 * safezoneH + safezoneY";
            w = "0.0525937 * safezoneW";
        };
        class TOOLS_TITLE: EXECUTE_TITLE {
            text = "TOOLS:";
            x = "0.602068 * safezoneW + safezoneX";
            y = "0.535548 * safezoneH + safezoneY";
            w = "0.0402188 * safezoneW";
        };
        class TITLE_ACTIVESCRIPTS: EXECUTE_TITLE {
            text = "ACTIVE SCRIPTS:";
            x = "0.295813 * safezoneW + safezoneX";
            y = "0.615104 * safezoneH + safezoneY";
            w = "0.0670308 * safezoneW";
        };
        class TITLE_ACTIVESQFSCRIPTS: EXECUTE_TITLE {
            text = "ACTIVE SQF SCTS:";
            x = "0.295833 * safezoneW + safezoneX";
            y = "0.63426 * safezoneH + safezoneY";
            w = "0.0670308 * safezoneW";
        };
        class TITLE_ACTIVESQSSCRIPTS: EXECUTE_TITLE {
            text = "ACTIVE SQS SCTS:";
            x = "0.295833 * safezoneW + safezoneX";
            y = "0.653704 * safezoneH + safezoneY";
            w = "0.0670308 * safezoneW";
        };
        class TITLE_ACTIVEFSMS: EXECUTE_TITLE {
            text = "ACTIVE FSM'S:";
            x = "0.295833 * safezoneW + safezoneX";
            y = "0.673148 * safezoneH + safezoneY";
            w = "0.0670308 * safezoneW";
        };
        class TITLE_CURRENTBUILD: EXECUTE_TITLE {
            text = "CURRENT BUILD:";
            x = "0.295833 * safezoneW + safezoneX";
            y = "0.694563 * safezoneH + safezoneY";
            w = "0.0670308 * safezoneW";
        };
        class TITLE_SCRIPTMONITORS: EXECUTE_TITLE {
            text = "SCRIPT MONITORS:";
            x = "0.295833 * safezoneW + safezoneX";
            y = "0.713778 * safezoneH + safezoneY";
            w = "0.0670308 * safezoneW";
        };
    };
    class controls {
        class INPUT: Caue_ctrlEditMultiCode {
        	idc = 9999622;
        	x = "0.295813 * safezoneW + safezoneX";
        	y = "0.247 * safezoneH + safezoneY";
        	w = "0.194695 * safezoneW";
        	h = "0.345919 * safezoneH";
        };
        class INPUT_RETURN: Caue_ctrlStaticContent {
        	idc = 9999637;
	        x = "0.295812 * safezoneW + safezoneX";
        	y = "0.59372 * safezoneH + safezoneY";
        	w = "0.194892 * safezoneW";
        	h = "0.0185185 * safezoneH";
        };
        class BUTTON_CLOSE: Caue_ctrlButtonClose {
            idc = 9999621;
        	x = "0.692844 * safezoneW + safezoneX";
        	y = "0.225 * safezoneH + safezoneY";
        	w = "0.013406 * safezoneW";
        	h = "5 * (pixelH * pixelGrid * 0.50)";
        };
        class EXECUTE_CHECKBOX: Caue_ctrlCheckbox {
            idc = 9999627;
            tooltip = "Enable 3rd party execution";
            x = "0.531591 * safezoneW + safezoneX";
            y = "0.534726 * safezoneH + safezoneY";
            w = "5 * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
            checked 		   = 0;
        };
        class EXECUTE_LOCAL: Caue_ctrlDefaultButton {
            idc = 9999626;
        	text = "LOCAL";
        	x = "0.546406 * safezoneW + safezoneX";
        	y = "0.5352 * safezoneH + safezoneY";
        	w = "0.0376562 * safezoneW";
        	h = "5 * (pixelH * pixelGrid * 0.50)";
        };
        class EXECUTE_GLOBAL: EXECUTE_LOCAL {
            idc = 9999625;
        	text = "GLOBAL";
        	x = "0.546406 * safezoneW + safezoneX";
        	y = "0.555 * safezoneH + safezoneY";
        	w = "0.0496982 * safezoneW";
        };
        class EXECUTE_SERVER: EXECUTE_LOCAL {
            idc = 9999624;
        	text = "SERVER";
        	x = "0.546402 * safezoneW + safezoneX";
        	y = "0.573874 * safezoneH + safezoneY";
        	w = "0.0496982 * safezoneW";
        };
        class EXECUTE_SELPLAYER: EXECUTE_LOCAL {
            idc = 9999623;
            text = "PLAYER";
            x = "0.546402 * safezoneW + safezoneX";
            y = "0.593793 * safezoneH + safezoneY";
            w = "0.0496982 * safezoneW";
        };
        class EXECUTE_LOCAL_PERFORMANCE: Caue_ctrlButton {
            idc = 9999636;
            text = "\a3\ui_f\data\GUI\RscCommon\RscDebugConsole\performance_ca.paa";
            style = "0x02 + 0x30 + 0x800";
            x = "0.585104 * safezoneW + safezoneX";
            y = "0.534852 * safezoneH + safezoneY";
            w = "0.010823 * safezoneW";
            h = "5 * (pixelH * pixelGrid * 0.50)";
        };
        class TREE_PLAYERS: Caue_ctrlTree {
        	idc = 9999635;
            idcSearch = 9999634;
        	x = "0.492782 * safezoneW + safezoneX";
        	y = "0.267726 * safezoneH + safezoneY";
        	w = "0.102936 * safezoneW";
        	h = "0.264519 * safezoneH";
        	colorBackground[]  = {0, 0, 0, 0.5};
        };
        class TREE_PLAYERS_SEARCH: Caue_ctrlEdit {
        	idc = 9999634;
        	x = "0.492782 * safezoneW + safezoneX";
        	y = "0.247 * safezoneH + safezoneY";
        	w = "0.0680624 * safezoneW";
        	h = "0.0185185 * safezoneH";
        	colorBackground[]  = {0, 0, 0, 0.3};
        };
        class TREE_PLAYERS_BUTTONSEARCH: Caue_ctrlButtonSearch {
        	idc = 9999645;
        	x = "0.562011 * safezoneW + safezoneX";
        	y = "0.246874 * safezoneH + safezoneY";
        };
        class PLAYERS_TREE_COLLAPSEALL: Caue_ctrlButtonCollapseAll {
        	idc = 9999644;
        	x = "0.584172 * safezoneW + safezoneX";
        	y = "0.246874 * safezoneH + safezoneY";
        };
        class TREE_PLAYERS_EXPANDALL: Caue_ctrlButtonExpandAll {
        	idc = 9999643;
        	x = "0.575414 * safezoneW + safezoneX";
        	y = "0.246874 * safezoneH + safezoneY";
        };
        class TREE_SCRIPTS: Caue_ctrlTree {
        	idc = 9999638;
            idcSearch = 9999642;
        	x = "0.600963 * safezoneW + safezoneX";
        	y = "0.267593 * safezoneH + safezoneY";
        	w = "0.102936 * safezoneW";
        	h = "0.242519 * safezoneH";
            colorBackground[]  = {0, 0, 0, 0.5};
        };
        class TREE_SCRIPTS_BUTTONSEARCH: Caue_ctrlButtonSearch {
            idc = 9999639;
            x = "0.671297 * safezoneW + safezoneX";
            y = "0.246874 * safezoneH + safezoneY";
        };
        class TREE_SCRIPTS_EXPANDALL: Caue_ctrlButtonExpandAll {
            idc = 9999640;
            x = "0.6847 * safezoneW + safezoneX";
            y = "0.246874 * safezoneH + safezoneY";
        };
        class TREE_SCRIPTS_COLLAPSEALL: Caue_ctrlButtonCollapseAll {
            idc = 9999641;
            x = "0.693458 * safezoneW + safezoneX";
            y = "0.246874 * safezoneH + safezoneY";
        };
        class SCRIPTS_SAVESCRIPT_INPUT: Caue_ctrlEdit {
        	idc = 9999642;
        	x = "0.602068 * safezoneW + safezoneX";
        	y = "0.247 * safezoneH + safezoneY";
        	w = "0.0680624 * safezoneW";
        	h = "5 * (pixelH * pixelGrid * 0.50)";
        };
        class CODE_INPUT_NAME: Caue_ctrlEdit {
        	idc = 9999647;
        	x = "0.602094 * safezoneW + safezoneX";
        	y = "0.5132 * safezoneH + safezoneY";
        	w = "0.078375 * safezoneW";
        	h = "5 * (pixelH * pixelGrid * 0.50)";
        };
        class CODE_BUTTON_LOAD: Caue_ctrlButtonToolbar {
        	idc = 9999648;
            tooltip = "Delete Script";
        	text = "\a3\3DEN\Data\Displays\Display3DEN\ToolBar\open_ca.paa";
        	x = "0.680988 * safezoneW + safezoneX";
        	y = "0.512274 * safezoneH + safezoneY";
        	w = "5 * (pixelH * pixelGrid * 0.50)";
        	h = "5 * (pixelH * pixelGrid * 0.50)";
        };
        class CODE_BUTTON_SAVE: CODE_BUTTON_LOAD {
        	idc = 9999649;
            tooltip = "Save Script";
            text = "\a3\3DEN\Data\Displays\Display3DEN\ToolBar\save_ca.paa";
        	x = "0.691811 * safezoneW + safezoneX";
        	y = "0.512274 * safezoneH + safezoneY";
        };
        class TOOLS_BUTTON_CONFIG: Caue_ctrlDefaultButton {
            idc = 9999650;
        	text = "CONFIGS";
        	x = "0.643229 * safezoneW + safezoneX";
        	y = "0.535185 * safezoneH + safezoneY";
        	w = "0.0610415 * safezoneW";
        	h = "5 * (pixelH * pixelGrid * 0.50)";
        };
        class TOOLS_BUTTON_ANIMATIONS: TOOLS_BUTTON_CONFIG {
            idc = 9999651;
        	text = "ANIMATIONS";
        	y = "0.55463 * safezoneH + safezoneY";
        };
        class TOOLS_BUTTON_FNCVIEWER: TOOLS_BUTTON_CONFIG {
            idc = 9999652;
        	text = "FUNCTIONS";
        	y = "0.574074 * safezoneH + safezoneY";
        };
        class TOOLS_BUTTON_SPLENDIDCAM: TOOLS_BUTTON_CONFIG {
            idc = 9999653;
        	text = "SPLENDID CAM";
        	y = "0.593519 * safezoneH + safezoneY";
        };
        class WATCH_1_EXPRESSION: Caue_ctrlEditMultiCode {
        	idc = 9999628;
        	x = "0.546406 * safezoneW + safezoneX";
        	y = "0.6144 * safezoneH + safezoneY";
        	w = "0.157767 * safezoneW";
        	h = "5 * (pixelH * pixelGrid * 0.50)";
        };
        class WATCH_2_EXPRESSION: WATCH_1_EXPRESSION {
            idc = 9999630;
            y = "0.654 * safezoneH + safezoneY";
        };
        class WATCH_3_EXPRESSION: WATCH_1_EXPRESSION {
            idc = 9999632;
            y = "0.692593 * safezoneH + safezoneY";
        };
        class WATCH_1_RETURN: Caue_ctrlEdit {
        	idc = 9999629;
        	x = "0.546402 * safezoneW + safezoneX";
        	y = "0.633689 * safezoneH + safezoneY";
        	w = "0.157767 * safezoneW";
        	h = "5 * (pixelH * pixelGrid * 0.50)";
            style = ST_RIGHT + ST_NO_RECT;
            colorBackground[]  = {0, 0, 0, 0.5};
        };
        class WATCH_2_RETURN: WATCH_1_RETURN {
        	idc = 9999631;
        	y = "0.673148 * safezoneH + safezoneY";
        };
        class WATCH_3_RETURN: WATCH_1_RETURN {
        	idc = 9999633;
        	y = "0.711111 * safezoneH + safezoneY";
        };
        class TEXT_ACTIVESQSSCRIPTS: Caue_ctrlStatic {
        	idc = 9999655;
        	text = "";
        	x = "0.363542 * safezoneW + safezoneX";
        	y = "0.654052 * safezoneH + safezoneY";
        	w = "0.126837 * safezoneW";
        	h = "5 * (pixelH * pixelGrid * 0.50)";
        	colorBackground[]  = {0, 0, 0, 0.3};
        };
        class TEXT_ACTIVESQFSCRIPTS: TEXT_ACTIVESQSSCRIPTS {
        	idc = 9999656;
        	y = "0.634252 * safezoneH + safezoneY";
        };
        class TEXT_ACTIVESCRIPTS: TEXT_ACTIVESQSSCRIPTS {
        	idc = 9999657;
        	y = "0.614452 * safezoneH + safezoneY";
        };
        class TEXT_ACTIVEFSMS: TEXT_ACTIVESQSSCRIPTS {
        	idc = 9999658;
        	y = "0.673496 * safezoneH + safezoneY";
        };
        class TEXT_CURRENTBUILD: TEXT_ACTIVESQSSCRIPTS {
        	idc = 9999659;
        	y = "0.694904 * safezoneH + safezoneY";
        };
        class BUTTON_SCRIPTMONITOR_CLIENT: Caue_ctrlDefaultButton {
            idc = 9999660;
        	text = "CLIENT";
        	x = "0.363685 * safezoneW + safezoneX";
        	y = "0.713548 * safezoneH + safezoneY";
        	w = "0.0419687 * safezoneW";
        	h = "5 * (pixelH * pixelGrid * 0.50)";
        };
        class BUTTON_SCRIPTMONITOR_SELPLAYER: BUTTON_SCRIPTMONITOR_CLIENT {
            idc = 9999661;
        	text = "PLAYER";
        	x = "0.40625 * safezoneW + safezoneX";
        };
        class BUTTON_SCRIPTMONITOR_SERVER: BUTTON_SCRIPTMONITOR_CLIENT {
            idc = 9999662;
        	text = "SERVER";
        	x = "0.448438 * safezoneW + safezoneX";
        };
    };
};
