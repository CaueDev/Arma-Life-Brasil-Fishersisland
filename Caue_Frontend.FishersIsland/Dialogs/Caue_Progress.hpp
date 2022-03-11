#define GAP_OTHER_WINDOW 17
#define PROGRESS_WINDOW_H 7
#define PROGRESS_WINDOW_W 140
#define PROGRESS_POS_X (CENTER_X - (PROGRESS_WINDOW_W * 0.5) * GRID_W)
#define PROGRESS_POS_Y ((safezoneY + safezoneH) - (GAP_OTHER_WINDOW * GRID_H) - (PROGRESS_WINDOW_H * GRID_H) - (2 * GRID_H))

class Caue_Progress {
	idd = 8999220;
	movingEnable = 0;
	enableSimulation = 1;
	duration = 10e10;
    name = "Caue_Progress";
	onLoad = "uiNamespace setVariable ['Caue_Progress',_this select 0];";

	class ControlsBackground {};
    class controls {
        class ProgressGroup: Caue_ctrlControlsGroupNoScrollbars {
            idc = 1;
            x = PROGRESS_POS_X;
            y = PROGRESS_POS_Y;
            w = PROGRESS_WINDOW_W * GRID_W;
            h = PROGRESS_WINDOW_H * GRID_H;
            class controls {
                class TextBackground: Caue_ctrlStatic {
                    idc = -1;
                    x = 0;
                    y = 0;
                    w = PROGRESS_WINDOW_W * GRID_W;
                    h = (PROGRESS_WINDOW_H * GRID_H) - (2 * GRID_H);
                    colorBackground[] = {0.15, 0.15, 0.15, 1};
                };
                class Text: Caue_ctrlStructuredText {
                    idc = 2;
                    x = 0;
                    y = 0.5 * GRID_H;
                    w = PROGRESS_WINDOW_W * GRID_W;
                    h = (PROGRESS_WINDOW_H * GRID_H) - (2 * GRID_H);
                    class Attributes {
                        size = 1 * GRID_H;
                    };
                };
                class ProgressBackground: Caue_ctrlStatic {
                    idc = 4;
                    x = 0;
                    y = (PROGRESS_WINDOW_H * GRID_H) - (2 * GRID_H);
                    w = PROGRESS_WINDOW_W * GRID_W;
                    h = 2 * GRID_H;
                    colorBackground[] = {0.2, 0.2, 0.2, 0.9};
                };
                class ProgressBackgroundStriped: Caue_ctrlStaticBackgroundDisableTiles {
                    idc = -1;
                    x = 0;
                    y = (PROGRESS_WINDOW_H * GRID_H) - (2 * GRID_H);
                    w = PROGRESS_WINDOW_W * GRID_W;
                    h = 2 * GRID_H;
                };
                class Progress: Caue_ctrlProgress {
                    idc = 3;
                    x = 0;
                    y = (PROGRESS_WINDOW_H * GRID_H) - (2 * GRID_H);
                    w = PROGRESS_WINDOW_W * GRID_W;
                    h = 2 * GRID_H;
                    colorBar[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","1"};
                    colorFrame[] = {0, 0, 0, 0};
                    onLoad = "(_this select 0) progressSetPosition 0.7";
                };
            };
        };
    };
};
