import zk_dealer.leo;
import zk_deck_shuffle.leo;

// The 'zk_texas_holdem' program.
program zk_texas_holdem.aleo {

    /// TODO: 
    //        1. Move shuffle helper and transistion shuffle to a import in a new directory imports/zk_deck_shuffle.aleo
    //        2. Make a dealer import program/transition who owns GameState and maintains which GameState can be shared with which party
    //        2a. Dealer program using self.signer calls shuffle and only program may access ShuffledDeck 
    //        3. Find use for coefficients or lagrange interpolation if deemed necessary (are they private or public candidates)
    //        4. coefficients with finite field p=53?
    //        5. Find a way to send your card u64 to the dealer to compare w/ the coeeficients which it knows of

    record Table {
        owner: address,
        table_id: group,
    }

    record Seat {
        owner: address,
        table_id: group,
        player_sequence: u8,
        salt: scalar,
        selected_seeds: [field; 7],
    }

    record Hand {
        owner: address,
        cards: [u8; 2],
    }

    struct TableState {
        table_id: group,
        player_index: u8,
        players: [address; 9],
        winner: address,
        rounds: u32,
        pot: u64,
        folded: [bool; 9],
    }

    mapping table_index: group => TableState;

    transition main(public table_id: group) -> (Table) {
        zk_dealer.leo/init_table(table_id);
        return 
            Table {
                owner: self.caller,
                table_id,
            } then finalize(table_id);
    }

    finalize main(table_id: group) {
        let init_state: TableState = TableState {
            table_id,
            player_index: 0u8,
            players: [0u8 as address, 0u8 as address, 0u8 as address, 0u8 as address, 0u8 as address, 0u8 as address, 0u8 as address, 0u8 as address, 0u8 as address],
            winner: 0u8 as address,
            rounds: 0u32,
            pot: 0u64,
            folded: [false, false, false, false, false, false, false, false, false],
        };
        let state: TableState = Mapping::get_or_use(table_index, table_id, init_state);
        assert(state == init_state);
        Mapping::set(table_index, table_id, state);
    }

    transition take_seat_at_table(table_id: group, player_sequence: u8, salt: scalar, selected_seeds: [field; 7]) -> Seat {
        let res: bool = zk_dealer.leo/init_player(table_id, salt, selected_seeds, self.caller);
        assert(res);
        return Seat {
                owner: self.caller, 
                table_id,
                player_sequence,
                salt,
                selected_seeds,
            } then finalize(table_id, player_sequence, self.caller);
    }

    finalize take_seat_at_table(table_id: group, player_sequence: u8, player: address) {
        let fetched_state: TableState = Mapping::get(table_index, table_id);
        let player_index: u8 = fetched_state.player_index;
        let players: [address; 9] = fetched_state.players;
        let player0: address = players[0u8];
        let player1: address = players[1u8];
        let player2: address = players[2u8];
        let player3: address = players[3u8];
        let player4: address = players[4u8];
        let player5: address = players[5u8];
        let player6: address = players[6u8];
        let player7: address = players[7u8];
        let player8: address = players[8u8];
        let match: bool = false;
        if (!match && player0 == 0u8 as address) {
            player0 = player;
            match = true;
        }
        if (!match && player1 == 0u8 as address) {
            player1 = player;
            match = true;
        }
        if (!match && player2 == 0u8 as address) {
            player2 = player;
            match = true;
        }
        if (!match && player3 == 0u8 as address) {
            player3 = player;
            match = true;
        }
        if (!match && player4 == 0u8 as address) {
            player4 = player;
            match = true;
        }
        if (!match && player5 == 0u8 as address) {
            player5 = player;
            match = true;
        }
        if (!match && player6 == 0u8 as address) {
            player6 = player;
            match = true;
        }
        if (!match && player7 == 0u8 as address) {
            player7 = player;
            match = true;
        }
        if (!match && player8 == 0u8 as address) {
            player8 = player;
            match = true;
        }
        assert(match);
        assert(player_index < 9u8);
        player_index += 1u8;
        assert(player_sequence == player_index);
        let state: TableState = TableState {
            table_id,
            player_index,
            players,
            winner: fetched_state.winner,
            rounds: fetched_state.rounds,
            pot: fetched_state.pot,
            folded: fetched_state.folded,
        };
        Mapping::set(table_index, table_id, state);
    }

    transition shuffle_and_deal(table: Table, commitments: [group; 9], player_index: u8, players: [address; 9]) -> (Hand, Hand, Hand, Hand, Hand, Hand, Hand, Hand, Hand) {
        let shuffles: [i8; 7] = zk_dealer.leo/determine_shuffles(table, commitments);
        let s0: i8 = shuffles[0u8];
        let s1: i8 = shuffles[1u8];
        let s2: i8 = shuffles[2u8];
        let s3: i8 = shuffles[3u8];
        let s4: i8 = shuffles[4u8];
        let s5: i8 = shuffles[5u8];
        let s6: i8 = shuffles[6u8];
        let deck: [[u8; 26]; 2] = zk_deck_shuffle.leo/shuffle(s0, s1, s2, s3, s4, s5, s6);
        let hands: [[u8; 2]; 9] = zk_dealer.leo/deal(table.table_id, deck, player_index, players);
        return (
            Hand {
                owner: players[0u8],
                cards: hands[0u8],
            },
            Hand {
                owner: players[1u8],
                cards: hands[1u8],
            },
            Hand {
                owner: players[2u8],
                cards: hands[2u8],
            },
            Hand {
                owner: players[3u8],
                cards: hands[3u8],
            },
            Hand {
                owner: players[4u8],
                cards: hands[4u8],
            },
            Hand {
                owner: players[5u8],
                cards: hands[5u8],
            },
            Hand {
                owner: players[6u8],
                cards: hands[6u8],
            },
            Hand {
                owner: players[7u8],
                cards: hands[7u8],
            },
            Hand {
                owner: players[8u8],
                cards: hands[8u8],
            },
        ) then finalize (table.table_id, player_index, players);
    }

    finalize shuffle_and_deal(table_id: group, player_index: u8, players: [address; 9]) {
        let fetched_state: TableState = Mapping::get(table_index, table_id);
        assert(players == fetched_state.players);
        assert(player_index == fetched_state.player_index);
    }
}
