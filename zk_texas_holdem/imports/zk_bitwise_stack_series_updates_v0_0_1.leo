program zk_bitwise_stack_series_updates_v0_0_1.aleo {
    
    transition get_buffer_at_series_index(series_index: u8, buffer_index: u8, stack: Stack) -> u128 {
        let s00: [u128; 26] = stack.s00;
        let s01: [u128; 26] = stack.s01;
        let s00a0: u128 = s00[0u8];
        let s00a1: u128 = s00[1u8];
        let s00a2: u128 = s00[2u8];
        let s00a3: u128 = s00[3u8];
        let s00a4: u128 = s00[4u8];
        let s00a5: u128 = s00[5u8];
        let s00a6: u128 = s00[6u8];
        let s00a7: u128 = s00[7u8];
        let s00a8: u128 = s00[8u8];
        let s00a9: u128 = s00[9u8];
        let s00a10: u128 = s00[10u8];
        let s00a11: u128 = s00[11u8];
        let s00a12: u128 = s00[12u8];
        let s00a13: u128 = s00[13u8];
        let s00a14: u128 = s00[14u8];
        let s00a15: u128 = s00[15u8];
        let s00a16: u128 = s00[16u8];
        let s00a17: u128 = s00[17u8];
        let s00a18: u128 = s00[18u8];
        let s00a19: u128 = s00[19u8];
        let s00a20: u128 = s00[20u8];
        let s00a21: u128 = s00[21u8];
        let s00a22: u128 = s00[22u8];
        let s00a23: u128 = s00[23u8];
        let s00a24: u128 = s00[24u8];
        let s00a25: u128 = s00[25u8];
        let s01b0: u128 = s01[0u8];
        let s01b1: u128 = s01[1u8];
        let s01b2: u128 = s01[2u8];
        let s01b3: u128 = s01[3u8];
        let s01b4: u128 = s01[4u8];
        let s01b5: u128 = s01[5u8];
        let s01b6: u128 = s01[6u8];
        let s01b7: u128 = s01[7u8];
        let s01b8: u128 = s01[8u8];
        let s01b9: u128 = s01[9u8];
        let s01b10: u128 = s01[10u8];
        let s01b11: u128 = s01[11u8];
        let s01b12: u128 = s01[12u8];
        let s01b13: u128 = s01[13u8];
        let s01b14: u128 = s01[14u8];
        let s01b15: u128 = s01[15u8];
        let s01b16: u128 = s01[16u8];
        let s01b17: u128 = s01[17u8];
        let s01b18: u128 = s01[18u8];
        let s01b19: u128 = s01[19u8];
        let s01b20: u128 = s01[20u8];
        let s01b21: u128 = s01[21u8];
        let s01b22: u128 = s01[22u8];
        let s01b23: u128 = s01[23u8];
        let s01b24: u128 = s01[24u8];
        let s01b25: u128 = s01[25u8];
        if (series_index == 0u8) {
            if (buffer_index == 0u8) {
                return s00a0;
            }
            else if (buffer_index == 1u8) {
                return s00a1;
            }
            else if (buffer_index == 2u8) {
                return s00a2;
            }
            else if (buffer_index == 3u8) {
                return s00a3;
            }
            else if (buffer_index == 4u8) {
                return s00a4;
            }
            else if (buffer_index == 5u8) {
                return s00a5;
            }
            else if (buffer_index == 6u8) {
                return s00a6;
            }
            else if (buffer_index == 7u8) {
                return s00a7;
            }
            else if (buffer_index == 8u8) {
                return s00a8;
            }
            else if (buffer_index == 9u8) {
                return s00a9;
            }
            else if (buffer_index == 10u8) {
                return s00a10;
            }
            else if (buffer_index == 11u8) {
                return s00a11;
            }
            else if (buffer_index == 12u8) {
                return s00a12;
            }
            else if (buffer_index == 13u8) {
                return s00a13;
            }
            else if (buffer_index == 14u8) {
                return s00a14;
            }
            else if (buffer_index == 15u8) {
                return s00a15;
            }
            else if (buffer_index == 16u8) {
                return s00a16;
            }
            else if (buffer_index == 17u8) {
                return s00a17;
            }
            else if (buffer_index == 18u8) {
                return s00a18;
            }
            else if (buffer_index == 19u8) {
                return s00a19;
            }
            else if (buffer_index == 20u8) {
                return s00a20;
            }
            else if (buffer_index == 21u8) {
                return s00a21;
            }
            else if (buffer_index == 22u8) {
                return s00a22;
            }
            else if (buffer_index == 23u8) {
                return s00a23;
            }
            else if (buffer_index == 24u8) {
                return s00a24;
            }
            else if (buffer_index == 25u8) {
                return s00a25;
            }
            else {
                assert(false);
                return 0u128;
            }
        } else if (series_index == 1u8) {
            if (buffer_index == 0u8) {
                return s01b0;
            }
            else if (buffer_index == 1u8) {
                return s01b1;
            }
            else if (buffer_index == 2u8) {
                return s01b2;
            }
            else if (buffer_index == 3u8) {
                return s01b3;
            }
            else if (buffer_index == 4u8) {
                return s01b4;
            }
            else if (buffer_index == 5u8) {
                return s01b5;
            }
            else if (buffer_index == 6u8) {
                return s01b6;
            }
            else if (buffer_index == 7u8) {
                return s01b7;
            }
            else if (buffer_index == 8u8) {
                return s01b8;
            }
            else if (buffer_index == 9u8) {
                return s01b9;
            }
            else if (buffer_index == 10u8) {
                return s01b10;
            }
            else if (buffer_index == 11u8) {
                return s01b11;
            }
            else if (buffer_index == 12u8) {
                return s01b12;
            }
            else if (buffer_index == 13u8) {
                return s01b13;
            }
            else if (buffer_index == 14u8) {
                return s01b14;
            }
            else if (buffer_index == 15u8) {
                return s01b15;
            }
            else if (buffer_index == 16u8) {
                return s01b16;
            }
            else if (buffer_index == 17u8) {
                return s01b17;
            }
            else if (buffer_index == 18u8) {
                return s01b18;
            }
            else if (buffer_index == 19u8) {
                return s01b19;
            }
            else if (buffer_index == 20u8) {
                return s01b20;
            }
            else if (buffer_index == 21u8) {
                return s01b21;
            }
            else if (buffer_index == 22u8) {
                return s01b22;
            }
            else if (buffer_index == 23u8) {
                return s01b23;
            }
            else if (buffer_index == 24u8) {
                return s01b24;
            }
            else if (buffer_index == 25u8) {
                return s01b25;
            }
            else {
                assert(false);
                return 0u128;
            }
        } else {
            assert(false);
            return 0u128;
        }
    }

    transition set_buffer_at_series_index(series_index: u8, buffer_index: u8, stack: Stack, buffer: u128) -> ([u128; 26], [u128; 26]) {
        // Top relative to how many 256 bit series have been used with stack.member_size lengthy elements.  
        // It is the index of the next series to be used.
        let top: u16 = stack.top;
        let member_size: u8 = stack.member_size;
        let capacity: u16 = stack.capacity;
        let s00: [u128; 26] = stack.s00;
        let s01: [u128; 26] = stack.s01;
        let s00a0: u128 = s00[0u8];
        let s00a1: u128 = s00[1u8];
        let s00a2: u128 = s00[2u8];
        let s00a3: u128 = s00[3u8];
        let s00a4: u128 = s00[4u8];
        let s00a5: u128 = s00[5u8];
        let s00a6: u128 = s00[6u8];
        let s00a7: u128 = s00[7u8];
        let s00a8: u128 = s00[8u8];
        let s00a9: u128 = s00[9u8];
        let s00a10: u128 = s00[10u8];
        let s00a11: u128 = s00[11u8];
        let s00a12: u128 = s00[12u8];
        let s00a13: u128 = s00[13u8];
        let s00a14: u128 = s00[14u8];
        let s00a15: u128 = s00[15u8];
        let s00a16: u128 = s00[16u8];
        let s00a17: u128 = s00[17u8];
        let s00a18: u128 = s00[18u8];
        let s00a19: u128 = s00[19u8];
        let s00a20: u128 = s00[20u8];
        let s00a21: u128 = s00[21u8];
        let s00a22: u128 = s00[22u8];
        let s00a23: u128 = s00[23u8];
        let s00a24: u128 = s00[24u8];
        let s00a25: u128 = s00[25u8];
        let s01b0: u128 = s01[0u8];
        let s01b1: u128 = s01[1u8];
        let s01b2: u128 = s01[2u8];
        let s01b3: u128 = s01[3u8];
        let s01b4: u128 = s01[4u8];
        let s01b5: u128 = s01[5u8];
        let s01b6: u128 = s01[6u8];
        let s01b7: u128 = s01[7u8];
        let s01b8: u128 = s01[8u8];
        let s01b9: u128 = s01[9u8];
        let s01b10: u128 = s01[10u8];
        let s01b11: u128 = s01[11u8];
        let s01b12: u128 = s01[12u8];
        let s01b13: u128 = s01[13u8];
        let s01b14: u128 = s01[14u8];
        let s01b15: u128 = s01[15u8];
        let s01b16: u128 = s01[16u8];
        let s01b17: u128 = s01[17u8];
        let s01b18: u128 = s01[18u8];
        let s01b19: u128 = s01[19u8];
        let s01b20: u128 = s01[20u8];
        let s01b21: u128 = s01[21u8];
        let s01b22: u128 = s01[22u8];
        let s01b23: u128 = s01[23u8];
        let s01b24: u128 = s01[24u8];
        let s01b25: u128 = s01[25u8];
        if (series_index == 0u8) {
            if (buffer_index == 0u8) {
                s00a0 = buffer;
            }
            else if (buffer_index == 1u8) {
                s00a1 = buffer;
            }
            else if (buffer_index == 2u8) {
                s00a2 = buffer;
            }
            else if (buffer_index == 3u8) {
                s00a3 = buffer;
            }
            else if (buffer_index == 4u8) {
                s00a4 = buffer;
            }
            else if (buffer_index == 5u8) {
                s00a5 = buffer;
            }
            else if (buffer_index == 6u8) {
                s00a6 = buffer;
            }
            else if (buffer_index == 7u8) {
                s00a7 = buffer;
            }
            else if (buffer_index == 8u8) {
                s00a8 = buffer;
            }
            else if (buffer_index == 9u8) {
                s00a9 = buffer;
            }
            else if (buffer_index == 10u8) {
                s00a10 = buffer;
            }
            else if (buffer_index == 11u8) {
                s00a11 = buffer;
            }
            else if (buffer_index == 12u8) {
                s00a12 = buffer;
            }
            else if (buffer_index == 13u8) {
                s00a13 = buffer;
            }
            else if (buffer_index == 14u8) {
                s00a14 = buffer;
            }
            else if (buffer_index == 15u8) {
                s00a15 = buffer;
            }
            else if (buffer_index == 16u8) {
                s00a16 = buffer;
            }
            else if (buffer_index == 17u8) {
                s00a17 = buffer;
            }
            else if (buffer_index == 18u8) {
                s00a18 = buffer;
            }
            else if (buffer_index == 19u8) {
                s00a19 = buffer;
            }
            else if (buffer_index == 20u8) {
                s00a20 = buffer;
            }
            else if (buffer_index == 21u8) {
                s00a21 = buffer;
            }
            else if (buffer_index == 22u8) {
                s00a22 = buffer;
            }
            else if (buffer_index == 23u8) {
                s00a23 = buffer;
            }
            else if (buffer_index == 24u8) {
                s00a24 = buffer;
            }
            else if (buffer_index == 25u8) {
                s00a25 = buffer;
            }
            else {
                assert(false);
            }
        } else if (series_index == 1u8) {
            if (buffer_index == 0u8) {
                s01b0 = buffer;
            }
            else if (buffer_index == 1u8) {
                s01b1 = buffer;
            }
            else if (buffer_index == 2u8) {
                s01b2 = buffer;
            }
            else if (buffer_index == 3u8) {
                s01b3 = buffer;
            }
            else if (buffer_index == 4u8) {
                s01b4 = buffer;
            }
            else if (buffer_index == 5u8) {
                s01b5 = buffer;
            }
            else if (buffer_index == 6u8) {
                s01b6 = buffer;
            }
            else if (buffer_index == 7u8) {
                s01b7 = buffer;
            }
            else if (buffer_index == 8u8) {
                s01b8 = buffer;
            }
            else if (buffer_index == 9u8) {
                s01b9 = buffer;
            }
            else if (buffer_index == 10u8) {
                s01b10 = buffer;
            }
            else if (buffer_index == 11u8) {
                s01b11 = buffer;
            }
            else if (buffer_index == 12u8) {
                s01b12 = buffer;
            }
            else if (buffer_index == 13u8) {
                s01b13 = buffer;
            }
            else if (buffer_index == 14u8) {
                s01b14 = buffer;
            }
            else if (buffer_index == 15u8) {
                s01b15 = buffer;
            }
            else if (buffer_index == 16u8) {
                s01b16 = buffer;
            }
            else if (buffer_index == 17u8) {
                s01b17 = buffer;
            }
            else if (buffer_index == 18u8) {
                s01b18 = buffer;
            }
            else if (buffer_index == 19u8) {
                s01b19 = buffer;
            }
            else if (buffer_index == 20u8) {
                s01b20 = buffer;
            }
            else if (buffer_index == 21u8) {
                s01b21 = buffer;
            }
            else if (buffer_index == 22u8) {
                s01b22 = buffer;
            }
            else if (buffer_index == 23u8) {
                s01b23 = buffer;
            }
            else if (buffer_index == 24u8) {
                s01b24 = buffer;
            }
            else if (buffer_index == 25u8) {
                s01b25 = buffer;
            }
            else {
                assert(false);
            }
        } else {
            assert(false);
        }
        return ([s00a0, s00a1, s00a2, s00a3, s00a4, s00a5, s00a6, s00a7, s00a8, s00a9, s00a10, s00a11, s00a12, s00a13, s00a14, s00a15, s00a16, s00a17, s00a18, s00a19, s00a20, s00a21, s00a22, s00a23, s00a24, s00a25],
                [s01b0, s01b1, s01b2, s01b3, s01b4, s01b5, s01b6, s01b7, s01b8, s01b9, s01b10, s01b11, s01b12, s01b13, s01b14, s01b15, s01b16, s01b17, s01b18, s01b19, s01b20, s01b21, s01b22, s01b23, s01b24, s01b25]);
    }
}