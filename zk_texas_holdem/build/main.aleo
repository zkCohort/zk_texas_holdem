import zk_dealer.aleo;
import zk_deck_shuffle.aleo;
program zk_texas_holdem.aleo;



record Table:
    owner as address.private;
    table_id as group.private;

record Seat:
    owner as address.private;
    table_id as group.private;
    player_sequence as u8.private;
    salt as scalar.private;
    selected_seeds as [field; 7u32].private;

record Hand:
    owner as address.private;
    cards as [u8; 2u32].private;

struct TableState:
    table_id as group;
    player_index as u8;
    players as [address; 9u32];
    winner as address;
    rounds as u32;
    pot as u64;
    folded as [boolean; 9u32];


mapping table_index:
	key as group.public;
	value as TableState.public;

function main:
    input r0 as group.public;
    cast self.caller r0 into r1 as Table.record;
    output r1 as Table.record;


function commit_to_card:
    input r0 as u8.private;
    input r1 as scalar.private;
    commit.ped64 r0 r1 into r2 as group;
    output r2 as group.private;
