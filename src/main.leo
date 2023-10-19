// The 'zk_texas_holdem' program.
program zk_texas_holdem.aleo {

    record GameState {
        owner: address,
        deck: u64,
        river: u64,
        players: u8,
        // player1_address: address,
        // player2_address: address,
        // player3_address: address,
        // player4_address: address,
        // player5_address: address,
        // player6_address: address,
        // player7_address: address,
        // player8_address: address,
        player1: u64,
        player2: u64,
        player3: u64,
        player4: u64,
        player5: u64,
        player6: u64,
        player7: u64,
        player8: u64,
    }

    record Invitation {
        owner: address,
        caller: address,
    }

    record Hand {
        owner: address,
        card1: u64,
        card2: u64,
    }

    record Seed {
        owner: address,
        seed: i8,
    }

    struct SplitDeck {
        c0: u64,
        c1: u64,
        c2: u64,
        c3: u64,
        c4: u64,
        c5: u64,
        c6: u64,
        c7: u64,
        c8: u64,
        c9: u64,
        c10: u64,
        c11: u64,
        c12: u64,
        c13: u64,
        c14: u64,
        c15: u64,
        c16: u64,
        c17: u64,
        c18: u64,
        c19: u64,
        c20: u64,
        c21: u64,
        c22: u64,
        c23: u64,
        c24: u64,
        c25: u64,
    }

    struct Deck {
        bottom: SplitDeck,
        top: SplitDeck,
    }

    function new_deck(init: bool) -> Deck {
        let mask: u64 = 1u64;
        return Deck {
            bottom: SplitDeck {
                c0: 9223372036854775808u64,
                c1: 4611686018427387904u64,
                c2: 2305843009213693952u64,
                c3: 1152921504606846976u64,
                c4: 576460752303423488u64,
                c5: 288230376151711744u64,
                c6: 144115188075855872u64,
                c7: 72057594037927936u64,
                c8: 36028797018963968u64,
                c9: 18014398509481984u64,
                c10: 9007199254740992u64,
                c11: 4503599627370496u64,
                c12: 2251799813685248u64,
                c13: 1125899906842624u64,
                c14: 562949953421312u64,
                c15: 281474976710656u64,
                c16: 140737488355328u64,
                c17: 70368744177664u64,
                c18: 35184372088832u64,
                c19: 17592186044416u64,
                c20: 8796093022208u64,
                c21: 4398046511104u64,
                c22: 2199023255552u64,
                c23: 1099511627776u64,
                c24: 549755813888u64,
                c25: 274877906944u64,
            },
            top: SplitDeck {
                c0: 137438953472u64,
                c1: 68719476736u64,
                c2: 34359738368u64,
                c3: 17179869184u64,
                c4: 8589934592u64,
                c5: 4294967296u64,
                c6: 2147483648u64,
                c7: 1073741824u64,
                c8: 536870912u64,
                c9: 268435456u64,
                c10: 134217728u64,
                c11: 67108864u64,
                c12: 33554432u64,
                c13: 16777216u64,
                c14: 8388608u64,
                c15: 4194304u64,
                c16: 2097152u64,
                c17: 1048576u64,
                c18: 524288u64,
                c19: 262144u64,
                c20: 131072u64,
                c21: 65536u64,
                c22: 32768u64,
                c23: 16384u64,
                c24: 8192u64,
                c25: 4096u64,
            },
        };
    }

    function setup_shuffle(seed: i8, deck: Deck) -> (i8, SplitDeck, SplitDeck) {
        let n: i8 = seed.abs();
        let a: SplitDeck = SplitDeck {
            c0: deck.bottom.c0,
            c1: deck.bottom.c1,
            c2: deck.bottom.c2,
            c3: deck.bottom.c3,
            c4: deck.bottom.c4,
            c5: deck.bottom.c5,
            c6: deck.bottom.c6,
            c7: deck.bottom.c7,
            c8: deck.bottom.c8,
            c9: deck.bottom.c9,
            c10: deck.bottom.c10,
            c11: deck.bottom.c11,
            c12: deck.bottom.c12,
            c13: deck.bottom.c13,
            c14: deck.bottom.c14,
            c15: deck.bottom.c15,
            c16: deck.bottom.c16,
            c17: deck.bottom.c17,
            c18: deck.bottom.c18,
            c19: deck.bottom.c19,
            c20: deck.bottom.c20,
            c21: deck.bottom.c21,
            c22: deck.bottom.c22,
            c23: deck.bottom.c23,
            c24: deck.bottom.c24,
            c25: deck.bottom.c25,
        };
        let b: SplitDeck = SplitDeck {
            c0: deck.top.c0,
            c1: deck.top.c1,
            c2: deck.top.c2,
            c3: deck.top.c3,
            c4: deck.top.c4,
            c5: deck.top.c5,
            c6: deck.top.c6,
            c7: deck.top.c7,
            c8: deck.top.c8,
            c9: deck.top.c9,
            c10: deck.top.c10,
            c11: deck.top.c11,
            c12: deck.top.c12,
            c13: deck.top.c13,
            c14: deck.top.c14,
            c15: deck.top.c15,
            c16: deck.top.c16,
            c17: deck.top.c17,
            c18: deck.top.c18,
            c19: deck.top.c19,
            c20: deck.top.c20,
            c21: deck.top.c21,
            c22: deck.top.c22,
            c23: deck.top.c23,
            c24: deck.top.c24,
            c25: deck.top.c25,
        };
        if (seed < 0i8) {
            a = b;
            b = a;
        }
        return (n, a, b);
    }

    function shuffle_deck(n: i8, a: SplitDeck, b: SplitDeck) -> Deck {
        let c0: u64 = 0u64;
        let c1: u64 = 0u64;
        let c2: u64 = 0u64;
        let c3: u64 = 0u64;
        let c4: u64 = 0u64;
        let c5: u64 = 0u64;
        let c6: u64 = 0u64;
        let c7: u64 = 0u64;
        let c8: u64 = 0u64;
        let c9: u64 = 0u64;
        let c10: u64 = 0u64;
        let c11: u64 = 0u64;
        let c12: u64 = 0u64;
        let c13: u64 = 0u64;
        let c14: u64 = 0u64;
        let c15: u64 = 0u64;
        let c16: u64 = 0u64;
        let c17: u64 = 0u64;
        let c18: u64 = 0u64;
        let c19: u64 = 0u64;
        let c20: u64 = 0u64;
        let c21: u64 = 0u64;
        let c22: u64 = 0u64;
        let c23: u64 = 0u64;
        let c24: u64 = 0u64;
        let c25: u64 = 0u64;
        let c26: u64 = 0u64;
        let c27: u64 = 0u64;
        let c28: u64 = 0u64;
        let c29: u64 = 0u64;
        let c30: u64 = 0u64;
        let c31: u64 = 0u64;
        let c32: u64 = 0u64;
        let c33: u64 = 0u64;
        let c34: u64 = 0u64;
        let c35: u64 = 0u64;
        let c36: u64 = 0u64;
        let c37: u64 = 0u64;
        let c38: u64 = 0u64;
        let c39: u64 = 0u64;
        let c40: u64 = 0u64;
        let c41: u64 = 0u64;
        let c42: u64 = 0u64;
        let c43: u64 = 0u64;
        let c44: u64 = 0u64;
        let c45: u64 = 0u64;
        let c46: u64 = 0u64;
        let c47: u64 = 0u64;
        let c48: u64 = 0u64;
        let c49: u64 = 0u64;
        let c50: u64 = 0u64;
        let c51: u64 = 0u64;
        let b_index: u8 = 0u8;
        let a_index: u8 = 26u8;
        for i: i8 in 0i8..52i8 {
            let hit: bool = false;
            let use_a: bool = false;
            let use_b: bool = false;
            if (!hit && i < n) {
                use_b = true;
                hit = true;
            }
            if (!hit && (i - n) % 2i8 == 0i8) {
                use_a = true;
                hit = true;
            }
            if (!hit) {
                if (b_index < 26u8) {
                    use_b = true;
                    hit = true;
                } else {
                    use_a = true;
                    hit = true;
                }
            }
            assert(hit);
            if (use_a) {
                // Assign the card to the correct position in the deck
                if (a_index == 26u8) {
                    c0 = a.c0;
                }
                if (a_index == 27u8) {
                    c1 = a.c1;
                }
                if (a_index == 28u8) {
                    c2 = a.c2;
                }
                if (a_index == 29u8) {
                    c3 = a.c3;
                }
                if (a_index == 30u8) {
                    c4 = a.c4;
                }
                if (a_index == 31u8) {
                    c5 = a.c5;
                }
                if (a_index == 32u8) {
                    c6 = a.c6;
                }
                if (a_index == 33u8) {
                    c7 = a.c7;
                }
                if (a_index == 34u8) {
                    c8 = a.c8;
                }
                if (a_index == 35u8) {
                    c9 = a.c9;
                }
                if (a_index == 36u8) {
                    c10 = a.c10;
                }
                if (a_index == 37u8) {
                    c11 = a.c11;
                }
                if (a_index == 38u8) {
                    c12 = a.c12;
                }
                if (a_index == 39u8) {
                    c13 = a.c13;
                }
                if (a_index == 40u8) {
                    c14 = a.c14;
                }
                if (a_index == 41u8) {
                    c15 = a.c15;
                }
                if (a_index == 42u8) {
                    c16 = a.c16;
                }
                if (a_index == 43u8) {
                    c17 = a.c17;
                }
                if (a_index == 44u8) {
                    c18 = a.c18;
                }
                if (a_index == 45u8) {
                    c19 = a.c19;
                }
                if (a_index == 46u8) {
                    c20 = a.c20;
                }
                if (a_index == 47u8) {
                    c21 = a.c21;
                }
                if (a_index == 48u8) {
                    c22 = a.c22;
                }
                if (a_index == 49u8) {
                    c23 = a.c23;
                }
                if (a_index == 50u8) {
                    c24 = a.c24;
                }
                if (a_index == 51u8) {
                    c25 = a.c25;
                }
                a_index = a_index + 1u8;
            }
            if (use_b) {
                // Assign the card to the correct position in the deck
                if (b_index == 0u8) {
                    c26 = b.c0;
                }
                if (b_index == 1u8) {
                    c27 = b.c1;
                }
                if (b_index == 2u8) {
                    c28 = b.c2;
                }
                if (b_index == 3u8) {
                    c29 = b.c3;
                }
                if (b_index == 4u8) {
                    c30 = b.c4;
                }
                if (b_index == 5u8) {
                    c31 = b.c5;
                }
                if (b_index == 6u8) {
                    c32 = b.c6;
                }
                if (b_index == 7u8) {
                    c33 = b.c7;
                }
                if (b_index == 8u8) {
                    c34 = b.c8;
                }
                if (b_index == 9u8) {
                    c35 = b.c9;
                }
                if (b_index == 10u8) {
                    c36 = b.c10;
                }
                if (b_index == 11u8) {
                    c37 = b.c11;
                }
                if (b_index == 12u8) {
                    c38 = b.c12;
                }
                if (b_index == 13u8) {
                    c39 = b.c13;
                }
                if (b_index == 14u8) {
                    c40 = b.c14;
                }
                if (b_index == 15u8) {
                    c41 = b.c15;
                }
                if (b_index == 16u8) {
                    c42 = b.c16;
                }
                if (b_index == 17u8) {
                    c43 = b.c17;
                }
                if (b_index == 18u8) {
                    c44 = b.c18;
                }
                if (b_index == 19u8) {
                    c45 = b.c19;
                }
                if (b_index == 20u8) {
                    c46 = b.c20;
                }
                if (b_index == 21u8) {
                    c47 = b.c21;
                }
                if (b_index == 22u8) {
                    c48 = b.c22;
                }
                if (b_index == 23u8) {
                    c49 = b.c23;
                }
                if (b_index == 24u8) {
                    c50 = b.c24;
                }
                if (b_index == 25u8) {
                    c51 = b.c25;
                }
                b_index = b_index + 1u8;
            }
        }
        return Deck {
            bottom: SplitDeck {
                c0,
                c1,
                c2,
                c3,
                c4,
                c5,
                c6,
                c7,
                c8,
                c9,
                c10,
                c11,
                c12,
                c13,
                c14,
                c15,
                c16,
                c17,
                c18,
                c19,
                c20,
                c21,
                c22,
                c23,
                c24,
                c25,
            },
            top: SplitDeck {
                c0: c26,
                c1: c27,
                c2: c28,
                c3: c29,
                c4: c30,
                c5: c31,
                c6: c32,
                c7: c33,
                c8: c34,
                c9: c35,
                c10: c36,
                c11: c37,
                c12: c38,
                c13: c39,
                c14: c40,
                c15: c41,
                c16: c42,
                c17: c43,
                c18: c44,
                c19: c45,
                c20: c46,
                c21: c47,
                c22: c48,
                c23: c49,
                c24: c50,
                c25: c51,
            },
        };
    }

    transition main(public players: u8) -> GameState {
        // Here players is the number of players. Main initializes the game state and creates a record owned by the contract.
        // bit 0 is the first card, bit 1 is the second card
        // b1111111111111111111111111111111111111111111111111111000000000000;
        // Here all 52 bits start in the deck and the bits are 1, 0's are used to represent other portions of the game state
        // the value in 64-bit unsigned int would be:
        let mask: u64 = 1u64;
        let deck: u64 =  18446744073709547520u64;
        return GameState {
            owner: self.signer,
            deck,
            river: 0u64,
            players,
            // player1_address: address, // Maybe use a mapping instead of 8 addresses
            // player2_address: address,
            // player3_address: address,
            // player4_address: address,
            // player5_address: address,
            // player6_address: address,
            // player7_address: address,
            // player8_address: address,
            player1: 0u64,
            player2: 0u64,
            player3: 0u64,
            player4: 0u64,
            player5: 0u64,
            player6: 0u64,
            player7: 0u64,
            player8: 0u64,
        };
    }

    // transition shuffle(s0: Seed, s1: Seed, s2: Seed, s3: Seed, s4: Seed, s5: Seed, s6: Seed, s7: Seed) -> Deck {
    transition shuffle(s0: i8, s1: i8, s2: i8, s3: i8, s4: i8, s5: i8, s6: i8, s7: i8) -> Deck {
        // assert(self.caller = zk_texas_holdem.leo/start as address)
        let deck: Deck = new_deck(true);
        let (n1, a1, b1): (i8, SplitDeck, SplitDeck) = setup_shuffle(s0, deck);
        deck = shuffle_deck(n1, a1, b1);
        let (n2, a2, b2): (i8, SplitDeck, SplitDeck) = setup_shuffle(s1, deck);
        deck = shuffle_deck(n2, a2, b2);
        let (n3, a3, b3): (i8, SplitDeck, SplitDeck) = setup_shuffle(s2, deck);
        deck = shuffle_deck(n3, a3, b3);
        let (n4, a4, b4): (i8, SplitDeck, SplitDeck) = setup_shuffle(s3, deck);
        deck = shuffle_deck(n4, a4, b4);
        let (n5, a5, b5): (i8, SplitDeck, SplitDeck) = setup_shuffle(s4, deck);
        deck = shuffle_deck(n5, a5, b5);
        let (n6, a6, b6): (i8, SplitDeck, SplitDeck) = setup_shuffle(s5, deck);
        deck = shuffle_deck(n6, a6, b6);
        let (n7, a7, b7): (i8, SplitDeck, SplitDeck) = setup_shuffle(s6, deck);
        deck = shuffle_deck(n7, a7, b7);
        let (n8, a8, b8): (i8, SplitDeck, SplitDeck) = setup_shuffle(s7, deck);
        deck = shuffle_deck(n8, a8, b8);
        return deck;
    }

    transition invite(state: GameState, player: address) -> (GameState, Invitation) {
        // TODO: Update GameState to include the player's address
        return (
            state,
            Invitation {
                owner: player,
                caller: self.caller,
            }
        );
    }

    transition accept(invitation: Invitation, seed: i8) -> Seed {
        assert(seed.abs() >= 1i8);
        assert(seed.abs() <= 26i8);
        return Seed {
            owner: invitation.caller,
            seed,
        };
    }
}
