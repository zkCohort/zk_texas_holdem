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
snarkos developer execute credits.aleo transfer_private "{  owner: aleo1rhgdu77hgyqd3xjj8ucu3jj9r2krwz6mnzyd80gncr5fxcwlh5rsvzp9px.private,  microcredits: 1000000000000u64.private,  _nonce: 1870384227717108990812464071079401090030090200169646008180314689517851502548group.public}" "aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c" 873000000000u64 --private-key APrivateKey1zkp8CZNn3yeCseEtxuVPbDCwSyhGW6yZKUYKfgXmcpoGPWH --query "http://localhost:3030" --broadcast "http://localhost:3030/testnet3/transaction/broadcast"

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

# A shuffle_and_pass transaction

```zsh
zk_texas_holdem % leo run shuffle_and_pass -- -- "{
  owner: aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c.private,
  table_address: aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c.private,
  phi: 2801307600u32.private,
  n: 2801413507u32.private,
  e: 1170454781u32.private,
  d: 2423676821u32.private,
  deck_e: [
    [
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private
    ],
    [
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private
    ]
  ],
  deck_d: [
    [
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private
    ],
    [
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private,
      0u32.private
    ]
  ],
  _nonce: 6227482928804889989781829452526314579422943618836555815401568926162241502497group.public
}" "{
  owner: aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c.private,
  cards: [
    [
      63u32.private,
      62u32.private,
      61u32.private,
      60u32.private,
      59u32.private,
      58u32.private,
      57u32.private,
      56u32.private,
      55u32.private,
      54u32.private,
      53u32.private,
      52u32.private,
      51u32.private,
      50u32.private,
      49u32.private,
      48u32.private,
      47u32.private,
      46u32.private,
      45u32.private,
      44u32.private,
      43u32.private,
      42u32.private,
      41u32.private,
      40u32.private,
      39u32.private,
      38u32.private
    ],
    [
      37u32.private,
      36u32.private,
      35u32.private,
      34u32.private,
      33u32.private,
      32u32.private,
      31u32.private,
      30u32.private,
      29u32.private,
      28u32.private,
      27u32.private,
      26u32.private,
      25u32.private,
      24u32.private,
      23u32.private,
      22u32.private,
      21u32.private,
      20u32.private,
      19u32.private,
      18u32.private,
      17u32.private,
      16u32.private,
      15u32.private,
      14u32.private,
      13u32.private,
      12u32.private
    ]
  ],
  _nonce: 2748886393642050821735342760440227962915648045687603101011273625956899716054group.public
}" 3i8 4i8 12i8 -9i8 aleo1gtrgfxzhuvpgmxtm5jz0pj8h6m6vacn07dcf5tdp86xxmpuyqsxqw45d4y
```

## A shuffle_and_pass transaction Output of the Deck Record Alice Sends to Bob.

```
{
  owner: aleo1gtrgfxzhuvpgmxtm5jz0pj8h6m6vacn07dcf5tdp86xxmpuyqsxqw45d4y.private,
  cards: [
    [
      903548341u32.private,
      1219224265u32.private,
      2194972411u32.private,
      1623141294u32.private,
      1495252248u32.private,
      1063887846u32.private,
      1855039138u32.private,
      265204498u32.private,
      891766602u32.private,
      421829602u32.private,
      1815182032u32.private,
      548699321u32.private,
      1882329000u32.private,
      726757187u32.private,
      2430342993u32.private,
      2384638503u32.private,
      1110781385u32.private,
      73037100u32.private,
      430635744u32.private,
      596816486u32.private,
      2203329578u32.private,
      1023113432u32.private,
      784691257u32.private,
      247721630u32.private,
      2466079850u32.private,
      2505253929u32.private
    ],
    [
      777418495u32.private,
      948844410u32.private,
      1693233513u32.private,
      1433050422u32.private,
      793111979u32.private,
      1499047059u32.private,
      594273551u32.private,
      1159745069u32.private,
      1279869734u32.private,
      340496627u32.private,
      1688497017u32.private,
      1956154540u32.private,
      936796540u32.private,
      65673615u32.private,
      1196978238u32.private,
      669953033u32.private,
      2388233669u32.private,
      931772915u32.private,
      1685927905u32.private,
      1381442244u32.private,
      1043611221u32.private,
      760515934u32.private,
      1064482984u32.private,
      2181212383u32.private,
      687901095u32.private,
      1887618880u32.private
    ]
  ],
  _nonce: 4201638630497730536057801854045238530067818219598856701121724199848651231597group.public
}
```
