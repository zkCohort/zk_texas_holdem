import zk_bitwise_stack_v0_0_4.aleo;
import zk_deck_shuffle_v0_0_1.aleo;
import zk_sra_encryption_v0_0_1.aleo;
program zk_texas_holdem.aleo;


struct Players:
    player0 as address;
    player1 as address;
    player2 as address;
    player3 as address;
    player4 as address;
    player5 as address;
    player6 as address;
    player7 as address;
    player8 as address;

struct GameState:
    active as boolean;
    players as Players;
    phi as u128;
    n as u128;

record Player:
    owner as address.private;
    table_address as address.private;
    phi as u128.private;
    n as u128.private;
    e as u128.private;
    d as u128.private;
    deck_e as [[u128; 26u32]; 2u32].private;
    deck_d as [[u128; 26u32]; 2u32].private;

record Card:
    owner as address.private;
    card as u128.private;

record Deck:
    owner as address.private;
    cards as [[u128; 26u32]; 2u32].private;


mapping game_state_map:
	key as address.public;
	value as GameState.public;



function setup_game:
    input r0 as Players.private;
    input r1 as u128.private;
    input r2 as u128.private;
    is.neq r0.player0 aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0 into r3;
    assert.eq r3 true;
    assert.eq r0.player0 self.caller;
    is.neq r0.player1 aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0 into r4;
    ternary r4 r0.player1 aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0 into r5;
    is.neq r0.player2 aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0 into r6;
    ternary r6 r0.player2 aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0 into r7;
    is.neq r0.player3 aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0 into r8;
    ternary r8 r0.player3 aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0 into r9;
    is.neq r0.player4 aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0 into r10;
    ternary r10 r0.player4 aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0 into r11;
    is.neq r0.player5 aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0 into r12;
    ternary r12 r0.player5 aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0 into r13;
    is.neq r0.player6 aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0 into r14;
    ternary r14 r0.player6 aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0 into r15;
    is.neq r0.player7 aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0 into r16;
    ternary r16 r0.player7 aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0 into r17;
    is.neq r0.player8 aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0 into r18;
    ternary r18 r0.player8 aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0 into r19;
    cast self.caller into r20 as u128;
    cast r0.player0 r5 r7 r9 r11 r13 r15 r17 r19 into r21 as Players;
    cast  63u128 62u128 61u128 60u128 59u128 58u128 57u128 56u128 55u128 54u128 53u128 52u128 51u128 50u128 49u128 48u128 47u128 46u128 45u128 44u128 43u128 42u128 41u128 40u128 39u128 38u128 into r22 as [u128; 26u32];
    cast  37u128 36u128 35u128 34u128 33u128 32u128 31u128 30u128 29u128 28u128 27u128 26u128 25u128 24u128 23u128 22u128 21u128 20u128 19u128 18u128 17u128 16u128 15u128 14u128 13u128 12u128 into r23 as [u128; 26u32];
    cast  r22 r23 into r24 as [[u128; 26u32]; 2u32];
    cast self.caller r24 into r25 as Deck.record;
    async setup_game self.caller r21 r1 r2 into r26;
    output r25 as Deck.record;
    output r26 as zk_texas_holdem.aleo/setup_game.future;

finalize setup_game:
    input r0 as address.public;
    input r1 as Players.public;
    input r2 as u128.public;
    input r3 as u128.public;
    assert.eq r1.player0 r0;
    cast true r1 r2 r3 into r4 as GameState;
    set r4 into game_state_map[r0];




function join_game:
    input r0 as address.private;
    input r1 as u128.private;
    input r2 as u128.private;
    input r3 as u128.private;
    input r4 as u128.private;
    cast  0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 into r5 as [u128; 26u32];
    cast  0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 into r6 as [u128; 26u32];
    cast  r5 r6 into r7 as [[u128; 26u32]; 2u32];
    cast  0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 into r8 as [u128; 26u32];
    cast  0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 0u128 into r9 as [u128; 26u32];
    cast  r8 r9 into r10 as [[u128; 26u32]; 2u32];
    cast self.caller r0 r3 r4 r1 r2 r7 r10 into r11 as Player.record;
    async join_game r0 self.caller into r12;
    output r11 as Player.record;
    output r12 as zk_texas_holdem.aleo/join_game.future;

finalize join_game:
    input r0 as address.public;
    input r1 as address.public;
    get game_state_map[r0] into r2;
    assert.eq r2.active true;
    is.eq r2.players.player0 r1 into r3;
    ternary r3 true false into r4;
    is.eq r2.players.player1 r1 into r5;
    ternary r5 true r4 into r6;
    is.eq r2.players.player2 r1 into r7;
    ternary r7 true r6 into r8;
    is.eq r2.players.player3 r1 into r9;
    ternary r9 true r8 into r10;
    is.eq r2.players.player4 r1 into r11;
    ternary r11 true r10 into r12;
    is.eq r2.players.player5 r1 into r13;
    ternary r13 true r12 into r14;
    is.eq r2.players.player6 r1 into r15;
    ternary r15 true r14 into r16;
    is.eq r2.players.player7 r1 into r17;
    ternary r17 true r16 into r18;
    is.eq r2.players.player8 r1 into r19;
    ternary r19 true r18 into r20;
    assert.eq r20 true;


function shuffle_and_pass:
    input r0 as Player.record;
    input r1 as Deck.record;
    input r2 as [i8; 7u32].private;
    input r3 as address.private;
    call zk_sra_encryption_v0_0_1.aleo/encrypt_deck r0.e r0.n r1.cards into r4;
    call zk_deck_shuffle_v0_0_1.aleo/shuffle_deck r2[0u32] 128u16 r4 into r5;
    call zk_deck_shuffle_v0_0_1.aleo/shuffle_deck r2[1u32] 128u16 r5 into r6;
    call zk_deck_shuffle_v0_0_1.aleo/shuffle_deck r2[2u32] 128u16 r6 into r7;
    call zk_deck_shuffle_v0_0_1.aleo/shuffle_deck r2[3u32] 128u16 r7 into r8;
    call zk_deck_shuffle_v0_0_1.aleo/shuffle_deck r2[4u32] 128u16 r8 into r9;
    call zk_deck_shuffle_v0_0_1.aleo/shuffle_deck r2[5u32] 128u16 r9 into r10;
    call zk_deck_shuffle_v0_0_1.aleo/shuffle_deck r2[6u32] 128u16 r10 into r11;
    cast r0.owner r0.table_address r0.phi r0.n r0.e r0.d r0.deck_e r0.deck_d into r12 as Player.record;
    cast r3 into r13 as address;
    cast r13 r11 into r14 as Deck.record;
    async shuffle_and_pass self.caller r0.table_address r3 into r15;
    output r12 as Player.record;
    output r14 as Deck.record;
    output r15 as zk_texas_holdem.aleo/shuffle_and_pass.future;

finalize shuffle_and_pass:
    input r0 as address.public;
    input r1 as address.public;
    input r2 as address.public;
    get game_state_map[r1] into r3;
    assert.eq r3.active true;
    is.neq r3.players.player0 aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0 into r4;
    add 0u8 1u8 into r5;
    ternary r4 r5 0u8 into r6;
    is.neq r3.players.player1 aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0 into r7;
    add r6 1u8 into r8;
    ternary r7 r8 r6 into r9;
    is.neq r3.players.player2 aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0 into r10;
    add r9 1u8 into r11;
    ternary r10 r11 r9 into r12;
    is.neq r3.players.player3 aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0 into r13;
    add r12 1u8 into r14;
    ternary r13 r14 r12 into r15;
    is.neq r3.players.player4 aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0 into r16;
    add r15 1u8 into r17;
    ternary r16 r17 r15 into r18;
    is.neq r3.players.player5 aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0 into r19;
    add r18 1u8 into r20;
    ternary r19 r20 r18 into r21;
    is.neq r3.players.player6 aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0 into r22;
    add r21 1u8 into r23;
    ternary r22 r23 r21 into r24;
    is.neq r3.players.player7 aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0 into r25;
    add r24 1u8 into r26;
    ternary r25 r26 r24 into r27;
    is.neq r3.players.player8 aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0 into r28;
    add r27 1u8 into r29;
    ternary r28 r29 r27 into r30;
    gt r30 1u8 into r31;
    assert.eq r31 true;


function decrypt_encrypt_each_then_pass:
    input r0 as Player.record;
    input r1 as Deck.record;
    input r2 as [[u128; 26u32]; 2u32].private;
    input r3 as [[u128; 26u32]; 2u32].private;
    input r4 as address.private;
    call zk_sra_encryption_v0_0_1.aleo/decrypt_deck r0.d r0.n r1.cards into r5;
    call zk_sra_encryption_v0_0_1.aleo/encrypt_deck_per_card r2 r0.n r5 into r6;
    cast self.caller r0.table_address r0.phi r0.n r0.e r0.d r2 r3 into r7 as Player.record;
    cast r4 r6 into r8 as Deck.record;
    async decrypt_encrypt_each_then_pass self.caller r0.table_address r4 into r9;
    output r7 as Player.record;
    output r8 as Deck.record;
    output r9 as zk_texas_holdem.aleo/decrypt_encrypt_each_then_pass.future;

finalize decrypt_encrypt_each_then_pass:
    input r0 as address.public;
    input r1 as address.public;
    input r2 as address.public;
    get game_state_map[r1] into r3;
    assert.eq r3.active true;
    is.neq r3.players.player0 aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0 into r4;
    add 0u8 1u8 into r5;
    ternary r4 r5 0u8 into r6;
    is.neq r3.players.player1 aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0 into r7;
    add r6 1u8 into r8;
    ternary r7 r8 r6 into r9;
    is.neq r3.players.player2 aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0 into r10;
    add r9 1u8 into r11;
    ternary r10 r11 r9 into r12;
    is.neq r3.players.player3 aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0 into r13;
    add r12 1u8 into r14;
    ternary r13 r14 r12 into r15;
    is.neq r3.players.player4 aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0 into r16;
    add r15 1u8 into r17;
    ternary r16 r17 r15 into r18;
    is.neq r3.players.player5 aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0 into r19;
    add r18 1u8 into r20;
    ternary r19 r20 r18 into r21;
    is.neq r3.players.player6 aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0 into r22;
    add r21 1u8 into r23;
    ternary r22 r23 r21 into r24;
    is.neq r3.players.player7 aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0 into r25;
    add r24 1u8 into r26;
    ternary r25 r26 r24 into r27;
    is.neq r3.players.player8 aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0 into r28;
    add r27 1u8 into r29;
    ternary r28 r29 r27 into r30;
    gt r30 1u8 into r31;
    assert.eq r31 true;
