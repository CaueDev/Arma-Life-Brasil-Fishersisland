#define WINDOW_GUIDE_H 100
#define WINDOW_GUIDE_W 160
#define POS_X (CENTER_X - (WINDOW_GUIDE_W * 0.5) * GRID_W)
#define POS_Y (0.415 - (WINDOW_GUIDE_H * 0.5 - SIZE_M) * GRID_H)
#define FOOTER_EXTRA 2
#define CONTENT_STARTPOS_Y (POS_Y + (SIZE_M * GRID_H) + (1.5 * GRID_H))
#define CONTENT_STARTPOS_X (POS_X + (1.5 * GRID_W))
#define GAP_H (1.5 * GRID_H)
#define GAP_W (1.5 * GRID_W)

class Caue_Wiki {
    idd = 8999920;
	movingEnable = 1;
    enableSimulation = 0;
	onLoad = "uiNamespace setVariable ['Caue_Wiki', _this select 0]";

    class controlsBackground {
        class Tiles: Caue_RscTiles {};
        class Header: Caue_ctrlStaticHeader {
            text = "Wiki";
            x = POS_X;
            y = POS_Y;
            w = WINDOW_GUIDE_W * GRID_W;
            h = SIZE_M * GRID_H;
        };
        class Background: Caue_ctrlStaticBackground {
            x = POS_X;
            y = POS_Y + (SIZE_M * GRID_H);
            w = WINDOW_GUIDE_W * GRID_W;
            h = (WINDOW_GUIDE_H * GRID_H) - (SIZE_M * GRID_H);
        };
        class Footer: Caue_ctrlStaticFooter {
            x = POS_X;
            y = POS_Y + ((WINDOW_GUIDE_H * GRID_H) - (SIZE_M * GRID_H)) + (SIZE_M * GRID_H);
            w = WINDOW_GUIDE_W * GRID_W;
            h = (SIZE_M + FOOTER_EXTRA) * GRID_H;
        };
    };
    class controls {
        class Search: Caue_ctrlEdit {
            idc = 1;
            x = CONTENT_STARTPOS_X;
            y = CONTENT_STARTPOS_Y;
            w = (WINDOW_GUIDE_H / 2.5) * GRID_W;
            h = SIZE_M * GRID_H;
        };
        class ButtonSearch: Caue_ctrlButtonSearch {
            idc = 3;
            x = CONTENT_STARTPOS_X + ((WINDOW_GUIDE_H / 2.5) * GRID_W) + (0.85 * GRID_W);
            y = CONTENT_STARTPOS_Y;
        };
        class ButtonExpandAll: Caue_ctrlButtonExpandAll {
            idc = 4;
            x = CONTENT_STARTPOS_X + ((WINDOW_GUIDE_H / 2.5) * GRID_W) + ((0.95 * 1.4) * GRID_W) + ((SIZE_M * 1) * GRID_W);
            y = CONTENT_STARTPOS_Y;
        };
        class ButtonCollapseAll: Caue_ctrlButtonCollapseAll {
            idc = 5;
            x = CONTENT_STARTPOS_X + ((WINDOW_GUIDE_H / 2.5) * GRID_W) + ((0.95 * 2) * GRID_W) + ((SIZE_M * 1.65) * GRID_W);
            y = CONTENT_STARTPOS_Y;
        };
        class Tree: Caue_ctrlTree {
            idc = 2;
            idcSearch = 1;
            x = CONTENT_STARTPOS_X;
            y = CONTENT_STARTPOS_Y + GAP_H + (SIZE_M * GRID_H);
            w = (WINDOW_GUIDE_W / 2.8) * GRID_W;
            h = (WINDOW_GUIDE_H * GRID_H) - ((SIZE_M * 3) * GRID_H);
            colorBackground[]   = COLOUR_CONTENTBACKGROUND;
        };
        class Content: Caue_ctrlControlsGroup {
            idc = 6;
            x = CONTENT_STARTPOS_X + ((WINDOW_GUIDE_W / 2.8) * GRID_W) + GAP_W;
            y = CONTENT_STARTPOS_Y + GAP_H + (SIZE_M * GRID_H);
            w = (WINDOW_GUIDE_W * GRID_W) - ((WINDOW_GUIDE_W / 2.8) * GRID_W) - (GAP_W * 3);
            h = (WINDOW_GUIDE_H * GRID_H) - ((SIZE_M * 3) * GRID_H);

            class HScrollBar: ScrollBar {
                width = 0;
                height = 0;
            };

            class Controls {
                class Text: Caue_ctrlStructuredText {
                    idc = 84212;
                    x = 0;
                    y = 0;
                    w = 0.5;
                    h = 1;
                    colorBackground[]   = COLOUR_CONTENTBACKGROUND;
                };
            };
        };
        class ButtonClose: Caue_ctrlButtonClose {
            x = POS_X + (WINDOW_GUIDE_W * GRID_W) - (SIZE_M * GRID_W);
            y = POS_Y;
            w = (SIZE_M * GRID_W);
            h = (SIZE_M * GRID_H);
        };
    };
};
