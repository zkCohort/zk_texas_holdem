# zk_texas_holdem.aleo

## Build Guide

To compile this Aleo program, run:

```bash
snarkvm build
```

To execute this Aleo program, run:

```bash
snarkvm run hello
```

## Some Aleo Accounts for Testing and Demonstration purposes

### !!! Do not put keys from your .env file here !!!

snarkos developer execute credits.aleo transfer_private "{ owner: aleo1rhgdu77hgyqd3xjj8ucu3jj9r2krwz6mnzyd80gncr5fxcwlh5rsvzp9px.private, microcredits: 1000000000000u64.private, \_nonce: 1870384227717108990812464071079401090030090200169646008180314689517851502548group.public}" "aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c" 873000000000u64 --private-key APrivateKey1zkp8CZNn3yeCseEtxuVPbDCwSyhGW6yZKUYKfgXmcpoGPWH --query "http://localhost:3030" --broadcast "http://localhost:3030/testnet3/transaction/broadcast"

snarkos developer execute credits.aleo transfer_private $RECORD1 "aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c" 837500000000u64 --private-key APrivateKey1zkp8CZNn3yeCseEtxuVPbDCwSyhGW6yZKUYKfgXmcpoGPWH --query "http://localhost:3030" --broadcast "http://localhost:3030/testnet3/transaction/broadcast"

snarkos developer deploy zk_deck_shuffle.aleo --private-key APrivateKey1zkpFbE6pVQGjDg76PmNJTvPLMSucSqQ4VvJ8yf8zWhBxMnN --query "http://localhost:3030" --path "./zk_texas_holdem/build/imports" --broadcast "http://localhost:3030/testnet3/transaction/broadcast" --fee 600000 --record "UNSPENT_RECORD"

1. Private Key APrivateKey1zkpFbE6pVQGjDg76PmNJTvPLMSucSqQ4VvJ8yf8zWhBxMnN
   View Key AViewKey1qrgqzJkfen4Y85Uz3S91PhprWNRpevzpJ2tnb5fw4S9Q
   Address aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c
2. Private Key APrivateKey1zkpAKjgjyyp5FRSX45DrpSQE5QJfcv5S77Xy8btppGeCAAC
   View Key AViewKey1grAH4JuefVdHMvi6JCZcQTX7sgRskWjNbAAvA9UDivqf
   Address aleo1gtrgfxzhuvpgmxtm5jz0pj8h6m6vacn07dcf5tdp86xxmpuyqsxqw45d4y
3. Private Key APrivateKey1zkp3pezMb9Q2DPNWx9PaAuaPWukjKmkBTssiNg118cWbC4M
   View Key AViewKey1kWorpwzEqhjRaBtdj6WQ7JSr5H5VVZwS4HGemb7YEMgd
   Address aleo1xg0z05nm65k5e0aafe8h82m6dtk9hsav6n87kh9rjz4wwexfyyrsfengj5
4. Private Key APrivateKey1zkp1tKgvbSUGRELNgQMqGJDR2LbU6UjxARn8ye1iNd1ei6d
   View Key AViewKey1pCmTATMHZTp8iDMWzSB6pQud6d6E34KSVVRgsW1bt3VB
   Address aleo1z5gjpu2vql5n8hy6ajl57jcm2hgf6vmskxzfszzpmvwxnhl7h5xqawu8gd
5. Private Key APrivateKey1zkp7uqdcZ1gsc28o8gMuNYy7Pv4ra2KXKmTRqXo9APx63ee
   View Key AViewKey1pw6b9Xaeumnw2i1snHb7kTckVvhVv2GQLfF4BjZWjoMd
   Address aleo1ac7lty930zchtzl4f602nnf06rt8a0et8lw84jf6uyhljzqdq59qmsr2n9
6. Private Key APrivateKey1zkp6BXiAtqTugZybXTNFt48VX9gMnz4BPaFwXiRsPDyjgRP
   View Key AViewKey1pQJhWKt5GDqWwhEQAh7xVyA13kJB3So7aqvNdspWeHFX
   Address aleo1wljecvf4fzyjur6lwe4k44k5hh26angzlyjurl4ca92sntkwhc8sur78r9
7. Private Key APrivateKey1zkpFCiWtJsD59coAGD183E3bjwyu9HejD72G14RtQQCPLMP
   View Key AViewKey1pXuHuGPhBpo4cfjggKTfdY2vEwC6Dr9NdAy9zDrwizYK
   Address aleo19rtpzd6s79wxvh2hw62e7ldw6gtfvszree8rvurq9g8hz7nytsrsaeprsj
8. Private Key APrivateKey1zkp9RDut2CXAkbsVsbmvvZRrU4UiqdPyJqKLUWd2w8uHt4B
   View Key AViewKey1pk5ojcTCtGQAoWUjFGHmTXP1ZCZ8qzzEU8qJ5dric1ZR
   Address aleo19wumu60j68qs7e3r6qtaerxz0mumg4ukelv6cmq8w26umn6g7syqmes8dm
9. Private Key APrivateKey1zkp4MPCYDU1THHiweQAYQxNWyn8SwK2WG4rFpS5as4BiE2P
   View Key AViewKey1eanMB7MSZCPaM8MK8RaHhns57YtbTqDBtin8fUTiz59i
   Address aleo1zw0ah806rpxqffcwt9lu82qzn0vwnq70he0gk28ludtfqsuukcgsel6qpd

## Game Setup

```zsh
leo run init_players aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c aleo1gtrgfxzhuvpgmxtm5jz0pj8h6m6vacn07dcf5tdp86xxmpuyqsxqw45d4y aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0 aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0 aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0 aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0 aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0 aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0 aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0
       Leo ✅ Compiled 'main.leo' into Aleo instructions

⛓  Constraints

 •  'zk_texas_holdem.aleo/init_players' - 0 constraints (called 1 time)

➡️  Output

 • {
  player0: aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c,
  player1: aleo1gtrgfxzhuvpgmxtm5jz0pj8h6m6vacn07dcf5tdp86xxmpuyqsxqw45d4y,
  player2: aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0,
  player3: aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0,
  player4: aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0,
  player5: aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0,
  player6: aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0,
  player7: aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0,
  player8: aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0
}

       Leo ✅ Finished 'zk_texas_holdem.aleo/init_players'
```

```zsh
leo run setup_game "{
  player0: aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c,
  player1: aleo1gtrgfxzhuvpgmxtm5jz0pj8h6m6vacn07dcf5tdp86xxmpuyqsxqw45d4y,
  player2: aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0,
  player3: aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0,
  player4: aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0,
  player5: aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0,
  player6: aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0,
  player7: aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0,
  player8: aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0
}" 2801307600field 2801413507u128
       Leo ✅ Compiled 'main.leo' into Aleo instructions

⛓  Constraints

 •  'zk_texas_holdem.aleo/setup_game' - 2,266 constraints (called 1 time)

➡️  Outputs

 • {
  owner: aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c.private,
  cards: [
    [
      63field.private,
      62field.private,
      61field.private,
      60field.private,
      59field.private,
      58field.private,
      57field.private,
      56field.private,
      55field.private,
      54field.private,
      53field.private,
      52field.private,
      51field.private,
      50field.private,
      49field.private,
      48field.private,
      47field.private,
      46field.private,
      45field.private,
      44field.private,
      43field.private,
      42field.private,
      41field.private,
      40field.private,
      39field.private,
      38field.private
    ],
    [
      37field.private,
      36field.private,
      35field.private,
      34field.private,
      33field.private,
      32field.private,
      31field.private,
      30field.private,
      29field.private,
      28field.private,
      27field.private,
      26field.private,
      25field.private,
      24field.private,
      23field.private,
      22field.private,
      21field.private,
      20field.private,
      19field.private,
      18field.private,
      17field.private,
      16field.private,
      15field.private,
      14field.private,
      13field.private,
      12field.private
    ]
  ],
  _nonce: 2139819510586079660120932439902383743899412820148858738718185967579374721054group.public
}
 • {
  program_id: zk_texas_holdem.aleo,
  function_name: setup_game,
  arguments: [
    aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c,
    2u8,
    {
  player0: aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c,
  player1: aleo1gtrgfxzhuvpgmxtm5jz0pj8h6m6vacn07dcf5tdp86xxmpuyqsxqw45d4y,
  player2: aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0,
  player3: aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0,
  player4: aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0,
  player5: aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0,
  player6: aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0,
  player7: aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0,
  player8: aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0
},
    {
  player0: aleo1gtrgfxzhuvpgmxtm5jz0pj8h6m6vacn07dcf5tdp86xxmpuyqsxqw45d4y,
  player1: aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c,
  player2: aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0,
  player3: aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0,
  player4: aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0,
  player5: aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0,
  player6: aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0,
  player7: aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0,
  player8: aleo1qgqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqanmpl0
},
    2801307600field,
    2801413507u128
  ]
}

       Leo ✅ Finished 'zk_texas_holdem.aleo/setup_game'
```

## Player 2 joins game

```zsh
leo run join_game aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c 1380396943field 2734228207field 2801307600field 2801413507u128
       Leo ✅ Compiled 'main.leo' into Aleo instructions

⛓  Constraints

 •  'zk_texas_holdem.aleo/join_game' - 2,020 constraints (called 1 time)

➡️  Outputs

 • {
  owner: aleo1gtrgfxzhuvpgmxtm5jz0pj8h6m6vacn07dcf5tdp86xxmpuyqsxqw45d4y.private,
  table_address: aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c.private,
  index: 1u8.private,
  phi: 2801307600field.private,
  n: 2801413507u128.private,
  e: 1380396943field.private,
  d: 2734228207field.private,
  deck_e: [
    [
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private
    ],
    [
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private
    ]
  ],
  deck_d: [
    [
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private
    ],
    [
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private
    ]
  ],
  _nonce: 1998383111598947495510883532423805162695083236822547473446741607927122423105group.public
}
 • {
  program_id: zk_texas_holdem.aleo,
  function_name: join_game,
  arguments: [
    aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c,
    aleo1gtrgfxzhuvpgmxtm5jz0pj8h6m6vacn07dcf5tdp86xxmpuyqsxqw45d4y,
    2801307600field,
    2801413507u128
  ]
}

       Leo ✅ Finished 'zk_texas_holdem.aleo/join_game'
```

## Player 0 does a shuffle_and_pass transaction to address Player 1

```zsh
zk_texas_holdem % leo run shuffle_and_pass -- -- "{
  owner: aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c.private,
  table_address: aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c.private,
  index: 0u8.private,
  phi: 2801307600field.private,
  n: 2801413507u128.private,
  e: 1170454781field.private,
  d: 2423676821field.private,
  deck_e: [
    [
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private
    ],
    [
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private
    ]
  ],
  deck_d: [
    [
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private
    ],
    [
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private
    ]
  ],
  _nonce: 6227482928804889989781829452526314579422943618836555815401568926162241502497group.public
}" "{
  owner: aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c.private,
  cards: [
    [
      63field.private,
      62field.private,
      61field.private,
      60field.private,
      59field.private,
      58field.private,
      57field.private,
      56field.private,
      55field.private,
      54field.private,
      53field.private,
      52field.private,
      51field.private,
      50field.private,
      49field.private,
      48field.private,
      47field.private,
      46field.private,
      45field.private,
      44field.private,
      43field.private,
      42field.private,
      41field.private,
      40field.private,
      39field.private,
      38field.private
    ],
    [
      37field.private,
      36field.private,
      35field.private,
      34field.private,
      33field.private,
      32field.private,
      31field.private,
      30field.private,
      29field.private,
      28field.private,
      27field.private,
      26field.private,
      25field.private,
      24field.private,
      23field.private,
      22field.private,
      21field.private,
      20field.private,
      19field.private,
      18field.private,
      17field.private,
      16field.private,
      15field.private,
      14field.private,
      13field.private,
      12field.private
    ]
  ],
  _nonce: 2748886393642050821735342760440227962915648045687603101011273625956899716054group.public
}" "[3i8, 4i8, 12i8, -9i8, -14i8, 17i8, 24i8]" aleo1gtrgfxzhuvpgmxtm5jz0pj8h6m6vacn07dcf5tdp86xxmpuyqsxqw45d4y
       Leo ✅ Compiled 'main.leo' into Aleo instructions

⛓  Constraints

 •  'zk_deck_shuffle_v0_0_1.aleo/shuffle_deck' - 841,960 constraints (called 7 times)
 •  'zk_texas_holdem.aleo/shuffle_and_pass' - 374,309 constraints (called 1 time)
 •  'zk_sra_encryption_v0_0_2.aleo/encrypt_deck' - 4,434,508 constraints (called 1 time)

➡️  Outputs

 • {
  owner: aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c.private,
  table_address: aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c.private,
  index: 0u8.private,
  phi: 2801307600field.private,
  n: 2801413507u128.private,
  e: 1170454781field.private,
  d: 2423676821field.private,
  deck_e: [
    [
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private
    ],
    [
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private
    ]
  ],
  deck_d: [
    [
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private
    ],
    [
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private
    ]
  ],
  _nonce: 8227606123994255495186290492523888430885588320573247320414713214241338249564group.public
}
 • {
  owner: aleo1gtrgfxzhuvpgmxtm5jz0pj8h6m6vacn07dcf5tdp86xxmpuyqsxqw45d4y.private,
  cards: [
    [
      1882329000field.private,
      669953033field.private,
      596816486field.private,
      1495252248field.private,
      1623141294field.private,
      936796540field.private,
      1956154540field.private,
      2181212383field.private,
      2466079850field.private,
      73037100field.private,
      687901095field.private,
      1693233513field.private,
      1110781385field.private,
      1499047059field.private,
      777418495field.private,
      1196978238field.private,
      903548341field.private,
      1685927905field.private,
      793111979field.private,
      931772915field.private,
      1381442244field.private,
      1159745069field.private,
      2388233669field.private,
      1063887846field.private,
      2384638503field.private,
      1433050422field.private
    ],
    [
      784691257field.private,
      1688497017field.private,
      1043611221field.private,
      421829602field.private,
      430635744field.private,
      1855039138field.private,
      891766602field.private,
      1023113432field.private,
      265204498field.private,
      1887618880field.private,
      548699321field.private,
      2505253929field.private,
      2203329578field.private,
      340496627field.private,
      247721630field.private,
      1219224265field.private,
      1279869734field.private,
      948844410field.private,
      2194972411field.private,
      2430342993field.private,
      726757187field.private,
      1064482984field.private,
      760515934field.private,
      594273551field.private,
      1815182032field.private,
      65673615field.private
    ]
  ],
  _nonce: 3882067503933784596747744478550249943908158393613156857282158345922322722473group.public
}
 • {
  program_id: zk_texas_holdem.aleo,
  function_name: shuffle_and_pass,
  arguments: [
    aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c,
    aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c,
    aleo1gtrgfxzhuvpgmxtm5jz0pj8h6m6vacn07dcf5tdp86xxmpuyqsxqw45d4y
  ]
}

       Leo ✅ Finished 'zk_texas_holdem.aleo/shuffle_and_pass'
```

## Player 1 does a shuffle and pass back to Player 0

```zsh

```bash
leo run shuffle_and_pass "{
  owner: aleo1gtrgfxzhuvpgmxtm5jz0pj8h6m6vacn07dcf5tdp86xxmpuyqsxqw45d4y.private,
  table_address: aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c.private,
  index: 1u8.private,
  phi: 2801307600field.private,
  n: 2801413507u128.private,
  e: 1380396943field.private,
  d: 2734228207field.private,
  deck_e: [
    [
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private
    ],
    [
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private
    ]
  ],
  deck_d: [
    [
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private
    ],
    [
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private
    ]
  ],
  _nonce: 2712496926427479107044795782073620584741133829304745049828829586432896819541group.public
}" "{
  owner: aleo1gtrgfxzhuvpgmxtm5jz0pj8h6m6vacn07dcf5tdp86xxmpuyqsxqw45d4y.private,
  cards: [
    [
      1882329000field.private,
      669953033field.private,
      596816486field.private,
      1495252248field.private,
      1623141294field.private,
      936796540field.private,
      1956154540field.private,
      2181212383field.private,
      2466079850field.private,
      73037100field.private,
      687901095field.private,
      1693233513field.private,
      1110781385field.private,
      1499047059field.private,
      777418495field.private,
      1196978238field.private,
      903548341field.private,
      1685927905field.private,
      793111979field.private,
      931772915field.private,
      1381442244field.private,
      1159745069field.private,
      2388233669field.private,
      1063887846field.private,
      2384638503field.private,
      1433050422field.private
    ],
    [
      784691257field.private,
      1688497017field.private,
      1043611221field.private,
      421829602field.private,
      430635744field.private,
      1855039138field.private,
      891766602field.private,
      1023113432field.private,
      265204498field.private,
      1887618880field.private,
      548699321field.private,
      2505253929field.private,
      2203329578field.private,
      340496627field.private,
      247721630field.private,
      1219224265field.private,
      1279869734field.private,
      948844410field.private,
      2194972411field.private,
      2430342993field.private,
      726757187field.private,
      1064482984field.private,
      760515934field.private,
      594273551field.private,
      1815182032field.private,
      65673615field.private
    ]
  ],
  _nonce: 3882067503933784596747744478550249943908158393613156857282158345922322722473group.public
}" "[3i8, 4i8, 12i8, 9i8, -6i8, -12i8, 13i8]" aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c
       Leo ✅ Compiled 'main.leo' into Aleo instructions

⛓  Constraints

 •  'zk_sra_encryption_v0_0_2.aleo/encrypt_deck' - 4,434,508 constraints (called 1 time)
 •  'zk_deck_shuffle_v0_0_1.aleo/shuffle_deck' - 841,960 constraints (called 7 times)
 •  'zk_texas_holdem.aleo/shuffle_and_pass' - 374,309 constraints (called 1 time)

➡️  Outputs

 • {
  owner: aleo1gtrgfxzhuvpgmxtm5jz0pj8h6m6vacn07dcf5tdp86xxmpuyqsxqw45d4y.private,
  table_address: aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c.private,
  index: 1u8.private,
  phi: 2801307600field.private,
  n: 2801413507u128.private,
  e: 1380396943field.private,
  d: 2734228207field.private,
  deck_e: [
    [
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private
    ],
    [
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private
    ]
  ],
  deck_d: [
    [
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private
    ],
    [
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private
    ]
  ],
  _nonce: 6638883398164484773631542304523636307241708888883521172413470375879544812954group.public
}
 • {
  owner: aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c.private,
  cards: [
    [
      527303256field.private,
      2342371725field.private,
      1937424230field.private,
      1922932692field.private,
      1563531344field.private,
      2450683058field.private,
      597410864field.private,
      1205669855field.private,
      2108885899field.private,
      119914801field.private,
      2376412319field.private,
      2488438057field.private,
      2741710737field.private,
      1293934511field.private,
      1555069154field.private,
      1295839414field.private,
      1005598803field.private,
      1002604125field.private,
      1928671067field.private,
      398439939field.private,
      55606756field.private,
      1542952919field.private,
      113149779field.private,
      1078841610field.private,
      326515929field.private,
      1093061910field.private
    ],
    [
      1726317647field.private,
      2029673705field.private,
      1426015505field.private,
      1098225456field.private,
      4069587field.private,
      1843860306field.private,
      473385152field.private,
      403886252field.private,
      1732305040field.private,
      1966655108field.private,
      1120652027field.private,
      1933674156field.private,
      1842823732field.private,
      2568736393field.private,
      463927696field.private,
      174922806field.private,
      2464738302field.private,
      2554446267field.private,
      451572880field.private,
      2738213003field.private,
      469395325field.private,
      2074606524field.private,
      703520137field.private,
      431217063field.private,
      1070862390field.private,
      225719549field.private
    ]
  ],
  _nonce: 7005345159046049840779863113575409256097336675141520032307423646448137254230group.public
}
 • {
  program_id: zk_texas_holdem.aleo,
  function_name: shuffle_and_pass,
  arguments: [
    aleo1gtrgfxzhuvpgmxtm5jz0pj8h6m6vacn07dcf5tdp86xxmpuyqsxqw45d4y,
    aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c,
    aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c
  ]
}

       Leo ✅ Finished 'zk_texas_holdem.aleo/shuffle_and_pass'
```

## decrypt and encrypt per card from Player 0 to Player 1

```zsh
leo run decrypt_encrypt_each_then_pass "{
  owner: aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c.private,
  table_address: aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c.private,
  index: 0u8.private,
  phi: 2801307600field.private,
  n: 2801413507u128.private,
  e: 1170454781field.private,
  d: 2423676821field.private,
  deck_e: [
    [
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private
    ],
    [
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private
    ]
  ],
  deck_d: [
    [
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private
    ],
    [
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private
    ]
  ],
  _nonce: 6227482928804889989781829452526314579422943618836555815401568926162241502497group.public
}" "{
  owner: aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c.private,
  cards: [
    [
      527303256field.private,
      2342371725field.private,
      1937424230field.private,
      1922932692field.private,
      1563531344field.private,
      2450683058field.private,
      597410864field.private,
      1205669855field.private,
      2108885899field.private,
      119914801field.private,
      2376412319field.private,
      2488438057field.private,
      2741710737field.private,
      1293934511field.private,
      1555069154field.private,
      1295839414field.private,
      1005598803field.private,
      1002604125field.private,
      1928671067field.private,
      398439939field.private,
      55606756field.private,
      1542952919field.private,
      113149779field.private,
      1078841610field.private,
      326515929field.private,
      1093061910field.private
    ],
    [
      1726317647field.private,
      2029673705field.private,
      1426015505field.private,
      1098225456field.private,
      4069587field.private,
      1843860306field.private,
      473385152field.private,
      403886252field.private,
      1732305040field.private,
      1966655108field.private,
      1120652027field.private,
      1933674156field.private,
      1842823732field.private,
      2568736393field.private,
      463927696field.private,
      174922806field.private,
      2464738302field.private,
      2554446267field.private,
      451572880field.private,
      2738213003field.private,
      469395325field.private,
      2074606524field.private,
      703520137field.private,
      431217063field.private,
      1070862390field.private,
      225719549field.private
    ]
  ],
  _nonce: 7005345159046049840779863113575409256097336675141520032307423646448137254230group.public
}" "[[333049603field, 1654889471field, 1921379489field, 883389029field, 2146122613field, 823429423field, 1170274603field, 704161421field, 819741157field, 960122407field, 2066102789field, 791247907field, 1514399101field, 57812059field, 1780465111field, 1271448463field, 461104981field, 2127822449field, 2065346921field, 1740989899field, 1281503651field, 618298943field, 1581324613field, 1747213609field, 75413243field, 1235103199field], [999059149field, 2067597887field, 2043920849field, 1599023653field, 954436397field, 1555980533field, 1049548999field, 150286973field, 751615601field, 839281003field, 779529337field, 545437223field, 1545514531field, 456969839field, 1216270829field, 953066129field, 2021014291field, 2026867187field, 1101677327field, 675372013field, 1922818111field, 887015861field, 1809876379field, 1595328871field, 1651110697field, 1592518111field]]" "[[1260384667field, 521309231field, 882323009field, 1816651469field, 720096877field, 2602150687field, 1687735267field, 1335274181field, 901205293field, 2029938343field, 1375897709field, 2526276043field, 424172101field, 2217571939field, 1844849191field, 1835613727field, 2152034221field, 471742049field, 2679902681field, 461594899field, 1573449851field, 2332759007field, 1695518077field, 297551689field, 646503107field, 481035199field], [619228549field, 835902623field, 815333249field, 2180479117field, 1305036533field, 27750797field, 1099255399field, 2182877237field, 135874001field, 926762467field, 1112455273field, 2258368487field, 2777879371field, 258119759field, 2223360869field, 428348369field, 2041592011field, 1200600923field, 1807373663field, 126603877field, 1818916591field, 579569741field, 2011707619field, 914255431field, 555201433field, 324560191field]]" aleo1gtrgfxzhuvpgmxtm5jz0pj8h6m6vacn07dcf5tdp86xxmpuyqsxqw45d4y
       Leo ✅ Compiled 'main.leo' into Aleo instructions

⛓  Constraints

 •  'zk_sra_encryption_v0_0_2.aleo/decrypt_deck' - 4,434,508 constraints (called 1 time)
 •  'zk_texas_holdem.aleo/decrypt_encrypt_each_then_pass' - 103,856 constraints (called 1 time)
 •  'zk_sra_encryption_v0_0_2.aleo/encrypt_deck_per_card' - 4,434,508 constraints (called 1 time)

➡️  Outputs

 • {
  owner: aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c.private,
  table_address: aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c.private,
  index: 0u8.private,
  phi: 2801307600field.private,
  n: 2801413507u128.private,
  e: 1170454781field.private,
  d: 2423676821field.private,
  deck_e: [
    [
      333049603field.private,
      1654889471field.private,
      1921379489field.private,
      883389029field.private,
      2146122613field.private,
      823429423field.private,
      1170274603field.private,
      704161421field.private,
      819741157field.private,
      960122407field.private,
      2066102789field.private,
      791247907field.private,
      1514399101field.private,
      57812059field.private,
      1780465111field.private,
      1271448463field.private,
      461104981field.private,
      2127822449field.private,
      2065346921field.private,
      1740989899field.private,
      1281503651field.private,
      618298943field.private,
      1581324613field.private,
      1747213609field.private,
      75413243field.private,
      1235103199field.private
    ],
    [
      999059149field.private,
      2067597887field.private,
      2043920849field.private,
      1599023653field.private,
      954436397field.private,
      1555980533field.private,
      1049548999field.private,
      150286973field.private,
      751615601field.private,
      839281003field.private,
      779529337field.private,
      545437223field.private,
      1545514531field.private,
      456969839field.private,
      1216270829field.private,
      953066129field.private,
      2021014291field.private,
      2026867187field.private,
      1101677327field.private,
      675372013field.private,
      1922818111field.private,
      887015861field.private,
      1809876379field.private,
      1595328871field.private,
      1651110697field.private,
      1592518111field.private
    ]
  ],
  deck_d: [
    [
      1260384667field.private,
      521309231field.private,
      882323009field.private,
      1816651469field.private,
      720096877field.private,
      2602150687field.private,
      1687735267field.private,
      1335274181field.private,
      901205293field.private,
      2029938343field.private,
      1375897709field.private,
      2526276043field.private,
      424172101field.private,
      2217571939field.private,
      1844849191field.private,
      1835613727field.private,
      2152034221field.private,
      471742049field.private,
      2679902681field.private,
      461594899field.private,
      1573449851field.private,
      2332759007field.private,
      1695518077field.private,
      297551689field.private,
      646503107field.private,
      481035199field.private
    ],
    [
      619228549field.private,
      835902623field.private,
      815333249field.private,
      2180479117field.private,
      1305036533field.private,
      27750797field.private,
      1099255399field.private,
      2182877237field.private,
      135874001field.private,
      926762467field.private,
      1112455273field.private,
      2258368487field.private,
      2777879371field.private,
      258119759field.private,
      2223360869field.private,
      428348369field.private,
      2041592011field.private,
      1200600923field.private,
      1807373663field.private,
      126603877field.private,
      1818916591field.private,
      579569741field.private,
      2011707619field.private,
      914255431field.private,
      555201433field.private,
      324560191field.private
    ]
  ],
  _nonce: 3110706512630320701370615463918688776435363236330891485259830921362053835939group.public
}
 • {
  owner: aleo1gtrgfxzhuvpgmxtm5jz0pj8h6m6vacn07dcf5tdp86xxmpuyqsxqw45d4y.private,
  cards: [
    [
      950974235field.private,
      2690693854field.private,
      1473465290field.private,
      2380695998field.private,
      2336661646field.private,
      1850055721field.private,
      868675062field.private,
      2389938587field.private,
      665239197field.private,
      1453258619field.private,
      460637129field.private,
      2378291319field.private,
      1236291058field.private,
      1218643106field.private,
      1305900514field.private,
      2272207137field.private,
      2496726508field.private,
      2351455276field.private,
      1531863048field.private,
      1398959504field.private,
      1636842423field.private,
      852254463field.private,
      2151977340field.private,
      926134371field.private,
      954969519field.private,
      2050800258field.private
    ],
    [
      941399726field.private,
      2273118311field.private,
      298898508field.private,
      1500661043field.private,
      853731491field.private,
      1605869107field.private,
      582397564field.private,
      1230106254field.private,
      1427016489field.private,
      171406013field.private,
      2040476481field.private,
      2107137118field.private,
      2095561256field.private,
      2359117276field.private,
      1889418006field.private,
      2604038877field.private,
      1462018965field.private,
      1271877820field.private,
      2002594923field.private,
      985752723field.private,
      1746904770field.private,
      921952984field.private,
      1812525651field.private,
      2795863193field.private,
      1330076078field.private,
      448541921field.private
    ]
  ],
  _nonce: 5883388861619179979473115186607268336114424549052105392881181431705703103058group.public
}
 • {
  program_id: zk_texas_holdem.aleo,
  function_name: decrypt_encrypt_each_then_pass,
  arguments: [
    aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c,
    aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c,
    aleo1gtrgfxzhuvpgmxtm5jz0pj8h6m6vacn07dcf5tdp86xxmpuyqsxqw45d4y
  ]
}

       Leo ✅ Finished 'zk_texas_holdem.aleo/decrypt_encrypt_each_then_pass'
```

## Player 1 does decrypt and encrypt per card to Player 0

```
leo run decrypt_encrypt_each_then_pass "{
  owner: aleo1gtrgfxzhuvpgmxtm5jz0pj8h6m6vacn07dcf5tdp86xxmpuyqsxqw45d4y.private,
  table_address: aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c.private,
  index: 1u8.private,
  phi: 2801307600field.private,
  n: 2801413507u128.private,
  e: 1380396943field.private,
  d: 2734228207field.private,
  deck_e: [
    [
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private
    ],
    [
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private
    ]
  ],
  deck_d: [
    [
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private
    ],
    [
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private,
      0field.private
    ]
  ],
  _nonce: 2656428413109411858207110775402308311702970936338476950149400889593521450544group.public
}" "{
  owner: aleo1gtrgfxzhuvpgmxtm5jz0pj8h6m6vacn07dcf5tdp86xxmpuyqsxqw45d4y.private,
  cards: [
    [
      950974235field.private,
      2690693854field.private,
      1473465290field.private,
      2380695998field.private,
      2336661646field.private,
      1850055721field.private,
      868675062field.private,
      2389938587field.private,
      665239197field.private,
      1453258619field.private,
      460637129field.private,
      2378291319field.private,
      1236291058field.private,
      1218643106field.private,
      1305900514field.private,
      2272207137field.private,
      2496726508field.private,
      2351455276field.private,
      1531863048field.private,
      1398959504field.private,
      1636842423field.private,
      852254463field.private,
      2151977340field.private,
      926134371field.private,
      954969519field.private,
      2050800258field.private
    ],
    [
      941399726field.private,
      2273118311field.private,
      298898508field.private,
      1500661043field.private,
      853731491field.private,
      1605869107field.private,
      582397564field.private,
      1230106254field.private,
      1427016489field.private,
      171406013field.private,
      2040476481field.private,
      2107137118field.private,
      2095561256field.private,
      2359117276field.private,
      1889418006field.private,
      2604038877field.private,
      1462018965field.private,
      1271877820field.private,
      2002594923field.private,
      985752723field.private,
      1746904770field.private,
      921952984field.private,
      1812525651field.private,
      2795863193field.private,
      1330076078field.private,
      448541921field.private
    ]
  ],
  _nonce: 5883388861619179979473115186607268336114424549052105392881181431705703103058group.public
}" "[[753880259field, 1335667267field, 1058362807field, 537435173field, 838243499field, 717948037field, 340085197field, 484250813field, 971943221field, 857745611field, 1406584903field, 1522148959field, 1229290039field, 1975053961field, 409462961field, 463631477field, 431879641field, 405287513field, 351847421field, 526635251field, 1283270987field, 575353741field, 1880437681field, 1253814677field, 1144064087field, 1844353057field], [1631982497field, 946082213field, 1274849629field, 2020538209field, 1069672939field, 724798381field, 929072663field, 1943001679field, 624764111field, 1772619011field, 156804121field, 472026901field, 1939925747field, 1306102519field, 911926759field, 363765433field, 1714313017field, 57933173field, 905904359field, 1604520599field, 258979057field, 1651318741field, 461642843field, 2015477917field, 403780367field, 1020790559field]]" "[[1540730939field, 394145803field, 1741506343field, 1725169037field, 1085337299field, 2003357773field, 2433752533field, 2076076277field, 772043981field, 467449091field, 2797166167field, 1004176639field, 1801417159field, 812638441field, 1435302641field, 2184661613field, 1055557561field, 1851120377field, 1645550981field, 2614547051field, 1827776723field, 781799461field, 277751521field, 2604996413field, 1650673223field, 1511083393field], [122860433field, 2283643277field, 2159602069field, 68132689field, 2100397459field, 1877850421field, 14950727field, 2652272719field, 2094832991field, 324275291field, 227557081field, 1232108701field, 1865418683field, 1938163879field, 2171570839field, 1513107097field, 132169753field, 1519231037field, 351795239field, 1805258999field, 534826993field, 2459614861field, 1757502707field, 2335031653field, 819476303field, 2507504639field]]" aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c
       Leo ✅ Compiled 'main.leo' into Aleo instructions

⛓  Constraints

 •  'zk_sra_encryption_v0_0_2.aleo/decrypt_deck' - 4,434,508 constraints (called 1 time)
 •  'zk_texas_holdem.aleo/decrypt_encrypt_each_then_pass' - 103,856 constraints (called 1 time)
 •  'zk_sra_encryption_v0_0_2.aleo/encrypt_deck_per_card' - 4,434,508 constraints (called 1 time)

➡️  Outputs

 • {
  owner: aleo1gtrgfxzhuvpgmxtm5jz0pj8h6m6vacn07dcf5tdp86xxmpuyqsxqw45d4y.private,
  table_address: aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c.private,
  index: 1u8.private,
  phi: 2801307600field.private,
  n: 2801413507u128.private,
  e: 1380396943field.private,
  d: 2734228207field.private,
  deck_e: [
    [
      753880259field.private,
      1335667267field.private,
      1058362807field.private,
      537435173field.private,
      838243499field.private,
      717948037field.private,
      340085197field.private,
      484250813field.private,
      971943221field.private,
      857745611field.private,
      1406584903field.private,
      1522148959field.private,
      1229290039field.private,
      1975053961field.private,
      409462961field.private,
      463631477field.private,
      431879641field.private,
      405287513field.private,
      351847421field.private,
      526635251field.private,
      1283270987field.private,
      575353741field.private,
      1880437681field.private,
      1253814677field.private,
      1144064087field.private,
      1844353057field.private
    ],
    [
      1631982497field.private,
      946082213field.private,
      1274849629field.private,
      2020538209field.private,
      1069672939field.private,
      724798381field.private,
      929072663field.private,
      1943001679field.private,
      624764111field.private,
      1772619011field.private,
      156804121field.private,
      472026901field.private,
      1939925747field.private,
      1306102519field.private,
      911926759field.private,
      363765433field.private,
      1714313017field.private,
      57933173field.private,
      905904359field.private,
      1604520599field.private,
      258979057field.private,
      1651318741field.private,
      461642843field.private,
      2015477917field.private,
      403780367field.private,
      1020790559field.private
    ]
  ],
  deck_d: [
    [
      1540730939field.private,
      394145803field.private,
      1741506343field.private,
      1725169037field.private,
      1085337299field.private,
      2003357773field.private,
      2433752533field.private,
      2076076277field.private,
      772043981field.private,
      467449091field.private,
      2797166167field.private,
      1004176639field.private,
      1801417159field.private,
      812638441field.private,
      1435302641field.private,
      2184661613field.private,
      1055557561field.private,
      1851120377field.private,
      1645550981field.private,
      2614547051field.private,
      1827776723field.private,
      781799461field.private,
      277751521field.private,
      2604996413field.private,
      1650673223field.private,
      1511083393field.private
    ],
    [
      122860433field.private,
      2283643277field.private,
      2159602069field.private,
      68132689field.private,
      2100397459field.private,
      1877850421field.private,
      14950727field.private,
      2652272719field.private,
      2094832991field.private,
      324275291field.private,
      227557081field.private,
      1232108701field.private,
      1865418683field.private,
      1938163879field.private,
      2171570839field.private,
      1513107097field.private,
      132169753field.private,
      1519231037field.private,
      351795239field.private,
      1805258999field.private,
      534826993field.private,
      2459614861field.private,
      1757502707field.private,
      2335031653field.private,
      819476303field.private,
      2507504639field.private
    ]
  ],
  _nonce: 5244340173505528576169406100600044319999157955958926436555374438857392842725group.public
}
 • {
  owner: aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c.private,
  cards: [
    [
      1050790452field.private,
      1101608491field.private,
      453323342field.private,
      1078274922field.private,
      1917329326field.private,
      2150760462field.private,
      529737511field.private,
      2609080075field.private,
      1851631477field.private,
      1435282277field.private,
      2475270608field.private,
      1079324907field.private,
      1017668325field.private,
      2009194323field.private,
      1754204914field.private,
      1707082925field.private,
      2213434551field.private,
      1854444071field.private,
      1228241181field.private,
      418157025field.private,
      2306807885field.private,
      2308517426field.private,
      1830643830field.private,
      62833233field.private,
      1766805518field.private,
      2698874611field.private
    ],
    [
      1841844434field.private,
      252061821field.private,
      2616375467field.private,
      786475824field.private,
      2312861639field.private,
      1253966708field.private,
      1373197314field.private,
      1092779175field.private,
      1171905317field.private,
      1258699423field.private,
      2785748748field.private,
      1556096087field.private,
      1275442285field.private,
      2737173998field.private,
      2492485030field.private,
      1701951647field.private,
      555707125field.private,
      23044881field.private,
      2570124839field.private,
      502544522field.private,
      414683129field.private,
      503487620field.private,
      2219866936field.private,
      2474597341field.private,
      300018055field.private,
      240502608field.private
    ]
  ],
  _nonce: 4502234571094271188508722117681479036535993747809473984001561129380832996984group.public
}
 • {
  program_id: zk_texas_holdem.aleo,
  function_name: decrypt_encrypt_each_then_pass,
  arguments: [
    aleo1gtrgfxzhuvpgmxtm5jz0pj8h6m6vacn07dcf5tdp86xxmpuyqsxqw45d4y,
    aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c,
    aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c
  ]
}

       Leo ✅ Finished 'zk_texas_holdem.aleo/decrypt_encrypt_each_then_pass'
```

## After all rounds of suffling and encryption are done, The deck is published.

```zsh
leo run publish_deck "{                                                         
  owner: aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c.private,
  table_address: aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c.private,
  index: 0u8.private,
  phi: 2801307600field.private,
  n: 2801413507u128.private,  
  e: 1170454781field.private, 
  d: 2423676821field.private, 
  deck_e: [                  
    [                         
      333049603field.private,
      1654889471field.private,
      1921379489field.private,
      883389029field.private, 
      2146122613field.private,
      823429423field.private,
      1170274603field.private,
      704161421field.private,
      819741157field.private,
      960122407field.private, 
      2066102789field.private,
      791247907field.private,
      1514399101field.private,
      57812059field.private, 
      1780465111field.private,
      1271448463field.private,
      461104981field.private, 
      2127822449field.private,
      2065346921field.private,
      1740989899field.private,
      1281503651field.private,
      618298943field.private,
      1581324613field.private,
      1747213609field.private,
      75413243field.private,  
      1235103199field.private 
    ],                       
    [                         
      999059149field.private,
      2067597887field.private,
      2043920849field.private,
      1599023653field.private,
      954436397field.private,
      1555980533field.private,
      1049548999field.private,
      150286973field.private,
      751615601field.private,
      839281003field.private,
      779529337field.private,
      545437223field.private,
      1545514531field.private,
      456969839field.private, 
      1216270829field.private,
      953066129field.private, 
      2021014291field.private,
      2026867187field.private,
      1101677327field.private,
      675372013field.private, 
      1922818111field.private,
      887015861field.private, 
      1809876379field.private,
      1595328871field.private,
      1651110697field.private,
      1592518111field.private 
    ]                         
  ],                          
  deck_d: [                  
    [                         
      1260384667field.private,
      521309231field.private, 
      882323009field.private,
      1816651469field.private,
      720096877field.private,
      2602150687field.private,
      1687735267field.private,
      1335274181field.private,                                                                    
      901205293field.private,
      2029938343field.private,                                                   
      1375897709field.private,
      2526276043field.private,
      424172101field.private, 
      2217571939field.private,
      1844849191field.private,
      1835613727field.private,
      2152034221field.private,
      471742049field.private, 
      2679902681field.private,
      461594899field.private, 
      1573449851field.private,
      2332759007field.private,
      1695518077field.private,
      297551689field.private, 
      646503107field.private, 
      481035199field.private  
    ],                        
    [                         
      619228549field.private, 
      835902623field.private, 
      815333249field.private, 
      2180479117field.private,
      1305036533field.private,
      27750797field.private,  
      1099255399field.private,
      2182877237field.private,
      135874001field.private, 
      926762467field.private,
      1112455273field.private,
      2258368487field.private,
      2777879371field.private,
      258119759field.private,
      2223360869field.private,
      428348369field.private,
      2041592011field.private,
      1200600923field.private,
      1807373663field.private,
      126603877field.private, 
      1818916591field.private,
      579569741field.private, 
      2011707619field.private,
      914255431field.private, 
      555201433field.private, 
      324560191field.private  
    ]                         
  ],                          
  _nonce: 3110706512630320701370615463918688776435363236330891485259830921362053835939group.public
}" "{
  owner: aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c.private,
  cards: [
    [
      1050790452field.private,
      1101608491field.private,
      453323342field.private,
      1078274922field.private,
      1917329326field.private,
      2150760462field.private,
      529737511field.private,
      2609080075field.private,
      1851631477field.private,
      1435282277field.private,
      2475270608field.private,
      1079324907field.private,
      1017668325field.private,
      2009194323field.private,
      1754204914field.private,
      1707082925field.private,
      2213434551field.private,
      1854444071field.private,
      1228241181field.private,
      418157025field.private,
      2306807885field.private,
      2308517426field.private,
      1830643830field.private,
      62833233field.private,
      1766805518field.private,
      2698874611field.private
    ],
    [
      1841844434field.private,
      252061821field.private,
      2616375467field.private,
      786475824field.private,
      2312861639field.private,
      1253966708field.private,
      1373197314field.private,
      1092779175field.private,
      1171905317field.private,
      1258699423field.private,
      2785748748field.private,
      1556096087field.private,
      1275442285field.private,
      2737173998field.private,
      2492485030field.private,
      1701951647field.private,
      555707125field.private,
      23044881field.private,
      2570124839field.private,
      502544522field.private,
      414683129field.private,
      503487620field.private,
      2219866936field.private,
      2474597341field.private,
      300018055field.private,
      240502608field.private
    ]
  ],
  _nonce: 4502234571094271188508722117681479036535993747809473984001561129380832996984group.public
}"
       Leo ✅ Compiled 'main.leo' into Aleo instructions

⛓  Constraints

 •  'zk_texas_holdem.aleo/publish_deck' - 4,040 constraints (called 1 time)

➡️  Outputs

 • {
  owner: aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c.private,
  table_address: aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c.private,
  index: 0u8.private,
  phi: 2801307600field.private,
  n: 2801413507u128.private,
  e: 1170454781field.private,
  d: 2423676821field.private,
  deck_e: [
    [
      1050790452field.private,
      1101608491field.private,
      453323342field.private,
      1078274922field.private,
      1917329326field.private,
      2150760462field.private,
      529737511field.private,
      2609080075field.private,
      1851631477field.private,
      1435282277field.private,
      2475270608field.private,
      1079324907field.private,
      1017668325field.private,
      2009194323field.private,
      1754204914field.private,
      1707082925field.private,
      2213434551field.private,
      1854444071field.private,
      1228241181field.private,
      418157025field.private,
      2306807885field.private,
      2308517426field.private,
      1830643830field.private,
      62833233field.private,
      1766805518field.private,
      2698874611field.private
    ],
    [
      1841844434field.private,
      252061821field.private,
      2616375467field.private,
      786475824field.private,
      2312861639field.private,
      1253966708field.private,
      1373197314field.private,
      1092779175field.private,
      1171905317field.private,
      1258699423field.private,
      2785748748field.private,
      1556096087field.private,
      1275442285field.private,
      2737173998field.private,
      2492485030field.private,
      1701951647field.private,
      555707125field.private,
      23044881field.private,
      2570124839field.private,
      502544522field.private,
      414683129field.private,
      503487620field.private,
      2219866936field.private,
      2474597341field.private,
      300018055field.private,
      240502608field.private
    ]
  ],
  deck_d: [
    [
      1260384667field.private,
      521309231field.private,
      882323009field.private,
      1816651469field.private,
      720096877field.private,
      2602150687field.private,
      1687735267field.private,
      1335274181field.private,
      901205293field.private,
      2029938343field.private,
      1375897709field.private,
      2526276043field.private,
      424172101field.private,
      2217571939field.private,
      1844849191field.private,
      1835613727field.private,
      2152034221field.private,
      471742049field.private,
      2679902681field.private,
      461594899field.private,
      1573449851field.private,
      2332759007field.private,
      1695518077field.private,
      297551689field.private,
      646503107field.private,
      481035199field.private
    ],
    [
      619228549field.private,
      835902623field.private,
      815333249field.private,
      2180479117field.private,
      1305036533field.private,
      27750797field.private,
      1099255399field.private,
      2182877237field.private,
      135874001field.private,
      926762467field.private,
      1112455273field.private,
      2258368487field.private,
      2777879371field.private,
      258119759field.private,
      2223360869field.private,
      428348369field.private,
      2041592011field.private,
      1200600923field.private,
      1807373663field.private,
      126603877field.private,
      1818916591field.private,
      579569741field.private,
      2011707619field.private,
      914255431field.private,
      555201433field.private,
      324560191field.private
    ]
  ],
  _nonce: 4248774256693202442744540208725654662325115039883704699207578730027379429873group.public
}
 • {
  owner: aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c.private,
  cards: [
    [
      1050790452field.private,
      1101608491field.private,
      453323342field.private,
      1078274922field.private,
      1917329326field.private,
      2150760462field.private,
      529737511field.private,
      2609080075field.private,
      1851631477field.private,
      1435282277field.private,
      2475270608field.private,
      1079324907field.private,
      1017668325field.private,
      2009194323field.private,
      1754204914field.private,
      1707082925field.private,
      2213434551field.private,
      1854444071field.private,
      1228241181field.private,
      418157025field.private,
      2306807885field.private,
      2308517426field.private,
      1830643830field.private,
      62833233field.private,
      1766805518field.private,
      2698874611field.private
    ],
    [
      1841844434field.private,
      252061821field.private,
      2616375467field.private,
      786475824field.private,
      2312861639field.private,
      1253966708field.private,
      1373197314field.private,
      1092779175field.private,
      1171905317field.private,
      1258699423field.private,
      2785748748field.private,
      1556096087field.private,
      1275442285field.private,
      2737173998field.private,
      2492485030field.private,
      1701951647field.private,
      555707125field.private,
      23044881field.private,
      2570124839field.private,
      502544522field.private,
      414683129field.private,
      503487620field.private,
      2219866936field.private,
      2474597341field.private,
      300018055field.private,
      240502608field.private
    ]
  ],
  _nonce: 6277853453353631697473920765860607494696748488496263765922123003819419014156group.public
}
 • {
  program_id: zk_texas_holdem.aleo,
  function_name: publish_deck,
  arguments: [
    aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c,
    aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c,
    [
  [
    1050790452field,
    1101608491field,
    453323342field,
    1078274922field,
    1917329326field,
    2150760462field,
    529737511field,
    2609080075field,
    1851631477field,
    1435282277field,
    2475270608field,
    1079324907field,
    1017668325field,
    2009194323field,
    1754204914field,
    1707082925field,
    2213434551field,
    1854444071field,
    1228241181field,
    418157025field,
    2306807885field,
    2308517426field,
    1830643830field,
    62833233field,
    1766805518field,
    2698874611field
  ],
  [
    1841844434field,
    252061821field,
    2616375467field,
    786475824field,
    2312861639field,
    1253966708field,
    1373197314field,
    1092779175field,
    1171905317field,
    1258699423field,
    2785748748field,
    1556096087field,
    1275442285field,
    2737173998field,
    2492485030field,
    1701951647field,
    555707125field,
    23044881field,
    2570124839field,
    502544522field,
    414683129field,
    503487620field,
    2219866936field,
    2474597341field,
    300018055field,
    240502608field
  ]
]
  ]
}

       Leo ✅ Finished 'zk_texas_holdem.aleo/publish_deck'
```

## Player 0 deals the flop (At this point there's nothing to see becuase it's handled in mappings)

```zsh
{
  owner: aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c.private,
  table_address: aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c.private,
  index: 0u8.private,
  phi: 2801307600field.private,
  n: 2801413507u128.private,
  e: 1170454781field.private,
  d: 2423676821field.private,
  deck_e: [
    [
      1050790452field.private,
      1101608491field.private,
      453323342field.private,
      1078274922field.private,
      1917329326field.private,
      2150760462field.private,
      529737511field.private,
      2609080075field.private,
      1851631477field.private,
      1435282277field.private,
      2475270608field.private,
      1079324907field.private,
      1017668325field.private,
      2009194323field.private,
      1754204914field.private,
      1707082925field.private,
      2213434551field.private,
      1854444071field.private,
      1228241181field.private,
      418157025field.private,
      2306807885field.private,
      2308517426field.private,
      1830643830field.private,
      62833233field.private,
      1766805518field.private,
      2698874611field.private
    ],
    [
      1841844434field.private,
      252061821field.private,
      2616375467field.private,
      786475824field.private,
      2312861639field.private,
      1253966708field.private,
      1373197314field.private,
      1092779175field.private,
      1171905317field.private,
      1258699423field.private,
      2785748748field.private,
      1556096087field.private,
      1275442285field.private,
      2737173998field.private,
      2492485030field.private,
      1701951647field.private,
      555707125field.private,
      23044881field.private,
      2570124839field.private,
      502544522field.private,
      414683129field.private,
      503487620field.private,
      2219866936field.private,
      2474597341field.private,
      300018055field.private,
      240502608field.private
    ]
  ],
  deck_d: [
    [
      1260384667field.private,
      521309231field.private,
      882323009field.private,
      1816651469field.private,
      720096877field.private,
      2602150687field.private,
      1687735267field.private,
      1335274181field.private,
      901205293field.private,
      2029938343field.private,
      1375897709field.private,
      2526276043field.private,
      424172101field.private,
      2217571939field.private,
      1844849191field.private,
      1835613727field.private,
      2152034221field.private,
      471742049field.private,
      2679902681field.private,
      461594899field.private,
      1573449851field.private,
      2332759007field.private,
      1695518077field.private,
      297551689field.private,
      646503107field.private,
      481035199field.private
    ],
    [
      619228549field.private,
      835902623field.private,
      815333249field.private,
      2180479117field.private,
      1305036533field.private,
      27750797field.private,
      1099255399field.private,
      2182877237field.private,
      135874001field.private,
      926762467field.private,
      1112455273field.private,
      2258368487field.private,
      2777879371field.private,
      258119759field.private,
      2223360869field.private,
      428348369field.private,
      2041592011field.private,
      1200600923field.private,
      1807373663field.private,
      126603877field.private,
      1818916591field.private,
      579569741field.private,
      2011707619field.private,
      914255431field.private,
      555201433field.private,
      324560191field.private
    ]
  ],
  _nonce: 4248774256693202442744540208725654662325115039883704699207578730027379429873group.public
}
       Leo ✅ Compiled 'main.leo' into Aleo instructions

⛓  Constraints

 •  'zk_texas_holdem.aleo/deal_flop' - 2,026 constraints (called 1 time)

➡️  Outputs

 • {
  owner: aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c.private,
  table_address: aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c.private,
  index: 0u8.private,
  phi: 2801307600field.private,
  n: 2801413507u128.private,
  e: 1170454781field.private,
  d: 2423676821field.private,
  deck_e: [
    [
      1050790452field.private,
      1101608491field.private,
      453323342field.private,
      1078274922field.private,
      1917329326field.private,
      2150760462field.private,
      529737511field.private,
      2609080075field.private,
      1851631477field.private,
      1435282277field.private,
      2475270608field.private,
      1079324907field.private,
      1017668325field.private,
      2009194323field.private,
      1754204914field.private,
      1707082925field.private,
      2213434551field.private,
      1854444071field.private,
      1228241181field.private,
      418157025field.private,
      2306807885field.private,
      2308517426field.private,
      1830643830field.private,
      62833233field.private,
      1766805518field.private,
      2698874611field.private
    ],
    [
      1841844434field.private,
      252061821field.private,
      2616375467field.private,
      786475824field.private,
      2312861639field.private,
      1253966708field.private,
      1373197314field.private,
      1092779175field.private,
      1171905317field.private,
      1258699423field.private,
      2785748748field.private,
      1556096087field.private,
      1275442285field.private,
      2737173998field.private,
      2492485030field.private,
      1701951647field.private,
      555707125field.private,
      23044881field.private,
      2570124839field.private,
      502544522field.private,
      414683129field.private,
      503487620field.private,
      2219866936field.private,
      2474597341field.private,
      300018055field.private,
      240502608field.private
    ]
  ],
  deck_d: [
    [
      1260384667field.private,
      521309231field.private,
      882323009field.private,
      1816651469field.private,
      720096877field.private,
      2602150687field.private,
      1687735267field.private,
      1335274181field.private,
      901205293field.private,
      2029938343field.private,
      1375897709field.private,
      2526276043field.private,
      424172101field.private,
      2217571939field.private,
      1844849191field.private,
      1835613727field.private,
      2152034221field.private,
      471742049field.private,
      2679902681field.private,
      461594899field.private,
      1573449851field.private,
      2332759007field.private,
      1695518077field.private,
      297551689field.private,
      646503107field.private,
      481035199field.private
    ],
    [
      619228549field.private,
      835902623field.private,
      815333249field.private,
      2180479117field.private,
      1305036533field.private,
      27750797field.private,
      1099255399field.private,
      2182877237field.private,
      135874001field.private,
      926762467field.private,
      1112455273field.private,
      2258368487field.private,
      2777879371field.private,
      258119759field.private,
      2223360869field.private,
      428348369field.private,
      2041592011field.private,
      1200600923field.private,
      1807373663field.private,
      126603877field.private,
      1818916591field.private,
      579569741field.private,
      2011707619field.private,
      914255431field.private,
      555201433field.private,
      324560191field.private
    ]
  ],
  _nonce: 4917636073613794181935562325831692662900716299735949335925027960885718522878group.public
}
 • {
  program_id: zk_texas_holdem.aleo,
  function_name: deal_flop,
  arguments: [
    aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c,
    aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c
  ]
}
```

# This example shows the cards can be decrypted with the proper keys.

```
leo run test_reveal_card 1050790452field 1540730939field 1260384667field 2801413507u128
       Leo ✅ Compiled 'main.leo' into Aleo instructions

⛓  Constraints

 •  'zk_sra_encryption_v0_0_2.aleo/sra_decrypt' - 85,279 constraints (called 2 times)
 •  'zk_texas_holdem.aleo/test_reveal_card' - 13,922 constraints (called 1 time)

➡️  Output

 • {
  owner: aleo1gtrgfxzhuvpgmxtm5jz0pj8h6m6vacn07dcf5tdp86xxmpuyqsxqw45d4y.private,
  card: 34field.private,
  _nonce: 6053322206999733895259983470480460676729772930711475441182950855596963489499group.public
}
```

It was shuffled, but this is a good sign, as it is in the range 63field..12field.