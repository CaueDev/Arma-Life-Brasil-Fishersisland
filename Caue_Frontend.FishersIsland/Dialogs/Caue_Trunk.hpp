#define VEHICLEINVENTORY_WINDOW_H 100
#define VEHICLEINVENTORY_WINDOW_W 160
#define VEHICLEINVENTORY_POS_X (CENTER_X - (VEHICLEINVENTORY_WINDOW_W * 0.5) * GRID_W)
#define VEHICLEINVENTORY_POS_Y (0.415 - (VEHICLEINVENTORY_WINDOW_H * 0.5 - SIZE_M) * GRID_H)
#define VEHICLEINVENTORY_STARTPOS_Y (VEHICLEINVENTORY_POS_Y + (SIZE_M * GRID_H) + (1.5 * GRID_H))
#define VEHICLEINVENTORY_STARTPOS_X (VEHICLEINVENTORY_POS_X + (1.5 * GRID_W))
#define VEHICLEINVENTORY_ENDPOS_Y 1
#define VEHICLEINVENTORY_ENDPOS_X (VEHICLEINVENTORY_POS_X + (VEHICLEINVENTORY_WINDOW_W * GRID_W) - (1.5 * GRID_W))
#define PORTION 2.18
#define VEHICLEINV_STARTPOS (VEHICLEINVENTORY_ENDPOS_X - ((VEHICLEINVENTORY_WINDOW_W / PORTION) * GRID_W))
#define SPACE_H (SIZE_XXS * GRID_H)
#define INVENTORY_W ((VEHICLEINVENTORY_WINDOW_W / PORTION) * GRID_W)
#define LIST_HEIGHT 1.35
#define DUMMY_NUMBER 232321

class Caue_Trunk {
    idd = 8005003;
    movingEnable = 1;
    enableSimulation = 0;

    class controlsBackground {
        class Tiles: Caue_RscTiles {};
        class Header: Caue_ctrlStaticHeader {
            text = "Inventario";
            x = VEHICLEINVENTORY_POS_X;
            y = VEHICLEINVENTORY_POS_Y;
            w = VEHICLEINVENTORY_WINDOW_W * GRID_W;
            h = SIZE_M * GRID_H;
        };
        class Background: Caue_ctrlStaticBackground {
            x = VEHICLEINVENTORY_POS_X;
            y = VEHICLEINVENTORY_POS_Y + (SIZE_M * GRID_H);
            w = VEHICLEINVENTORY_WINDOW_W * GRID_W;
            h = (VEHICLEINVENTORY_WINDOW_H * GRID_H) - (SIZE_M * GRID_H);
        };
        class MyInventoryProgressBarBackground: Caue_ctrlStatic {
            x = VEHICLEINVENTORY_STARTPOS_X;
            y = VEHICLEINVENTORY_STARTPOS_Y + (SIZE_M * GRID_H) + (SPACE_H / 2);
            w = INVENTORY_W;
            h = SIZE_M * GRID_H;
            colorBackground[] = {0, 0, 0, 0.2};
        };
        class VehicleInventoryProgressBarBackground: MyInventoryProgressBarBackground {
            x = VEHICLEINV_STARTPOS;
        };
        class MyInventoryFilterBackground: Caue_ctrlStatic {
            x = VEHICLEINVENTORY_STARTPOS_X;
            y = VEHICLEINVENTORY_STARTPOS_Y + ((SIZE_M * GRID_H) * 2) + SPACE_H;
            w = INVENTORY_W;
            h = SIZE_M * GRID_H;
            colorBackground[] = {0, 0, 0, 1};
        };
        class VehicleInventoryFilterBackground: MyInventoryFilterBackground {
            x = VEHICLEINV_STARTPOS;
        };
        class MyInventoryListBackground: MyInventoryFilterBackground {
            h = (VEHICLEINVENTORY_WINDOW_H / LIST_HEIGHT) * GRID_H;
            colorBackground[] = {0, 0, 0, 0.5};
        };
        class VehicleInventoryListBackground: MyInventoryListBackground {
            x = VEHICLEINV_STARTPOS;
        };
    };
    class controls {
        class MyInventoryTitle: Caue_ctrlStatic {
            idc  = DUMMY_NUMBER + 1;
            text = "Meu Inventario";
            x = VEHICLEINVENTORY_STARTPOS_X;
            y = VEHICLEINVENTORY_STARTPOS_Y;
            w = INVENTORY_W;
            h = SIZE_M * GRID_H;
        };
        class MyInventoryProgressBar: Caue_ctrlProgress {
            idc = 35;
            x = VEHICLEINVENTORY_STARTPOS_X;
            y = VEHICLEINVENTORY_STARTPOS_Y + (SIZE_M * GRID_H) + (SPACE_H / 2);
            w = INVENTORY_W;
            h = SIZE_M * GRID_H;
            colorBar[] = {0.3, 0.3, 0.3, 1};
            colorFrame[] = {0, 0, 0, 0};
        };
        class MyInventoryProgressBarText: Caue_ctrlStatic {
            idc = 47;
            text = "10/224";
            x = VEHICLEINVENTORY_STARTPOS_X;
            y = VEHICLEINVENTORY_STARTPOS_Y + (SIZE_M * GRID_H) + (SPACE_H / 2);
            w = INVENTORY_W;
            h = SIZE_M * GRID_H;
            style = ST_CENTER;
        };
        class MyInventoryFilter: Caue_ctrlListNBox {
            idc = 36;
            x = VEHICLEINVENTORY_STARTPOS_X;
            y = VEHICLEINVENTORY_STARTPOS_Y + ((SIZE_M * GRID_H) * 2) + SPACE_H;
            w = INVENTORY_W;
            h = SIZE_M * GRID_H;
            disableOverflow = 1;
            columns[] = {0, 0.09, 0.43, 0.73};
            class Items {
                class Icon {
                    text = "";
                    value = 0;
                };
                class Item: Icon {
                    text = "Item";
                    value = 0;
                };
                class TotalWeight: Icon {
                    text = "Peso Total";
                    value = 0;
                };
                class Quantity: Icon {
                    text = "Quantia";
                    value = 0;
                };
            };
        };
        class MyInventoryList: MyInventoryFilter {
            idc = 37;
            x = VEHICLEINVENTORY_STARTPOS_X;
            y = VEHICLEINVENTORY_STARTPOS_Y + ((SIZE_M * GRID_H) * 3) + SPACE_H;
            w = INVENTORY_W;
            h = (VEHICLEINVENTORY_WINDOW_H / LIST_HEIGHT) * GRID_H;
            class Items {};
        };

        class AmountTitle: Caue_ctrlStatic {
            idc  = DUMMY_NUMBER + 2;
            text = "Quantia:";
            x = VEHICLEINVENTORY_STARTPOS_X;
            y = (VEHICLEINVENTORY_STARTPOS_Y + ((SIZE_M * GRID_H) * 3) + SPACE_H) + ((VEHICLEINVENTORY_WINDOW_H / LIST_HEIGHT) * GRID_H) - (SPACE_H * 1.6);
            w = INVENTORY_W * 0.19;
            h = SIZE_M * GRID_H;
        };
        class AmountInput: Caue_ctrlEdit {
            idc  = 39;
            text = "1";
            x = (VEHICLEINVENTORY_STARTPOS_X + (INVENTORY_W * 0.19));
            y = (VEHICLEINVENTORY_STARTPOS_Y + ((SIZE_M * GRID_H) * 3) + SPACE_H) + ((VEHICLEINVENTORY_WINDOW_H / LIST_HEIGHT) * GRID_H) - (SPACE_H * 1.6);
            w = (INVENTORY_W * 0.66) - (GAP_W / 2);
            h = SIZE_M * GRID_H;
        };
        class Plus: Caue_ctrlDefaultButton {
            idc  = 40;
            text = "+";
            x = VEHICLEINVENTORY_STARTPOS_X + INVENTORY_W - ((SIZE_M * GRID_W) * 2) - (GAP_W * 0.5);
            y = (VEHICLEINVENTORY_STARTPOS_Y + ((SIZE_M * GRID_H) * 3) + SPACE_H) + ((VEHICLEINVENTORY_WINDOW_H / LIST_HEIGHT) * GRID_H) - (SPACE_H * 1.6);
            w = SIZE_M * GRID_W;
            h = SIZE_M * GRID_H;
        };
        class Minus: Caue_ctrlDefaultButton {
            idc  = 41;
            text = "-";
            x = VEHICLEINVENTORY_STARTPOS_X + INVENTORY_W - (SIZE_M * GRID_W);
            y = (VEHICLEINVENTORY_STARTPOS_Y + ((SIZE_M * GRID_H) * 3) + SPACE_H) + ((VEHICLEINVENTORY_WINDOW_H / LIST_HEIGHT) * GRID_H) - (SPACE_H * 1.6);
            w = SIZE_M * GRID_W;
            h = SIZE_M * GRID_H;
        };

        class VehicleInventoryTitle: MyInventoryTitle {
            idc  = 48;
            text = "Inventario do Alvo";
            x = VEHICLEINV_STARTPOS;
        };
        class VehicleInventoryProgressBar: MyInventoryProgressBar {
            idc = 42;
            x = VEHICLEINV_STARTPOS;
        };
        class VehicleInventoryProgressBarText: MyInventoryProgressBarText {
            idc = 43;
            x = VEHICLEINV_STARTPOS;
        };
        class VehicleInventoryFilter: MyInventoryFilter {
            idc = 44;
            x = VEHICLEINV_STARTPOS;
            y = VEHICLEINVENTORY_STARTPOS_Y + ((SIZE_M * GRID_H) * 2) + SPACE_H;
            w = INVENTORY_W;
            h = SIZE_M * GRID_H;
        };
        class VehicleInventoryList: MyInventoryList {
            idc = 45;
            x = VEHICLEINV_STARTPOS;
            y = VEHICLEINVENTORY_STARTPOS_Y + ((SIZE_M * GRID_H) * 3) + SPACE_H;
            w = INVENTORY_W;
            h = (VEHICLEINVENTORY_WINDOW_H / 1.7) * GRID_H;
        };

        class Footer: Caue_ctrlControlsGroupNoScrollbars {
            idc = 46;
            x = VEHICLEINVENTORY_POS_X;
            y = VEHICLEINVENTORY_POS_Y + ((VEHICLEINVENTORY_WINDOW_H * GRID_H) - (SIZE_M * GRID_H)) + (SIZE_M * GRID_H);
            w = VEHICLEINVENTORY_WINDOW_W * GRID_W;
            h = (SIZE_M + FOOTER_EXTRA) * GRID_H;
            class controls {
                class Background: Caue_ctrlStaticFooter {
                    x = 0;
                    y = 0;
                    w = "safezoneW";
                    h = "safezoneH";
                };
                class ButtonTake: Caue_ctrlDefaultButton {
                    idc  = 49;
                    text = "PEGAR";
                    x = GRID_W;
                    y = GRID_H;
                    w = (VEHICLEINVENTORY_WINDOW_W / 6.8) * GRID_W;
                    h = SIZE_M * GRID_H;
                };
                class ButtonStore: Caue_ctrlDefaultButton {
                    idc  = 50;
                    text = "GUARDAR";
                    x = (GRID_W * 2) + (VEHICLEINVENTORY_WINDOW_W / 6.8) * GRID_W;
                    y = GRID_H;
                    w = (VEHICLEINVENTORY_WINDOW_W / 6.8) * GRID_W;
                    h = SIZE_M * GRID_H;
                };
                /*
                class ButtonDestroy: Caue_ctrlDefaultButton {
                    idc  = 51;
                    text = "DESTRUIR";
                    x = (GRID_W * 3) + (((VEHICLEINVENTORY_WINDOW_W / 6.8) * GRID_W) * 2);
                    y = GRID_H;
                    w = (VEHICLEINVENTORY_WINDOW_W / 6.8) * GRID_W;
                    h = SIZE_M * GRID_H;
                };
                */
            };
        };
        class ButtonClose: Caue_ctrlButtonClose {
            x = VEHICLEINVENTORY_POS_X + (VEHICLEINVENTORY_WINDOW_W * GRID_W) - (SIZE_M * GRID_W);
            y = VEHICLEINVENTORY_POS_Y;
            w = SIZE_M * GRID_W;
            h = SIZE_M * GRID_H;
        };
    };
};
