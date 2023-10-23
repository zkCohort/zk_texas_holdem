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
        deck: [[u8; 26]; 2],
    }

    record Seat {
        owner: address,
        table_id: group,
        player_sequence: u8,
        deck: [[u8; 26]; 2],
    }

    record Deck {
        owner: address,
        caller: address,
        table_id: group,
        initial_salt: scalar,
        commitments: [[group; 26]; 2],
        salts: [[scalar; 26]; 2],
    }

    record Hand {
        owner: address,
        cards: u64,
    }

    struct TableState {
        table_id: group,
        player_index: u8,
        players: [address; 9],
        winner: address,
        rounds: u32,
        pot: u64,
        passed: [bool; 9],
        folded: [bool; 9],
    }

    mapping table_index: group => TableState;

    function euler_totient(n: u64) -> u64 {
        let result: u64 = n;
        for p: u64 in 2u64..18446744073709551615u64;
            if (n % p == 0u64) {
                n /= p;
                result -= result / p;
            }
        }

        if (n > 1u64) {
            result -= result / n;
        }

        return result;
    }

    transition create_table(public table_id: group) -> Table {
        let deck: [[u8; 26]; 2] = zk_dealer.leo/init_table(table_id);
        return 
            Table {
                owner: self.caller,
                table_id,
                deck,
            } then finalize (table_id);
    }

    finalize create_table(table_id: group) {
        let burn_address: field = 0field;
        let init_state: TableState = TableState {
            table_id,
            player_index: 0u8,
            players: [burn_address, burn_address, burn_address, burn_address, burn_address, burn_address, burn_address, burn_address, burn_address],
            winner: 0u8 as address,
            rounds: 0u32,
            pot: 0u64,
            passed: [false, false, false, false, false, false, false, false, false],
            folded: [false, false, false, false, false, false, false, false, false],
        };
        let state: TableState = Mapping::get_or_use(table_index, table_id, init_state);
        assert(state == init_state);
        Mapping::set(table_index, table_id, state);
    }

    // The cards can be converted to u64 where one bit is flipped to determine position.  The deck is 
    // represented as a 2x26 array of u8.  The first row represents the bottom of
    // the deck and the second row represents the top of the deck.  The deck is shuffled by each player
    // following the mental poker shuffle algorithm:

    // 1. Alice and Bob agree on a certain "deck" of cards. In practice, this means they agree on a set of 
    //    numbers or other data such that each element of the set represents a card.  This contract utilizes
    //    u8 to represent 52 cards.  With the possibility to bit shift 1u64 << 63u8 to represent the first
    //    and 1u64 << 12u8 to represent the last card.
    // 2. Alice picks a salt to commit to each card in the deck.  The salt is a scalar value.  The salt is
    //    used to generate a commitment for each card in the deck.  The commitment is a group element.
    // 3. Alice shuffles the cards.  The shuffle is a series of 7 shuffles.  Each shuffle is i8 between
    //    absolute values 1i8..26i8 (52/2).
    // 4. Alice sends the commitments to Bob.
    transition shuffle_and_pass(deck: Deck, seat: Seat, salt: scalar, shuffles: [i8; 7], player: address) -> (Deck, Deck) {
        let c0: group = 0group;
        let c1: group = 0group;
        let c2: group = 0group;
        let c3: group = 0group;
        let c4: group = 0group;
        let c5: group = 0group;
        let c6: group = 0group;
        let c7: group = 0group;
        let c8: group = 0group;
        let c9: group = 0group;
        let c10: group = 0group;
        let c11: group = 0group;
        let c12: group = 0group;
        let c13: group = 0group;
        let c14: group = 0group;
        let c15: group = 0group;
        let c16: group = 0group;
        let c17: group = 0group;
        let c18: group = 0group;
        let c19: group = 0group;
        let c20: group = 0group;
        let c21: group = 0group;
        let c22: group = 0group;
        let c23: group = 0group;
        let c24: group = 0group;
        let c25: group = 0group;

        for i: u8 in 0u8..2u8 {
            for j: u8 in 0u8..26u8 {
                assert(deck[i][j] <= 63u8);
                assert(deck[i][j] >= 12u8);
                // assert the cards are in inital order 63u8..12u8
                assert(deck[i][j] == 63u8 - (26u8 * i) + i + j);
                if (j == 0u8) {
                    c0 = Pedersen64::commit_to_group(deck[i][j], salt);
                }
                if (j == 1u8) {
                    c1 = Pedersen64::commit_to_group(deck[i][j], salt);
                }
                if (j == 2u8) {
                    c2 = Pedersen64::commit_to_group(deck[i][j], salt);
                }
                if (j == 3u8) {
                    c3 = Pedersen64::commit_to_group(deck[i][j], salt);
                }
                if (j == 4u8) {
                    c4 = Pedersen64::commit_to_group(deck[i][j], salt);
                }
                if (j == 5u8) {
                    c5 = Pedersen64::commit_to_group(deck[i][j], salt);
                }
                if (j == 6u8) {
                    c6 = Pedersen64::commit_to_group(deck[i][j], salt);
                }
                if (j == 7u8) {
                    c7 = Pedersen64::commit_to_group(deck[i][j], salt);
                }
                if (j == 8u8) {
                    c8 = Pedersen64::commit_to_group(deck[i][j], salt);
                }
                if (j == 9u8) {
                    c9 = Pedersen64::commit_to_group(deck[i][j], salt);
                }
                if (j == 10u8) {
                    c10 = Pedersen64::commit_to_group(deck[i][j], salt);
                }
                if (j == 11u8) {
                    c11 = Pedersen64::commit_to_group(deck[i][j], salt);
                }
                if (j == 12u8) {
                    c12 = Pedersen64::commit_to_group(deck[i][j], salt);
                }
                if (j == 13u8) {
                    c13 = Pedersen64::commit_to_group(deck[i][j], salt);
                }
                if (j == 14u8) {
                    c14 = Pedersen64::commit_to_group(deck[i][j], salt);
                }
                if (j == 15u8) {
                    c15 = Pedersen64::commit_to_group(deck[i][j], salt);
                }
                if (j == 16u8) {
                    c16 = Pedersen64::commit_to_group(deck[i][j], salt);
                }
                if (j == 17u8) {
                    c17 = Pedersen64::commit_to_group(deck[i][j], salt);
                }
                if (j == 18u8) {
                    c18 = Pedersen64::commit_to_group(deck[i][j], salt);
                }
                if (j == 19u8) {
                    c19 = Pedersen64::commit_to_group(deck[i][j], salt);
                }
                if (j == 20u8) {
                    c20 = Pedersen64::commit_to_group(deck[i][j], salt);
                }
                if (j == 21u8) {
                    c21 = Pedersen64::commit_to_group(deck[i][j], salt);
                }
                if (j == 22u8) {
                    c22 = Pedersen64::commit_to_group(deck[i][j], salt);
                }
                if (j == 23u8) {
                    c23 = Pedersen64::commit_to_group(deck[i][j], salt);
                }
                if (j == 24u8) {
                    c24 = Pedersen64::commit_to_group(deck[i][j], salt);
                }
                if (j == 25u8) {
                    c25 = Pedersen64::commit_to_group(deck[i][j], salt);
                }
            }
            if (i == 0u8) {
                bottom_half = [c0, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, 
                                            c11, c12, c13, c14, c15, c16, c17, c18, c19, c20, 
                                            c21, c22, c23, c24, c25];
            }
            else {
                top_half = [c0, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, 
                                         c11, c12, c13, c14, c15, c16, c17, c18, c19, c20, 
                                         c21, c22, c23, c24, c25];
            }
        }
        let commitments: [[group; 26]; 2] = [bottom_half, top_half];
        let shuffled_deck: [[group; 26]; 2] = zk_deck_shuffle.leo/shuffle(commitments, shuffles);
        let salts: [[scalar; 26]; 2] = [[0scalar, 0scalar, 0scalar, 0scalar, 0scalar, 0scalar, 0scalar, 0scalar, 0scalar, 0scalar, 0scalar, 
                                            0scalar, 0scalar, 0scalar, 0scalar, 0scalar, 0scalar, 0scalar, 0scalar, 0scalar, 0scalar, 
                                            0scalar, 0scalar, 0scalar, 0scalar, 0scalar],[0scalar, 0scalar, 0scalar, 0scalar, 0scalar, 0scalar, 0scalar, 0scalar, 0scalar, 0scalar, 0scalar, 
                                            0scalar, 0scalar, 0scalar, 0scalar, 0scalar, 0scalar, 0scalar, 0scalar, 0scalar, 0scalar, 
                                            0scalar, 0scalar, 0scalar, 0scalar, 0scalar]];
        return (Deck {
            owner: self.caller,
            caller: self.caller,
            table_id: seat.table_id,
            commitments,
            initial_salt: salt,
            salts,
        }, Deck {
            owner: player,
            caller: self.caller,
            table_id: seat.table_id,
            commitments,
            initial_salt: salt,
            salts,
        });
        // }) then finalize (seat.table_id, seat.player_sequence, player);
    }

    // 5. Bob picks a salt to commit to each of Alice's cards in the deck.  
    //    The contract keeps track of 1 salt per card in an array.
    // 6. Bob sends the new commitments to Alice.
    // transition shuffle_and_return() -> Deck {
    //     return Deck {
    //         owner: self.caller,
    //         table_id: 0u8 as group,
    //         cards: [[0u8 as group; 26]; 2],
    //         commitments: [[0u8 as group; 26]; 2],
    //         initial_salt: 0u8 as scalar,
    //         salts: [[scalar; 26]; 2],
    //     };
    // }

    // transition take_seat_at_table(table_id: group, player_sequence: u8, salt: scalar, selected_seeds: [field; 7]) -> Seat {
    //     // let res: bool = zk_dealer.leo/init_player(table_id, salt, selected_seeds, self.caller);
    //     return Seat {
    //             owner: self.caller, 
    //             table_id,
    //             player_sequence,
    //             salt,
    //             selected_seeds,
    //         } then finalize(table_id, player_sequence, self.caller);
    // }

    // finalize take_seat_at_table(table_id: group, player_sequence: u8, player: address) {
    //     let fetched_state: TableState = Mapping::get(table_index, table_id);
    //     let player_index: u8 = fetched_state.player_index;
    //     let players: [address; 9] = fetched_state.players;
    //     let player0: address = players[0u8];
    //     let player1: address = players[1u8];
    //     let player2: address = players[2u8];
    //     let player3: address = players[3u8];
    //     let player4: address = players[4u8];
    //     let player5: address = players[5u8];
    //     let player6: address = players[6u8];
    //     let player7: address = players[7u8];
    //     let player8: address = players[8u8];
    //     let match: bool = false;
    //     if (!match && player0 == 0u8 as address) {
    //         player0 = player;
    //         match = true;
    //     }
    //     if (!match && player1 == 0u8 as address) {
    //         player1 = player;
    //         match = true;
    //     }
    //     if (!match && player2 == 0u8 as address) {
    //         player2 = player;
    //         match = true;
    //     }
    //     if (!match && player3 == 0u8 as address) {
    //         player3 = player;
    //         match = true;
    //     }
    //     if (!match && player4 == 0u8 as address) {
    //         player4 = player;
    //         match = true;
    //     }
    //     if (!match && player5 == 0u8 as address) {
    //         player5 = player;
    //         match = true;
    //     }
    //     if (!match && player6 == 0u8 as address) {
    //         player6 = player;
    //         match = true;
    //     }
    //     if (!match && player7 == 0u8 as address) {
    //         player7 = player;
    //         match = true;
    //     }
    //     if (!match && player8 == 0u8 as address) {
    //         player8 = player;
    //         match = true;
    //     }
    //     assert(match);
    //     assert(player_index < 9u8);
    //     player_index += 1u8;
    //     assert(player_sequence == player_index);
    //     let state: TableState = TableState {
    //         table_id,
    //         player_index,
    //         players,
    //         winner: fetched_state.winner,
    //         rounds: fetched_state.rounds,
    //         pot: fetched_state.pot,
    //         folded: fetched_state.folded,
    //     };
    //     Mapping::set(table_index, table_id, state);
    // }

    // transition shuffle_and_deal(table: Table, commitments: [group; 9], player_index: u8, players: [address; 9]) -> (Hand, Hand, Hand, Hand, Hand, Hand, Hand, Hand, Hand) {
    //     // let shuffles: [i8; 7] = zk_dealer.leo/determine_shuffles(table, commitments);
    //     let s0: i8 = shuffles[0u8];
    //     let s1: i8 = shuffles[1u8];
    //     let s2: i8 = shuffles[2u8];
    //     let s3: i8 = shuffles[3u8];
    //     let s4: i8 = shuffles[4u8];
    //     let s5: i8 = shuffles[5u8];
    //     let s6: i8 = shuffles[6u8];
    //     let deck: [[u8; 26]; 2] = zk_deck_shuffle.leo/shuffle(s0, s1, s2, s3, s4, s5, s6);
    //     let hands: [[u8; 2]; 9] = zk_dealer.leo/deal(table.table_id, deck, player_index, players);
    //     return (
    //         Hand {
    //             owner: players[0u8],
    //             cards: hands[0u8],
    //         },
    //         Hand {
    //             owner: players[1u8],
    //             cards: hands[1u8],
    //         },
    //         Hand {
    //             owner: players[2u8],
    //             cards: hands[2u8],
    //         },
    //         Hand {
    //             owner: players[3u8],
    //             cards: hands[3u8],
    //         },
    //         Hand {
    //             owner: players[4u8],
    //             cards: hands[4u8],
    //         },
    //         Hand {
    //             owner: players[5u8],
    //             cards: hands[5u8],
    //         },
    //         Hand {
    //             owner: players[6u8],
    //             cards: hands[6u8],
    //         },
    //         Hand {
    //             owner: players[7u8],
    //             cards: hands[7u8],
    //         },
    //         Hand {
    //             owner: players[8u8],
    //             cards: hands[8u8],
    //         },
    //     ) then finalize (table.table_id, player_index, players);
    // }

    // finalize shuffle_and_deal(table_id: group, player_index: u8, players: [address; 9]) {
    //     let fetched_state: TableState = Mapping::get(table_index, table_id);
    //     assert(players == fetched_state.players);
    //     assert(player_index == fetched_state.player_index);
    // }
}
