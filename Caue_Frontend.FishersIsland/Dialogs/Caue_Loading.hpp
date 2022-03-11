class Caue_Loading {
    idd = 999210;
    movingEnable = 1;
    enableSimulation = 0;

    class Controls {
        class ProgressBarBackground: Caue_ctrlStatic {
            idc = 11;
            x = safezoneX;
            y = safezoneY + safezoneH - (3 * GRID_H);
            w = safezoneW;
            h = 3 * GRID_H;
            colorBackground[] = {0.2, 0.2, 0.2, 0.9};
        };
        class ProgressBarBackgroundStriped: Caue_ctrlStaticBackgroundDisableTiles {
            idc = 12;
            x = safezoneX;
            y = safezoneY + safezoneH - (3 * GRID_H);
            w = safezoneW;
            h = 3 * GRID_H;
        };
        class ProgressBar: Caue_ctrlProgress {
            idc = 13;
            x = safezoneX;
            y = safezoneY + safezoneH - (3 * GRID_H);
            w = safezoneW;
            h = 3 * GRID_H;
        };
        class InitStateText: Caue_ctrlStatic {
            idc = 14;
            text = "CARREGANDO";
            sizeEx = "11 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
            x = safezoneX + (SIZE_XXS * GRID_W);
            y = "(safezoneY + safezoneH) - (11 * (1 / (getResolution select 3)) * pixelGrid * 0.5) - (5 * (pixelH * pixelGrid * 0.50))";
            h = "11 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
            w = safezoneW;
            shadow = 0.6;
            font = FONT_ALT_BOLD;
        };
    };
};
