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

# A shuffle_and_pass transaction to address 2

```zsh
zk_texas_holdem % leo run shuffle_and_pass -- -- "{
  owner: aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c.private,
  table_address: aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c.private,
  phi: 2801307600u128.private,
  n: 2801413507u128.private,
  e: 1170454781u128.private,
  d: 2423676821u128.private,
  deck_e: [
    [
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private
    ],
    [
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private
    ]
  ],
  deck_d: [
    [
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private
    ],
    [
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private
    ]
  ],
  _nonce: 6227482928804889989781829452526314579422943618836555815401568926162241502497group.public
}" "{
  owner: aleo1gtrgfxzhuvpgmxtm5jz0pj8h6m6vacn07dcf5tdp86xxmpuyqsxqw45d4y.private,
  cards: [
    [
      63u128.private,
      62u128.private,
      61u128.private,
      60u128.private,
      59u128.private,
      58u128.private,
      57u128.private,
      56u128.private,
      55u128.private,
      54u128.private,
      53u128.private,
      52u128.private,
      51u128.private,
      50u128.private,
      49u128.private,
      48u128.private,
      47u128.private,
      46u128.private,
      45u128.private,
      44u128.private,
      43u128.private,
      42u128.private,
      41u128.private,
      40u128.private,
      39u128.private,
      38u128.private
    ],
    [
      37u128.private,
      36u128.private,
      35u128.private,
      34u128.private,
      33u128.private,
      32u128.private,
      31u128.private,
      30u128.private,
      29u128.private,
      28u128.private,
      27u128.private,
      26u128.private,
      25u128.private,
      24u128.private,
      23u128.private,
      22u128.private,
      21u128.private,
      20u128.private,
      19u128.private,
      18u128.private,
      17u128.private,
      16u128.private,
      15u128.private,
      14u128.private,
      13u128.private,
      12u128.private
    ]
  ],
  _nonce: 2748886393642050821735342760440227962915648045687603101011273625956899716054group.public
}" "[3i8, 4i8, 12i8, -9i8, -14i8, 17i8, 24i8]" aleo1gtrgfxzhuvpgmxtm5jz0pj8h6m6vacn07dcf5tdp86xxmpuyqsxqw45d4y
```

## from address 2 to address 1

```
leo run shuffle_and_pass "{
  owner: aleo1gtrgfxzhuvpgmxtm5jz0pj8h6m6vacn07dcf5tdp86xxmpuyqsxqw45d4y.private,
  table_address: aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c.private,
  phi: 2801307600u128.private,
  n: 2801413507u128.private,
  e: 1170454781u128.private,
  d: 2423676821u128.private,
  deck_e: [
    [
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private
    ],
    [
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private
    ]
  ],
  deck_d: [
    [
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private
    ],
    [
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private
    ]
  ],
  _nonce: 2712496926427479107044795782073620584741133829304745049828829586432896819541group.public
}" "{
  owner: aleo1gtrgfxzhuvpgmxtm5jz0pj8h6m6vacn07dcf5tdp86xxmpuyqsxqw45d4y.private,
  cards: [
    [
      1882329000u128.private,
      669953033u128.private,
      596816486u128.private,
      1495252248u128.private,
      1623141294u128.private,
      936796540u128.private,
      1956154540u128.private,
      2181212383u128.private,
      2466079850u128.private,
      73037100u128.private,
      687901095u128.private,
      1693233513u128.private,
      1110781385u128.private,
      1499047059u128.private,
      777418495u128.private,
      1196978238u128.private,
      903548341u128.private,
      1685927905u128.private,
      793111979u128.private,
      931772915u128.private,
      1381442244u128.private,
      1159745069u128.private,
      2388233669u128.private,
      1063887846u128.private,
      2384638503u128.private,
      1433050422u128.private
    ],
    [
      784691257u128.private,
      1688497017u128.private,
      1043611221u128.private,
      421829602u128.private,
      430635744u128.private,
      1855039138u128.private,
      891766602u128.private,
      1023113432u128.private,
      265204498u128.private,
      1887618880u128.private,
      548699321u128.private,
      2505253929u128.private,
      2203329578u128.private,
      340496627u128.private,
      247721630u128.private,
      1219224265u128.private,
      1279869734u128.private,
      948844410u128.private,
      2194972411u128.private,
      2430342993u128.private,
      726757187u128.private,
      1064482984u128.private,
      760515934u128.private,
      594273551u128.private,
      1815182032u128.private,
      65673615u128.private
    ]
  ],
  _nonce: 8114141324971014705548668788183524075144357234427145933880046868926620052891group.public
}" "[3i8, 4i8, 12i8, 9i8, -6i8, -12i8, 13i8]" aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c
```

## decrypt and encrypt per card from address 1 to address 2

```
leo run decrypt_encrypt_each_then_pass "{
  owner: aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c.private,
  table_address: aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c.private,
  phi: 2801307600u128.private,
  n: 2801413507u128.private,
  e: 1170454781u128.private,
  d: 2423676821u128.private,
  deck_e: [
    [
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private
    ],
    [
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private
    ]
  ],
  deck_d: [
    [
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private
    ],
    [
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private
    ]
  ],
  _nonce: 6227482928804889989781829452526314579422943618836555815401568926162241502497group.public
}" "{
  owner: aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c.private,
  cards: [
    [
      938757405u128.private,
      2004675778u128.private,
      1532048893u128.private,
      1269180353u128.private,
      716667489u128.private,
      353394192u128.private,
      803062337u128.private,
      2225577663u128.private,
      840996307u128.private,
      91613768u128.private,
      668663670u128.private,
      1078337629u128.private,
      1942341602u128.private,
      596978404u128.private,
      2748227615u128.private,
      2007825599u128.private,
      2325955199u128.private,
      1075184167u128.private,
      374222657u128.private,
      1274666759u128.private,
      281840026u128.private,
      386146442u128.private,
      2696587466u128.private,
      708204680u128.private,
      948787666u128.private,
      208407338u128.private
    ],
    [
      1899663898u128.private,
      2592532114u128.private,
      1826688392u128.private,
      1533857850u128.private,
      1831289855u128.private,
      528918838u128.private,
      2031871124u128.private,
      4029510u128.private,
      2158869516u128.private,
      898876340u128.private,
      283363094u128.private,
      233540283u128.private,
      2460254280u128.private,
      2391934686u128.private,
      125152216u128.private,
      666572584u128.private,
      706971390u128.private,
      2121242221u128.private,
      52870123u128.private,
      2715142444u128.private,
      1213479888u128.private,
      46836209u128.private,
      1887064250u128.private,
      837479801u128.private,
      887335040u128.private,
      520672852u128.private
    ]
  ],
  _nonce: 2345810925069298751712340417587132792072177605358134600257567961067357165886group.public
}" "[[333049603u128, 1654889471u128, 1921379489u128, 883389029u128, 2146122613u128, 823429423u128, 1170274603u128, 704161421u128, 819741157u128, 960122407u128, 2066102789u128, 791247907u128, 1514399101u128, 57812059u128, 1780465111u128, 1271448463u128, 461104981u128, 2127822449u128, 2065346921u128, 1740989899u128, 1281503651u128, 618298943u128, 1581324613u128, 1747213609u128, 75413243u128, 1235103199u128], [999059149u128, 2067597887u128, 2043920849u128, 1599023653u128, 954436397u128, 1555980533u128, 1049548999u128, 150286973u128, 751615601u128, 839281003u128, 779529337u128, 545437223u128, 1545514531u128, 456969839u128, 1216270829u128, 953066129u128, 2021014291u128, 2026867187u128, 1101677327u128, 675372013u128, 1922818111u128, 887015861u128, 1809876379u128, 1595328871u128, 1651110697u128, 1592518111u128]]" "[[1260384667u128, 521309231u128, 882323009u128, 1816651469u128, 720096877u128, 2602150687u128, 1687735267u128, 1335274181u128, 901205293u128, 2029938343u128, 1375897709u128, 2526276043u128, 424172101u128, 2217571939u128, 1844849191u128, 1835613727u128, 2152034221u128, 471742049u128, 2679902681u128, 461594899u128, 1573449851u128, 2332759007u128, 1695518077u128, 297551689u128, 646503107u128, 481035199u128], [619228549u128, 835902623u128, 815333249u128, 2180479117u128, 1305036533u128, 27750797u128, 1099255399u128, 2182877237u128, 135874001u128, 926762467u128, 1112455273u128, 2258368487u128, 2777879371u128, 258119759u128, 2223360869u128, 428348369u128, 2041592011u128, 1200600923u128, 1807373663u128, 126603877u128, 1818916591u128, 579569741u128, 2011707619u128, 914255431u128, 555201433u128, 324560191u128]]" aleo1gtrgfxzhuvpgmxtm5jz0pj8h6m6vacn07dcf5tdp86xxmpuyqsxqw45d4y
```

## decrypt and encrypt per card to player 1

```
leo run decrypt_encrypt_each_then_pass "{
  owner: aleo1gtrgfxzhuvpgmxtm5jz0pj8h6m6vacn07dcf5tdp86xxmpuyqsxqw45d4y.private,
  table_address: aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c.private,
  phi: 2801307600u128.private,
  n: 2801413507u128.private,
  e: 1380396943u128.private,
  d: 2734228207u128.private,
  deck_e: [
    [
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private
    ],
    [
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private
    ]
  ],
  deck_d: [
    [
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private
    ],
    [
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private,
      0u128.private
    ]
  ],
  _nonce: 2656428413109411858207110775402308311702970936338476950149400889593521450544group.public
}" "{
  owner: aleo1gtrgfxzhuvpgmxtm5jz0pj8h6m6vacn07dcf5tdp86xxmpuyqsxqw45d4y.private,
  cards: [
    [
      376807381u128.private,
      229774024u128.private,
      1501515691u128.private,
      1473061938u128.private,
      458841476u128.private,
      693668690u128.private,
      284611205u128.private,
      1809188481u128.private,
      509864101u128.private,
      2483585940u128.private,
      1146347428u128.private,
      1023775788u128.private,
      753186896u128.private,
      2617671971u128.private,
      2256896641u128.private,
      2631621194u128.private,
      1311696031u128.private,
      1047357638u128.private,
      1474643935u128.private,
      1514323600u128.private,
      2238823330u128.private,
      1460753938u128.private,
      2001284000u128.private,
      821854439u128.private,
      1832093523u128.private,
      1573422730u128.private
    ],
    [
      2664953558u128.private,
      1757478457u128.private,
      2361023126u128.private,
      1380638669u128.private,
      2184763485u128.private,
      2190761477u128.private,
      2443925206u128.private,
      1231202217u128.private,
      510522393u128.private,
      1928764755u128.private,
      1191316215u128.private,
      863291688u128.private,
      2588405085u128.private,
      1957889416u128.private,
      325496312u128.private,
      137887501u128.private,
      624879251u128.private,
      1517444088u128.private,
      343326820u128.private,
      2362691617u128.private,
      270805541u128.private,
      2170612703u128.private,
      2241346461u128.private,
      2004387016u128.private,
      2651361046u128.private,
      876508008u128.private
    ]
  ],
  _nonce: 5016116419452235116020170812045698179798891375474746107832887242361556243071group.public
}" "[[753880259u128, 1335667267u128, 1058362807u128, 537435173u128, 838243499u128, 717948037u128, 340085197u128, 484250813u128, 971943221u128, 857745611u128, 1406584903u128, 1522148959u128, 1229290039u128, 1975053961u128, 409462961u128, 463631477u128, 431879641u128, 405287513u128, 351847421u128, 526635251u128, 1283270987u128, 575353741u128, 1880437681u128, 1253814677u128, 1144064087u128, 1844353057u128], [1631982497u128, 946082213u128, 1274849629u128, 2020538209u128, 1069672939u128, 724798381u128, 929072663u128, 1943001679u128, 624764111u128, 1772619011u128, 156804121u128, 472026901u128, 1939925747u128, 1306102519u128, 911926759u128, 363765433u128, 1714313017u128, 57933173u128, 905904359u128, 1604520599u128, 258979057u128, 1651318741u128, 461642843u128, 2015477917u128, 403780367u128, 1020790559u128]]" "[[1540730939u128, 394145803u128, 1741506343u128, 1725169037u128, 1085337299u128, 2003357773u128, 2433752533u128, 2076076277u128, 772043981u128, 467449091u128, 2797166167u128, 1004176639u128, 1801417159u128, 812638441u128, 1435302641u128, 2184661613u128, 1055557561u128, 1851120377u128, 1645550981u128, 2614547051u128, 1827776723u128, 781799461u128, 277751521u128, 2604996413u128, 1650673223u128, 1511083393u128], [122860433u128, 2283643277u128, 2159602069u128, 68132689u128, 2100397459u128, 1877850421u128, 14950727u128, 2652272719u128, 2094832991u128, 324275291u128, 227557081u128, 1232108701u128, 1865418683u128, 1938163879u128, 2171570839u128, 1513107097u128, 132169753u128, 1519231037u128, 351795239u128, 1805258999u128, 534826993u128, 2459614861u128, 1757502707u128, 2335031653u128, 819476303u128, 2507504639u128]]" aleo1w68rxc2rtr37gz4pnc9qpy9jwh308cl0ygdcf7t2l0yknwej4ygsym6z5c
```

## A shuffle_and_pass transaction Output of the Deck Record Alice Sends to Bob.

```
{
  owner: aleo1gtrgfxzhuvpgmxtm5jz0pj8h6m6vacn07dcf5tdp86xxmpuyqsxqw45d4y.private,
  cards: [
    [
      903548341u128.private,
      1219224265u128.private,
      2194972411u128.private,
      1623141294u128.private,
      1495252248u128.private,
      1063887846u128.private,
      1855039138u128.private,
      265204498u128.private,
      891766602u128.private,
      421829602u128.private,
      1815182032u128.private,
      548699321u128.private,
      1882329000u128.private,
      726757187u128.private,
      2430342993u128.private,
      2384638503u128.private,
      1110781385u128.private,
      73037100u128.private,
      430635744u128.private,
      596816486u128.private,
      2203329578u128.private,
      1023113432u128.private,
      784691257u128.private,
      247721630u128.private,
      2466079850u128.private,
      2505253929u128.private
    ],
    [
      777418495u128.private,
      948844410u128.private,
      1693233513u128.private,
      1433050422u128.private,
      793111979u128.private,
      1499047059u128.private,
      594273551u128.private,
      1159745069u128.private,
      1279869734u128.private,
      340496627u128.private,
      1688497017u128.private,
      1956154540u128.private,
      936796540u128.private,
      65673615u128.private,
      1196978238u128.private,
      669953033u128.private,
      2388233669u128.private,
      931772915u128.private,
      1685927905u128.private,
      1381442244u128.private,
      1043611221u128.private,
      760515934u128.private,
      1064482984u128.private,
      2181212383u128.private,
      687901095u128.private,
      1887618880u128.private
    ]
  ],
  _nonce: 4201638630497730536057801854045238530067818219598856701121724199848651231597group.public
}"
```
