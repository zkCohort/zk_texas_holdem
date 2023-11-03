import zk_bitwise_stack_seiries_updates_v0_0_1.leo;

program zk_bitwise_stack_v0_0_1.aleo {

    struct Stack {
        capacity: u16,
        top: u16,
        member_size: u8,
        s00: [u128; 26],
        s01: [u128; 26],
    }

    inline is_empty(stack: Stack) -> bool {
        return stack.top == 0u16;
    }

    inline is_full(stack: Stack) -> bool {
        return stack.top == stack.capacity;
    }

    // top is the index of the next element to be pushed.
    // member_size is the number of bits used to represent each element.
    //   member_size can be between 8 and 128 inclusive % 8 == 0.
    // capacity is the number of elements that can be stored in the stack.
    //   capacity is calculated from member_size.
    //   capacity = 128 * 26 * 2 / member_size
    function get_series_buffer_indexes(top: u16, member_size: u8) -> (u8, u8) {
        assert(member_size > 0u8);
        const BUFFERS_PER_SERIES: u16 = 26u16;
        const FULL_BITS: u16 = 128u16;
        let size_in_bits: u16 = member_size as u16;
        let elements_per_buffer: u16 = FULL_BITS / size_in_bits;
        let series_index: u16 = top / (elements_per_buffer * BUFFERS_PER_SERIES);
        let buffer_index: u16 = (top / elements_per_buffer) % BUFFERS_PER_SERIES;
        return (series_index as u8, buffer_index as u8);
    }

    function init_stack(member_size: u8) -> Stack {
        assert_eq(member_size % 8u8, 0u8);
        let max_size: u16 = member_size as u16;
        let capacity: u16 = 6656u16 / max_size;
        // Check for overflow
        assert(capacity > 0u16); 
        assert(capacity <= 832u16);
        assert(member_size > 0u8);
        assert(member_size <= 128u8);
        return Stack {
            capacity,
            top: 0u16,
            member_size,
            s00: [0u128, 0u128, 0u128, 0u128, 0u128, 0u128,0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128,
                 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128],
            s01: [0u128, 0u128, 0u128, 0u128, 0u128, 0u128,0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128,
                 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128],
        };
    }

    transition push(value: u128, stack: Stack) -> Stack {
        const MAX_U128_VALUE: u128 = 340282366920938463463374607431768211455u128;
        const FULL_BITS: u8 = 128u8;
        const ZERO: u8 = 0u8;
        const ONE: u8 = 1u8;
        let (series_index, buffer_index): (u8, u8) = get_series_buffer_indexes(stack.top, stack.member_size);
        // Calculate series_index and modify if necessary
        let series: u128 = zk_bitwise_stack_seiries_updates_v0_0_1.leo/get_buffer_at_series_index(series_index, buffer_index, stack);
        let mask: u128 = MAX_U128_VALUE;
        if (stack.member_size < FULL_BITS) {
            mask = MAX_U128_VALUE.shr_wrapped(FULL_BITS - stack.member_size);
        }

        // Check for overflow
        assert(stack.top < stack.capacity);
        assert(value <= mask);
        assert(mask <= MAX_U128_VALUE);

        // Shift Left and then use OR to add the value to the series.
        let new_buffer_in_series: u128 = (series.shl_wrapped(stack.member_size)) | value;
        let (s00, s01): ([u128; 26], [u128; 26]) = zk_bitwise_stack_seiries_updates_v0_0_1.leo/(series_index, buffer_index, stack, new_buffer_in_series);

        return Stack {
            capacity: stack.capacity,
            top: stack.top + 1u16,
            member_size: stack.member_size,
            s00,
            s01,
        };
    }

    transition pop(stack: Stack) -> (u128, Stack) {
        const MAX_U128_VALUE: u128 = 340282366920938463463374607431768211455u128;
        const FULL_BITS: u8 = 128u8;
        // Check for underflow.
        assert(!is_empty(stack));
        let (series_index, buffer_index): (u8, u8) = get_series_buffer_indexes(stack.top - 1u16, stack.member_size);
        let series: u128 = zk_bitwise_stack_seiries_updates_v0_0_1.leo/get_buffer_at_series_index(series_index, buffer_index, stack);

        // Calculate mask.
        let mask: u128 = MAX_U128_VALUE;
        // Extract value and calculate new series. (Initial values for FULL_BITS member_size)
        let value: u128 = series;
        let new_buffer_in_series: u128 = 0u128;
        if (stack.member_size < FULL_BITS) {
            mask = MAX_U128_VALUE.shr_wrapped(FULL_BITS - stack.member_size);
            value = series & mask;
            if (stack.member_size == 8u8) {
                new_buffer_in_series = series >> 8u8;
            }
            else if (stack.member_size == 16u8) {
                new_buffer_in_series = series >> 16u8;
            }
            else if (stack.member_size == 32u8) {
                new_buffer_in_series = series >> 32u8;
            }
            else if (stack.member_size == 64u8) {
                new_buffer_in_series = series >> 64u8;
            }
            else {
                assert(false);
            }
        }
        let (s00, s01): ([u128; 26], [u128; 26]) = zk_bitwise_stack_seiries_updates_v0_0_1.leo/set_buffer_at_series_index(series_index, buffer_index, stack, new_buffer_in_series);
        return (value, Stack {
            capacity: stack.capacity,
            top: stack.top - 1u16,
            member_size: stack.member_size,
            s00,
            s01,
        });
    }
}