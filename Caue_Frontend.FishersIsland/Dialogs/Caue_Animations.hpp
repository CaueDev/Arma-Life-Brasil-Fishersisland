class Caue_Animations {
    idd = 3040;
    movingEnable = 1;
    enableSimulation = 0;

    class controlsBackground {
        class TILES: Caue_RscTiles {};
        class HEADER: Caue_ctrlStaticTitle {
            idc = 3921;
            text = "Title";
            x = "0.427802 * safezoneW + safezoneX";
        	y = "0.225 * safezoneH + safezoneY";
        	w = "0.145426 * safezoneW";
        };
        class BACKGROUND: Caue_ctrlStaticBackground {
            x = "0.427698 * safezoneW + safezoneX";
        	y = "0.248148 * safezoneH + safezoneY";
        	w = "0.145426 * safezoneW";
        	h = "0.528 * safezoneH";
        };
    };

    class controls {
        class BUTTON_CLOSE: Caue_ctrlButtonClose {
            idc = 3041;
            x = "0.559822 * safezoneW + safezoneX";
        	y = "0.225 * safezoneH + safezoneY";
        	w = "0.0123751 * safezoneW";
        };
        class TARGETS_SEARCH_INPUT: Caue_ctrlEdit {
        	idc = 3042;
            x = "0.429372 * safezoneW + safezoneX";
        	y = "0.25117 * safezoneH + safezoneY";
        	w = "0.130249 * safezoneW";
        	h = "0.0198 * safezoneH";
        	colorBackground[] = COLOUR_INPUT;
        };
        class TARGETS_SEARCH_BUTTON_REFRESH: Caue_ctrlButtonPictureKeepAspect {
            idc = 3043;
        	text = "\a3\3DEN\Data\Displays\Display3DEN\search_start_ca.paa";
            x = "0.55981 * safezoneW + safezoneX";
        	y = "0.251052 * safezoneH + safezoneY";
        	w = "0.0115501 * safezoneW";
        	h = "0.0198 * safezoneH";
        };
        class TARGETS_TREE: Caue_ctrlTree {
        	idc = 3044;
            idcSearch = 3042;
            x = "0.429261 * safezoneW + safezoneX";
        	y = "0.272444 * safezoneH + safezoneY";
        	w = "0.142051 * safezoneW";
        	h = "0.479252 * safezoneH";
        	colorBackground[] = COLOUR_CONTENTBACKGROUND;
        };
        class BUTTON_1: Caue_ctrlDefaultButton {
            idc = 3045;
        	text = "1";
            x = "0.502058 * safezoneW + safezoneX";
        	y = "0.753926 * safezoneH + safezoneY";
        	w = "0.0690937 * safezoneW";
        	colorBackground[] = COLOUR_EMPTY;
        };
        class BUTTON_2: BUTTON_1 {
            idc = 3046;
        	text = "2";
            x = "0.429366 * safezoneW + safezoneX";
            w = "0.071677 * safezoneW";
        };
    };
};
