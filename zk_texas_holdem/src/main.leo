import zk_sra_encryption_v0_0_2.aleo;
import zk_deck_shuffle_v0_0_1.aleo;

// The 'zk_texas_holdem' program.
program zk_texas_holdem.aleo {

    struct Players {
        player0: address,
        player1: address,
        player2: address,
        player3: address,
        player4: address,
        player5: address,
        player6: address,
        player7: address,
        player8: address,
    }

    struct GameState {
        active: bool,
        player_count: u8,
        players: Players,
        next_players: Players,
        phi: field,
        n: u128,
        deck: [[field; 26]; 2],
        pointer_i: u8,
        pointer_j: u8,
        hands: [[field; 2]; 9],
        flop: [field; 3],
        turn: field,
        river: field,
        hands_ij: [[[u8; 2]; 2]; 9],
        flop_ij: [[u8; 2]; 3],
        turn_ij: [u8; 2],
        river_ij: [u8; 2],
        hands_d: [[[field; 2]; 9]; 9],
        flop_d: [[field; 3]; 9],
        turn_d: [field; 9],
        river_d: [field; 9],
        deck_ready: bool,
        hands_dealt: bool
        flop_dealt: bool
        turn_dealt: bool
        river_dealt: bool
    }

    record Player {
        owner: address,
        table_address: address,
        index: u8,
        phi: field, // Eulier's Totient Used to setup e, d, deck_e, deck_d
        n: u128,  // Semi Prime N used to setup e, d, deck_e, deck_d
        e: field, // Public SRA key
        d: field, // Private SRA key
        deck_e: [[field; 26]; 2], // Individual Card Public SRA keys
        deck_d: [[field; 26]; 2], // Individual Card Private SRA keys
    }

    record Deck {
        owner: address,
        cards: [[field; 26]; 2],
    }

    record Card { // Not used if everything is done with mappings
        owner: address,
        card: field,
    }

    mapping game_state_map: address => GameState;

    transition init_players(player0: address, player1: address, player2: address, player3: address, player4: address, player5: address, player6: address, player7: address, player8: address) -> Players {
        return Players {
            player0,
            player1,
            player2,
            player3,
            player4,
            player5,
            player6,
            player7,
            player8,
        };
    }

    transition setup_game(players: Players, phi: field, n: u128) -> Deck {
        const burn_address: address = aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0;
        let player0: address = players.player0;
        assert_neq(player0, burn_address);
        assert_eq(player0, self.caller);
        let player1: address = players.player1;
        let player2: address = players.player2;
        let player3: address = players.player3;
        let player4: address = players.player4;
        let player5: address = players.player5;
        let player6: address = players.player6;
        let player7: address = players.player7;
        let player8: address = players.player8;
        let p0: address = player0;
        let p1: address = burn_address;
        let p2: address = burn_address;
        let p3: address = burn_address;
        let p4: address = burn_address;
        let p5: address = burn_address;
        let p6: address = burn_address;
        let p7: address = burn_address;
        let p8: address = burn_address;
        let n0: address = burn_address;
        let n1: address = burn_address;
        let n2: address = burn_address;
        let n3: address = burn_address;
        let n4: address = burn_address;
        let n5: address = burn_address;
        let n6: address = burn_address;
        let n7: address = burn_address;
        let n8: address = burn_address;
        let count: u8 = 1u8;
        if (player1 != burn_address) {
            p1 = player1;
            n0 = player1;
            count += 1u8;
        }
        if (player2 != burn_address) {
            p2 = player2;
            n1 = player2;
            count += 1u8;
        }
        if (player3 != burn_address) {
            p3 = player3;
            n2 = player3;
            count += 1u8;
        }
        if (player4 != burn_address) {
            p4 = player4;
            n3 = player4;
            count += 1u8;
        }
        if (player5 != burn_address) {
            p5 = player5;
            n4 = player5;
            count += 1u8;
        }
        if (player6 != burn_address) {
            p6 = player6;
            n5 = player6;
            count += 1u8;
        }
        if (player7 != burn_address) {
            p7 = player7;
            n6 = player7;
            count += 1u8;
        }
        if (player8 != burn_address) {
            p8 = player8;
            n7 = player8;
            count += 1u8;
        }
        assert(count > 1u8);
        // fix to wrap back to begging based on player count
        if (count == 2u8) {
            n1 = player0;
        }
        if (count == 3u8) {
            n2 = player0;
        }
        if (count == 4u8) {
            n3 = player0;
        }
        if (count == 5u8) {
            n4 = player0;
        }
        if (count == 6u8) {
            n5 = player0;
        }
        if (count == 7u8) {
            n6 = player0;
        }
        if (count == 8u8) {
            n7 = player0;
        }
        if (count == 9u8) {
            n8 = player0;
        }
        let updated_players: Players = Players {
            player0: p0,
            player1: p1,
            player2: p2,
            player3: p3,
            player4: p4,
            player5: p5,
            player6: p6,
            player7: p7,
            player8: p8,
        };
        let next_players: Players = Players {
            player0: n0,
            player1: n1,
            player2: n2,
            player3: n3,
            player4: n4,
            player5: n5,
            player6: n6,
            player7: n7,
            player8: n8,
        };
        return Deck {
            owner: self.caller,
            cards: initial_deck(),
        } then finalize (self.caller, count, updated_players, next_players, phi, n);
    }

    finalize setup_game(caller: address, player_count: u8, players: Players, next_players: Players, phi: field, n: u128) {
        let updated_game_state: GameState = GameState {
            active: true,
            player_count,
            players,
            next_players,
            phi,
            n,
            deck: initial_deck(),
            pointer_i: 0u8,
            pointer_j: 0u8,
            hands: [[0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field]],
            flop: [0field, 0field, 0field],
            turn: 0field,
            river: 0field,
            hands_ij: [[[0u8, 0u8], [0u8, 0u8]], [[0u8, 0u8], [0u8, 0u8]], [[0u8, 0u8], [0u8, 0u8]], [[0u8, 0u8], [0u8, 0u8]], [[0u8, 0u8], [0u8, 0u8]], [[0u8, 0u8], [0u8, 0u8]], [[0u8, 0u8], [0u8, 0u8]], [[0u8, 0u8], [0u8, 0u8]], [[0u8, 0u8], [0u8, 0u8]]],
            flop_ij: [[0u8, 0u8], [0u8, 0u8], [0u8, 0u8]],
            turn_ij: [0u8, 0u8],
            river_ij: [0u8, 0u8],
            hands_d: [[[0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field]], [[0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field]], [[0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field]], [[0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field]], [[0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field]], [[0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field]], [[0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field]], [[0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field]], [[0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field]]],
            flop_d: [[0field, 0field, 0field], [0field, 0field, 0field], [0field, 0field, 0field], [0field, 0field, 0field], [0field, 0field, 0field], [0field, 0field, 0field], [0field, 0field, 0field], [0field, 0field, 0field], [0field, 0field, 0field]],
            turn_d: [0field, 0field, 0field, 0field, 0field, 0field, 0field, 0field, 0field],
            river_d: [0field, 0field, 0field, 0field, 0field, 0field, 0field, 0field, 0field],
            deck_ready: false,
            hands_dealt: false,
            flop_dealt: false,
            turn_dealt: false,
            river_dealt: false,
        };
        Mapping::set(game_state_map, caller, updated_game_state);
    }

    // e is the public SRA key generated by client, d is the private SRA key generated by client
    transition join_game(table_address: address, players: Players, e: field, d: field, phi: field, n: u128) -> Player {
        let index: u8 = 0u8;
        if (players.player0 == self.caller) {
            index = 0u8;
        }
        if (players.player1 == self.caller) {
            index = 1u8;
        }
        if (players.player2 == self.caller) {
            index = 2u8;
        }
        if (players.player3 == self.caller) {
            index = 3u8;
        }
        if (players.player4 == self.caller) {
            index = 4u8;
        }
        if (players.player5 == self.caller) {
            index = 5u8;
        }
        if (players.player6 == self.caller) {
            index = 6u8;
        }
        if (players.player7 == self.caller) {
            index = 7u8;
        }
        if (players.player8 == self.caller) {
            index = 8u8;
        }
        return Player {
            owner: self.caller,
            table_address,
            index,
            phi,
            n,
            e,
            d,
            deck_e: empty_deck(),
            deck_d: empty_deck(),
        } then finalize (table_address, self.caller, phi, n);
    }

    finalize join_game(table_address: address, caller: address, phi: field, n: u128) {
        let game_state: GameState = Mapping::get(game_state_map, table_address);
        assert(game_state.active);
        assert(game_state.phi == phi);
        assert(game_state.n == n);
        let players: Players = game_state.players;
        let listed: bool = false;
        const burn_address: address = aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0;
        if (players.player0 == caller) {
            listed = true;
        } 
        if (players.player1 == caller) {
            listed = true;
        }
        if (players.player2 == caller) {
            listed = true;
        }
        if (players.player3 == caller) {
            listed = true;
        }
        if (players.player4 == caller) {
            listed = true;
        }
        if (players.player5 == caller) {
            listed = true;
        }
        if (players.player6 == caller) {
            listed = true;
        }
        if (players.player7 == caller) {
            listed = true;
        }
        if (players.player8 == caller) {
            listed = true;
        }
        assert(listed);
    }

    

    transition shuffle_and_pass(player: Player, deck: Deck, shuffles: [i8; 7], next_player: address) -> (Player, Deck) {
        let encrypted_deck: [[field; 26]; 2] = zk_sra_encryption_v0_0_2.aleo/encrypt_deck(player.e, player.n, deck.cards);
        let member_size: u16 = 128u16;
        for i: i8 in 0i8..7i8 {
            encrypted_deck = zk_deck_shuffle_v0_0_1.aleo/shuffle_deck(shuffles[i], member_size, encrypted_deck);
        }
        return (Player {
            owner: player.owner,
            table_address: player.table_address,
            index: player.index,
            phi: player.phi,
            n: player.n,
            e: player.e,
            d: player.d,
            deck_e: player.deck_e,
            deck_d: player.deck_d,
        }, Deck {
            owner: next_player as address,
            cards: encrypted_deck,
        }) then finalize (self.caller, player.table_address, next_player);
    }

    finalize shuffle_and_pass(player_address: address, table_address: address, next_player: address) {
        const burn_address: address = aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0;
        let game_state: GameState = Mapping::get(game_state_map, table_address);
        assert(game_state.active);
        let players: Players = game_state.players;
        let next_players: Players = game_state.next_players;
        if (players.player0 == player_address) {
            assert_eq(next_players.player0, next_player);
        }
        if (players.player1 == player_address) {
            assert_eq(next_players.player1, next_player);
        }
        if (players.player2 == player_address) {
            assert_eq(next_players.player2, next_player);
        }
        if (players.player3 == player_address) {
            assert_eq(next_players.player3, next_player);
        }
        if (players.player4 == player_address) {
            assert_eq(next_players.player4, next_player);
        }
        if (players.player5 == player_address) {
            assert_eq(next_players.player5, next_player);
        }
        if (players.player6 == player_address) {
            assert_eq(next_players.player6, next_player);
        }
        if (players.player7 == player_address) {
            assert_eq(next_players.player7, next_player);
        }
        if (players.player8 == player_address) {
            assert_eq(next_players.player8, next_player);
        }
    }

    transition decrypt_encrypt_each_then_pass(player: Player, deck: Deck, deck_e: [[field; 26]; 2], deck_d: [[field; 26]; 2], next_player: address) -> (Player, Deck) {
        let e: field = player.e;
        let d: field = player.d;
        let n: u128 = player.n;
        let decrypted_deck: [[field; 26]; 2] = zk_sra_encryption_v0_0_2.aleo/decrypt_deck(d, n, deck.cards);
        let encrypted_deck: [[field; 26]; 2] = zk_sra_encryption_v0_0_2.aleo/encrypt_deck_per_card(deck_e, n, decrypted_deck);
        return (
            Player {
                owner: self.caller,
                table_address: player.table_address,
                index: player.index,
                phi: player.phi,
                n: player.n,
                e: player.e,
                d: player.d,
                deck_e: deck_e,
                deck_d: deck_d,
            },
            Deck {
                owner: next_player,
                cards: encrypted_deck,
            }) then finalize (self.caller, player.table_address, next_player);
    }

    finalize decrypt_encrypt_each_then_pass(player_address: address, table_address: address, next_player: address) {
        const burn_address: address = aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0;
        let game_state: GameState = Mapping::get(game_state_map, table_address);
        assert(game_state.active);
        let players: Players = game_state.players;
        let next_players: Players = game_state.next_players;
        if (players.player0 == player_address) {
            assert_eq(next_players.player0, next_player);
        }
        if (players.player1 == player_address) {
            assert_eq(next_players.player1, next_player);
        }
        if (players.player2 == player_address) {
            assert_eq(next_players.player2, next_player);
        }
        if (players.player3 == player_address) {
            assert_eq(next_players.player3, next_player);
        }
        if (players.player4 == player_address) {
            assert_eq(next_players.player4, next_player);
        }
        if (players.player5 == player_address) {
            assert_eq(next_players.player5, next_player);
        }
        if (players.player6 == player_address) {
            assert_eq(next_players.player6, next_player);
        }
        if (players.player7 == player_address) {
            assert_eq(next_players.player7, next_player);
        }
        if (players.player8 == player_address) {
            assert_eq(next_players.player8, next_player);
        }
    }

    transition publish_deck(player: Player, deck: Deck) -> (Player, Deck) {
        return (Player {
            owner: self.caller,
            table_address: player.table_address,
            index: player.index,
            phi: player.phi,
            n: player.n,
            e: player.e,
            d: player.d,
            deck_e: deck.cards,
            deck_d: player.deck_d,
        }, Deck {
            owner: self.caller,
            cards: deck.cards,
        }) then finalize (self.caller, player.table_address, deck.cards);
    }

    finalize publish_deck(player_address: address, table_address: address, deck: [[field; 26]; 2]) {
        let game_state: GameState = Mapping::get(game_state_map, table_address);
        assert(game_state.active);
        let players: Players = game_state.players;
        assert_eq(players.player0, player_address);
        assert_eq(players.player0, table_address);
        let new_game_state: GameState = GameState {
            active: true,
            player_count: game_state.player_count,
            players: game_state.players,
            next_players: game_state.next_players,
            phi: game_state.phi,
            n: game_state.n,
            deck,
            pointer_i: 0u8,
            pointer_j: 0u8,
            hands: [[0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field]],
            flop: [0field, 0field, 0field],
            turn: 0field,
            river: 0field,
            hands_ij: [[[0u8, 0u8], [0u8, 0u8]], [[0u8, 0u8], [0u8, 0u8]], [[0u8, 0u8], [0u8, 0u8]], [[0u8, 0u8], [0u8, 0u8]], [[0u8, 0u8], [0u8, 0u8]], [[0u8, 0u8], [0u8, 0u8]], [[0u8, 0u8], [0u8, 0u8]], [[0u8, 0u8], [0u8, 0u8]], [[0u8, 0u8], [0u8, 0u8]]],
            flop_ij: [[0u8, 0u8], [0u8, 0u8], [0u8, 0u8]],
            turn_ij: [0u8, 0u8],
            river_ij: [0u8, 0u8],
            hands_d: [[[0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field]], [[0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field]], [[0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field]], [[0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field]], [[0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field]], [[0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field]], [[0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field]], [[0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field]], [[0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field]]],
            flop_d: [[0field, 0field, 0field], [0field, 0field, 0field], [0field, 0field, 0field], [0field, 0field, 0field], [0field, 0field, 0field], [0field, 0field, 0field], [0field, 0field, 0field], [0field, 0field, 0field], [0field, 0field, 0field]],
            turn_d: [0field, 0field, 0field, 0field, 0field, 0field, 0field, 0field, 0field],
            river_d: [0field, 0field, 0field, 0field, 0field, 0field, 0field, 0field, 0field],
            deck_ready: true,
            hands_dealt: false,
            flop_dealt: false,
            turn_dealt: false,
            river_dealt: false,
        };
        Mapping::set(game_state_map, table_address, new_game_state);
    }

    transition deal_flop(player: Player) -> Player {
        assert(player.owner == player.table_address);
        return Player {
            owner: self.caller,
            table_address: player.table_address,
            index: player.index,
            phi: player.phi,
            n: player.n,
            e: player.e,
            d: player.d,
            deck_e: player.deck_e,
            deck_d: player.deck_d,
        } then finalize (self.caller, player.table_address);
    }

    finalize deal_flop(player_address: address, table_address: address) {
        let game_state: GameState = Mapping::get(game_state_map, table_address);
        assert(game_state.active);
        assert_neq(game_state.flop_dealt, true);
        let deck: [[field; 26]; 2] = game_state.deck;
        let pointer_i: u8 = game_state.pointer_i;
        let pointer_j: u8 = game_state.pointer_j;
        let burn_result: (u8, u8) = burn_card(deck, pointer_i, pointer_j);
        pointer_i = burn_result.0;
        pointer_j = burn_result.1;
        let flop_result_1: (u8, u8, field) = pick_card(deck, pointer_i, pointer_j);
        let flop_result_2: (u8, u8, field) = pick_card(deck, flop_result_1.0, flop_result_1.1);
        let flop_result_3: (u8, u8, field) = pick_card(deck, flop_result_2.0, flop_result_2.1);
        pointer_i = flop_result_3.0;
        pointer_j = flop_result_3.1;
        let new_game_state: GameState = GameState {
            active: true,
            player_count: game_state.player_count,
            players: game_state.players,
            next_players: game_state.next_players,
            phi: game_state.phi,
            n: game_state.n,
            deck,
            pointer_i: pointer_i,
            pointer_j: pointer_j,
            hands: [[0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field]],
            flop: [flop_result_1.2, flop_result_2.2, flop_result_3.2],
            turn: 0field,
            river: 0field,
            hands_ij: [[[0u8, 0u8], [0u8, 0u8]], [[0u8, 0u8], [0u8, 0u8]], [[0u8, 0u8], [0u8, 0u8]], [[0u8, 0u8], [0u8, 0u8]], [[0u8, 0u8], [0u8, 0u8]], [[0u8, 0u8], [0u8, 0u8]], [[0u8, 0u8], [0u8, 0u8]], [[0u8, 0u8], [0u8, 0u8]], [[0u8, 0u8], [0u8, 0u8]]],
            flop_ij: [[flop_result_1.0, flop_result_1.1], [flop_result_2.0, flop_result_2.1], [flop_result_3.0, flop_result_3.1]],
            turn_ij: [0u8, 0u8],
            river_ij: [0u8, 0u8],
            hands_d: [[[0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field]], [[0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field]], [[0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field]], [[0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field]], [[0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field]], [[0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field]], [[0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field]], [[0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field]], [[0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field], [0field, 0field]]],
            flop_d: [[0field, 0field, 0field], [0field, 0field, 0field], [0field, 0field, 0field], [0field, 0field, 0field], [0field, 0field, 0field], [0field, 0field, 0field], [0field, 0field, 0field], [0field, 0field, 0field], [0field, 0field, 0field]],
            turn_d: [0field, 0field, 0field, 0field, 0field, 0field, 0field, 0field, 0field],
            river_d: [0field, 0field, 0field, 0field, 0field, 0field, 0field, 0field, 0field],
            deck_ready: game_state.deck_ready,
            hands_dealt: game_state.hands_dealt,
            flop_dealt: true,
            turn_dealt: false,
            river_dealt: false,
        };
        Mapping::set(game_state_map, table_address, new_game_state);
    }

    transition reveal_flop(player: Player, public c1: field, public c2: field, public c3: field, public d1: field, public d2: field, public d3: field) -> (field, field, field) {
        let deck_d: [[field; 26]; 2] = player.deck_d;
        let card1: field = zk_sra_encryption_v0_0_2.aleo/sra_decrypt(c1, d1, player.n);
        let card2: field = zk_sra_encryption_v0_0_2.aleo/sra_decrypt(c2, d2, player.n);
        let card3: field = zk_sra_encryption_v0_0_2.aleo/sra_decrypt(c3, d3, player.n);
        return (card1, card2, card3) then finalize (self.caller, player.table_address, player.index, deck_d, card1, card2, card3, c1, c2, c3, d1, d2, d3);
    }

    finalize reveal_flop(player: address, table_address: address, index: u8, deck_d: [[field; 26]; 2], card1: field, card2: field, card3: field, c1: field, c2: field, c3: field, d1: field, d2: field, d3: field) {
        let game_state: GameState = Mapping::get(game_state_map, table_address);
        assert(game_state.active);
        let flop: [field; 3] = game_state.flop;
        let flop_d: [[field; 3]; 9] = game_state.flop_d;
        let flop_ij: [[u8; 2]; 3] = game_state.flop_ij;
        let flop1: (u8, u8, field) = pick_card(game_state.deck, flop_ij[0u8][0u8], flop_ij[0u8][1u8]);
        let flop2: (u8, u8, field) = pick_card(game_state.deck, flop_ij[1u8][0u8], flop_ij[1u8][1u8]);
        let flop3: (u8, u8, field) = pick_card(game_state.deck, flop_ij[2u8][0u8], flop_ij[2u8][1u8]);
        let flop_key_1: (u8, u8, field) = pick_card(deck_d, flop_ij[0u8][0u8], flop_ij[0u8][1u8]);
        let flop_key_2: (u8, u8, field) = pick_card(deck_d, flop_ij[1u8][0u8], flop_ij[1u8][1u8]);
        let flop_key_3: (u8, u8, field) = pick_card(deck_d, flop_ij[2u8][0u8], flop_ij[2u8][1u8]);
        assert_eq(flop1.2, c1);
        assert_eq(flop2.2, c2);
        assert_eq(flop3.2, c3);
        assert_eq(flop_key_1.2, d1);
        assert_eq(flop_key_2.2, d2);
        assert_eq(flop_key_3.2, d3);
        if index == 0u8 {
            flop_d = [[d1, d2, d3], flop_d[1u8], flop_d[2u8], flop_d[3u8], flop_d[4u8], flop_d[5u8], flop_d[6u8], flop_d[7u8], flop_d[8u8]];
        }
        else if index == 1u8 {
            flop_d = [flop_d[0u8], [d1, d2, d3], flop_d[2u8], flop_d[3u8], flop_d[4u8], flop_d[5u8], flop_d[6u8], flop_d[7u8], flop_d[8u8]];
        }
        else if index == 2u8 {
            flop_d = [flop_d[0u8], flop_d[1u8], [d1, d2, d3], flop_d[3u8], flop_d[4u8], flop_d[5u8], flop_d[6u8], flop_d[7u8], flop_d[8u8]];
        }
        else if index == 3u8 {
            flop_d = [flop_d[0u8], flop_d[1u8], flop_d[2u8], [d1, d2, d3], flop_d[4u8], flop_d[5u8], flop_d[6u8], flop_d[7u8], flop_d[8u8]];
        }
        else if index == 4u8 {
            flop_d = [flop_d[0u8], flop_d[1u8], flop_d[2u8], flop_d[3u8], [d1, d2, d3], flop_d[5u8], flop_d[6u8], flop_d[7u8], flop_d[8u8]];
        }
        else if index == 5u8 {
            flop_d = [flop_d[0u8], flop_d[1u8], flop_d[2u8], flop_d[3u8], flop_d[4u8], [d1, d2, d3], flop_d[6u8], flop_d[7u8], flop_d[8u8]];
        }
        else if index == 6u8 {
            flop_d = [flop_d[0u8], flop_d[1u8], flop_d[2u8], flop_d[3u8], flop_d[4u8], flop_d[5u8], [d1, d2, d3], flop_d[7u8], flop_d[8u8]];
        }
        else if index == 7u8 {
            flop_d = [flop_d[0u8], flop_d[1u8], flop_d[2u8], flop_d[3u8], flop_d[4u8], flop_d[5u8], flop_d[6u8], [d1, d2, d3], flop_d[8u8]];
        }
        else if index == 8u8 {
            flop_d = [flop_d[0u8], flop_d[1u8], flop_d[2u8], flop_d[3u8], flop_d[4u8], flop_d[5u8], flop_d[6u8], flop_d[7u8], [d1, d2, d3]];
        }
        let new_game_state: GameState = GameState {
            active: true,
            player_count: game_state.player_count,
            players: game_state.players,
            next_players: game_state.next_players,
            phi: game_state.phi,
            n: game_state.n,
            deck: game_state.deck,
            pointer_i: game_state.pointer_i,
            pointer_j: game_state.pointer_j,
            hands: game_state.hands,
            flop: [card1, card2, card3],
            turn: 0field,
            river: 0field,
            hands_ij: game_state.hands_ij,
            flop_ij: game_state.flop_ij,
            turn_ij: game_state.turn_ij,
            river_ij: game_state.river_ij,
            hands_d: game_state.hands_d,
            flop_d,
            turn_d: game_state.turn_d,
            river_d: game_state.river_d,
            deck_ready: game_state.deck_ready,
            hands_dealt: game_state.hands_dealt,
            flop_dealt: game_state.flop_dealt,
            turn_dealt: game_state.turn_dealt,
            river_dealt: game_state.river_dealt,
        };
        Mapping::set(game_state_map, table_address, new_game_state);
    }

    inline burn_card(deck: [[field; 26]; 2], pointer_i: u8, pointer_j: u8) -> (u8, u8) {
        let new_pointer_i: u8 = 0u8;
        let new_pointer_j: u8 = 0u8;
        for i: u8 in 0u8..2u8 {
            if (i == pointer_i) {
                for j: u8 in 0u8..26u8 {
                    if (j == pointer_j) {
                        new_pointer_j = pointer_j + 1u8;
                        if (pointer_i == 0u8 && new_pointer_j == 26u8) {
                            new_pointer_j = 0u8;
                            new_pointer_i = pointer_i + 1u8;
                        }
                    }
                }
            }
        }
        return (new_pointer_i, new_pointer_j);
    }

    inline pick_card(deck: [[field; 26]; 2], pointer_i: u8, pointer_j: u8) -> (u8, u8, field) {
        let new_pointer_i: u8 = 0u8;
        let new_pointer_j: u8 = 0u8;
        let card: field = 0field;
        for i: u8 in 0u8..2u8 {
            if (i == pointer_i) {
                for j: u8 in 0u8..26u8 {
                    if (j == pointer_j) {
                        card = deck[i][j];
                        new_pointer_j = pointer_j + 1u8;
                        if (pointer_i == 0u8 && new_pointer_j == 26u8) {
                            new_pointer_j = 0u8;
                            new_pointer_i = pointer_i + 1u8;
                        }
                    }
                }
            }
        }
        return (new_pointer_i, new_pointer_j, card);
    }

    /// Reveal Card to Player

    inline initial_deck() -> [[field; 26]; 2] {
        return [[63field, 62field, 61field, 60field, 59field, 58field, 57field, 56field, 55field, 54field, 53field, 52field, 51field,
                 50field, 49field, 48field, 47field, 46field, 45field, 44field, 43field, 42field, 41field, 40field, 39field, 38field], 
                [37field, 36field, 35field, 34field, 33field, 32field, 31field, 30field, 29field, 28field, 27field, 26field, 25field,
                 24field, 23field, 22field, 21field, 20field, 19field, 18field, 17field, 16field, 15field, 14field, 13field, 12field]];
    }

    inline empty_deck() -> [[field; 26]; 2] {
        return [[0field, 0field, 0field, 0field, 0field, 0field,0field, 0field, 0field, 0field, 0field, 0field, 0field,
                 0field, 0field, 0field, 0field, 0field, 0field, 0field, 0field, 0field, 0field, 0field, 0field, 0field], 
                [0field, 0field, 0field, 0field, 0field, 0field,0field, 0field, 0field, 0field, 0field, 0field, 0field,
                 0field, 0field, 0field, 0field, 0field, 0field, 0field, 0field, 0field, 0field, 0field, 0field, 0field]];
    }
}
