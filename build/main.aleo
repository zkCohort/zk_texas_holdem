import zk_deck_shuffle.aleo;
program zk_texas_holdem.aleo;

record GameState:
    owner as address.private;
    deck as u64.private;
    river as u64.private;
    players as u8.private;
    player1 as u64.private;
    player2 as u64.private;
    player3 as u64.private;
    player4 as u64.private;
    player5 as u64.private;
    player6 as u64.private;
    player7 as u64.private;
    player8 as u64.private;

record Invitation:
    owner as address.private;
    caller as address.private;

record Hand:
    owner as address.private;
    card1 as u64.private;
    card2 as u64.private;

record Seed:
    owner as address.private;
    seed as i8.private;

struct SplitDeck:
    c0 as u64;
    c1 as u64;
    c2 as u64;
    c3 as u64;
    c4 as u64;
    c5 as u64;
    c6 as u64;
    c7 as u64;
    c8 as u64;
    c9 as u64;
    c10 as u64;
    c11 as u64;
    c12 as u64;
    c13 as u64;
    c14 as u64;
    c15 as u64;
    c16 as u64;
    c17 as u64;
    c18 as u64;
    c19 as u64;
    c20 as u64;
    c21 as u64;
    c22 as u64;
    c23 as u64;
    c24 as u64;
    c25 as u64;

struct Deck:
    bottom as SplitDeck;
    top as SplitDeck;


closure new_deck:
    input r0 as boolean;
    shl 1u64 63u8 into r1;
    shl 1u64 62u8 into r2;
    shl 1u64 61u8 into r3;
    shl 1u64 60u8 into r4;
    shl 1u64 59u8 into r5;
    shl 1u64 58u8 into r6;
    shl 1u64 57u8 into r7;
    shl 1u64 56u8 into r8;
    shl 1u64 55u8 into r9;
    shl 1u64 54u8 into r10;
    shl 1u64 53u8 into r11;
    shl 1u64 52u8 into r12;
    shl 1u64 51u8 into r13;
    shl 1u64 50u8 into r14;
    shl 1u64 49u8 into r15;
    shl 1u64 48u8 into r16;
    shl 1u64 47u8 into r17;
    shl 1u64 46u8 into r18;
    shl 1u64 45u8 into r19;
    shl 1u64 44u8 into r20;
    shl 1u64 43u8 into r21;
    shl 1u64 42u8 into r22;
    shl 1u64 41u8 into r23;
    shl 1u64 40u8 into r24;
    shl 1u64 39u8 into r25;
    shl 1u64 38u8 into r26;
    cast r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 r16 r17 r18 r19 r20 r21 r22 r23 r24 r25 r26 into r27 as SplitDeck;
    shl 1u64 37u8 into r28;
    shl 1u64 36u8 into r29;
    shl 1u64 35u8 into r30;
    shl 1u64 34u8 into r31;
    shl 1u64 33u8 into r32;
    shl 1u64 32u8 into r33;
    shl 1u64 31u8 into r34;
    shl 1u64 30u8 into r35;
    shl 1u64 29u8 into r36;
    shl 1u64 28u8 into r37;
    shl 1u64 27u8 into r38;
    shl 1u64 26u8 into r39;
    shl 1u64 25u8 into r40;
    shl 1u64 24u8 into r41;
    shl 1u64 23u8 into r42;
    shl 1u64 22u8 into r43;
    shl 1u64 21u8 into r44;
    shl 1u64 20u8 into r45;
    shl 1u64 19u8 into r46;
    shl 1u64 18u8 into r47;
    shl 1u64 17u8 into r48;
    shl 1u64 16u8 into r49;
    shl 1u64 15u8 into r50;
    shl 1u64 14u8 into r51;
    shl 1u64 13u8 into r52;
    shl 1u64 12u8 into r53;
    cast r28 r29 r30 r31 r32 r33 r34 r35 r36 r37 r38 r39 r40 r41 r42 r43 r44 r45 r46 r47 r48 r49 r50 r51 r52 r53 into r54 as SplitDeck;
    cast r27 r54 into r55 as Deck;
    output r55 as Deck;


function main:
    input r0 as u8.public;
    cast self.signer 18446744073709547520u64 0u64 r0 0u64 0u64 0u64 0u64 0u64 0u64 0u64 0u64 into r1 as GameState.record;
    output r1 as GameState.record;


function do_shuffle:
    input r0 as i8.private;
    input r1 as i8.private;
    input r2 as i8.private;
    input r3 as i8.private;
    input r4 as i8.private;
    input r5 as i8.private;
    input r6 as i8.private;
    call zk_deck_shuffle.aleo/shuffle r0 r1 r2 r3 r4 r5 r6 into r7;
    output r7 as [[u8; 26u32]; 2u32].private;
