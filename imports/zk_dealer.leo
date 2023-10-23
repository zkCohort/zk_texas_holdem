program zk_dealer.aleo {
    record GameState {
        owner: address,
        table_id: group,
        deck: u64,
        river: u64,
        hands: [u64; 9],
        seeds: [field; 9],
    }

    struct State {
        table_id: group,
        deck: group,
        river: u64,
        hands: [u64; 9],
        seeds: [field; 20],
        commitments: [group; 9],
    }

    mapping public_game_state: group => State;

    // function commitments_to_shuffles(commitments: [group; 9]) -> [i8; 7] {
    //     let commitment: group = 0group;
    //     let s0: i8 = 0i8;
    //     let s1: i8 = 0i8;
    //     let s2: i8 = 0i8;
    //     let s3: i8 = 0i8;
    //     let s4: i8 = 0i8;
    //     let s5: i8 = 0i8;
    //     let s6: i8 = 0i8;
    //     for i: u8 in 0u8..9u8 {
    //         let element: i8 = 0i8;
    //         commitment += commitments[i];
    //         element = commitment as i8 % 26i8;
    //         let sign: i8 = commitments[i] as i8 % 2i8;
    //         if (sign == 0i8) {
    //             element *= -1i8;
    //         }
    //         if (commitment % 7group == 0group) {
    //             s0 = element;
    //         }
    //         if (commitment % 7group == 1group) {
    //             s1 = element;
    //         }
    //         if (commitment % 7group == 2group) {
    //             s2 = element;
    //         }
    //         if (commitment % 7group == 3group) {
    //             s3 = element;
    //         }
    //         if (commitment % 7group == 4group) {
    //             s4 = element;
    //         }
    //         if (commitment % 7group == 5group) {
    //             s5 = element;
    //         }
    //         if (commitment % 7group == 6group) {
    //             s6 = element;
    //         }
    //     }
    //     assert(s0 != 0i8 && s1 != 0i8 && s2 != 0i8 && s3 != 0i8 && s4 != 0i8 && s5 != 0i8 && s6 != 0i8);
    //     return [s0, s1, s2, s3, s4, s5, s6];
    // }

    transition init_table(table_id: group) -> [[u8; 26]; 2] {
        let deck: [[u8; 26]; 2] = [[63u8, 62u8, 61u8, 60u8, 59u8, 58u8, 57u8, 56u8, 55u8, 54u8, 53u8, 52u8, 51u8, 50u8, 49u8, 48u8, 47u8, 46u8, 45u8, 44u8, 43u8, 42u8, 41u8, 40u8, 39u8, 38u8], [37u8, 36u8, 35u8, 34u8, 33u8, 32u8, 31u8, 30u8, 29u8, 28u8, 27u8, 26u8, 25u8, 24u8, 23u8, 22u8, 21u8, 20u8, 19u8, 18u8, 17u8, 16u8, 15u8, 14u8, 13u8, 12u8]];
        return deck then finalize(table_id);
    }
    
    finalize init_table(table_id: group) {
        let seed0: field = ChaCha::rand_field();
        let seed1: field = ChaCha::rand_field();
        let seed2: field = ChaCha::rand_field();
        let seed3: field = ChaCha::rand_field();
        let seed4: field = ChaCha::rand_field();
        let seed5: field = ChaCha::rand_field();
        let seed6: field = ChaCha::rand_field();
        let seed7: field = ChaCha::rand_field();
        let seed8: field = ChaCha::rand_field();
        let seed9: field = ChaCha::rand_field();
        let seed10: field = ChaCha::rand_field();
        let seed11: field = ChaCha::rand_field();
        let seed12: field = ChaCha::rand_field();
        let seed13: field = ChaCha::rand_field();
        let seed14: field = ChaCha::rand_field();
        let seed15: field = ChaCha::rand_field();
        let seed16: field = ChaCha::rand_field();
        let seed17: field = ChaCha::rand_field();
        let seed18: field = ChaCha::rand_field();
        let seed19: field = ChaCha::rand_field();
        let init_state: State = State {
            table_id,
            deck: 0group,
            river: 0u64,
            hands: [0u64, 0u64, 0u64, 0u64, 0u64, 0u64, 0u64, 0u64, 0u64],
            seeds: [seed0, seed1, seed2, seed3, seed4, seed5, seed6, seed7, seed8, seed9, seed10, seed11, seed12, seed13, seed14, seed15, seed16, seed17, seed18, seed19],
            commitments: [0group, 0group, 0group, 0group, 0group, 0group, 0group, 0group, 0group],
        };
        let state: State = Mapping::get_or_use(public_game_state, table_id, init_state);
        assert(state == init_state);
        Mapping::set(public_game_state, table_id, state);
    }

    // transition init_player(table_id: group, salt: scalar, selected_seeds: [field; 7], player: address) -> bool {
    //     let semi_random: field = 0field;
    //     let select_seed0: field = selected_seeds[0u8];
    //     let select_seed1: field = selected_seeds[1u8];
    //     let select_seed2: field = selected_seeds[2u8];
    //     let select_seed3: field = selected_seeds[3u8];
    //     let select_seed4: field = selected_seeds[4u8];
    //     let select_seed5: field = selected_seeds[5u8];
    //     let select_seed6: field = selected_seeds[6u8];
    //     assert(select_seed0 != select_seed1 && select_seed0 != select_seed2 && select_seed0 != select_seed3 && select_seed0 != select_seed4 && select_seed0 != select_seed5 && select_seed0 != select_seed6);
    //     assert(select_seed1 != select_seed2 && select_seed1 != select_seed3 && select_seed1 != select_seed4 && select_seed1 != select_seed5 && select_seed1 != select_seed6);
    //     assert(select_seed2 != select_seed3 && select_seed2 != select_seed4 && select_seed2 != select_seed5 && select_seed2 != select_seed6);
    //     assert(select_seed3 != select_seed4 && select_seed3 != select_seed5 && select_seed3 != select_seed6);
    //     assert(select_seed4 != select_seed5 && select_seed4 != select_seed6);
    //     assert(select_seed5 != select_seed6);
    //     for i: u8 in 0u8..7u8 {
    //         semi_random += selected_seeds[i];
    //     }
    //     let semi_random_u128: u128 = semi_random as u128 % 7u128;
    //     semi_random = semi_random_u128 as field;
    //     if semi_random == 0field {
    //         return true then finalize(table_id, salt, selected_seeds[0u8], player);
    //     }
    //     if semi_random == 1field {
    //         return true then finalize(table_id, salt, selected_seeds[1u8], player);
    //     }
    //     if semi_random == 2field {
    //         return true then finalize(table_id, salt, selected_seeds[2u8], player);
    //     }
    //     if semi_random == 3field {
    //         return true then finalize(table_id, salt, selected_seeds[3u8], player);
    //     }
    //     if semi_random == 4field {
    //         return true then finalize(table_id, salt, selected_seeds[4u8], player);
    //     }
    //     if semi_random == 5field {
    //         return true then finalize(table_id, salt, selected_seeds[5u8], player);
    //     }
    //     if semi_random == 6field {
    //         return true then finalize(table_id, salt, selected_seeds[6u8], player);
    //     }
    //     return false then finalize(table_id, salt, selected_seeds[0u8], player);
    // }

    // finalize init_player(table_id: group, salt: scalar, random_seed: field, player: address) {
    //     let state: State = Mapping::get(public_game_state, table_id);
    //     assert(state.table_id == table_id);
    //     assert(random_seed == state.seeds[0u8] || random_seed == state.seeds[1u8] || random_seed == state.seeds[2u8] || random_seed == state.seeds[3u8] || random_seed == state.seeds[4u8] || random_seed == state.seeds[5u8] || random_seed == state.seeds[6u8] || random_seed == state.seeds[7u8] || random_seed == state.seeds[8u8] || random_seed == state.seeds[9u8] || random_seed == state.seeds[10u8] || random_seed == state.seeds[11u8] || random_seed == state.seeds[12u8] || random_seed == state.seeds[13u8] || random_seed == state.seeds[14u8] || random_seed == state.seeds[15u8] || random_seed == state.seeds[16u8] || random_seed == state.seeds[17u8] || random_seed == state.seeds[18u8] || random_seed == state.seeds[19u8]);
    //     let seed_commitment: group = Pedersen64::commit_to_group(random_seed, salt);
    //     assert(state.deck == 0group);
    //     assert(state.river == 0u64);
    //     let commit: bool = false;
    //     let commitments: [group; 9] = [0group, 0group, 0group, 0group, 0group, 0group, 0group, 0group, 0group];
    //     if (!commit && state.commitments[0u8] == 0group) {
    //         commit = true;
    //         commitments = [seed_commitment, 0group, 0group, 0group, 0group, 0group, 0group, 0group, 0group];
    //     }
    //     if (!commit && state.commitments[1u8] == 0group) {
    //         commit = true;
    //         commitments = [state.commitments[0u8], seed_commitment, 0group, 0group, 0group, 0group, 0group, 0group, 0group];
    //     }
    //     if (!commit && state.commitments[2u8] == 0group) {
    //         commit = true;
    //         commitments = [state.commitments[0u8], state.commitments[1u8], seed_commitment, 0group, 0group, 0group, 0group, 0group, 0group];
    //     }
    //     if (!commit && state.commitments[3u8] == 0group) {
    //         commit = true;
    //         commitments = [state.commitments[0u8], state.commitments[1u8], state.commitments[2u8], seed_commitment, 0group, 0group, 0group, 0group, 0group];
    //     }
    //     if (!commit && state.commitments[4u8] == 0group) {
    //         commit = true;
    //         commitments = [state.commitments[0u8], state.commitments[1u8], state.commitments[2u8], state.commitments[3u8], seed_commitment, 0group, 0group, 0group, 0group];
    //     }
    //     if (!commit && state.commitments[5u8] == 0group) {
    //         commit = true;
    //         commitments = [state.commitments[0u8], state.commitments[1u8], state.commitments[2u8], state.commitments[3u8], state.commitments[4u8], seed_commitment, 0group, 0group, 0group];
    //     }
    //     if (!commit && state.commitments[6u8] == 0group) {
    //         commit = true;
    //         commitments = [state.commitments[0u8], state.commitments[1u8], state.commitments[2u8], state.commitments[3u8], state.commitments[4u8], state.commitments[5u8], seed_commitment, 0group, 0group];
    //     }
    //     if (!commit && state.commitments[7u8] == 0group) {
    //         commit = true;
    //         commitments = [state.commitments[0u8], state.commitments[1u8], state.commitments[2u8], state.commitments[3u8], state.commitments[4u8], state.commitments[5u8], state.commitments[6u8], seed_commitment, 0group];
    //     }
    //     if (!commit && state.commitments[8u8] == 0group) {
    //         commit = true;
    //         commitments = [state.commitments[0u8], state.commitments[1u8], state.commitments[2u8], state.commitments[3u8], state.commitments[4u8], state.commitments[5u8], state.commitments[6u8], state.commitments[7u8], seed_commitment];
    //     }
    //     assert(commit);
    //     let new_state: State = State {
    //         table_id,
    //         deck: 0group,
    //         river: 0u64,
    //         hands: [0u64, 0u64, 0u64, 0u64, 0u64, 0u64, 0u64, 0u64, 0u64],
    //         seeds: state.seeds,
    //         commitments: commitments,
    //     };
    //     Mapping::set(public_game_state, table_id, new_state);
    // }

    // transition determine_shuffles(table: Table, commitments: [group; 9]) -> [i8; 7] {
    //     let shuffles: [i8; 7] = commitments_to_shuffles(commitments);
    //     return shuffles then finalize(table.table_id, commitments);
    // }

    // finalize determine_shuffles(table_id: group, commitments: [group; 9]) {
    //     let state: State = Mapping::get(public_game_state, table_id);
    //     assert(state.table_id == table_id);
    //     assert(state.commitments[0u8] == commitments[0u8] || state.commitments[1u8] == commitments[1u8] || state.commitments[2u8] == commitments[2u8] || state.commitments[3u8] == commitments[3u8] || state.commitments[4u8] == commitments[4u8] || state.commitments[5u8] == commitments[5u8] || state.commitments[6u8] == commitments[6u8] || state.commitments[7u8] == commitments[7u8] || state.commitments[8u8] == commitments[8u8]);
    // }

    // transition deal(table_id: group, deck: [[u8; 26]; 2], player_index: u8, players: [address; 9]) -> [[u8; 2]; 9] {
    //     let top: [u8; 26] = deck[1u8];
    //     let h0: u8 = 0u8;
    //     let h1: u8 = 0u8;
    //     let h2: u8 = 0u8;
    //     let h3: u8 = 0u8;
    //     let h4: u8 = 0u8;
    //     let h5: u8 = 0u8;
    //     let h6: u8 = 0u8;
    //     let h7: u8 = 0u8;
    //     let h8: u8 = 0u8;
    //     let h9: u8 = 0u8;
    //     let h10: u8 = 0u8;
    //     let h11: u8 = 0u8;
    //     let h12: u8 = 0u8;
    //     let h13: u8 = 0u8;
    //     let h14: u8 = 0u8;
    //     let h15: u8 = 0u8;
    //     let h16: u8 = 0u8;
    //     let h17: u8 = 0u8;
    //     let r0: u8 = 0u8;
    //     let r1: u8 = 0u8;
    //     let r2: u8 = 0u8;
    //     let r3: u8 = 0u8;
    //     let r4: u8 = 0u8;
    //     for i: u8 in 0u8..23u8 {
    //         let player: address = 0u8 as address;
    //         if (i == 0u8 && player_index >= 1u8) {
    //             player = players[0u8];
    //             h0 = top[25u8];
    //         }
    //         if (i == 1u8 && player_index >= 2u8) {
    //             player = players[1u8];
    //             h2 = top[24u8];
    //         }
    //         if (i == 2u8 && player_index >= 3u8) {
    //             player = players[2u8];
    //             h4 = top[23u8];
    //         }
    //         if (i == 3u8 && player_index >= 4u8) {
    //             player = players[3u8];
    //             h5 = top[22u8];
    //         }
    //         if (i == 4u8 && player_index >= 5u8) {
    //             player = players[4u8];
    //             h7 = top[21u8];
    //         }
    //         if (i == 5u8 && player_index >= 6u8) {
    //             player = players[5u8];
    //             h9 = top[20u8];
    //         }
    //         if (i == 6u8 && player_index >= 7u8) {
    //             player = players[6u8];
    //             h11 = top[19u8];
    //         }
    //         if (i == 7u8 && player_index >= 8u8) {
    //             player = players[7u8];
    //             h13 = top[18u8];
    //         }
    //         if (i == 8u8 && player_index >= 9u8) {
    //             player = players[8u8];
    //             h15 = top[17u8];
    //         }
    //         if (i == 3u8 && player_index < 3u8) {
    //             r0 = top[22u8];
    //         }
    //         if (i == 4u8 && player_index < 4u8) {
    //             r0 = top[21u8];
    //         }
    //         if (i == 5u8 && player_index < 5u8) {
    //             r0 = top[20u8];
    //         }
    //         if (i == 6u8 && player_index < 6u8) {
    //             r0 = top[19u8];
    //         }
    //         if (i == 7u8 && player_index < 7u8) {
    //             r0 = top[18u8];
    //         }
    //         if (i == 8u8 && player_index < 8u8) {
    //             r0 = top[17u8];
    //         }
    //         if (i == 9u8 && player_index < 9u8) {
    //             r0 = top[16u8];
    //         }
    //         if (i == 10u8 && player_index < 10u8) {
    //             r0 = top[15u8];
    //         }
    //         if (i == 4u8 && player_index >= 1u8) {
    //             player = players[0u8];
    //             h1 = top[21u8];
    //         }
    //         if (i == 5u8 && player_index >= 2u8) {
    //             player = players[1u8];
    //             h3 = top[20u8];
    //         }
    //         if (i == 6u8 && player_index >= 3u8) {
    //             player = players[2u8];
    //             h5 = top[19u8];
    //         }
    //         if (i == 7u8 && player_index >= 4u8) {
    //             player = players[3u8];
    //             h7 = top[18u8];
    //         }
    //         if (i == 8u8 && player_index >= 5u8) {
    //             player = players[4u8];
    //             h9 = top[17u8];
    //         }
    //         if (i == 9u8 && player_index >= 6u8) {
    //             player = players[5u8];
    //             h11 = top[16u8];
    //         }
    //         if (i == 10u8 && player_index >= 7u8) {
    //             player = players[6u8];
    //             h12 = top[15u8];
    //         }
    //         if (i == 11u8 && player_index >= 8u8) {
    //             player = players[7u8];
    //             h15 = top[14u8];
    //         }
    //         if (i == 12u8 && player_index >= 9u8) {
    //             player = players[8u8];
    //             h17 = top[13u8];
    //         }
    //         if (i == 6u8 && player_index < 3u8) {
    //             r1 = top[19u8];
    //         }
    //         if (i == 7u8 && player_index < 4u8) {
    //             r1  = top[18u8];
    //         }
    //         if (i == 8u8 && player_index < 5u8) {
    //             r1  = top[17u8];
    //         }
    //         if (i == 9u8 && player_index < 6u8) {
    //             r1  = top[16u8];
    //         }
    //         if (i == 10u8 && player_index < 7u8) {
    //             r1  = top[15u8];
    //         }
    //         if (i == 11u8 && player_index < 8u8) {
    //             r1  = top[14u8];
    //         }
    //         if (i == 12u8 && player_index < 9u8) {
    //             r1  = top[13u8];
    //         }
    //         if (i == 13u8 && player_index < 10u8) {
    //             r1  = top[12u8];
    //         }
    //         if (i == 7u8 && player_index < 3u8) {
    //             r2 = top[18u8];
    //         }
    //         if (i == 8u8 && player_index < 4u8) {
    //             r2 = top[17u8];
    //         }
    //         if (i == 9u8 && player_index < 5u8) {
    //             r2 = top[16u8];
    //         }
    //         if (i == 10u8 && player_index < 6u8) {
    //             r2 = top[15u8];
    //         }
    //         if (i == 11u8 && player_index < 7u8) {
    //             r2 = top[14u8];
    //         }
    //         if (i == 12u8 && player_index < 8u8) {
    //             r2 = top[13u8];
    //         }
    //         if (i == 13u8 && player_index < 9u8) {
    //             r2 = top[12u8];
    //         }
    //         if (i == 14u8 && player_index < 10u8) {
    //             r2 = top[11u8];
    //         }
    //         if (i == 8u8 && player_index < 3u8) {
    //             r3 = top[17u8];
    //         }
    //         if (i == 9u8 && player_index < 4u8) {
    //             r3 = top[16u8];
    //         }
    //         if (i == 10u8 && player_index < 5u8) {
    //             r3= top[15u8];
    //         }
    //         if (i == 11u8 && player_index < 6u8) {
    //             r3 = top[14u8];
    //         }
    //         if (i == 12u8 && player_index < 7u8) {
    //             r3 = top[13u8];
    //         }
    //         if (i == 13u8 && player_index < 8u8) {
    //             r3 = top[12u8];
    //         }
    //         if (i == 14u8 && player_index < 9u8) {
    //             r3 = top[11u8];
    //         }
    //         if (i == 15u8 && player_index < 10u8) {
    //             r3 = top[10u8];
    //         }
    //         if (i == 9u8 && player_index < 3u8) {
    //             r4 = top[16u8];
    //         }
    //         if (i == 10u8 && player_index < 4u8) {
    //             r4 = top[15u8];
    //         }
    //         if (i == 11u8 && player_index < 5u8) {
    //             r4= top[14u8];
    //         }
    //         if (i == 12u8 && player_index < 6u8) {
    //             r4 = top[13u8];
    //         }
    //         if (i == 13u8 && player_index < 7u8) {
    //             r4 = top[12u8];
    //         }
    //         if (i == 14u8 && player_index < 8u8) {
    //             r4 = top[11u8];
    //         }
    //         if (i == 15u8 && player_index < 9u8) {
    //             r4 = top[10u8];
    //         }
    //         if (i == 16u8 && player_index < 10u8) {
    //             r4 = top[9u8];
    //         }
    //     }

    //     return [[h0, h1], [h2, h3], [h4, h5], [h6, h7], [h8, h9], [h10, h11], [h12, h13], [h14, h15], [h16, h17]] then finalize(table_id, r0, r1, r2, r3, r4);
    // }

    // finalize deal(table_id: group, r0: u8, r1: u8, r2: u8, r3: u8, r4: u8) {
    //     let fetched_state: State = Mapping::get(public_game_state, table_id);
    //     let river: u64 = 1u64 << r0 ^ 1u64 << r1 ^ 1u64 << r2 ^ 1u64 << r3 ^ 1u64 << r4;
    //     assert(fetched_state.table_id == table_id);
    //     assert(fetched_state.deck == 0group);
    //     assert(fetched_state.river == 0u64);
    //     let new_state: State = State {
    //         table_id,
    //         deck: 0group,
    //         river,
    //         hands: fetched_state.hands,
    //         seeds: fetched_state.seeds,
    //         commitments: fetched_state.commitments,
    //     };
    //     Mapping::set(public_game_state, table_id, new_state);
    // }
}