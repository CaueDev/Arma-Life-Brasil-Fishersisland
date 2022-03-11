#define BANK_WINDOW_H 40
#define BANK_WINDOW_W 130
#define BANK_POS_X (CENTER_X - (BANK_WINDOW_W * 0.5) * GRID_W)
#define BANK_POS_Y (0.415 - (BANK_WINDOW_H * 0.5 - SIZE_M) * GRID_H)
#define BANK_STARTPOS_Y (BANK_POS_Y + (SIZE_M * GRID_H) + (1.5 * GRID_H))
#define BANK_STARTPOS_X (BANK_POS_X + (1.5 * GRID_W))

class Caue_ATM {
    idd = 8999520;
    movingEnable = 1;
    enableSimulation = 0;

    class ControlsBackground {
        class Tiles: Caue_RscTiles {};
        class Header: Caue_ctrlStaticHeader {
            text = "Conta Bancária";
            x = BANK_POS_X;
            y = BANK_POS_Y;
            w = BANK_WINDOW_W * GRID_W;
            h = SIZE_M * GRID_H;
        };
        class Background: Caue_ctrlStaticBackground {
            x = BANK_POS_X;
            y = BANK_POS_Y + (SIZE_M * GRID_H);
            w = BANK_WINDOW_W * GRID_W;
            h = (BANK_WINDOW_H * GRID_H) - (SIZE_M * GRID_H) - ((SIZE_M + 2) * GRID_H);
        };
        class TitleBank: Caue_ctrlStatic {
            text = "Banco";
            x = BANK_STARTPOS_X;
            y = BANK_STARTPOS_Y;
            w = 10 * GRID_W;
            h = SIZE_M * GRID_H;
            font = FONT_ALT_BOLD;
        };
        class TitleCash: TitleBank {
            text = "Dinheiro";
            y = BANK_STARTPOS_Y + (SIZE_M * GRID_H) + GRID_H;
        };
    };
    class Controls {
        class Bank: Caue_ctrlStatic {
            idc = 120;
            x = BANK_STARTPOS_X + (10 * GRID_W) + GRID_W;
            y = BANK_STARTPOS_Y;
            w = (BANK_WINDOW_H * 0.7) * GRID_W;
            h = SIZE_M * GRID_H;
        };
        class Cash: Caue_ctrlStatic {
            idc = 121;
            x = BANK_STARTPOS_X + (10 * GRID_W) + GRID_W;
            y = BANK_STARTPOS_Y + (SIZE_M * GRID_H) + GRID_H;
            w = (BANK_WINDOW_H * 0.7) * GRID_W;
            h = SIZE_M * GRID_H;
        };
        class ListPlayers: Caue_ctrlCombo {
            idc = 122;
            x = BANK_STARTPOS_X;
            y = BANK_STARTPOS_Y + (((SIZE_M * GRID_H) + GRID_H) * 2);
            w = (BANK_WINDOW_W * GRID_W) - ((1.5 * GRID_W) * 2);
            h = SIZE_M * GRID_H;
        };
        class Input: Caue_ctrlEdit {
            idc = 123;
            x = BANK_STARTPOS_X;
            y = BANK_STARTPOS_Y + (((SIZE_M * GRID_H) + GRID_H) * 2) + (SIZE_M * GRID_H) + GRID_H;
            w = (BANK_WINDOW_W * GRID_W) - ((1.5 * GRID_W) * 2);
            h = SIZE_M * GRID_H;
        };
        class FooterGroup: Caue_ctrlControlsGroupNoScrollbars {
            idc = 124;
            x = BANK_POS_X;
            y = BANK_POS_Y  + (BANK_WINDOW_H * GRID_H) - ((SIZE_M + 2) * GRID_H);
            w = BANK_WINDOW_W * GRID_W;
            h = (SIZE_M + 2) * GRID_H;
            class Controls {
                class Background: Caue_ctrlStaticFooter {
                    x = 0;
                    y = 0;
                    w = BANK_WINDOW_W * GRID_W;
                    h = (SIZE_M + 2) * GRID_H;
                };
                class ButtonDepositAll: Caue_ctrlDefaultButton {
                    idc = 125;
                    text = "Depositar Tudo";
                    x = GRID_W;
                    y = GRID_H;
                    w = (BANK_WINDOW_W * GRID_W) * 0.2;
                    h = SIZE_M * GRID_H;
                };
                class ButtonWithdraw: Caue_ctrlDefaultButton {
                    idc = 126;
                    text = "Sacar";
                    x = GRID_W + ((((BANK_WINDOW_W * GRID_W) * 0.2) + GRID_W) * 1);
                    y = GRID_H;
                    w = (BANK_WINDOW_W * GRID_W) * 0.2;
                    h = SIZE_M * GRID_H;
                };
                class ButtonDeposit: Caue_ctrlDefaultButton {
                    idc = 127;
                    text = "Depositar";
                    x = GRID_W + ((((BANK_WINDOW_W * GRID_W) * 0.2) + GRID_W) * 2);
                    y = GRID_H;
                    w = (BANK_WINDOW_W * GRID_W) * 0.2;
                    h = SIZE_M * GRID_H;
                };
                class ButtonTransfer: Caue_ctrlDefaultButton {
                    idc = 128;
                    text = "Transferir";
                    x = GRID_W + ((((BANK_WINDOW_W * GRID_W) * 0.2) + GRID_W) * 3);
                    y = GRID_H;
                    w = (BANK_WINDOW_W * GRID_W) * 0.2;
                    h = SIZE_M * GRID_H;
                };
            };
        };
        class ButtonCancel: Caue_ctrlButtonClose {
            x = BANK_POS_X + (BANK_WINDOW_W * GRID_W) - (SIZE_M * GRID_W);
            y = BANK_POS_Y;
            w = SIZE_M * GRID_W;
            h = SIZE_M * GRID_H;
        };
    };
};
