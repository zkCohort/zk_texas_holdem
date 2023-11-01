program zk_deck_shuffle.aleo {
    transition setup_shuffle(element: i8, deck: [[u128; 26]; 2]) -> (i8, [u128; 26], [u128; 26]) {
        let n: i8 = element.abs();
        if (element < 0i8) {
            return (n, deck[0u8], deck[1u8]);
        } else {
            return (n, deck[1u8], deck[0u8]);
        }
    }

    struct Stack {
        capacity: u8,
        top: u8,
        member_size: u8,
        s00: u128,
        s01: u128,
        s02: u128,
        s03: u128,
    }

    inline is_empty(stack: Stack) -> bool {
        return stack.top == 0u8;
    }

    inline is_full(stack: Stack) -> bool {
        return stack.top == stack.capacity;
    }

    // There are 4 128 bit series in a stack.  A series contains n member_size packed values.
    // e.g 16 8 bit values, 8 16 bit values, 4 32 bit values, 2 64 bit values, 1 128 bit value.
    // This lends to either 64 values, 32 values, 16 values, 8 values, or 4 values per Stack.
    // Top is the position to be unpacked next, member_size is the size of the values to be unpacked.
    // @return the index of the series 0-3.
    inline get_series_index(top: u8, member_size: u8) -> u8 {
        return (top * member_size) / 128u8;
    }

    inline get_series(series_index: u8, stack: Stack) -> u128 {
        // Top relative to how many 256 bit series have been used with stack.member_size lengthy elements.  
        // It is the index of the next series to be used.
        let top: u8 = stack.top;
        let member_size: u8 = stack.member_size;
        let capacity: u8 = stack.capacity;
        if series_index == 0u8 {
            return stack.s00;
        } else if series_index == 1u8 {
            return stack.s01;
        } else if series_index == 2u8 {
            return stack.s02;
        } else if series_index == 3u8 {
            return stack.s03;
        } else {
            assert(top < ((4u16 * 8u16 * 16u16 / (member_size as u16)) as u8));
            return 0u128;
        }
        
    }

    inline set_series(series_index: u8, stack: Stack, buffer_series: u128) -> (u128, u128, u128, u128) {
        // Top relative to how many 256 bit series have been used with stack.member_size lengthy elements.  
        // It is the index of the next series to be used.
        let top: u8 = stack.top;
        let member_size: u8 = stack.member_size;
        let capacity: u8 = stack.capacity;
        let buffer_series00: u128 = stack.s00;
        let buffer_series01: u128 = stack.s01;
        let buffer_series02: u128 = stack.s02;
        let buffer_series03: u128 = stack.s03;
        if series_index == 0u8 {
            buffer_series00 = buffer_series;
        } else if series_index == 1u8 {
            buffer_series01 = buffer_series;
        } else if series_index == 2u8 {
            buffer_series02 = buffer_series;
        } else if series_index == 3u8 {
            buffer_series03 = buffer_series;
        } else {
            assert(top < ((4u16 * 8u16 * 16u16 / (member_size as u16)) as u8));
        }
        return (buffer_series00, buffer_series01, buffer_series02, buffer_series03);
    }

    function init_stack(member_size: u8) -> Stack {
        let capacity: u8 = (4u16 * 8u16 * 16u16 / (member_size as u16)) as u8;
        // Check for overflow
        assert(capacity > 0u8); 
        assert(capacity <= 64u8);
        assert(member_size > 0u8);
        assert(member_size <= 128u8);
        assert_eq(member_size % 8u8, 0u8);
        return Stack {
            capacity,
            top: 0u8,
            member_size,
            s00: 0u128,
            s01: 0u128,
            s02: 0u128,
            s03: 0u128,
        };
    }

    function push(value: u128, stack: Stack) -> Stack {
        let capacity: u8 = stack.capacity;
        let top: u8 = stack.top;
        let bits: u8 = stack.member_size;
        let series_index: u8 = get_series_index(top, bits);
        // Check for overflow
        if (top + 1u8) * bits % 128u8 < bits && (top + 1u8) * bits % 128u8 != 0u8 {
            series_index += 1u8;
        }
        let series: u128 = get_series(series_index, stack);
        let max_u128_value: u128 = !0u128; // b11111111111111111111111111111111
        let mask: u128 = 0u128;
        if bits >= 128u8 {
            mask = max_u128_value;
            bits = 128u8;
        }
        else {
            mask = max_u128_value >> (128u8 - bits);
        }
        // Check for overflow
        assert(top < capacity);
        assert(value <= mask);
        assert(mask <= max_u128_value);
        
        // Shift Left and then use OR to add the value
        let new_top: u8 = top + 1u8;
        // Where the magic happens:
        let new_series: u128 = (series.shl_wrapped(bits)) | (value & mask);
        let (s00, s01, s02, s03): (u128, u128, u128, u128) = set_series(series_index, stack, new_series);

        return Stack {
            capacity,
            top: new_top,
            member_size: bits,
            s00,
            s01,
            s02,
            s03,
        };
    }

    function pop(stack: Stack) -> (u128, Stack) {
        // Check for underflow
        assert(!is_empty(stack));
        let top: u8 = stack.top;
        let bits: u8 = stack.member_size;
        let series_index: u8 = get_series_index(top, bits);
        let series: u128 = get_series(series_index, stack);
        let max_u128_value: u128 = !0u128; // b11111111111111111111111111111111
        let mask: u128 = 0u128;
        if bits >= 128u8 {
            mask = max_u128_value;
            bits = 128u8;
        }
        else {
            mask = max_u128_value >> (128u8 - bits);
        }
        assert(top != 0u8);
        let new_top: u8 = top - 1u8;
        // Where the magic happens:
        let value: u128 = series & mask;
        let new_series: u128 = 0u128;
        if bits < 128u8 {
            new_series = series.shr_wrapped(bits) & (max_u128_value >> (128u8 % bits));
        }
        let (s00, s01, s02, s03): (u128, u128, u128, u128) = set_series(series_index, stack, new_series);
        return (value, Stack {
            capacity: stack.capacity,
            top: new_top,
            member_size: bits,
            s00,
            s01,
            s02,
            s03,
        });
    }

    transition shuffle_deck(n: i8, a: [u128; 26], b: [u128; 26]) -> [[u128; 26]; 2] {
        assert(n >= 1i8);
        assert(n <= 26i8);
        let a_index: u8 = 0u8;
        let b_index: u8 = 0u8;
        let stack_a: Stack = init_stack(8u8);
        let stack_b: Stack = init_stack(8u8);
        let shuffled_stack: Stack = init_stack(8u8);
        for i: u8 in 0u8..26u8 {
            stack_a = push(a[i], stack_a);
        }
        for i: u8 in 0u8..26u8 {
            stack_b = push(b[i], stack_b);
        }
        for i: i8 in 0i8..52i8 {
            let use_b: bool = false;
            let use_a: bool = false;
            if (i < n) {
                use_b = true;
            }
            else if (((i - n) % 2i8 == 0i8)) {
                use_a = true;
            }
            else if (b_index <= 25u8) {
                use_b = true;
            } else {
                use_a = true;
            }
            assert(use_a || use_b);
            let card: u128 = 0u128;
            let tuple_card_stack: (u128, Stack) = (0u128, init_stack(8u8));
            if (use_a) {
                tuple_card_stack = pop(stack_a);
                card = tuple_card_stack.0;
                stack_a = tuple_card_stack.1;
                shuffled_stack = push(card, shuffled_stack);
                a_index += 1u8;
            }
            if (use_b) {
                tuple_card_stack = pop(stack_b);
                card = tuple_card_stack.0;
                stack_b = tuple_card_stack.1;
                shuffled_stack = push(card, shuffled_stack);
                b_index += 1u8;
            }
        }
        let tuple: (u128, Stack) = pop(shuffled_stack);
        let t0: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = pop(shuffled_stack);
        let t1: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = pop(shuffled_stack);
        let t2: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = pop(shuffled_stack);
        let t3: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = pop(shuffled_stack);
        let t4: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = pop(shuffled_stack);
        let t5: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = pop(shuffled_stack);
        let t6: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = pop(shuffled_stack);
        let t7: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = pop(shuffled_stack);
        let t8: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = pop(shuffled_stack);
        let t9: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = pop(shuffled_stack);
        let t10: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = pop(shuffled_stack);
        let t11: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = pop(shuffled_stack);
        let t12: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = pop(shuffled_stack);
        let t13: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = pop(shuffled_stack);
        let t14: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = pop(shuffled_stack);
        let t15: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = pop(shuffled_stack);
        let t16: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = pop(shuffled_stack);
        let t17: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = pop(shuffled_stack);
        let t18: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = pop(shuffled_stack);
        let t19: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = pop(shuffled_stack);
        let t20: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = pop(shuffled_stack);
        let t21: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = pop(shuffled_stack);
        let t22: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = pop(shuffled_stack);
        let t23: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = pop(shuffled_stack);
        let t24: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = pop(shuffled_stack);
        let t25: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = pop(shuffled_stack);
        let t26: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = pop(shuffled_stack);
        let t27: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = pop(shuffled_stack);
        let t28: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = pop(shuffled_stack);
        let t29: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = pop(shuffled_stack);
        let t30: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = pop(shuffled_stack);
        let t31: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = pop(shuffled_stack);
        let t32: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = pop(shuffled_stack);
        let t33: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = pop(shuffled_stack);
        let t34: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = pop(shuffled_stack);
        let t35: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = pop(shuffled_stack);
        let t36: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = pop(shuffled_stack);
        let t37: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = pop(shuffled_stack);
        let t38: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = pop(shuffled_stack);
        let t39: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = pop(shuffled_stack);
        let t40: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = pop(shuffled_stack);
        let t41: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = pop(shuffled_stack);
        let t42: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = pop(shuffled_stack);
        let t43: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = pop(shuffled_stack);
        let t44: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = pop(shuffled_stack);
        let t45: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = pop(shuffled_stack);
        let t46: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = pop(shuffled_stack);
        let t47: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = pop(shuffled_stack);
        let t48: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = pop(shuffled_stack);
        let t49: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = pop(shuffled_stack);
        let t50: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = pop(shuffled_stack);
        let t51: u128 = tuple.0;
        shuffled_stack = tuple.1;

        return [[t0, t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12, t13, t14, t15, t16, t17, t18, t19, t20, t21, t22, t23, t24, t25],
                [t26, t27, t28, t29, t30, t31, t32, t33, t34, t35, t36, t37, t38, t39, t40, t41, t42, t43, t44, t45, t46, t47, t48, t49, t50, t51]];
    }
}