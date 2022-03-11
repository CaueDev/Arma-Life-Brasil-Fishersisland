class Caue_Clothing {
    idd = 8000510;
    movingEnable = 1;
    enableSimulation = 0;
    onUnload = "Shop_Info = nil; Clothing_Camera cameraEffect ['terminate','back']; camDestroy Clothing_Camera; deleteVehicle Clothing_Macaco;";

    class controlsBackground {
        class HEADER: Caue_ctrlStatic {
        	idc = 1;
        	text = "Loja de Roupas";
        	x = "0.707238 * safezoneW + safezoneX";
        	y = "0.291 * safezoneH + safezoneY";
        	w = "0.175313 * safezoneW";
        	h = SIZE_BLOCK_HEADER2;
        	colorBackground[] = COLOUR_HEADER;
        };
        class BACKGROUND: Caue_ctrlStatic {
        	idc = -1;
        	x = "0.707238 * safezoneW + safezoneX";
        	y = "0.313926 * safezoneH + safezoneY";
        	w = "0.175313 * safezoneW";
        	h = "0.396 * safezoneH";
        	colorBackground[] = COLOUR_AREABACKGROUND;
        };
        class BACKGROUND_SEARCHBUTTON: Caue_ctrlStatic {
        	idc = -1;
        	x = "0.709344 * safezoneW + safezoneX";
        	y = "0.3174 * safezoneH + safezoneY";
        	w = "0.0134063 * safezoneW";
        	h = SIZE_BLOCK_HEADER2;
        	colorBackground[] = COLOUR_CONTENTBACKGROUND;
        };
        class NAME_TITLE: Caue_ctrlStatic {
        	idc = -1;
        	text = "Nome:";
        	x = "0.709396 * safezoneW + safezoneX";
        	y = "0.615674 * safezoneH + safezoneY";
        	w = "0.0634955 * safezoneW";
        	h = SIZE_BLOCK_HEADER2;
        	colorBackground[] = COLOUR_CONTENTBACKGROUND;
        };
        class PRICE_TITLE: NAME_TITLE {
        	text = "Preço:";
        	y = "0.638659 * safezoneH + safezoneY";
        };
    };
    class controls {
        class SEARCH_INPUT: Caue_ctrlEdit {
        	idc = 2;
        	x = "0.723438 * safezoneW + safezoneX";
        	y = "0.317593 * safezoneH + safezoneY";
        	w = "0.156736 * safezoneW";
        	h = SIZE_BLOCK_HEADER2;
        	colorBackground[] = COLOUR_INPUT;
        };
        class BUTTON_SEARCH: Caue_ctrlButtonPictureKeepAspect {
            idc = 3;
        	text = "\a3\3DEN\Data\Displays\Display3DEN\search_start_ca.paa";
        	x = "0.710364 * safezoneW + safezoneX";
        	y = "0.31937 * safezoneH + safezoneY";
        	w = "0.0113542 * safezoneW";
        	h = "0.0182963 * safezoneH";
        	colorBackground[] = COLOUR_CONTENTBUTTON;
        };
        class TREE: Caue_ctrlTree {
        	idc = 4;
            idcSearch = 2;
        	x = "0.709323 * safezoneW + safezoneX";
        	y = "0.340556 * safezoneH + safezoneY";
        	w = "0.170729 * safezoneW";
        	h = "0.273726 * safezoneH";
        	colorBackground[] = COLOUR_CONTENTBACKGROUND;
        };
        class NAME_INPUT: Caue_ctrlStatic {
        	idc = 5;
        	text = "";
        	x = "0.773438 * safezoneW + safezoneX";
        	y = "0.615511 * safezoneH + safezoneY";
        	w = "0.106807 * safezoneW";
        	h = SIZE_BLOCK_HEADER2;
        	colorBackground[] = COLOUR_INPUT;
        };
        class PRICE: NAME_INPUT {
        	idc = 6;
        	y = "0.638659 * safezoneH + safezoneY";
        };
        class COMBO: Caue_ctrlCombo {
        	idc = 7;
            onLBSelChanged  = "_this call Caue_Clothing_Filter";
            x = "0.709396 * safezoneW + safezoneX";
            y = "0.661807 * safezoneH + safezoneY";
            w = "0.1703025 * safezoneW";
            h = SIZE_BLOCK_HEADER2;
        };
        class BUTTON_PURCHASE: Caue_ctrlDefaultButton {
            idc = 8;
            text = "COMPRAR";
        	x = "0.709344 * safezoneW + safezoneX";
        	y = "0.687 * safezoneH + safezoneY";
        	w = "0.170649 * safezoneW";
        	h = SIZE_BLOCK_CONTENTBUTTON;
        };
    };
};
