program zk_dealer.aleo;

record GameState:
    owner as address.private;
    table_id as group.private;
    deck as u64.private;
    river as u64.private;
    hands as [u64; 9u32].private;
    seeds as [field; 9u32].private;

struct State:
    table_id as group;
    deck as group;
    river as u64;
    hands as [u64; 9u32];
    seeds as [field; 20u32];
    commitments as [group; 9u32];


mapping public_game_state:
	key as group.public;
	value as State.public;

function init_table:
    input r0 as group.private;
    cast 63u862u861u860u859u858u857u856u855u854u853u852u851u850u849u848u847u846u845u844u843u842u841u840u839u838u8 into r1 as [u8; 26u32];
    cast 37u836u835u834u833u832u831u830u829u828u827u826u825u824u823u822u821u820u819u818u817u816u815u814u813u812u8 into r2 as [u8; 26u32];
    cast r1r2 into r3 as [[u8; 26u32]; 2u32];
    async init_table r0 into r4;
    output r3 as [[u8; 26u32]; 2u32].private;
    output r4 as zk_dealer.aleo/init_table.future;

finalize init_table:
    input r0 as group.public;
    rand.chacha into r1 as field;
    rand.chacha into r2 as field;
    rand.chacha into r3 as field;
    rand.chacha into r4 as field;
    rand.chacha into r5 as field;
    rand.chacha into r6 as field;
    rand.chacha into r7 as field;
    rand.chacha into r8 as field;
    rand.chacha into r9 as field;
    rand.chacha into r10 as field;
    rand.chacha into r11 as field;
    rand.chacha into r12 as field;
    rand.chacha into r13 as field;
    rand.chacha into r14 as field;
    rand.chacha into r15 as field;
    rand.chacha into r16 as field;
    rand.chacha into r17 as field;
    rand.chacha into r18 as field;
    rand.chacha into r19 as field;
    rand.chacha into r20 as field;
    cast 0u640u640u640u640u640u640u640u640u64 into r21 as [u64; 9u32];
    cast r1r2r3r4r5r6r7r8r9r10r11r12r13r14r15r16r17r18r19r20 into r22 as [field; 20u32];
    cast 0group0group0group0group0group0group0group0group0group into r23 as [group; 9u32];
    cast r0 0group 0u64 r21 r22 r23 into r24 as State;
    get.or_use public_game_state[r0] r24 into r25;
    is.eq r25 r24 into r26;
    assert.eq r26 true;
    set r25 into public_game_state[r0];
