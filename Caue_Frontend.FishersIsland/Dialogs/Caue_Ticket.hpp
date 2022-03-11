#define TICKET_WINDOW_H 38
#define TICKET_WINDOW_W 130
#define TICKET_POS_X (CENTER_X - (TICKET_WINDOW_W * 0.5) * GRID_W)
#define TICKET_POS_Y (0.415 - (TICKET_WINDOW_H * 0.5 - SIZE_M) * GRID_H)
#define TICKET_STARTPOS_Y (TICKET_POS_Y + (SIZE_M * GRID_H) + (1.5 * GRID_H))
#define TICKET_STARTPOS_X (TICKET_POS_X + (1.5 * GRID_W))

class Caue_Ticket {
    idd = 73192;
    movingEnable = 1;
    enableSimulation = 0;

    class ControlsBackground {
        class Tiles: Caue_RscTiles {};
        class Header: Caue_ctrlStaticHeader {
            text = "";
            x    = TICKET_POS_X;
            y    = TICKET_POS_Y;
            w    = TICKET_WINDOW_W * GRID_W;
            h    = SIZE_M * GRID_H;
        };
        class Background: Caue_ctrlStaticBackground {
            x = TICKET_POS_X;
            y = TICKET_POS_Y + (SIZE_M * GRID_H);
            w = TICKET_WINDOW_W * GRID_W;
            h = (TICKET_WINDOW_H * GRID_H) - (SIZE_M * GRID_H) - ((SIZE_M + 2) * GRID_H);
        };
        class Information: Caue_ctrlStatic {
            text  = "";
            x     = TICKET_STARTPOS_X;
            y     = TICKET_STARTPOS_Y;
            w     = (TICKET_WINDOW_W * GRID_W) - (1.5 * GRID_W);
            h     = (SIZE_M * GRID_H) * 3;
            style = ST_MULTI + ST_NO_RECT;
        };
    };
    class Controls {
        class Input: Caue_ctrlEdit {
            idc  = 1;
            x    = TICKET_STARTPOS_X;
            y    = TICKET_STARTPOS_Y + ((SIZE_M * GRID_H) * 3) + GAP_H;
            w    = (TICKET_WINDOW_W * GRID_W) - ((1.5 * GRID_W) * 2);
            h    = SIZE_M * GRID_H;
        };
        class FooterGroup: Caue_ctrlControlsGroupNoScrollbars {
            idc = 2;
            x = TICKET_POS_X;
            y = TICKET_POS_Y  + (TICKET_WINDOW_H * GRID_H) - ((SIZE_M + 2) * GRID_H);
            w = TICKET_WINDOW_W * GRID_W;
            h = (SIZE_M + 2) * GRID_H;
            class Controls {
                class Background: Caue_ctrlStaticFooter {
                    x = 0;
                    y = 0;
                    w = TICKET_WINDOW_W * GRID_W;
                    h = (SIZE_M + 2) * GRID_H;
                };
                class ButtonIssueTicket: Caue_ctrlDefaultButton {
                    idc  = 3;
                    text = "";
                    x = GRID_W;
                    y = GRID_H;
                    w = (TICKET_WINDOW_W * GRID_W) * 0.3;
                    h = SIZE_M * GRID_H;
                };
            };
        };
        class ButtonCancel: Caue_ctrlButtonClose {
            x = TICKET_POS_X + (TICKET_WINDOW_W * GRID_W) - (SIZE_M * GRID_W);
            y = TICKET_POS_Y;
            w = SIZE_M * GRID_W;
            h = SIZE_M * GRID_H;
        };
    };
};
