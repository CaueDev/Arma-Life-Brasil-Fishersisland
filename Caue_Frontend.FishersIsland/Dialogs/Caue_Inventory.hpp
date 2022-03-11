#define INVENTORY_WINDOW_H 100
#define INVENTORY_WINDOW_W 160
#define INVENTORY_POS_X (CENTER_X - (INVENTORY_WINDOW_W * 0.5) * GRID_W)
#define INVENTORY_POS_Y (0.415 - (INVENTORY_WINDOW_H * 0.5 - SIZE_M) * GRID_H)
#define INVENTORY_STARTPOS_Y (INVENTORY_POS_Y + (SIZE_M * GRID_H) + (1.5 * GRID_H))
#define INVENTORY_STARTPOS_X (INVENTORY_POS_X + (1.5 * GRID_W))

class Caue_Inventory {
    idd = 8000710;
    movingEnable = 1;
    enableSimulation = 0;

    class controlsBackground {
        class Tiles: Caue_RscTiles {};
        class Header: Caue_ctrlStaticHeader {
            text = "Inventário";
            x = INVENTORY_POS_X;
            y = INVENTORY_POS_Y;
            w = INVENTORY_WINDOW_W * GRID_W;
            h = SIZE_M * GRID_H;
        };
        class Background: Caue_ctrlStaticBackground {
            x = INVENTORY_POS_X;
            y = INVENTORY_POS_Y + (SIZE_M * GRID_H);
            w = INVENTORY_WINDOW_W * GRID_W;
            h = (INVENTORY_WINDOW_H * GRID_H) - (SIZE_M * GRID_H);
        };
        class TabsBackground: Caue_ctrlStatic {
            x = INVENTORY_STARTPOS_X;
            y = INVENTORY_STARTPOS_Y + (GAP_H / 2) + (SIZE_M * GRID_H);
            w = (INVENTORY_WINDOW_W * GRID_W) - (GAP_W * 2);
            h = (SIZE_M + TAB_H) * GRID_H;
            colorBackground[] = {0.1, 0.1, 0.1, 1};
        };
    };
    class controls {
        class Search: Caue_ctrlEdit {
            idc = 10;
            x = INVENTORY_STARTPOS_X;
            y = INVENTORY_STARTPOS_Y;
            w = (INVENTORY_WINDOW_H / 2.5) * GRID_W;
            h = SIZE_M * GRID_H;
        };
        class ButtonSearch: Caue_ctrlButtonSearch {
            idc = 21;
            x = INVENTORY_STARTPOS_X + ((INVENTORY_WINDOW_H / 2.5) * GRID_W) + (0.85 * GRID_W);
            y = INVENTORY_STARTPOS_Y;
        };
        class Tabs: Caue_ctrlToolbox {
            idc = 30;
            x = INVENTORY_STARTPOS_X;
            y = INVENTORY_STARTPOS_Y + (GAP_H / 2) + (SIZE_M * GRID_H) + ((TAB_H / 2) * GRID_H);
            w = (INVENTORY_WINDOW_W * GRID_W) - (GAP_W * 2);
            h = SIZE_M * GRID_H;
            font = FONT_ALT_LIGHT;
            columns = 2;
            strings[] = {"Inventário", "Licenças"};
            onToolBoxSelChanged = "_this spawn Caue_Inventory_ToolBox;";
        };
        class Inventory: Caue_ctrlControlsGroupNoScrollbars {
            idc = 40;
            x = INVENTORY_STARTPOS_X;
            y = INVENTORY_STARTPOS_Y + (GAP_H / 2) + (SIZE_M * GRID_H) + ((TAB_H / 2) * GRID_H) + (SIZE_M * GRID_H) + GAP_H;
            w = (INVENTORY_WINDOW_W * GRID_W) - (GAP_W * 2);
            h = (INVENTORY_WINDOW_H / 1.265) * GRID_H;
            class controls {
                class ProgressBackground: Caue_ctrlStatic {
                    idc = 5041;
                    x = 0;
                    y = 0;
                    w = ((INVENTORY_WINDOW_W * GRID_W) - (GAP_W * 2)) / 2;
                    h = SIZE_M * GRID_H;
                    colorBackground[] = {0, 0, 0, 0.2};
                };
                class Progress: Caue_ctrlProgress {
                    idc = 70;
                    x = 0;
                    y = 0;
                    w = ((INVENTORY_WINDOW_W * GRID_W) - (GAP_W * 2)) / 2;
                    h = SIZE_M * GRID_H;
                    colorBar[] = {0.3, 0.3, 0.3, 1};
                    colorFrame[] = {0, 0, 0, 0};
                };
                class ProgressText: Caue_ctrlStatic {
                    idc = 80;
                    text = "";
                    x = 0;
                    y = 0;
                    w = ((INVENTORY_WINDOW_W * GRID_W) - (GAP_W * 2)) / 2;
                    h = SIZE_M * GRID_H;
                    colorBar[] = {0.3, 0.3, 0.3, 1};
                    colorFrame[] = {0, 0, 0, 0};
                    style = ST_CENTER;
                };
                class NearPlayersList: Caue_ctrlCombo {
                    idc = 90;
                    x = (((INVENTORY_WINDOW_W * GRID_W) - (GAP_W * 2)) / 2) + GAP_W;
                    y = 0;
                    w = (((INVENTORY_WINDOW_W * GRID_W) - (GAP_W * 2)) / 2) - GAP_W;
                    h = SIZE_M * GRID_H;
                };
                class FilterBackground: Caue_ctrlStatic {
                    idc = -1;
                    x = 0;
                    y = (SIZE_M * GRID_H) + GAP_H;
                    w = "safezoneW";
                    h = SIZE_M * GRID_H;
                    colorBackground[] = {0, 0, 0, 1};
                };
                class ListBackground: Caue_ctrlStaticContent {
                    idc = -1;
                    x = 0;
                    y = ((SIZE_M * GRID_H) + GAP_H) + (SIZE_M * GRID_H);
                    w = "safezoneW";
                    h = (INVENTORY_WINDOW_H * 0.8) * GRID_H;
                };
                class Filter: Caue_ctrlListNBox {
                    idc = 35;
                    x = 0;
                    y = (SIZE_M * GRID_H) + GAP_H;
                    w = "safezoneW";
                    h = SIZE_M * GRID_H;
                    disableOverflow = 1;
                    columns[] = {0, 0.2, 0.25};
                    class Items {
                        class Item {
                            text  = "Item";
                            value = 0;
                        };
                        class Quantity: Item {
                            text = "Quantia";
                        };
                        class TotalWeight: Item {
                            text = "Peso Total";
                        };
                    };
                };
                class List: Filter {
                    idc = 36;
                    x = 0;
                    y = ((SIZE_M * GRID_H) + GAP_H) + (SIZE_M * GRID_H);
                    w = "safezoneW";
                    h = (INVENTORY_WINDOW_H * 0.8) * GRID_H;
                    class Items {};
                };
            };
        };
        class Footer: Caue_ctrlControlsGroupNoScrollbars {
            idc = 60;
            x = INVENTORY_POS_X;
            y = INVENTORY_POS_Y + ((INVENTORY_WINDOW_H * GRID_H) - (SIZE_M * GRID_H)) + (SIZE_M * GRID_H);
            w = INVENTORY_WINDOW_W * GRID_W;
            h = (SIZE_M + FOOTER_EXTRA) * GRID_H;
            class controls {
                class Background: Caue_ctrlStaticFooter {
                    x = 0;
                    y = 0;
                    w = "safezoneW";
                    h = "safezoneH";
                };
                class ButtonUse: Caue_ctrlDefaultButton {
                    idc  = 15;
                    text = "USAR";
                    x = GRID_W;
                    y = GRID_H;
                    w = (INVENTORY_WINDOW_W / 6.8) * GRID_W;
                    h = SIZE_M * GRID_H;
                };
                class ButtonRemove: Caue_ctrlDefaultButton {
                    idc  = 25;
                    text = "SOLTAR";
                    x = (GRID_W * 2) + (INVENTORY_WINDOW_W / 6.8) * GRID_W;
                    y = GRID_H;
                    w = (INVENTORY_WINDOW_W / 6.8) * GRID_W;
                    h = SIZE_M * GRID_H;
                };
                class ButtonGive: Caue_ctrlDefaultButton {
                    idc  = 35;
                    text = "DAR";
                    x = (GRID_W * 3) + (((INVENTORY_WINDOW_W / 6.8) * GRID_W) * 2);
                    y = GRID_H;
                    w = (INVENTORY_WINDOW_W / 6.8) * GRID_W;
                    h = SIZE_M * GRID_H;
                };
                class Amount: Caue_ctrlEdit {
                    idc  = 45;
                    text = "1";
                    x = (GRID_W * 6) + (((INVENTORY_WINDOW_W / 6.8) * GRID_W) * 5);
                    y = GRID_H;
                    w = (INVENTORY_WINDOW_W / 4.7) * GRID_W;
                    h = SIZE_M * GRID_H;
                    colorBackground[] = {0, 0, 0, 0};
                };
            };
        };
        class ButtonClose: Caue_ctrlButtonClose {
            x = INVENTORY_POS_X + (INVENTORY_WINDOW_W * GRID_W) - (SIZE_M * GRID_W);
            y = INVENTORY_POS_Y;
            w = SIZE_M * GRID_W;
            h = SIZE_M * GRID_H;
        };
    };
};
