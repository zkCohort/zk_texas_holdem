import sra_encryption.aleo;
import zk_deck_shuffle_v0_0_1.aleo;
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

function get_address:
    input r0 as u128.private;
    cast r0 into r1 as address;
    output r1 as address.private;




function setup_game:
    input r0 as Players.private;
    input r1 as u128.private;
    input r2 as u128.private;
    cast 0u128 into r3 as address;
    is.neq r0.player0 r3 into r4;
    assert.eq r4 true;
    assert.eq r0.player0 self.caller;
    is.neq r0.player1 r3 into r5;
    ternary r5 r0.player1 r3 into r6;
    is.neq r0.player2 r3 into r7;
    ternary r7 r0.player2 r3 into r8;
    is.neq r0.player3 r3 into r9;
    ternary r9 r0.player3 r3 into r10;
    is.neq r0.player4 r3 into r11;
    ternary r11 r0.player4 r3 into r12;
    is.neq r0.player5 r3 into r13;
    ternary r13 r0.player5 r3 into r14;
    is.neq r0.player6 r3 into r15;
    ternary r15 r0.player6 r3 into r16;
    is.neq r0.player7 r3 into r17;
    ternary r17 r0.player7 r3 into r18;
    is.neq r0.player8 r3 into r19;
    ternary r19 r0.player8 r3 into r20;
    cast self.caller into r21 as u128;
    cast r0.player0 r6 r8 r10 r12 r14 r16 r18 r20 into r22 as Players;
    cast 63u12862u12861u12860u12859u12858u12857u12856u12855u12854u12853u12852u12851u12850u12849u12848u12847u12846u12845u12844u12843u12842u12841u12840u12839u12838u128 into r23 as [u128; 26u32];
    cast 37u12836u12835u12834u12833u12832u12831u12830u12829u12828u12827u12826u12825u12824u12823u12822u12821u12820u12819u12818u12817u12816u12815u12814u12813u12812u128 into r24 as [u128; 26u32];
    cast r23r24 into r25 as [[u128; 26u32]; 2u32];
    cast self.caller r25 into r26 as Deck.record;
    async setup_game self.caller r22 r1 r2 into r27;
    output r26 as Deck.record;
    output r27 as zk_texas_holdem.aleo/setup_game.future;

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
    cast 0u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u128 into r5 as [u128; 26u32];
    cast 0u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u128 into r6 as [u128; 26u32];
    cast r5r6 into r7 as [[u128; 26u32]; 2u32];
    cast 0u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u128 into r8 as [u128; 26u32];
    cast 0u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u1280u128 into r9 as [u128; 26u32];
    cast r8r9 into r10 as [[u128; 26u32]; 2u32];
    cast self.caller r0 r3 r4 r1 r2 r7 r10 into r11 as Player.record;
    async join_game r0 self.caller into r12;
    output r11 as Player.record;
    output r12 as zk_texas_holdem.aleo/join_game.future;

finalize join_game:
    input r0 as address.public;
    input r1 as address.public;
    get game_state_map[r0] into r2;
    assert.eq r2.active true;
    cast 0u128 into r3 as address;
    is.eq r2.players.player0 r1 into r4;
    ternary r4 true false into r5;
    is.eq r2.players.player1 r1 into r6;
    ternary r6 true r5 into r7;
    is.eq r2.players.player2 r1 into r8;
    ternary r8 true r7 into r9;
    is.eq r2.players.player3 r1 into r10;
    ternary r10 true r9 into r11;
    is.eq r2.players.player4 r1 into r12;
    ternary r12 true r11 into r13;
    is.eq r2.players.player5 r1 into r14;
    ternary r14 true r13 into r15;
    is.eq r2.players.player6 r1 into r16;
    ternary r16 true r15 into r17;
    is.eq r2.players.player7 r1 into r18;
    ternary r18 true r17 into r19;
    is.eq r2.players.player8 r1 into r20;
    ternary r20 true r19 into r21;
    assert.eq r21 true;


function shuffle_and_pass:
    input r0 as Player.record;
    input r1 as Deck.record;
    input r2 as i8.private;
    input r3 as i8.private;
    input r4 as i8.private;
    input r5 as i8.private;
    input r6 as address.private;
    call sra_encryption.aleo/encrypt_deck r0.e r0.n r1.cards into r7;
    call zk_deck_shuffle_v0_0_1.aleo/setup_shuffle r2 r7 into r8 r9 r10;
    call zk_deck_shuffle_v0_0_1.aleo/shuffle_deck r8 128u8 r9 r10 into r11;
    call zk_deck_shuffle_v0_0_1.aleo/setup_shuffle r3 r11 into r12 r13 r14;
    call zk_deck_shuffle_v0_0_1.aleo/shuffle_deck r12 128u8 r13 r14 into r15;
    call zk_deck_shuffle_v0_0_1.aleo/setup_shuffle r4 r15 into r16 r17 r18;
    call zk_deck_shuffle_v0_0_1.aleo/shuffle_deck r16 128u8 r17 r18 into r19;
    call zk_deck_shuffle_v0_0_1.aleo/setup_shuffle r5 r19 into r20 r21 r22;
    call zk_deck_shuffle_v0_0_1.aleo/shuffle_deck r20 128u8 r21 r22 into r23;
    cast r0.owner r0.table_address r0.phi r0.n r0.e r0.d r0.deck_e r0.deck_d into r24 as Player.record;
    cast r6 into r25 as address;
    cast r25 r23 into r26 as Deck.record;
    output r24 as Player.record;
    output r26 as Deck.record;


function decrypt_encrypt_each_then_pass:
    input r0 as Player.record;
    input r1 as Deck.record;
    input r2 as [[u128; 26u32]; 2u32].private;
    input r3 as [[u128; 26u32]; 2u32].private;
    input r4 as address.private;
    call sra_encryption.aleo/decrypt_deck r0.d r0.n r1.cards into r5;
    call sra_encryption.aleo/encrypt_deck_per_card r2 r0.n r5 into r6;
    cast self.caller r0.table_address r0.phi r0.n r0.e r0.d r2 r3 into r7 as Player.record;
    cast r4 r6 into r8 as Deck.record;
    output r7 as Player.record;
    output r8 as Deck.record;
