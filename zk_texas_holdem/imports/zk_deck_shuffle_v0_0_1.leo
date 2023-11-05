import zk_bitwise_stack_v0_0_1.leo;

program zk_deck_shuffle_v0_0_1.aleo {

    transition setup_shuffle(element: i8, deck: [[u128; 26]; 2]) -> (i8, [u128; 26], [u128; 26]) {
        let n: i8 = element.abs();
        if (element < 0i8) {
            return (n, deck[0u8], deck[1u8]);
        } else {
            return (n, deck[1u8], deck[0u8]);
        }
    }

    transition shuffle_deck(n: i8, member_size: u8, a: [u128; 26], b: [u128; 26]) -> [[u128; 26]; 2] {
        assert(n >= 1i8);
        assert(n <= 26i8);
        let stack_a: Stack = init_stack(member_size);
        let stack_b: Stack = init_stack(member_size);
        let shuffled_stack: Stack = init_stack(member_size);
        for i: u8 in 0u8..26u8 {
            stack_a = zk_bitwise_stack_v0_0_1.leo/push(a[i], stack_a);
        }
        for i: u8 in 0u8..26u8 {
            stack_b = zk_bitwise_stack_v0_0_1.leo/push(b[i], stack_b);
        }
        let a_index: u8 = 0u8;
        let b_index: u8 = 0u8;
        let tuple_card_stack: (u128, Stack) = (0u128, init_stack(member_size));
        for i: i8 in 0i8..52i8 {
            let use_b: bool = false;
            let use_a: bool = false;
            if (i < n) {
                use_b = true;
                b_index += 1u8;
            }
            else if (((i - n) % 2i8 == 0i8)) {
                use_a = true;
                a_index += 1u8;
            }
            else if (b_index <= 25u8) {
                use_b = true;
                b_index += 1u8;
            } else {
                use_a = true;
                a_index += 1u8;
            }
            assert(use_a && !use_b || !use_a && use_b);
            if (use_b) {
                tuple_card_stack = zk_bitwise_stack_v0_0_1.leo/pop(stack_b);
                stack_b = tuple_card_stack.1;
                shuffled_stack = zk_bitwise_stack_v0_0_1.leo/push(tuple_card_stack.0, shuffled_stack);
            }
            else {
                tuple_card_stack = zk_bitwise_stack_v0_0_1.leo/pop(stack_a);
                stack_a = tuple_card_stack.1;
                shuffled_stack = zk_bitwise_stack_v0_0_1.leo/push(tuple_card_stack.0, shuffled_stack);
            }
        }
        let tuple: (u128, Stack) = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack);
        let t0: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack);
        let t1: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack);
        let t2: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack);
        let t3: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack);
        let t4: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack);
        let t5: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack);
        let t6: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack);
        let t7: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack);
        let t8: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack);
        let t9: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack);
        let t10: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack);
        let t11: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack);
        let t12: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack);
        let t13: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack);
        let t14: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack);
        let t15: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack);
        let t16: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack);
        let t17: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack);
        let t18: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack);
        let t19: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack);
        let t20: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack);
        let t21: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack);
        let t22: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack);
        let t23: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack);
        let t24: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack);
        let t25: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack);
        let t26: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack);
        let t27: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack);
        let t28: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack);
        let t29: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack);
        let t30: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack);
        let t31: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack);
        let t32: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack);
        let t33: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack);
        let t34: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack);
        let t35: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack);
        let t36: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack);
        let t37: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack);
        let t38: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack);
        let t39: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack);
        let t40: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack);
        let t41: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack);
        let t42: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack);
        let t43: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack);
        let t44: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack);
        let t45: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack);
        let t46: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack);
        let t47: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack);
        let t48: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack);
        let t49: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack);
        let t50: u128 = tuple.0;
        shuffled_stack = tuple.1;
        tuple = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack);
        let t51: u128 = tuple.0;
        shuffled_stack = tuple.1;

        return [[t0, t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12, t13, t14, t15, t16, t17, t18, t19, t20, t21, t22, t23, t24, t25],
                [t26, t27, t28, t29, t30, t31, t32, t33, t34, t35, t36, t37, t38, t39, t40, t41, t42, t43, t44, t45, t46, t47, t48, t49, t50, t51]];
    }
}