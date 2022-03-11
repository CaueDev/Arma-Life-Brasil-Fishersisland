#define GARAGE_WINDOW_H 100
#define GARAGE_WINDOW_W 160
#define GARAGE_POS_X (CENTER_X - (GARAGE_WINDOW_W * 0.5) * GRID_W)
#define GARAGE_POS_Y (0.415 - (GARAGE_WINDOW_H * 0.5 - SIZE_M) * GRID_H)
#define GARAGE_STARTPOS_Y (GARAGE_POS_Y + (SIZE_M * GRID_H) + (1.5 * GRID_H))
#define GARAGE_STARTPOS_X (GARAGE_POS_X + (1.5 * GRID_W))

class Caue_Storage {
    idd = 98123;
    movingEnable = 1;
    enableSimulation = 0;

    class controlsBackground {
        class Tiles: Caue_RscTiles {};
        class Header: Caue_ctrlStaticHeader {
            text = "Garagem";
            x = GARAGE_POS_X;
            y = GARAGE_POS_Y;
            w = GARAGE_WINDOW_W * GRID_W;
            h = SIZE_M * GRID_H;
        };
        class Background: Caue_ctrlStaticBackground {
            x = GARAGE_POS_X;
            y = GARAGE_POS_Y + (SIZE_M * GRID_H);
            w = GARAGE_WINDOW_W * GRID_W;
            h = (GARAGE_WINDOW_H * GRID_H) - (SIZE_M * GRID_H);
        };
        class FilterBackground: Caue_ctrlStatic {
            x = GARAGE_STARTPOS_X;
            y = GARAGE_STARTPOS_Y + (SIZE_M * GRID_H) + (1.5 * GRID_H);
            w = (GARAGE_WINDOW_W * GRID_W) - ((1.5 * GRID_W) * 2);
            h = SIZE_M * GRID_H;
            colorBackground[] = {0, 0, 0, 1};
        };
        class ListBackground: Caue_ctrlStaticContent {
            x = GARAGE_STARTPOS_X;
            y = GARAGE_STARTPOS_Y + ((SIZE_M * GRID_H) * 2) + (1.5 * GRID_H);
            w = (GARAGE_WINDOW_W * GRID_W) - ((1.5 * GRID_W) * 2);
            h = (GARAGE_WINDOW_H * GRID_H) * 0.8;
        };
    };
    class controls {
        class Search: Caue_ctrlEdit {
            idc = 23;
            x = GARAGE_STARTPOS_X;
            y = GARAGE_STARTPOS_Y;
            w = (GARAGE_WINDOW_W / 3) * GRID_W;
            h = SIZE_M * GRID_H;
        };
        class ButtonSearch: Caue_ctrlButtonSearch {
            idc = 24;
            x = GARAGE_STARTPOS_X + ((GARAGE_WINDOW_W / 3) * GRID_W) + (0.85 * GRID_W);
            y = GARAGE_STARTPOS_Y;
        };
        class Filter: Caue_ctrlListNBox {
            idc = 25;
            x = GARAGE_STARTPOS_X;
            y = GARAGE_STARTPOS_Y + (SIZE_M * GRID_H) + (1.5 * GRID_H);
            w = (GARAGE_WINDOW_W * GRID_W) - ((1.5 * GRID_W) * 2);
            h = SIZE_M * GRID_H;
            disableOverflow = 1;
            columns[] = {0};
            class Items {
                class Icon {
                    text  = "Veiculos";
                    value = 0;
                };
            };
        };
        class List: Filter {
            idc = 26;
            x = GARAGE_STARTPOS_X;
            y = GARAGE_STARTPOS_Y + ((SIZE_M * GRID_H) * 2) + (1.5 * GRID_H);
            w = (GARAGE_WINDOW_W * GRID_W) - ((1.5 * GRID_W) * 2);
            h = (GARAGE_WINDOW_H * GRID_H) * 0.8;
            class Items {};
        };
        class Footer: Caue_ctrlControlsGroupNoScrollbars {
            idc = 27;
            x = GARAGE_POS_X;
            y = GARAGE_POS_Y + ((GARAGE_WINDOW_H * GRID_H) - (SIZE_M * GRID_H)) + (SIZE_M * GRID_H);
            w = GARAGE_WINDOW_W * GRID_W;
            h = (SIZE_M + FOOTER_EXTRA) * GRID_H;
            class controls {
                class Background: Caue_ctrlStaticFooter {
                    x = 0;
                    y = 0;
                    w = "safezoneW";
                    h = "safezoneH";
                };
                class ButtonRetrieve: Caue_ctrlDefaultButton {
                    idc  = 1;
                    text = "RETIRAR";
                    x = GRID_W;
                    y = GRID_H;
                    w = (GARAGE_WINDOW_W / 6.8) * GRID_W;
                    h = SIZE_M * GRID_H;
                };
                /*
                class ButtonCrush: Caue_ctrlDefaultButton {
                    idc  = 2;
                    text = "VENDER";
                    x = (GRID_W * 2) + (GARAGE_WINDOW_W / 6.8) * GRID_W;
                    y = GRID_H;
                    w = (GARAGE_WINDOW_W / 6.8) * GRID_W;
                    h = SIZE_M * GRID_H;
                };
                */
            };
        };
        class ButtonClose: Caue_ctrlButtonClose {
            x = GARAGE_POS_X + ((GARAGE_WINDOW_W * GRID_W) - (SIZE_M * GRID_W));
            y = GARAGE_POS_Y;
            h = SIZE_M * GRID_H;
            w = SIZE_M * GRID_W;
        };
    };
};
