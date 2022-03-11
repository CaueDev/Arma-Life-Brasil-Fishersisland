Config_Interactions = [
    ["Inventario", {
        [] call Caue_Inventory_Open;
    }, {
        ([] call Caue_Lib_InputAccess)
    }],
    ["Menu medico", {
        [player] spawn Caue_Medical_Open;
    }, {
        ([] call Caue_Lib_InputAccess)
    }],
    ["Animações", {
        [] call Caue_Animations_Open;
    }, {
        ((vehicle player) isEqualTo player) && ([] call Caue_Lib_InputAccess)
    }],
    ["Criar items", {
        [] call Caue_Combine_Open;
    }, {
        ([] call Caue_Lib_InputAccess)
    }],
    ["Acessar Banco de Dados", {
        [] call Caue_Police_DatabaseOpen;
    }, {
        ((vehicle player) != player) && ([] call Caue_Lib_InputAccess) && (isNull (findDisplay 211)) && ((vehicle player) animationPhase "Laptop_Top" > 0.5)
    }],
    ["Dar Chaves", {
        [cursorObject] spawn Caue_Keys_Open;
    }, {
        ((vehicle player) isEqualTo player) && ([] call Caue_Lib_InputAccess) && (isPlayer cursorObject) && ((player distance cursorObject) < 4)
    }],
    ["Pegar/Guardar Armario", {
        [] spawn Caue_Police_Locker;
    }, {
        (!((nearestObjects [player,["Land_A3PL_Sheriffpd"],10]) isEqualTo [])) && ((player getVariable ["job","unemployed"]) IN ["police"])
    }],
    ["Musicas", {
        [] call Caue_Animations_OpenGuitar;
    }, {
        ((vehicle player) isEqualTo player) && ([] call Caue_Lib_InputAccess) && (player hasWeapon "USSR_GuitarA")
    }],
    ["Checar Mochila", {
        [format["Há $%1 de dinheiro sujo dentro desta mochila",((backpackContainer player) getVariable ["coalore",0])],Color_Green] call A3PL_HUD_Notification;
    }, {
        ((backpack player) isEqualTo "A3PL_Backpack_Money")
    }],
    ["Tempo do Veiculo", {
        [format["Você tem %1 minutos restantes para usar o seu veículo de trabalho", ((player getVariable["jobVehicleTimer", diag_tickTime]) - diag_tickTime) / 60], Color_Green] call A3PL_HUD_Notification;
    }, {!isNull(player getVariable["jobVehicle", objNull])
    }],
    ["Entregar pacote", {
        [] call A3PL_Delivery_Deliver;
    }, {
        private["_found"];
        _found = false; {
            if ((typeOf _x) == "A3PL_DeliveryBox") exitwith {
                _found = true;
                true;
            }
        }
        foreach([player] call A3PL_Lib_AttachedAll);
        _found;
    }],
    ["Menu de licenças", {
        [] call Caue_DMV_Open;
    }, {
        ((player getVariable["faction", "citizen"]) IN ["doj", "dmv", "police", "faa"])
    }],
    ["Sair do guindaste", {
        player action["eject", vehicle player];
    }, {
        ((typeOf(vehicle player)) == "A3PL_MobileCrane")
    }],
    ["Resetar guindaste", {
        [] call A3PL_IE_CraneReset;
    }, {
        ((typeOf(vehicle player)) == "A3PL_MobileCrane")
    }],
    ["Comandos guindaste", {
        ["Use the movement keys to move the crane around", Color_Yellow] call A3PL_HUD_Notification;
        ["Press PAGE UP and PAGE DOWN to turn the crane", Color_Yellow] call A3PL_HUD_Notification;
        ["Press HOME and END to move the boom up and down", Color_Yellow] call A3PL_HUD_Notification;
        ["Press DELETE and INSERT to move the hook up and down", Color_Yellow] call A3PL_HUD_Notification;
        ["Press , and . to rotate the hook around", Color_Yellow] call A3PL_HUD_Notification;
        ["Press SPACE to pickup/drop a container", Color_Yellow] call A3PL_HUD_Notification;
    }, {
        (typeOf vehicle player) == "A3PL_MobileCrane"
    }],
    ["Colocar cone", {
        [] call A3PL_Placeables_PlaceCone;
    }, {
        (typeOf(([] call A3PL_Lib_Attached) select 0)) == "A3PL_RoadCone_x10"
    }],
    ["Configurar taxi", {
        [] call A3PL_JobTaxi_SetupFare;
    }, {
        typeOf(vehicle player) == "A3PL_CVPI_Taxi"
    }],
    ["Roubar objeto", {
        [cursorObject] spawn Caue_Robbery_Placeables;
    }, {
        (player distance cursorObject < 3) && ((typeOf cursorObject) IN ["A3PL_Steel_Pellet","A3PL_Aluminium_Pellet","A3PL_Titanium_Pellet","A3PL_Titanium_Ingot_Pellet","A3PL_Iron_Ingot_Pellet","A3PL_Coal_Ingot_Pellet","A3PL_Kerosene","A3PL_Pumpjack","A3PL_OilBarrel"])
    }],
    ["Pegar refem", {
        [cursorobject] spawn Caue_Player_TakeHostage;
    }, {
        isNil "EnableHostage" && (handgunWeapon player != "") && (cursorobject IN allPlayers) && (player distance cursorobject < 2) && (([cursorobject, player] call BIS_fnc_relativeDirTo) < 220) && (([cursorobject, player] call BIS_fnc_relativeDirTo) > 130)
    }],
    ["Soltar refem", {
        EnableHostage = false;
    }, {
        !isNil "EnableHostage"
    }],
    ["Apontar para frente", {
        HostageMode = "shoot"
    }, {
        !isNil "EnableHostage" && HostageMode == "hostage"
    }],
    ["Apontar para o refem", {
        HostageMode = "hostage"
    }, {
        !isNil "EnableHostage" && HostageMode == "shoot"
    }],
    ["Vender veiculo", {
        [player_objintersect] call A3PL_Business_Sell;
    }, {
        (player_objintersect isKindOf "All") && {
            (getPlayerUID player in (player_objintersect getVariable["keyAccess", []]))
        } && ((player getVariable "job") == "business")
    }],
    ["Comprar veiculo", {
        [player_objintersect] call A3PL_Business_BuyItem;
    }, {
        (player_objintersect isKindOf "All") && (!isNil {player_objintersect getVariable["bitem", nil]})
    }],
    ["Plantar semente", {
        [] call A3PL_JobFarming_Plant;
    }, {
        (player_itemClass IN["seed_wheat", "seed_marijuana", "seed_corn", "seed_lettuce", "seed_coca", "seed_sugar"]) && ((surfaceType getpos player) == "#cype_plowedfield")
    }],
    ["Procurar sementes", {
        [] spawn A3PL_JobFarming_SearchSeeds;
    }, {
        ((surfaceType getpos player) == "#cype_plowedfield") && ((vehicle player) isEqualTo player)
    }],
    ["Cavar o chão", {
        [] call A3PL_JobWildCat_ProspectOpen
    }, {
        (vehicle player == player) && ([] call Caue_Lib_InputAccess) && ((surfaceType getpos player) IN["#cype_plowedfield", "#cype_grass", "#cype_forest", "#cype_soil", "#cype_beach", "#GtdMud", "#GtdDirt", "#cype_beach"]) && (!(isOnRoad player))
    }],
    ["Verificar tanque", {
        [format["Parece haver %1 galões de gasolina neste tanque", (cursorObject getVariable["petrol", 0])], Color_Green] call A3PL_HUD_Notification;
    }, {
        (typeOf cursorObject == "A3PL_Tanker_Trailer")
    }],
    ["Desvirar", {
        closedialog 0; [false,cursorObject] spawn Caue_Vehicle_Unflip;
    }, {
        ((getPlayerUID player in (player_objintersect getVariable["keyAccess", []])) && (player distance cursorObject < 5))
    }],
    ["Empurrar", {
        closedialog 0; [cursorObject] spawn Caue_Vehicle_Push;
    }, {
        ((getPlayerUID player in (player_objintersect getVariable["keyAccess", []])) && (player distance cursorObject < 5))
    }],
    ["Verificar tanque", {
        [format["Parece haver %1 galões de querosene neste tanque", (cursorObject getVariable["petrol", 0])], Color_Green] call A3PL_HUD_Notification;
    }, {
        (typeOf cursorObject == "A3PL_Fuel_Van")
    }],
    ["Mostrar identidade", {
        if (!([] call Caue_Player_AntiSpam)) exitWith {};
        [player] remoteExec ["Caue_HUD_IDCard",cursorObject];
    }, {
        isPlayer cursorObject && alive cursorObject && (player distance cursorObject < 8)
    }],
    ["Pegar identidade", {
        [cursorObject] spawn Caue_HUD_IDCard;
    }, {
        (isPlayer cursorObject) && (player distance cursorObject < 8) && ((animationState cursorObject) IN ["A3PL_HandsupToKneel","A3PL_HandsupKneelGetCuffed","A3PL_Cuff","A3PL_HandsupKneelCuffed","A3PL_HandsupKneelKicked","A3PL_CuffKickDown","a3pl_idletohandsup","a3pl_kneeltohandsup","a3pl_handsuptokneel","A3PL_HandsupKneel"])
    }],
    ["Definir nome", {
        [cursorObject] call Caue_Player_OpenNameTag;
    }, {
        (isPlayer cursorObject) && ((player distance cursorObject) < 5) && ((vehicle player) isEqualTo player)
    }],
    ["Prender jogador", {
        [cursorObject] spawn Caue_Police_JailOpen;
    }, {
        (isPlayer cursorObject) && ((player getVariable["job", "unemployed"]) isEqualTo "police") && (player distance cursorObject < 5) && ((count (nearestObjects[player,["Land_A3PL_Prison"],50])) > 0)
    }],
    ["Jogar pipoca", {
        [] call Caue_Items_ThrowPopcornClient;
    }, {
        (player_itemclass == "popcornbucket" && (vehicle player == player))
    }],
    ["Apreender item(s)", {
        [] spawn Caue_Police_SeizeItems;
    }, {
        ((player getVariable["job","unemployed"]) IN ["police"]) && (count(nearestObjects[player, ["weaponholder"], 3] + nearestObjects[player, ["groundWeaponHolder"], 3]) > 0)
    }],
    ["Reparar objeto", {
        [] call A3PL_JobRoadworker_RepairTerrain;
    }, {
        ((player getVariable["job", "unemployed"]) IN["roadworker", "Roadside_Service"]) && (vehicle player == player)
    }],
    ["Mudar localidade", {
        [cursorObject,player] remoteExec ["A3PL_Lib_ChangeLocality",2];
    }, {
        (cursorObject isKindOf "Car") && ((player getVariable ["job","unemployed"]) isEqualTo "Roadside_Service") && (cursorObject getVariable ["impound", false])
    }],
    ["Apreender Veiculo", {
        [cursorObject] spawn Caue_Police_Impound;
    }, {
        ((cursorObject isKindOf "Car") || (cursorObject isKindOf "Ship")) && ((player getVariable ["job","unemployed"]) IN ["police","fifr","dmv"])
    }],
    ["Marcar/desmarcar apreender", {
        [] call A3PL_JobRoadWorker_ToggleMark;
    }, {
        (player_objintersect isKindOf "Car") && (getPlayerUID player IN(player_objintersect getVariable["keyAccess", []])) && (!((typeOf player_objintersect) IN A3PL_Jobroadworker_MarkBypass))
    }],
    ["Trancar veiculo", {
        vehicle player setVariable["locked", true, true];
        ["Você trancou as portas do veículo", Color_Red] call A3PL_HUD_Notification;
    }, {
        (vehicle player != player) && {
            (getPlayerUID player in (vehicle player getVariable["keyAccess", []]))
        } && {!(vehicle player getVariable["locked", true])
        }
    }],
    ["Trancar veiculo", {
        player_objintersect setVariable["locked", true, true];
        ["Você trancou as portas do veículo", Color_Red] call A3PL_HUD_Notification;
        cursorObject say3D "A3PL_Car_Lock";
    }, {
        (vehicle player == player) && {
            (simulationEnabled player_objintersect)
        } && {!isNil "player_objintersect"
        } && {
            (getPlayerUID player in (player_objintersect getVariable["keyAccess", []]))
        } && {!(player_objintersect getVariable["locked", true])
        }
    }],
    ["Destrancar veiculo", {
        vehicle player setVariable["locked", false, true];
        ["Você destrancou as portas do veículo", Color_Green] call A3PL_HUD_Notification;
    }, {
        (vehicle player != player) && {
            (getPlayerUID player in (vehicle player getVariable["keyAccess", []]))
        } && {
            (vehicle player getVariable["locked", true])
        }
    }],
    ["Destrancar veiculo", {
        player_objintersect setVariable["locked", false, true];
        ["Você destrancou as portas do veículo", Color_Green] call A3PL_HUD_Notification;
        cursorObject say3D "A3PL_Car_Lock";
    }, {
        (vehicle player == player) && (simulationEnabled player_objintersect) && ((player distance player_objintersect) < 15) && ((getPlayerUID player) IN(player_objintersect getVariable["keyAccess", []])) && (player_objintersect getVariable["locked", true])
    }],
    ["Prender barco", {
        [cursorObject] call A3PL_Vehicle_TrailerAttach;
    }, {
        ((vehicle player == player) && (cursorObject distance player < 5)) && {
            (simulationEnabled cursorObject)
        } && {
            (typeOf cursorObject == "A3PL_Small_Boat_Trailer")
        }
    }],
    ["Prender barco", {
        [cursorObject] call A3PL_Vehicle_BigTrailerAttach;
    }, {
        ((vehicle player == player) && (cursorObject distance player < 5)) && {
            (simulationEnabled cursorObject)
        } && {
            (typeOf cursorObject == "A3PL_Lowboy")
        } && {
            (cursorObject animationSourcePhase "RBM_Supports" > 0.5)
        }
    }],
    ["Desprender barco", {
        _Boat = ((attachedObjects player_objintersect) select 0);
        _Trailer = player_objintersect;
        [_Boat] remoteExec ["Server_Vehicle_TrailerDetach", 2];
    }, {
        ((vehicle player == player) && (cursorObject distance player < 5)) && (!(((attachedObjects player_objintersect) select 0) getVariable["locked", true]))
    }],
    ["Desprender barco", {
        if (!(cursorObject isKindOf "Ship")) exitwith {};
        [cursorObject] remoteExec ["Server_Vehicle_TrailerDetach", 2];
    }, {
        ((vehicle player == player) && (cursorObject distance player < 5)) && ({
            (typeOf(attachedTo cursorObject)) IN["A3PL_Boat_Trailer", "A3PL_Small_Boat_Trailer"]
        }) && (!(cursorObject getVariable["locked", true]))
    }],
    ["Subir no iate", {
        private["_veh"];
        _veh = player_objintersect;
        if (!(_veh isKindOf "A3PL_Yacht")) exitwith {};
        player setpos(_veh modeltoworld[-1, -25, -5]);
    }, {
        (vehicle player == player) && (player_objintersect isKindOf "A3PL_Yacht") && ((player distance(player_objintersect modeltoworld[-1, -25, -5])) < 10)
    }],
    ["Subir no barco", {
        private["_veh"];
        _veh = cursorObject;
        if (!(_veh isKindOf "A3PL_RBM")) exitwith {};
        player setpos(_veh modeltoworld[0, -4.16406, 0]);
    }, {
        (vehicle player == player) && (cursorObject isKindOf "A3PL_RBM") && (cursorObject distance player < 10)
    }],
    ["Adicionar à Facção", {
        [cursorObject,(getPlayerUID cursorObject),(player getVariable "faction")] spawn Caue_FactionSetup_AddToFaction;
    }, {
        ([(player getVariable ["faction", "citizen"])] call Caue_FactionSetup_IsLeader) && (isPlayer cursorObject)
    }],
    ["Usar computador", {
        [] spawn Caue_Police_DatabaseOpen;
    }, {
        player_objIntersect IN [doj_pc, doj_pc_1, doj_pc_2, doj_pc_3]
    }],
    ["Congelar/Descongelar", {
        if (player_objintersect getVariable["locked", true]) then {
            player_objintersect setVariable["locked", false];
        } else {
            player_objintersect setVariable["locked", true];
        };
    }, {
        Player_NameIntersect == "furniture" && ((player_objintersect getVariable["stock", -1]) < 0)
    }],
    ["Render-se", {
        [player, true] call Caue_Player_Surrender;
    }, {
        (((animationState player) IN["amovpercmstpsnonwnondnon", "amovpercmrunsnonwnondf", "amovpercmrunsnonwnondb"]) && (vehicle player == player))
    }],
    ["Render-se", {
        [player, true] call Caue_Player_Surrender;
    }, {
        ((animationState player IN["a3pl_idletohandsup", "a3pl_kneeltohandsup"]) && (vehicle player == player))
    }],
    ["Ajoelhe-se", {
        [player, false] call Caue_Player_Surrender;
    }, {
        ((animationState player IN["a3pl_idletohandsup", "a3pl_kneeltohandsup"]) && (vehicle player == player))
    }],
    ["Levantar", {
        [player, true] call Caue_Player_Surrender;
    }, {
        ((animationState player IN["a3pl_handsuptokneel", "a3pl_kneeltohandsup"]) && (vehicle player == player))
    }],
    ["Arrastar", {
        [player_objintersect] call Caue_Police_Drag;
    }, {
        ((player distance player_objintersect) < 4) && (isPlayer player_objintersect) && ((player_objintersect getVariable ["Cuffed",false]) || (player_objintersect getVariable ["Tied",false])) && (isNull (player getVariable ["dragged",objNull])) && !(player_objintersect getVariable ["isdragged",false])
    }],
    ["Parar de arrastar", {
        [] call Caue_Police_Drag;
    }, {
        !(isNull (player getVariable ["dragged",objNull]))
    }],
    ["Comer Item", {
        [] spawn Caue_Items_Eat;
    }, {
        (([Player_ItemClass, 'fnc'] call Caue_Config_GetItem) isEqualTo 'Caue_Items_Eat')
    }],
    ["Beber Item", {
        [] spawn Caue_Items_Drink;
    }, {
        (([Player_ItemClass, 'fnc'] call Caue_Config_GetItem) isEqualTo 'Caue_Items_Drink')
    }],
    ["Usar droga(s)", {
        [Player_ItemClass, 1] call A3PL_Drugs_Use;
    }, {
        (([Player_ItemClass, 'fnc'] call Caue_Config_GetItem) isEqualTo 'A3PL_Drugs_Use')
    }],
    ["Colocar no bolso", {
        [] call Caue_Inventory_PutBack;
    }, {
        ((isNull Player_Item) isEqualTo false) && (!(player_itemClass IN["ticket"]))
    }],
    ["Destruir multa", {
        [player_item] call Caue_Inventory_Clear;
    }, {
        ((isNull Player_Item) isEqualTo false) && (player_itemClass IN["ticket"])
    }],
    ["Escrever multa", {
        [] spawn Caue_Police_TicketOpen;
    }, {
        (vehicle player == player) && ((player getVariable["job","unemployed"]) IN ["police","dmv"]) && (!(player_itemclass == "ticket"))
    }],
    ["Jogar Item", {
        [] spawn Caue_Inventory_Throw;
    }, {
        !(isNull Player_Item)
    }],
    ["Soltar Item", {
        [] call Caue_Inventory_Drop;
    }, {
        !(isNull Player_Item)
    }],
    ["Pegar Item", {
        [player_objintersect] call Caue_Inventory_Pickup;
    }, {
        (((isNull Player_Item) isEqualTo true) && ((call A3PL_Intersect_cursorObject) in (server getVariable 'Server_DroppedItems')))
    }],
    ["Sair do veiculo", {
        private["_veh"];
        _veh = vehicle player;
        if (_veh getVariable["locked", true]) exitwith {
            ["Incapaz de sair, este veículo está trancado",Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["getOut", _veh];
        _veh lock 2;

    }, {
        ((vehicle player) isKindOf "Ship")
    }],
    ["Passageiro veiculo", {
        private["_veh"];
        _veh = cursorObject;
        if (_veh getVariable["locked", true]) exitwith {
            ["Incapaz de entrar, este veículo está trancado", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;

        player moveInCargo _veh;
        _veh lock 2;
    }, {
        (cursorobject isKindOf "Ship") && (player distance cursorObject < 5)
    }],
    ["Entrar no veiculo", {
        private["_veh"];
        _veh = cursorObject;
        if (_veh getVariable["locked", true]) exitwith {
            ["Incapaz de entrar, este veículo está trancado", Color_Red] call A3PL_HUD_Notification;
        };
        _veh lock 1;
        player action["getInDriver", _veh];
        _veh lock 2;
    }, {
        (cursorobject isKindOf "Ship") && (player distance cursorObject < 5)
    }],
    ["Ligar/Desligar Farois", {
        _veh = vehicle player;
        if (_veh animationSourcePhase "Spotlight" < 0.5) then {
            _veh animateSource["Spotlight", 1];
            if (_veh animationSourcePhase "Head_Lights" < 0.5) then {
                player action["lightOn", _veh];
            };

        } else {
            _veh animateSource["Spotlight", 0];
            if (_veh animationSourcePhase "Head_Lights" < 0.5) then {
                player action["lightOff", _veh];
            };
        };

    }, {
        (typeOf(vehicle player) == "A3PL_Jayhawk") && (player == ((vehicle player) turretUnit[0]))
    }],
    ["Alterar Cesta de Resgate", {
        private["_veh", "_rope"];
        _veh = vehicle player;
        _basket = _veh getVariable "basket";
        if (((count(crew _basket)) > 0) && (_veh animationPhase "Basket" > 0.5)) exitwith {
            [_basket] spawn {
                private _basket = _this select 0;
                private _crewbasket = (crew _basket) select 0;
                {unassignVehicle _x;_x action ["EJECT", vehicle _x];sleep 0.4;} foreach crew _basket;
                sleep 0.15;
                [(vehicle player),false] remoteExec ["A3PL_Lib_MoveInPass",_crewbasket];
            };
        };
        if (_basket isEqualTo objNull) then {
            [] call A3PL_Create_RescueBasket;
        };
        if (count ropes _veh > 0) exitwith {
            {
                ropeDestroy _x;
            } foreach(ropes _veh);
            _basket attachTo[_veh, [0, 999999, 0]];
            _veh animate["Basket", 0];
        };
        [(driver _veh), _veh, _basket] remoteExec ["Server_Vehicle_AtegoHandle", 2];
        detach _basket;
        _veh animate["Basket", 1];
        _basket setpos(_veh modelToWorld[4, 2, -1]);
        _rope = ropeCreate[_veh, "rope", _basket, [-0.3, 0.2, 0.25], 3];
    }, {
        ((typeOf(vehicle player) == "A3PL_Jayhawk") && ((player == ((vehicle player) turretUnit[0])) OR (player == ((vehicle player) turretUnit[1])) OR (player == (driver vehicle player))) && ((speed vehicle player) < 30))
    }],
    ["Sair do veiculo", {
        [] spawn {
            private["_veh"];
            _veh = vehicle player;
            _heli = vehicle player getVariable "vehicle";
            _crew = crew _heli;
            _available = true; {
                if ((_heli getCargoIndex _x) == 6) exitwith {
                    _available = false;
                };
            }
            foreach(crew _heli);
            if (!_available) exitwith {
                _veh lock 0;
                unassignVehicle player;
                player leaveVehicle _veh;
                player action["GetOut", _veh];
                sleep 1.5;
                _veh lock 0;
                player moveInCargo _heli;
                ["Não pode entrar em alguém está na maca", Color_Red] call A3PL_HUD_Notification;
            };
            _veh lock 0;
            unassignVehicle player;
            player leaveVehicle _veh;
            player action["GetOut", _veh];
            sleep 1.5;
            _veh lock 0;
            player moveInCargo[_heli, 6];
        };
    }, {
        (("A3PL_rescueBasket" == (typeOf(vehicle player))))
    }],
    ["Aumentar a corda", {
        private["_veh"];
        _veh = vehicle player;
        if (typeOf _veh != "A3PL_Jayhawk") exitwith {};
        if (count ropes _veh < 1) exitwith {};
        ropeUnwind[(ropes _veh) select 0, 2, (ropeLength((ropes _veh) select 0)) + 5];

    }, {
        ((typeOf(vehicle player) == "A3PL_Jayhawk") && (local vehicle player) && ((player == ((vehicle player) turretUnit[0])) OR(player == ((vehicle player) turretUnit[1])) OR(player == (driver vehicle player))))
    }],
    ["Diminuir a corda", {
        private["_veh"];
        _veh = vehicle player;
        if (typeOf _veh != "A3PL_Jayhawk") exitwith {};
        if (count ropes _veh < 1) exitwith {};
        ropeUnwind[(ropes _veh) select 0, 2, (ropeLength((ropes _veh) select 0)) - 5];

    }, {
        ((typeOf(vehicle player) == "A3PL_Jayhawk") && (local vehicle player) && ((player == ((vehicle player) turretUnit[0])) OR(player == ((vehicle player) turretUnit[1])) OR(player == (driver vehicle player))))
    }],
    ["Alterar Autohover", {
        private["_veh"];
        _veh = vehicle player;
        if (isAutoHoverOn _veh) then {
            player action["autoHoverCancel", _veh];
        } else {
            player action["autoHover", _veh];
        };

    }, {
        (((vehicle player) isKindOf "Helicopter")) && (((player == (vehicle player turretUnit[0]))) OR(player == (driver vehicle player)))
    }],
    ["Usar transponder", {
        [] call A3PL_ATC_Transponder;
    }, {
        (((vehicle player) isKindOf "Air")) && (((player == (vehicle player turretUnit[0]))) OR(player == (driver vehicle player)))
    }],
    ["Alterar Controle", {
        private["_veh"];
        _veh = vehicle player;
        if (!isCopilotEnabled _veh) then {
            _veh enableCopilot true;
            player action["UnlockVehicleControl", _veh];
        }
        else {
            _veh enableCopilot false;
            player action["SuspendVehicleControl", _veh];
            player action["LockVehicleControl", _veh];
        };
    }, {
        (((vehicle player) isKindOf "Air") && (player == (driver vehicle player)))
    }],
    ["Pegar Controle", {
        private["_veh"];
        _veh = vehicle player;
        player action["TakeVehicleControl", _veh];
    }, {
        (((vehicle player) isKindOf "Air") && (player == (vehicle player turretUnit[0])) && (isCopilotEnabled vehicle player))
    }],
    ["Soltar Controle", {
        private["_veh"];
        _veh = vehicle player;
        player action["SuspendVehicleControl", _veh];
    }, {
        (((vehicle player) isKindOf "Air") && (player == (vehicle player turretUnit[0])) && (isCopilotEnabled vehicle player))
    }],
    ["Abrir o radar", {
        [] spawn A3PL_ATC_RadarStart;
    }, {
        (player getVariable["job", "unemployed"] == "faa")
    }],
    ["Redefinir velocidade", {

        _veh = vehicle player;
        _veh setVelocity[0, 0, 0];
    }, {
        (local(vehicle player)) && ((vehicle player) isKindOf "Plane") && ((speed vehicle player) < 10)
    }],
    ["Sair do veiculo", {
        if ((speed vehicle player) < 1) then {
            player action["GetOut", vehicle player];
            [] spawn {
                if (player getVariable["Cuffed", true]) then {
                    sleep 1.5;
                    player setVelocityModelSpace[0, 3, 1];
                    [player, "a3pl_handsupkneelcuffed"] remoteExec ["A3PL_Lib_SyncAnim", 0];
                };
            };
        } else {
            player action["eject", vehicle player];
            [] spawn {
                if (player getVariable["Cuffed", true]) then {
                    sleep 1.5;
                    player setVelocityModelSpace[0, 3, 1];

                    [player, "a3pl_handsupkneelcuffed"] remoteExec ["A3PL_Lib_SyncAnim", 0];
                };
            };
        };
    }, {
        ((vehicle player) != player) && (!(vehicle player getVariable["locked", true])) && (!(player getVariable ["Cuffed",false]))
    }],
    ["Empurrar para a frente", {
        _veh = vehicle player;
        _vel = velocity _veh;
        _dir = direction _veh;
        _speed = 5;
        _veh setVelocity[
            (_vel select 0) + (sin _dir * _speed),
            (_vel select 1) + (cos _dir * _speed),
            (_vel select 2)
        ];
    }, {
        ((vehicle player) isKindOf "Plane") && (local(vehicle player))
    }],
    ["Empurrar para tras", {
        _veh = vehicle player;
        _vel = velocity _veh;
        _dir = direction _veh;
        _speed = -5;
        _veh setVelocity[
            (_vel select 0) + (sin _dir * _speed),
            (_vel select 1) + (cos _dir * _speed),
            (_vel select 2)
        ];
    }, {
        ((vehicle player) isKindOf "Plane") && (local(vehicle player))
    }],
    ["Abrir paraquedas", {
        player action["openParachute"];
    }, {
        ((backpack player) isKindOf "B_Parachute")
    }],
    ["Trocar Controles", {
        private["_veh", "_turretPos", "_newTurretPos"];
        _veh = vehicle player;
        _turretPos = call A3PL_Lib_ReturnTurret;
        if (_turretPos == -1) exitwith {};
        if (_turretPos == 0) then {
            _newTurretPos = 1;
        } else {
            _newTurretPos = 0;
        };
        _veh lock 0;
        player action["moveToTurret", _veh, [_newTurretPos]];
        if (_newTurretPos == 1) then {
            [_veh] spawn A3PL_FD_LadderHeavyLoop
        };
        _veh lock 2;
    }, {
        (call A3PL_Lib_ReturnTurret IN[0, 1]) && (typeOf vehicle player IN["A3PL_Pierce_Heavy_Ladder", "A3PL_Pierce_Ladder"]) && !((vehicle player) getVariable["locked", true])
    }],
    ["Colocar mangueira", {
        [30] call A3PL_FD_DeployHose;
    }, {
        player_ItemClass == "FD_Hose"
    }],
    ["Soltar adaptador", {
        [(call A3PL_Lib_AttachedFirst)] call A3PL_FD_DropHose;
    }, {
        (typeof(call A3PL_Lib_AttachedFirst)) IN["A3PL_FD_HoseEnd1", "A3PL_FD_HoseEnd2"]
    }],
    ["Colocar mascara", {
        [] call A3PL_FD_MaskOn;
    }, {
        player_itemClass == "fd_mask"
    }],
    ["Remover mascara", {
        [] call A3PL_FD_MaskOff;
    }, {
        goggles player == "A3PL_FD_Mask"
    }],
    ["Limpar mascara", {
        [] call A3PL_FD_SwipeMask;
    }, {
        goggles player == "A3PL_FD_Mask"
    }],
    ["Colocar mangueira", {
        [50] call A3PL_FD_GasDeployHose;
    }, {
        (player_ItemClass == "FD_Hose") && (player getVariable["job", "unemployed"] == "oil")
    }],
    ["Cavar buraco", {
        [] spawn A3PL_Resources_StartDigging;
    }, {
        currentWeapon player == "A3PL_Shovel" && (vehicle player == player) && ((surfaceType getpos player) IN["#cype_beach"])
    }],
    ["Farol alto", {
        _veh = vehicle player;
        if (_veh animationSourcePhase "High_Beam" < 0.5) then {
            _veh animateSource["High_Beam", 1];
        } else {
            _veh animateSource["High_Beam", 0];
        };
    }, {
        (vehicle player) isKindOf "Car"
    }],
    ["Resetar radar", {
        _veh = vehicle player;
        if (player == driver _veh) then {
            _veh setVariable["lockfast", nil, false];
            _veh setVariable["locktarget", nil, false];
            [_veh, "lockfast", 0] call A3PL_Police_RadarSet;
            [_veh, "locktarget", 0] call A3PL_Police_RadarSet;
        } else {
            _veh setVariable["lockfast", nil, true];
            _veh setVariable["locktarget", nil, true];
            [_veh, "lockfast", 0] call A3PL_Police_RadarSet;
            [_veh, "locktarget", 0] call A3PL_Police_RadarSet;
        };
    }, {
        (typeOf vehicle player IN["A3PL_Charger_PD", "A3PL_Charger_PD_Slicktop", "A3PL_Mustang_PD", "A3PL_Mustang_PD_Slicktop", "A3PL_CVPI_PD_Slicktop", "A3PL_Tahoe_PD", "A3PL_Tahoe_PD_Slicktop", "A3PL_CVPI_PD"])
    }],
    ["Pegar caixa", {
        private["_house"];
        if !([] call Caue_Anticheat_LagSwitch) exitWith {closeDialog 0;};
        if (!([] call Caue_Player_AntiSpam)) exitWith {};
        _house = nearestObjects[player, ["Land_Home1g_DED_Home1g_01_F", "Land_Mansion01", "Land_A3PL_Ranch1", "Land_A3PL_Ranch2", "Land_A3PL_Ranch3", "Land_A3PL_ModernHouse1", "Land_A3PL_ModernHouse2", "Land_A3PL_ModernHouse3", "Land_A3PL_BostonHouse", "Land_A3PL_Shed1", "Land_A3PL_Shed2", "Land_A3PL_Shed3", "Land_A3PL_Shed4"], 10];
        if ((count _house) < 1) exitwith {
            ["Não foi possível encontrar a casa por perto, reporte este bug", Color_Red] call A3PL_HUD_Notification;
        };
        _house = _house select 0;
        [player, _house] remoteExec ["Server_Housing_LoadBox", 2];
    }, {
        (player distance(player getVariable["house", objNull]) < 8)
    }],
    ["Guardar caixa", {
        private["_house", "_box"];
        if !([] call Caue_Anticheat_LagSwitch) exitWith {closeDialog 0;};
        if !([] call Caue_Player_AntiSpam) exitWith {};

        private _box = nearestObjects[player,["plp_ct_FootlockerBrown"],10];
        if ((count _box) < 1) exitwith {["Não foi possível encontrar a caixa nas proximidades, reporte este bug", Color_Red] call A3PL_HUD_Notification;};
        _box = _box select 0;

        [_box] remoteExec ["Server_Housing_SaveBox",2];
    }, {
        (player distance(nearestObject[player, "plp_ct_FootlockerBrown"]) < 5)
    }],
    ["Alugar ($350)", {
        [cursorobject] call A3PL_JobFarming_BuyGreenhouse;
    }, {
        (typeOf cursorobject == "Land_A3PL_GreenHouse") && ((player distance cursorobject) < 4.3)
    }],
    ["Reparar veiculo", {
        private["_intersect"];
        _intersect = player_objintersect;
        if (isNull _intersect) exitwith {};
        [_intersect] call A3PL_Vehicle_Repair;
    }, {
        (player_ItemClass == "repairwrench") && (vehicle player == player) && (player distance cursorObject < 5)
    }],
    ["Ancora", {
        private["_veh"];
        _veh = cursorObject;
        [_veh] spawn A3PL_Vehicle_Anchor;
    }, {
        ((typeOf cursorObject) IN["A3PL_Motorboat", "A3PL_Motorboat_Rescue", "A3PL_Motorboat_Police", "A3PL_RHIB", "A3PL_Yacht", "A3PL_Yacht_Pirate", "A3PL_RBM", "A3PL_Container_Ship"]) && (player distance cursorObject < 15) && (!(cursorObject getVariable["locked", true])) && ((speed cursorObject) < 5)
    }],
    ["Ancora", {
        private["_veh"];
        _veh = vehicle player;
        [_veh] spawn A3PL_Vehicle_Anchor;
    }, {
        ((typeOf vehicle player) IN["A3PL_Motorboat", "A3PL_Motorboat_Rescue", "A3PL_Motorboat_Police", "A3PL_RHIB", "A3PL_Yacht", "A3PL_Yacht_Pirate", "A3PL_RBM", "A3PL_Container_Ship"]) && (!(vehicle player getVariable["locked", true])) && ((speed vehicle player) < 5)
    }],
    ["Levantar", {
        [player,""] remoteExec ["A3PL_Lib_SyncAnim",0];
    }, {
        animationState player IN ["hubsittingchairb_idle1","hubsittingchairb_idle2","hubsittingchairb_idle3","incapacitated"]
    }],
    ["Fumar", {
        [player] spawn Caue_Animations_StartCig;
    }, {
        ((goggles player) in Config_CigsArray) && (!(player getVariable ['murshun_cigs_cigLitUp',false]))
    }],
    ["Parar de fumar", {
        [player] spawn Caue_Animations_StopCig;
    }, {
        ((goggles player) in Config_CigsArray) && ((player getVariable ['murshun_cigs_cigLitUp',false]))
    }],
    ["Pegar cigarro", {
        [player] spawn Caue_Animations_TakeCig;
    }, {
        "murshun_cigs_cigpack" IN (magazines player)
    }]
];
publicVariable "Config_Interactions";

Config_Apts = [
    /* Palm Beach */
    [3479.79,6570.52,0.230252],[3479.47,6576.23,0.230253],[3479.64,6581.5,0.230281],[3480.09,6586.61,0.230332],[3479.96,6586.79,3.00887],[3479.42,6581.19,3.00881],[3480.06,6576.01,3.00878],[3479.83,6570.62,3.00878],[3479.31,6603.49,0.230368],[3479.88,6609.18,0.230362],[3479.51,6614.58,0.230361],[3480.05,6619.6,0.230362],[3480.21,6619.62,3.0089],[3479.93,6614.15,3.00889],[3479.62,6609.09,3.00889],[3479.68,6603.33,3.0089],[3479.92,6636.78,0.230082],[3479.67,6641.69,0.230082],[3479.94,6647.37,0.230085],[3479.53,6652.45,0.231201],[3480.03,6652.74,3.00987],[3479.7,6647.49,3.00862],[3480.12,6641.88,3.00861],[3480.07,6636.5,3.00861],[3479.96,6676.9,0.229233],[3479.45,6682.38,0.229882],[3480.31,6687.7,0.230279],[3479.86,6692.74,0.230416],[3480.25,6692.89,3.00895],[3479.86,6687.53,3.00881],[3479.72,6682.23,3.00839],[3479.77,6676.61,3.00777],[3480.17,6711.3,0.229846],[3480.18,6716.08,0.230207],[3479.85,6721.88,0.23118],[3480.05,6727.6,0.235154],[3480.12,6727.4,3.01327],[3479.87,6721.74,3.00965],[3480.24,6716.61,3.00875],[3480.48,6711.36,3.0083],[3560.55,6699.48,0.223306],[3565.42,6700.03,0.223307],[3571.14,6699.84,0.223307],[3575.94,6699.99,0.223308],[3576.52,6699.67,3.00184],[3570.9,6699.4,3.00184],[3565.33,6699.83,3.00184],[3559.93,6699.69,3.00184],[3586.83,6710.59,0.216798],[3586.64,6715.84,0.216799],[3586.6,6721.12,0.216799],[3586.53,6726.83,0.216799],[3586.27,6726.68,2.99533],[3586.98,6721.32,2.99533],[3586.68,6715.77,2.99533],[3586.22,6710.46,2.99533],[3561.54,6635.3,0.224283],[3567.55,6635.33,0.22317],[3572.33,6634.86,0.223075],[3577.7,6635.03,0.22311],[3577.66,6634.77,3.00159],[3571.93,6634.82,3.0016],[3567.18,6635.06,3.00165],[3561.29,6634.76,3.0029],[3586.19,6623.41,0.193718],[3587.01,6617.96,0.193654],[3586.96,6612.31,0.193653],[3586.88,6606.69,0.193653],[3586.68,6607.05,2.97219],[3586.58,6612.45,2.97219],[3587.47,6617.59,2.97219],[3587.18,6623.16,2.97224],
    /* Stoney Creek */
    [3373.49,7485.31,0.302122],[3373.9,7490.92,0.30175],[3374.3,7496.3,0.293041],[3374.9,7501.63,0.213779],[3374.91,7501.86,2.98916],[3374.32,7496.28,3.07119],[3373.9,7491,3.08026],[3373.21,7485.48,3.08066],[3376.3,7512.81,0.346431],[3376.76,7517.63,0.312815],[3377.83,7523.43,0.277437],[3378.07,7528.21,0.252628],[3377.78,7528.61,3.03111],[3377.79,7523.04,3.05644],[3376.92,7518.01,3.08896],[3375.92,7512.08,3.13992],
    /* Elk City */
    [6150.87,7320.44,0.227314],[6153.36,7325.72,0.227314],[6156.73,7329.81,0.227315],[6160.1,7334.59,0.227316],[6159.79,7334.6,3.00586],[6156.78,7329.82,3.00586],[6154.1,7325.02,3.00586],[6150.39,7320.49,3.00586],[6167.67,7347.83,0.274184],[6171.1,7352.63,0.278967],[6173.53,7357.21,0.274182],[6175.48,7361.79,0.276583],[6176.09,7361.59,3.05613],[6173.83,7357.3,3.05273],[6170.53,7352.1,3.05685],[6167.86,7348.23,3.05273],[6185.11,7373.67,0.327484],[6188.61,7379.07,0.327484],[6191.38,7383.08,0.327484],[6194.09,7387.58,0.327485],[6193.85,7387.76,3.10603],[6190.95,7383.03,3.10603],[6187.88,7378.48,3.10603],[6184.91,7374.06,3.10603],[6202.67,7400.86,0.2593],[6205.65,7405.86,0.2593],[6208.43,7410.23,0.2593],[6211.22,7414.85,0.259301],[6211.33,7414.82,3.03785],[6208.72,7410.17,3.03785],[6205.71,7405.56,3.03785],[6202.72,7400.85,3.03785]
];
publicVariable "Config_Apts";

Config_Resources_Ores = [
    ["Iron",15,27,28,20,"Iron_Ore",20,"Ferro"],
    ["Coal",15,20,23,20,"Coal_Ore",20,"Carvão"],
    ["Aluminium",15,20,15,20,"Aluminium_Ore",20,"Alumínio"],
    ["Sulphur",15,20,15,20,"Sulphur_Ore",20,"Enxofre"]
];
publicVariable "Config_Resources_Ores";

Config_Licenses = [
    ["driver","Carteira de Motorista","Motorista"],
    ["bike","Carteira de Motorista Motos","Moto"],
    ["cdl","Carteira de Motorista Comercial","Comercial"],
    ["boat","Licença de Barco","Barco"],
    ["ccp","Porte de Armas","Armas"],
    ["hunting","Licença de Caça","Caça"],
    ["pilot","Licença de Piloto","Piloto"],
    ["hpilot","Licença de Piloto de Helicóptero","Helicóptero"],
    ["c3driver","Licença de Motorista Avançada","Avançada"],
    ["fishing","Licença de Pesca","Pesca"],
    ["security","Licença de Segurança","Segurança"],
    ["pilotcop","Piloto Policia","Piloto Cop"],
    ["dtu","DTU","DTU"],
    ["sert","S.E.R.T","SERT"],
    ["highway","Highway","Highway"],
    ["uscgcop","USCG","USCG"],
    ["uscgsnipercop","Licença de Atirador Aéreo","Atirador"],
    ["k9cop","Licença de K-9","K9"],
    ["instructor","Instrutor de Armas","Instrutor"]
];
publicVariable "Config_Licenses";

Config_Jobs = [
    ["unemployed","Desempregado"],
    ["police","Policial"],
    ["fifr","Medico"],
    ["doj","DOJ"],
    ["faa","FAA"],
    ["dmv","DMV"],
    ["gov","Governo"],
    ["deliver","Entregador"],
    ["extermy","Exterminador"],
    ["waste","Lixeiro"],
    ["uber","Uber"],
    ["farmer","Fazendeiro"],
    ["roadworker","Mecanico"],
    ["oil","óleo"],
    ["Roadside_Service","Mecanico"],
    ["fisherman","Pescador"],
    ["business","Negociante"]
];
publicVariable "Config_Jobs";

Config_Masks = [
    "d3s_CAP_berd_003_u_a",
    "d3s_CAP_berd_003_u_b",
    "d3s_CAP_berd_003_u_c",
    "d3s_CAP_berd_003_u_d",
    "d3s_CAP_berd_003_u_e",
    "d3s_CAP_berd_003_u_f",
    "d3s_CAP_berd_003_u_g",
    "d3s_CAP_berd_003_u_h",
    "d3s_CAP_berd_003_u_i",
    "d3s_CAP_berd_003_u_j",
    "d3s_CAP_berd_003_u_k",
    "d3s_CAP_berd_003_u_l",
    "d3s_CAP_berd_003_u_m",
    "d3s_CAP_berd_003_u_n",
    "d3s_CAP_berd_003_u_o",
    "d3s_CAP_berd_003_u_p",
    "d3s_CAP_berd_003_u_q",
    "d3s_CAP_berd_003_u_r",
    "d3s_CAP_berd_003_u_s",
    "d3s_CAP_berd_003_u_t",
    "d3s_CAP_berd_003_u_u",
    "d3s_CAP_berd_003_u_v",
    "d3s_CAP_berd_003_u_w",
    "d3s_CAP_berd_003_u_x",
    "d3s_CAP_berd_003_u_y",
    "d3s_CAP_berd_003_u_z",
    "d3s_CAP_berd_006_u_a",
    "d3s_CAP_berd_006_u_b",
    "d3s_CAP_berd_006_u_c",
    "d3s_CAP_berd_006_u_d",
    "d3s_CAP_berd_006_u_e",
    "d3s_CAP_berd_006_u_f",
    "d3s_CAP_berd_006_u_g",
    "d3s_CAP_berd_006_u_h",
    "d3s_CAP_berd_006_u_i",
    "d3s_CAP_berd_006_u_j",
    "d3s_CAP_berd_006_u_k",
    "d3s_CAP_berd_006_u_l",
    "d3s_CAP_berd_006_u_m",
    "d3s_CAP_berd_006_u_n",
    "d3s_CAP_Headgear",
    "d3s_CAP_Headgear1",
    "sl_client_c4_ninja_ShirtMask_01_W",
    "sl_client_c4_ninja_ShirtMask_02_W",
    "sl_client_c4_ninja_ShirtMask_03_W",
    "sl_client_c4_ninja_ShirtMask_04_W",
    "sl_client_c4_ninja_ShirtMask_05_W",
    "sl_client_c4_ninja_ShirtMask_06_W",
    "sl_client_c4_ninja_ShirtMask_07_W",
    "sl_client_c4_ninja_ShirtMask_08_W",
    "sl_client_c4_ninja_ShirtMask_09_W",
    "sl_client_c4_ninja_ShirtMask_10_W",
    "sl_client_c4_ninja_ShirtMask_11_W",
    "sl_client_c_masks_anonymous_W",
    "sl_client_c3_masks2_BatmanMask_W",
    "sl_client_c3_masks2_GingerbreadMask_W",
    "sl_client_c5_Gingerbread1_W",
    "sl_client_c_masks_horse_head_W",
    "sl_client_c3_masks2_JasonMask_W",
    "sl_client_c3_masks2_KermitMask_W",
    "sl_client_c3_knuckle",
    "sl_client_c3_masque_Dallas",
    "sl_client_c3_masque_Chains",
    "sl_client_c3_masque_Hoxton",
    "sl_client_c3_masque_Wolfv2",
    "sl_client_c3_masque_Religieuse",
    "sl_client_c3_masks2_MickeyMask_W",
    "sl_client_c3_masks2_ShrekMask_W",
    "sl_client_c3_masks2_SpidermanMask_W",
    "sl_client_c3_masks2_SpongebobMask_W",
    "G_Balaclava_blk",
    "G_Balaclava_oli",
    "G_Bandanna_blk",
    "G_Bandanna_khk",
    "G_Bandanna_oli",
    "G_Bandanna_tan",
    "G_Bandanna_aviator",
    "G_Bandanna_sport",
    "nigga_platok",
    "nigga_platok2",
    "nigga_platok3",
    "nigga_platok4",
    "nigga_platok5",
    "nigga_platok6",
    "nigga_platok7",
    "nigga_platok8",
    "nigga_platok9",
    "nigga_platok10",
    "nigga_platok11",
    "nigga_platok12"
];
publicVariable "Config_Masks";

Config_NPC_Text = [
    /* McFidhers */
    ["mcfishers_initial","Olá! Bem vindo ao McFishers, como posso ajudá-lo?",["1. Olá! Eu gostaria de começar a trabalhar no McFishers","2. Ignore-me, estou apenas dando uma olhada"],["if (player getVariable 'job' == 'mcfisher') exitwith {['mcfishers_already'] call A3PL_NPC_Start;}; ['mcfishers_work'] call A3PL_NPC_Start;",""]],
    ["mcfishers_work","Ótimo! Estamos sempre contratando. Você tem certeza de que gostaria de trabalhar aqui? A duração do seu contrato será de no mínimo 1 mês (1 hora).",["1. Isso soa bem, eu vou começar imediatamente!","2. Acho que mudei de idéia, obrigado pela oferta de qualquer maneira."],["['mcfisher'] call A3PL_NPC_TakeJob;",""]],
    ["mcfishers_already","Você já está trabalhando aqui...",["1. Eu só estava brincando! *risos*","2. Eu gostaria de parar de trabalhar aqui, eu odeio esse lugar."],["","[] call A3PL_NPC_LeaveJob;"]],
    ["mcfishers_accepted","Agora você é um funcionário da McFishers em tempo integral. Você pode encontrar suas roupas de trabalho no balcão. Eu preciso orientá-lo sobre o básico?",["1. Sim por favor.","2. Eu ja fiz esse tipo de trabalho antes. Eu estou bem!"],["['mcfishers_tutorial'] call A3PL_NPC_Start;",""]],
    ["mcfishers_tutorial","Tudo bem, ouça. 1. Você pode encontrar ingredientes na cozinha. 2. Use a grelha para cozinhar os hambúrgueres. 3. O microfone pode ser usado para conversar com os clientes.",["1. Tudo bem, entendi!"],[""]],

    /* Taco Hell */
    ["tacohell_initial","Olá! Bem-vindo ao Taco Hell, como posso ajudá-lo? ", [" 1. Olá! Eu gostaria de começar a trabalhar no Taco Hell","2. Ignore-me, estou apenas dando uma olhada"],["if (player getVariable 'job' == 'tacohell') exitwith {['tacohell_already'] call A3PL_NPC_Start;}; ['tacohell_work'] call A3PL_NPC_Start;",""]],
    ["tacohell_work","Ótimo! Estamos sempre contratando. Tem certeza de que gostaria de trabalhar aqui? A duração do seu contrato será de pelo menos 1 mês (1 hora).",["1. Isso soa bem, eu vou começar imediatamente!","2. Acho que mudei de idéia, obrigado pela oferta de qualquer maneira."],["['tacohell'] call A3PL_NPC_TakeJob;",""]],
    ["tacohell_already","Você já está trabalhando aqui...",["1. Eu só estava brincando! *risos*","2. Eu gostaria de parar de trabalhar aqui, eu odeio esse lugar."],["","[] call A3PL_NPC_LeaveJob;"]],
    ["tacohell_accepted","Agora você é um funcionário do Taco Hell em tempo integral. Você pode encontrar suas roupas de trabalho no balcão. Eu preciso orientá-lo sobre o básico?",["1. Sim por favor.","2. Eu ja fiz esse tipo de trabalho antes. Eu estou bem!"],["['tacohell_tutorial'] call A3PL_NPC_Start;",""]],
    ["tacohell_tutorial","Tudo bem, ouça. 1. Você pode encontrar ingredientes na cozinha. 2. Use a grelha para cozinhar o peixe. 3. O microfone pode ser usado para conversar com os clientes.",["1. Tudo bem, entendi!"],[""]],

    /* Fishermen */
    ["fisherman_initial","Olá! Como posso ajudá-lo?",["1. Olá! Eu gostaria de me tornar um pescador!","2. Ignore-me, estou apenas dando uma olhada.","3. Eu gostaria de acessar a loja"],["if (player getVariable 'job' == 'fisherman') exitwith {['fisherman_already'] call A3PL_NPC_Start;}; ['fisherman_work'] call A3PL_NPC_Start;","","['Shop_Fisherman'] call Caue_Shop_Open"]],
    ["fisherman_work","Fishers Island está sempre à procura de mais pescadores. McFishers tem que continuar recebendo seus peixes de algum lugar *risos* Você tem certeza que quer se tornar um pescador?",["1. Sim, deixe-me pescar já!","2. Na verdade, acho que não quero me tornar pescador."],["['fisherman'] call A3PL_NPC_TakeJob;",""]],
    ["fisherman_already","Você já está trabalhando como pescador...",["1. Eu só estava brincando! *risos*","2. Eu gostaria de parar de trabalhar aqui, não gosto de pescar"],["","[] call A3PL_NPC_LeaveJob;"]],
    ["fisherman_accepted","Você é agora um pescador! Preciso te guiar pelo básico?",["1. Sim por favor.","2. Eu ja fiz esse tipo de trabalho antes. Eu estou bem!"],["['fisherman_tutorial'] call A3PL_NPC_Start;",""]],
    ["fisherman_tutorial","Tudo bem, ouça atentamente. 1. Compre uma rede e um balde na minha loja. 2. Implante a rede quando estiver na água. 3. Espere um pouco, depois recupere a rede",["1. Tudo bem, entendi!"],[""]],

    /* Bank */
    ["bank_initial","Bem-vindo ao Banco da Liberdade. Como posso ajudá-lo?",["1. Eu gostaria de assinar meu cheque de pagamento","2. Eu gostaria de verificar minha conta bancária"],["if (Player_Paycheck < 1 ) then {['bank_paycheckrefuse'] call A3PL_NPC_Start;} else {['bank_paycheckaccepted'] call A3PL_NPC_Start;};","[] spawn Caue_ATM_Open;"]],
    ["bank_paycheckrefuse","Não parece que há um cheque aqui para você assinar.",["1. Isso é estranho, tudo bem. Eu voltarei mais tarde então."],[""]],
    ["bank_paycheckaccepted","Eu encontrei seu cheque. Por favor, assine e eu me certificarei de que o valor seja depositado em sua conta bancária.",["1. *assinando cheque* Pronto, tenha um bom dia!","2. Eu assinarei meu cheque mais tarde"],["[] call Caue_Player_PickupPaycheck;",""]],

    /* Police */
    ["police_initial","Olá! Como posso ajudá-lo?",["1. Olá! Como eu me torno um policial?","2. Olá senhor, eu tenho um crime para relatar","3. Olá, estou aqui para começar meu turno."],["['police_howto'] call A3PL_NPC_Start;","['police_reportcrime'] call A3PL_NPC_Start;","if (player getVariable 'job' == 'police') exitwith {['police_already'] call A3PL_NPC_Start;}; if (player getVariable 'faction' == 'police') then { ['police_work'] call A3PL_NPC_Start; } else {['police_workdenied'] call A3PL_NPC_Start;};"]],
    ["police_howto","Você pode encontrar mais informações com o sheriff Steewie Griffin ",["1. Tudo bem obrigado."],[""]],
    ["police_reportcrime","Você pode denunciar crimes ligando para o 911",["1. Tudo bem obrigado."],[""]],
    ["police_workdenied","Você não parece trabalhar aqui! Se fingir de policial é um crime!",["1. Eu sinto muito! Eu irei embora."],[""]],
    ["police_work","Bem-vindo de volta. Tem certeza de que está pronto para começar seu turno?",["1. Estou pronto, vamos acabar com alguns criminosos.","2. Deixe-me pegar alguns donuts e eu voltarei"],["['police'] call A3PL_NPC_TakeJob;",""]],
    ["police_already","Você já está de plantão, quer sair de folga?",["1. Sim, por favor, é hora de ir para casa.","2. Na verdade, deixa pra lá."],["[] call A3PL_NPC_LeaveJob;",""]],
    ["police_accepted","Você está agora de plantão. Aqui está o seu rádio. Certifique-se de pegar o seu equipamento, boa sorte lá fora",["1. Obrigado, nos vemos mais tarde."],[""]],

    /* FIFR */
    ["fifr_initial","Olá! Como posso ajudá-lo?",["1. Eu não me sinto bem, você pode me verificar?","2. Como faço para me tornar parte do FIFR?","3. Olá colega, estou aqui para começar meu turno."],["['fifr_heal'] call A3PL_NPC_Start;","['fifr_howto'] call A3PL_NPC_Start;","if (player getVariable 'job' == 'fifr') exitwith {['fifr_already'] call A3PL_NPC_Start;}; if (player getVariable 'faction' == 'fifr') then { ['fifr_work'] call A3PL_NPC_Start; } else {['fifr_workdenied'] call A3PL_NPC_Start;};"]],
    ["fifr_howto","Você pode encontrar mais informações com o chefe Alantras",["1. Tudo bem obrigado."],[""]],
    ["fifr_workdenied","Você não parece trabalhar aqui!",["1. Eu sinto muito! Eu irei embora."],[""]],
    ["fifr_work","Bem-vindo de volta, você está pronto para começar seu turno?",["1. Estou pronto, hora de salvar algumas vidas.","2. Eu não estou pronto ainda."],["['fifr'] call A3PL_NPC_TakeJob;",""]],
    ["fifr_already","Você já está de plantão, quer sair de folga?",["1. Sim, por favor, é hora de ir para casa.","2. Na verdade, deixa pra lá."],["[] call A3PL_NPC_LeaveJob;",""]],
    ["fifr_accepted","Você está agora de plantão. Aqui está o seu rádio. Certifique-se de pegar o seu equipamento, boa sorte lá fora",["1. Obrigado, nos vemos mais tarde."],[""]],
    ["fifr_heal","Vamos dar uma olhada em você por $100, tem certeza que quer pagar isso?",["1. Tenho certeza que não estou me sentindo bem","2. Isso é muito caro, desculpe."],["[] call Caue_Medical_Heal;",""]],
    ["fifr_healdone","Eu te dei um remédio que vai fazer você se sentir melhor. Você sempre pode voltar para um check-up.",["1. Tudo bem, obrigado senhor!"],[""]],

    /* Farmer */
    ["farmer_initial","Olá! Como posso ajudá-lo?",["1. Olá, gostaria de me tornar fazendeiro e plantar!","2. Nada, tchau"],["if ((player getVariable ['job','unemployed']) == 'farmer') exitwith {['farmer_already'] call A3PL_NPC_Start;}; ['farmer_work'] call A3PL_NPC_Start;",""]],
    ["farmer_work","Claro, estamos sempre procurando pessoas para ajudar. Tem certeza de que gostaria de se tornar um fazendeiro?",["1. Sim eu tenho certeza!","2. Não, mudei de ideia"],["['farmer'] call A3PL_NPC_TakeJob;",""]],
    ["farmer_already","Você já está trabalhando como fazendeiro. Gostaria de parar de trabalhar aqui?",["1. Sim, eu gostaria de parar de trabalhar aqui","2. Na verdade, eu gosto desse trabalho, deixa pra lá."],["[] call A3PL_NPC_LeaveJob;",""]],
    ["farmer_accepted","Você é agora um fazendeiro, eu preciso explicar o básico da agricultura?",["1. Sim por favor","2. Não, eu estou bem"],["['farmer_howto'] call A3PL_NPC_Start;",""]],
    ["farmer_howto","Tudo bem, é muito fácil. 1. Encontre sementes neste campo. 2. Plante as sementes no campo. 3. Colhe-os quando eles terminarem de crescer e lucrar",["1. Tudo bem obrigado."],[""]],

    /* OIL */
    ["oil_initial","Olá! Como posso ajudá-lo?",["1. Olá, gostaria de me tornar um recuperador de petróleo e aumentar o petróleo!","2. Nada tchau"],["if ((player getVariable ['job','unemployed']) == 'oil') exitwith {['oil_already'] call A3PL_NPC_Start;}; ['oil_work'] call A3PL_NPC_Start;",""]],
    ["oil_work","Claro, estamos sempre à procura de pessoas para nos ajudar a fornecer petróleo bruto! Tem certeza de que gostaria de se tornar um recuperador de petróleo?",["Sim eu tenho certeza!","Não, eu mudei de idéia "],["['oil'] call A3PL_NPC_TakeJob;",""]],
    ["oil_already","Você já está trabalhando como recuperador de petróleo. Gostaria de parar de trabalhar aqui?",["1. Sim, eu gostaria de parar de trabalhar aqui","2. Na verdade, eu gosto desse trabalho, deixa pra lá."],["[] call A3PL_NPC_LeaveJob;",""]],
    ["oil_accepted","Você é agora uma recuperador de petróleo. Preciso explicar os fundamentos da recuperação de petróleo?",["1. Sim por favor","2. Não, eu estou bem"],["['oil_howto'] call A3PL_NPC_Start;",""]],
    ["oil_howto","Bem. 1. Encontre um wildcatter que possa encontrar uma área adequada para extração de óleo. 2. Faça a furadeira fazer um furo. 3. Conecte um extrator(pumpjack) e inicie-a",["1. Tudo bem obrigado."],[""]],

    /* FAA */
    ["faastart_initial","Olá! Como posso ajudá-lo?",["1. Olá! Como eu trabalho aqui?","2. Olá! Estou aqui para fazer o check-in como controlador de ATC"],["['faastart_howto'] call A3PL_NPC_Start;","if (player getVariable 'job' == 'faa') exitwith {['faastart_already'] call A3PL_NPC_Start;}; if (player getVariable 'faction' IN ['faa']) then { ['faastart_work'] call A3PL_NPC_Start; } else {['faastart_workdenied'] call A3PL_NPC_Start;}"]],
    ["faastart_howto","Você pode encontrar mais informações o Lucifer",["1. Tudo bem obrigado!"],["1. Tudo bem obrigado."]],
    ["faastart_already","Você já está trabalhando como FAA, gostaria de parar de trabalhar aqui?",["1. Sim, eu gostaria de parar de trabalhar aqui","2. Na verdade, eu gosto desse trabalho, deixa pra lá."],["[] call A3PL_NPC_LeaveJob;",""]],
    ["faastart_work","Bem-vindo de volta, membro da FAA, Tem certeza de que está pronto para começar seu turno?",["1. Estou pronto.","2. Eu voltarei"],["['faa'] call A3PL_NPC_TakeJob;",""]],
    ["faastart_workdenied","Você não parece trabalhar aqui!",["1. Eu sinto muito! Eu irei embora."],[""]],
    ["faastop_initial","Olá! Como posso ajudá-lo?",["1. Olá! Eu gostaria de voltar para baixo"],["[] call A3PL_ATC_LeaveJob;"]],

    /* GOV */
    ["government_initial","Olá! Como posso ajudá-lo?",["1. Olá! Como eu trabalho aqui?","2. Olá! Estou aqui para fazer o check-in como funcionário do governo"],["['government_howto'] call A3PL_NPC_Start;","if (player getVariable 'job' == 'gov') exitwith {['government_already'] call A3PL_NPC_Start;}; if (player getVariable 'faction' == 'gov') then { ['government_work'] call A3PL_NPC_Start; } else {['government_workdenied'] call A3PL_NPC_Start;}"]],
    ["government_howto","Você pode encontrar mais informações com o Prefeito",["1. Tudo bem obrigado!"],[""]],
    ["government_already","Você já está trabalhando como o governo, gostaria de parar de trabalhar aqui?",["1. Yes I would like to stop working here","2. Actually, I like this job, nevermind."],["[] call A3PL_NPC_LeaveJob;",""]],
    ["government_work","Bem-vindo de volta Membro do governo, Tem certeza de que está pronto para começar seu turno?",["1. Estou pronto.","2. Eu voltarei"],["['gov'] call A3PL_NPC_TakeJob;",""]],
    ["government_workdenied","Você não parece trabalhar aqui!",["1. Eu sinto muito! Eu irei embora."],[""]],

    /* DOJ */
    ["doj_initial","Olá! Como posso ajudá-lo?",["1. Olá! Como eu trabalho aqui?","2. Olá! Estou aqui para fazer o check-in como funcionário do DOJ"],["['doj_howto'] call A3PL_NPC_Start;","if (player getVariable 'job' == 'doj') exitwith {['doj_already'] call A3PL_NPC_Start;}; if (player getVariable 'faction' == 'doj') then { ['doj_work'] call A3PL_NPC_Start; } else {['doj_workdenied'] call A3PL_NPC_Start;}"]],
    ["doj_howto","Você pode encontrar mais informações com o juiz",["1. Tudo bem obrigado!"],[""]],
    ["doj_already","Você já está trabalhando como DOJ, gostaria de parar de trabalhar aqui?",["1. Sim, eu gostaria de parar de trabalhar aqui","2. Na verdade, eu gosto desse trabalho, não importa."],["[] call A3PL_NPC_LeaveJob;",""]],
    ["doj_work","Welcome back DOJ member, Are you sure you are ready to start your shift?",["1. I'm ready.","2. I'll be back"],["['doj'] call A3PL_NPC_TakeJob;",""]],
    ["doj_workdenied","Você não parece trabalhar aqui!",["1. Eu sinto muito! Eu irei embora."],[""]],

    /* DMV */
    ["dmv_initial","Olá! Como posso ajudá-lo?",["1. Olá! Como eu trabalho aqui?","2. Olá! Estou aqui para fazer o check-in como funcionário da DMV"],["['dmv_howto'] call A3PL_NPC_Start;","if (player getVariable 'job' == 'dmv') exitwith {['dmv_already'] call A3PL_NPC_Start;}; if (player getVariable 'faction' == 'dmv') then { ['dmv_work'] call A3PL_NPC_Start; } else {['dmv_workdenied'] call A3PL_NPC_Start;}"]],
    ["dmv_howto","Você pode encontrar mais informações com Caue Versace",["1. Tudo bem obrigado!"],[""]],
    ["dmv_already","Você já está trabalhando como DMV. Gostaria de parar de trabalhar aqui?",["1. Sim, eu gostaria de parar de trabalhar aqui","2. Na verdade, eu gosto desse trabalho, deixa pra lá."],["[] call A3PL_NPC_LeaveJob;",""]],
    ["dmv_work","Bem-vindo de volta, membro do DMV, Tem certeza de que está pronto para começar seu turno?",["1. Estou pronto.","2. Daqui a pouco eu volto"],["['dmv'] call A3PL_NPC_TakeJob;",""]],
    ["dmv_workdenied","Você não parece trabalhar aqui!",["1. Desculpe, vou sair"],[""]],

    /* DOC */
    ["doc_initial","Olá! Como posso ajudá-lo?",["1. Olá! Como eu trabalho aqui?","2. Olá! Estou aqui para fazer o check-in como funcionário do DOC"],["['doc_howto'] call A3PL_NPC_Start;","if (player getVariable 'job' == 'doc') exitwith {['doc_already'] call A3PL_NPC_Start;}; if (player getVariable 'faction' == 'doc') then { ['doc_work'] call A3PL_NPC_Start; } else {['doc_workdenied'] call A3PL_NPC_Start;}"]],
    ["doc_howto","Você pode encontrar mais informações com o sheriff Steewie Griffin ",["1. Tudo bem obrigado!"],[""]],
    ["doc_already","Você já está trabalhando como DOC, gostaria de parar de trabalhar aqui?",["1. Sim, eu gostaria de parar de trabalhar aqui","2. Na verdade, eu gosto desse trabalho, deixa pra lá."],["[] call A3PL_NPC_LeaveJob;",""]],
    ["doc_work","Bem-vindo de volta, membro do DOC, Tem certeza de que está pronto para começar seu turno?",["1. Estou pronto.","2. Eu voltarei"],["['doc'] call A3PL_NPC_TakeJob;",""]],
    ["doc_workdenied","Você não parece trabalhar aqui!",["1. Desculpe, vou sair"],[""]],

    /* Roadside */
    ["roadside_service_initial","Você gostaria de se tornar um guincho/mecanico?",["Claro, quanto recebo?"],["if ((player getVariable ['job','unemployed']) == 'Roadside_Service') exitwith {['roadside_service_already'] call A3PL_NPC_Start;}; ['roadside_service_work'] call A3PL_NPC_Start;"]],
    ["roadside_service_work","Você recebe $400 cada cheque de pagamento e $2.500 para cada carro que você apreender.",["Soa bem, quando eu começo?","Não, mudei de ideia"],["['Roadside_Service'] call A3PL_NPC_TakeJob;['roadside_service_accepted'] call A3PL_NPC_Start;",""]],
    ["roadside_service_already","Você já está trabalhando. Você gostaria de parar de trabalhar aqui?",["Sim, eu gostaria de parar de trabalhar aqui","Na verdade, eu gosto desse trabalho, deixa pra lá."],["[] call A3PL_NPC_LeaveJob;",""]],
    ["roadside_service_accepted","Você é agora um guincho/mecanico, preciso explicar o trabalho?",["Não, eu estou bem","Sim por favor"],["","['roadside_service_howto'] call A3PL_NPC_Start;"]],
    ["roadside_service_howto","Você tem dois empregos: 1. Ajudar pessoas com veiculo quebrado. 2. Apreender veiculos marcados...",["Continue","Tudo bem, eu entendi, obrigado"],["['roadside_service_howtopt2'] call A3PL_NPC_Start;",""]],
    ["roadside_service_howtopt2","Fornecendo assistência: Você precisará de chaves de reparo e Jerry Cans que podem ser compradas na Loja Geral ...",["Continue","Tudo bem, eu entendi, obrigado"],["['roadside_service_howtopt3'] call A3PL_NPC_Start;",""]],
    ["roadside_service_howtopt3","Se o veículo estiver muito danificado, ele precisará ser rebocado para uma garagem ou você pode rebocar o veículo até os postos de gasolina para reabastecimento.",["Continue","Tudo bem, eu entendi, obrigado"],["['roadside_service_howtopt4'] call A3PL_NPC_Start;",""]],
    ["roadside_service_howtopt4","Veículos apreendidos: Você receberá uma mensagem quando os carros forem marcados para apreensão, use seu mapa para ver onde...",["Continue","Tudo bem, eu entendi, obrigado"],["['roadside_service_howtopt5'] call A3PL_NPC_Start;",""]],
    ["roadside_service_howtopt5","Uma vez que você tenha pego o veículo, reboque-o de volta e apreenda-o para receber sua recompensa.",["Tudo bem, eu entendi, obrigado"],[""]]
];
publicVariable "Config_NPC_Text";

Config_Blueprints = [
    ["police", ["Blueprint_cvpi_PD","Blueprint_cvpi_PDST","Blueprint_tahoe_PD","Blueprint_tahoe_PDST","Blueprint_mustang_PD","Blueprint_mustang_PDST","Blueprint_charger_PD","Blueprint_charger_PDST","Blueprint_Jayhawk"]],
    ["dmv", []],
    ["fifr", []]
];
publicVariable "Config_Blueprints";

Config_Business_Items = [
    ["A3PL_Charger","vehicle",1000,5000,0,50000],
    ["A3PL_Charger_PD","vehicle",1000,5000,0,50000],
    ["A3PL_Tahoe_PD_Slicktop","vehicle",1000,5000,0,50000],
    ["A3PL_P362","vehicle",1000,5000,0,50000]
];
publicVariable "Config_Business_Items";

Config_Wiki = [
    ["Atualizações",[
        ["Atualização 28/02","<t font='PuristaMedium' shadow='0' align='center' size='1.2'>Atualização 28/02</t><br/><br/><t color='#00ff00' shadow='0' font='PuristaBold'>Adicionado: </t><t shadow='0' font='PuristaLight'>Dar chaves.</t><br/><t color='#00ff00' shadow='0' font='PuristaBold'>Adicionado: </t><t shadow='0' font='PuristaLight'>Quando revistar você pega as chaves da pessoa.</t><br/><t color='#00ff00' shadow='0' font='PuristaBold'>Adicionado: </t><t shadow='0' font='PuristaLight'>Garagem aerea da EMS e Policia.</t><br/><t color='#00ff00' shadow='0' font='PuristaBold'>Adicionado: </t><t shadow='0' font='PuristaLight'>Cessna armado para FAA.</t><br/><t color='#00ff00' shadow='0' font='PuristaBold'>Adicionado: </t><t shadow='0' font='PuristaLight'>Mais logs.</t><br/><t color='#00ff00' shadow='0' font='PuristaBold'>Adicionado: </t><t shadow='0' font='PuristaLight'>Lockpick.</t><br/><br/><t color='#ff8000' shadow='0' font='PuristaBold'>Arrumado: </t><t shadow='0' font='PuristaLight'>Garagem de barcos USCG.</t><br/><t color='#ff8000' shadow='0' font='PuristaBold'>Arrumado: </t><t shadow='0' font='PuristaLight'>Locais de entrega.</t><br/><br/><t color='#cc0000' shadow='0' font='PuristaBold'>Removido: </t><t shadow='0' font='PuristaLight'>Cinto bugado da loja de roupas.</t><br/><t color='#cc0000' shadow='0' font='PuristaBold'>Removido: </t><t shadow='0' font='PuristaLight'>Colocar gasolina direto no posto (agora você tem que fazer o reboque).</t>"],
        ["Atualização 06/03","<t font='PuristaMedium' shadow='0' align='center' size='1.2'>Atualização 05/03</t><br/><br/><t color='#00ff00' shadow='0' font='PuristaBold'>Adicionado: </t><t shadow='0' font='PuristaLight'>Chave mestra na fabrica de mercadorias.</t><br/><t color='#00ff00' shadow='0' font='PuristaBold'>Adicionado: </t><t shadow='0' font='PuristaLight'>Novo Roleplay Radio.</t><br/><t color='#00ff00' shadow='0' font='PuristaBold'>Adicionado: </t><t shadow='0' font='PuristaLight'>Novos sons.</t><br/><t color='#00ff00' shadow='0' font='PuristaBold'>Adicionado: </t><t shadow='0' font='PuristaLight'>Quantia de craft nas fabricas (criar mais de 1 item ao mesmo tempo).</t><br/><t color='#00ff00' shadow='0' font='PuristaBold'>Adicionado: </t><t shadow='0' font='PuristaLight'>Caminhao de Querosene na fabrica de veiculos.</t><br/><t color='#00ff00' shadow='0' font='PuristaBold'>Adicionado: </t><t shadow='0' font='PuristaLight'>Menu de criação no windows.</t><br/><t color='#00ff00' shadow='0' font='PuristaBold'>Adicionado: </t><t shadow='0' font='PuristaLight'>Lojas do mesmo tipo agora compartilham o mesmo estoque.</t><br/><t color='#00ff00' shadow='0' font='PuristaBold'>Adicionado: </t><t shadow='0' font='PuristaLight'>Gerenciar banco da facção.</t><br/><br/><t color='#ff8000' shadow='0' font='PuristaBold'>Arrumado: </t><t shadow='0' font='PuristaLight'>Quantidade de cordas que vem na fabrica.</t><br/><t color='#ff8000' shadow='0' font='PuristaBold'>Arrumado: </t><t shadow='0' font='PuristaLight'>Rifles de caça não dão mais dano em pessoas.</t><br/><t color='#ff8000' shadow='0' font='PuristaBold'>Arrumado: </t><t shadow='0' font='PuristaLight'>Ao deslogar você não perde mais sua loja ou posto de gasolina.</t><br/><t color='#ff8000' shadow='0' font='PuristaBold'>Arrumado: </t><t shadow='0' font='PuristaLight'>Problema que fazia você perder items na importação.</t><br/><t color='#ff8000' shadow='0' font='PuristaBold'>Arrumado: </t><t shadow='0' font='PuristaLight'>Armario de evidencias agora salva os items.</t><br/><br/><t color='#cc0000' shadow='0' font='PuristaBold'>Removido: </t><t shadow='0' font='PuristaLight'>Celular e radio antigos.</t>"]
    ]],
    ["Guias",[
        ["Teclas","<t font='PuristaMedium' shadow='0' align='center' size='1.2'>TECLAS</t><br/><br/><t shadow='0' font='PuristaBold'>ESPAÇO: </t><t shadow='0' font='PuristaLight'>Botão de interação</t><br/><t shadow='0' font='PuristaBold'>WINDOWS: </t><t shadow='0' font='PuristaLight'>Menu de interação</t><br/><t shadow='0' font='PuristaBold'>T: </t><t shadow='0' font='PuristaLight'>Escrever no twitter</t><br/><t shadow='0' font='PuristaBold'>SHIFT + P: </t><t shadow='0' font='PuristaLight'>Fones de Ouvido</t><br/><t shadow='0' font='PuristaBold'>SHIFT + H: </t><t shadow='0' font='PuristaLight'>Guardar Arma</t><br/><t shadow='0' font='PuristaBold'>G: </t><t shadow='0' font='PuristaLight'>Abrir celular</t><br/><t shadow='0' font='PuristaBold'>CAPS LOCK: </t><t shadow='0' font='PuristaLight'>Falar no celular/radio</t><br/><t shadow='0' font='PuristaBold'>CTRL + P: </t><t shadow='0' font='PuristaLight'>CTRL + P: Abrir radio</t>"],
        ["Mineração","<t font='PuristaMedium' shadow='0' align='center' size='1.2'>TUTORIAL DE MINERAÇÃO</t><br/><br/><t shadow='0' font='PuristaBold'>1. </t><t shadow='0' font='PuristaLight'>Vá ate o minerador em Elk City.</t><br/><br/><t shadow='0' font='PuristaBold'>2. </t><t shadow='0' font='PuristaLight'>Fale com o minerador e compre uma picareta e uma pá.</t><br/><br/><t shadow='0' font='PuristaBold'>3. </t><t shadow='0' font='PuristaLight'>Apos você comprar suas ferramentas você pode escolher um mapa para comprar sendo eles de ferro,carvão,alumínio e petróleo.</t><br/><br/><t shadow='0' font='PuristaBold'>4. </t><t shadow='0' font='PuristaLight'>Quando você comprar um mapa ele ira marcar a posição no seu mapa, vá ate o local marcada no mapa.</t><br/><br/><t shadow='0' font='PuristaBold'>5. </t><t shadow='0' font='PuristaLight'>Assim que você chegar no local aperte o botão do WINDOWS no seu teclado e selecione a opção cavar o chão e procure pelo minério do mapa que você comprou.</t><br/><br/><t shadow='0' font='PuristaBold'>6. </t><t shadow='0' font='PuristaLight'>Quando acabar de procurar ira aparecer uma bandeira, bata com pá no chão onde a bandeira esta ate o minério ser retirado totalmente do solo.</t><br/><br/><t shadow='0' font='PuristaBold'>7. </t><t shadow='0' font='PuristaLight'>Assim que você cavar todo o minério bata com a picareta nele para pegar o minério.</t><br/><br/><t shadow='0' font='PuristaBold'>8. </t><t shadow='0' font='PuristaLight'>Repita o processo ate acabar todos os minérios do local.</t>"]
    ]],
    ["Regras",[
        ["Gerais","<t font='PuristaMedium' shadow='0' align='center' size='1.2'>REGRAS GERAIS</t><br/><br/><t shadow='0' font='PuristaBold'>1. </t><t shadow='0' font='PuristaLight'>É extremamente proibido o uso do metagaming ou seja obter informações OOC e levar para IC. EX: Chat da Steam,Lives,TS3,Discord e etc.</t><br/><br/><t shadow='0' font='PuristaBold'>2. </t><t shadow='0' font='PuristaLight'>É proibido deslogar no meio de uma ação de Roleplay. EX: Deslogar no meio de um assalto a banco, deslogar para não ser pego pela COP, deslogar no meio de uma abordagem policial etc.</t><br/><br/><t shadow='0' font='PuristaBold'>3. </t><t shadow='0' font='PuristaLight'>Matar um jogador sem motivo algum ou por algum motivo fútil. OBS: É proibido o uso de 'Recompensa ou Assassino de Aluguel' como razão para matar alguém.</t><br/><br/><t shadow='0' font='PuristaBold'>4. </t><t shadow='0' font='PuristaLight'>Utilizar o veículo como arma para matar indivíduos ou para atropelar sem motivo. OBS: SÓ É PERMITIDO ATROPELAR CASO SUA VIDA ESTEJA EM PERIGO, EX: ALGUM BANDIDO ESTÁ ATIRANDO EM VOCÊ OU ALGUÉM ESTÁ TE AMEAÇANDO, NESSES CASOS VOCÊ PODERÁ ATROPELAR APENAS PARA FUGIR/ESCAPAR.</t><br/><br/><t shadow='0' font='PuristaBold'>5. </t><t shadow='0' font='PuristaLight'>Você não poderá retornar ao local onde morreu durante (10) minutos ou se a ação ainda estiver ocorrendo.</t><br/><br/><t shadow='0' font='PuristaBold'>6. </t><t shadow='0' font='PuristaLight'>Proibido usar o chat (Twitter) para assuntos OOC.</t><br/><br/><t shadow='0' font='PuristaBold'>7. </t><t shadow='0' font='PuristaLight'>O '/anuncio' só poder ser utilizado para anúncios, sejam eles comerciais ou outros afins, ele não poderá ser utilizado por exemplo para conversar ou mandar uma mensagem para alguém.</t><br/><br/><t shadow='0' font='PuristaBold'>8. </t><t shadow='0' font='PuristaLight'>Proibido mandar mensagem no chat enquanto estiver rendido ou que esteja algemado.</t><br/><br/><t shadow='0' font='PuristaBold'>9. </t><t shadow='0' font='PuristaLight'>Caso a EMS lhe reviva você deve permanecer sob custódia e seguir as instruções dadas pelos mesmos, caso você não cumpra estará sujeito a punição.</t><br/><br/><t shadow='0' font='PuristaBold'>10. </t><t shadow='0' font='PuristaLight'>É proibido tocar músicas fora do veículo! Somentes memes são autorizados.</t>"],
        ["Teamspeak","<t font='PuristaMedium' shadow='0' align='center' size='1.2'>REGRAS DO TEAMSPEAK</t><br/><br/><t shadow='0' font='PuristaBold'>1. </t><t shadow='0' font='PuristaLight'>Proibido qualquer tipo de spam.</t><br/><br/><t shadow='0' font='PuristaBold'>2. </t><t shadow='0' font='PuristaLight'>SoundBoard/Modificadores de voz só são permitidos no Task Force (IN-GAME).</t><br/><br/><t shadow='0' font='PuristaBold'>3. </t><t shadow='0' font='PuristaLight'>Nome do TS3 deverá ser igual ao do jogo.</t><br/><br/><t shadow='0' font='PuristaBold'>4. </t><t shadow='0' font='PuristaLight'>Você deve permanecer no Task Force sempre que estiver conectado em nosso servidor.</t>"],
        ["Criminais","<t font='PuristaMedium' shadow='0' align='center' size='1.2'>REGRAS CRIMINAIS</t><br/><br/><t shadow='0' font='PuristaBold'>1. </t><t shadow='0' font='PuristaLight'>Atividade criminal excessiva ou comportamento que prejudica o servidor é passível de punição. Todo crime deve ter uma razão por trás.</t><br/><br/><t shadow='0' font='PuristaBold'>2. </t><t shadow='0' font='PuristaLight'>Toda iniciação deve ser verbal e dentro de RP.</t><br/><br/><t shadow='0' font='PuristaBold'>3. </t><t shadow='0' font='PuristaLight'>Indivíduos usando máscaras que cobrem totalmente seus rostos não podem ser identificados pelo nome ou som, apenas se eles lhe fornecerem essas informações ou você utilizar uma forma válida de identificação pela carteira de identidade. Necessita retirar a identificação do bolso do indivíduo por exemplo.</t><br/><br/><t shadow='0' font='PuristaBold'>4. </t><t shadow='0' font='PuristaLight'>É permitido a venda, a distribuição e a utilização dos equipamentos da polícia.</t><br/><br/><t shadow='0' font='PuristaBold'>5. </t><t shadow='0' font='PuristaLight'>Caso você esteja sendo preso e o servidor reinicie você deverá voltar para o RP e prosseguir com a situação após o restart.</t><br/><br/><t shadow='0' font='PuristaBold'>6. </t><t shadow='0' font='PuristaLight'>Situação de reféns e assaltos a banco só podem ser realizados quando houver pelo menos cinco (5) membros da Polícia.</t><br/><br/><t shadow='0' font='PuristaBold'>7. </t><t shadow='0' font='PuristaLight'>É necessário negociar antes de qualquer ação letal.</t><br/><br/><t shadow='0' font='PuristaBold'>8. </t><t shadow='0' font='PuristaLight'>Antes do término de uma negociação é necessário um anúncio entre os dois negociadores e deve-se esperar 10 segundos para que qualquer conflito seja iniciado.</t><br/><br/><t shadow='0' font='PuristaBold'>9. </t><t shadow='0' font='PuristaLight'>O número máximo de membros em uma gangue é 9.</t><br/><br/><t shadow='0' font='PuristaBold'>10. </t><t shadow='0' font='PuristaLight'>Assaltos a banco devem ser iniciados no mínimo 1 hora antes do restart.</t><br/><br/><t shadow='0' font='PuristaBold'>11. </t><t shadow='0' font='PuristaLight'>Proibido cometer crime com arma de paintball.</t><br/><br/><t shadow='0' font='PuristaBold'>12. </t><t shadow='0' font='PuristaLight'>É proibido qualquer tipo de crime contra a EMS ou roubar veículos de trabalho dos mesmos.</t><br/><br/><t shadow='0' font='PuristaBold'>13. </t><t shadow='0' font='PuristaLight'>O hospital é a única área Safe do servidor.</t><br/><br/><t shadow='0' font='PuristaBold'>14. </t><t shadow='0' font='PuristaLight'>É extremamente proibido interromper uma ação médica.</t><br/><br/><t shadow='0' font='PuristaBold'>15. </t><t shadow='0' font='PuristaLight'>É proibido assaltar após acidentes, por ex: Colisão de dois veículos.</t><br/><br/><t shadow='0' font='PuristaBold'>16. </t><t shadow='0' font='PuristaLight'>Roubar itens como pilha de materiais, tanques de combustível e qualquer outro item com a opção 'Roubar Objeto' requerem uma ação de assalto.</t><br/><br/><t shadow='0' font='PuristaBold'>17. </t><t shadow='0' font='PuristaLight'>É proibido intervir em uma ação externa ou seja sequestros e roubos a banco.</t><br/><br/><t shadow='0' font='PuristaBold'>18. </t><t shadow='0' font='PuristaLight'>Quando houverem atiradores fora do banco é necessário avisar a COP a quantidade de atiradores.</t><br/><br/><t shadow='0' font='PuristaBold'>19. </t><t shadow='0' font='PuristaLight'>É extremamente proibido forçar alguém a retirar dinheiro do banco seja por ameaça ou assalto.</t><br/><br/><t shadow='0' font='PuristaBold'>20. </t><t shadow='0' font='PuristaLight'>É proibido qualquer tipo de crime enquanto não houver 2 COPS online.</t>"]
    ]]
];
publicVariable "Config_Wiki";

/*

<t font='PuristaMedium' shadow='0' align='center' size='1.2'>Atualização 1.0 - Dia 01/01</t>
<br/><br/>
<t color='#00ff00' shadow='0' font='PuristaBold'>Adicionado: </t><t shadow='0' font='PuristaLight'>Exemplo</t><br/>
<t color='#00ff00' shadow='0' font='PuristaBold'>Adicionado: </t><t shadow='0' font='PuristaLight'>Exemplo</t>
<br/><br/>
<t color='#ff8000' shadow='0' font='PuristaBold'>Arrumado: </t><t shadow='0' font='PuristaLight'>Exemplo</t>
<br/><br/>
<t color='#cc0000' shadow='0' font='PuristaBold'>Removido: </t><t shadow='0' font='PuristaLight'>Exemplo</t>

*/
