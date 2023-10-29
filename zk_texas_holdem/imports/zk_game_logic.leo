program zk_game_logic.aleo {
	transition get_hand_ranking_combination(public hand: u64) -> u64 {
    let winning_combination : u64 = get_four_of_a_kind(hand);

    if winning_combination != 0u64 {
        return winning_combination;
    }

    winning_combination = get_full_house_combination(hand);

    if winning_combination != 0u64 {
        return winning_combination;
    }

    winning_combination = get_three_of_a_kind(hand);

    if winning_combination != 0u64 {
        return winning_combination;
    }

    winning_combination = get_two_pairs_combination(hand);

    if winning_combination != 0u64 {
        return winning_combination;
    }

    winning_combination = get_pair_combination(hand);

    if winning_combination != 0u64 {
        return winning_combination;
    }

    return 0u64;
  }
  
  inline get_four_of_a_kind(hand: u64) -> u64 {
    if has_combination(hand, 4222124650659840u64) {
        return 4222124650659840u64; // Aces
    }
    if has_combination(hand, 263882790666240u64) {
        return 263882790666240u64; // Kings
    }
    if has_combination(hand, 16492674416640u64) {
        return 16492674416640u64; // Queens
    }
    if has_combination(hand, 1030792151040u64) {
        return 1030792151040u64; // Jacks
    }
    if has_combination(hand, 64424509440u64) {
        return 64424509440u64; // 10s
    }
    if has_combination(hand, 4026531840u64) {
        return 4026531840u64; // 9s
    }
    if has_combination(hand, 251658240u64) {
        return 251658240u64; // 8s
    }
    if has_combination(hand, 15728640u64) {
        return 15728640u64; // 7s
    }
    if has_combination(hand, 983040u64) {
        return 983040u64; // 6s
    }
    if has_combination(hand, 61440u64) {
        return 61440u64; // 5s
    }
    if has_combination(hand, 3840u64) {
        return 3840u64; // 4s
    }
    if has_combination(hand, 240u64) {
        return 240u64; // 3s
    }
    if has_combination(hand, 15u64) {
        return 15u64; // 2s
    }

    return 0u64;
  }
  
  inline get_full_house_combination(hand: u64) -> u64 {
    let hand_copy: u64 = hand;

    let three_of_a_kind : u64 = get_three_of_a_kind(hand_copy);

    if three_of_a_kind == 0u64 {
        return 0u64;
    }

    hand_copy = hand_copy & !three_of_a_kind;

    let pair : u64 = get_pair_combination(hand_copy);

    if pair == 0u64 {
        return 0u64;
    }

    let full_house : u64 = three_of_a_kind | pair;

    return full_house;
  }

  inline get_three_of_a_kind(hand: u64) -> u64 {
    // Triplets of Aces
    if has_combination(hand, 1970324836974592u64) {
        return 1970324836974592u64; // Aces - Hearts, Diamonds, and Clubs
    }
    if has_combination(hand, 3096224743817216u64) {
        return 3096224743817216u64; // Aces - Hearts, Diamonds, and Spades
    }
    if has_combination(hand, 3659174697238528u64) {
        return 3659174697238528u64; // Aces - Hearts, Clubs, and Spades
    }
    if has_combination(hand, 3940649673949184u64) {
        return 3940649673949184u64; // Aces - Diamonds, Clubs, and Spades
    }

    // Triplets of Kings
    if has_combination(hand, 123145302310912u64) {
        return 123145302310912u64; // Kings - Hearts, Diamonds, and Clubs
    }
    if has_combination(hand, 193514046488576u64) {
        return 193514046488576u64; // Kings - Hearts, Diamonds, and Spades
    }
    if has_combination(hand, 228698418577408u64) {
        return 228698418577408u64; // Kings - Hearts, Clubs, and Spades
    }
    if has_combination(hand, 246290604621824u64) {
        return 246290604621824u64; // Kings - Diamonds, Clubs, and Spades
    }

    // Triplets of Queens
    if has_combination(hand, 7696581394432u64) {
        return 7696581394432u64; // Queens - Hearts, Diamonds, and Clubs
    }
    if has_combination(hand, 12094627905536u64) {
        return 12094627905536u64; // Queens - Hearts, Diamonds, and Spades
    }
    if has_combination(hand, 14293651161088u64) {
        return 14293651161088u64; // Queens - Hearts, Clubs, and Spades
    }
    if has_combination(hand, 15393162788864u64) {
        return 15393162788864u64; // Queens - Diamonds, Clubs, and Spades
    }

    // Triplets of Jacks
    if has_combination(hand, 481036337152u64) {
        return 481036337152u64; // Jacks - Hearts, Diamonds, and Clubs
    }
    if has_combination(hand, 755914244096u64) {
        return 755914244096u64; // Jacks - Hearts, Diamonds, and Spades
    }
    if has_combination(hand, 893353197568u64) {
        return 893353197568u64; // Jacks - Hearts, Clubs, and Spades
    }
    if has_combination(hand, 962072674304u64) {
        return 962072674304u64; // Jacks - Diamonds, Clubs, and Spades
    }

    // Triplets of 10s
    if has_combination(hand, 30064771072u64) {
        return 30064771072u64; // 10s - Hearts, Diamonds, and Clubs
    }
    if has_combination(hand, 47244640256u64) {
        return 47244640256u64; // 10s - Hearts, Diamonds, and Spades
    }
    if has_combination(hand, 55834574848u64) {
        return 55834574848u64; // 10s - Hearts, Clubs, and Spades
    }
    if has_combination(hand, 60129542144u64) {
        return 60129542144u64; // 10s - Diamonds, Clubs, and Spades
    }

    // Triplets of 9s
    if has_combination(hand, 1879048192u64) {
        return 1879048192u64; // 9s - Hearts, Diamonds, and Clubs
    }
    if has_combination(hand, 2952790016u64) {
        return 2952790016u64; // 9s - Hearts, Diamonds, and Spades
    }
    if has_combination(hand, 3489660928u64) {
        return 3489660928u64; // 9s - Hearts, Clubs, and Spades
    }
    if has_combination(hand, 3758096384u64) {
        return 3758096384u64; // 9s - Diamonds, Clubs, and Spades
    }
    
    // Triplets of 8s
    if has_combination(hand, 117440512u64) {
        return 117440512u64; // 8s - Hearts, Diamonds, and Clubs
    }
    if has_combination(hand, 184549376u64) {
        return 184549376u64; // 8s - Hearts, Diamonds, and Spades
    }
    if has_combination(hand, 218103808u64) {
        return 218103808u64; // 8s - Hearts, Clubs, and Spades
    }
    if has_combination(hand, 234881024u64) {
        return 234881024u64; // 8s - Diamonds, Clubs, and Spades
    }
    
    // Triplets of 7s
    if has_combination(hand, 7340032u64) {
        return 7340032u64; // 7s - Hearts, Diamonds, and Clubs
    }
    if has_combination(hand, 11534336u64) {
        return 11534336u64; // 7s - Hearts, Diamonds, and Spades
    }
    if has_combination(hand, 13631488u64) {
        return 13631488u64; // 7s - Hearts, Clubs, and Spades
    }
    if has_combination(hand, 14680064u64) {
        return 14680064u64; // 7s - Diamonds, Clubs, and Spades
    }

    // Triplets of 6s
    if has_combination(hand, 458752u64) {
        return 458752u64; // 6s - Hearts, Diamonds, and Clubs
    }
    if has_combination(hand, 720896u64) {
        return 720896u64; // 6s - Hearts, Diamonds, and Spades
    }
    if has_combination(hand, 851968u64) {
        return 851968u64; // 6s - Hearts, Clubs, and Spades
    }
    if has_combination(hand, 917504u64) {
        return 917504u64; // 6s - Diamonds, Clubs, and Spades
    }

    // Triplets of 5s
    if has_combination(hand, 28672u64) {
        return 28672u64; // 5s - Hearts, Diamonds, and Clubs
    }
    if has_combination(hand, 45056u64) {
        return 45056u64; // 5s - Hearts, Diamonds, and Spades
    }
    if has_combination(hand, 53248u64) {
        return 53248u64; // 5s - Hearts, Clubs, and Spades
    }
    if has_combination(hand, 57344u64) {
        return 57344u64; // 5s - Diamonds, Clubs, and Spades
    }

    // Triplets of 4s
    if has_combination(hand, 1792u64) {
        return 1792u64; // 4s - Hearts, Diamonds, and Clubs
    }
    if has_combination(hand, 2816u64) {
        return 2816u64; // 4s - Hearts, Diamonds, and Spades
    }
    if has_combination(hand, 3328u64) {
        return 3328u64; // 4s - Hearts, Clubs, and Spades
    }
    if has_combination(hand, 3584u64) {
        return 3584u64; // 4s - Diamonds, Clubs, and Spades
    }

    // Triplets of 3s
    if has_combination(hand, 112u64) {
        return 112u64; // 3s - Hearts, Diamonds, and Clubs
    }
    if has_combination(hand, 176u64) {
        return 176u64; // 3s - Hearts, Diamonds, and Spades
    }
    if has_combination(hand, 208u64) {
        return 208u64; // 3s - Hearts, Clubs, and Spades
    }
    if has_combination(hand, 224u64) {
        return 224u64; // 3s - Diamonds, Clubs, and Spades
    }

    // Triplets of 2s
    if has_combination(hand, 7u64) {
        return 7u64; // 2s - Hearts, Diamonds, and Clubs
    }
    if has_combination(hand, 11u64) {
        return 11u64; // 2s - Hearts, Diamonds, and Spades
    }
    if has_combination(hand, 13u64) {
        return 13u64; // 2s - Hearts, Clubs, and Spades
    }
    if has_combination(hand, 14u64) {
        return 14u64; // 2s - Diamonds, Clubs, and Spades
    }

    return 0u64;
  }  

  inline get_two_pairs_combination(hand: u64) -> u64 {
    let hand_copy: u64 = hand;

    let first_pair : u64 = get_pair_combination(hand_copy);

    if first_pair == 0u64 {
        return 0u64;
    }

    hand_copy = hand_copy & !first_pair;

    let second_pair : u64 = get_pair_combination(hand_copy);

    if second_pair == 0u64 {
        return 0u64;
    }

    let two_pairs : u64 = first_pair | second_pair;

    return two_pairs;
  }

  inline get_pair_combination(hand: u64) -> u64 {
    // Pairs of Aces
    if has_combination(hand, 844424930131968u64) {
        return 844424930131968u64; // Aces - Hearts and Diamonds
    }
    if has_combination(hand, 1407374883553280u64) {
        return 1407374883553280u64; // Aces - Hearts and Clubs
    }
    if has_combination(hand, 2533274790395904u64) {
        return 2533274790395904u64; // Aces - Hearts and Spades
    }
    if has_combination(hand, 1688849860263936u64) {
        return 1688849860263936u64; // Aces - Diamonds and Clubs
    }
    if has_combination(hand, 2814749767106560u64) {
        return 2814749767106560u64; // Aces - Diamonds and Spades
    }
    if has_combination(hand, 3377699720527872u64) {
        return 3377699720527872u64; // Aces - Clubs and Spades
    }

    // Pairs of Kings
    if has_combination(hand, 6597069766656u64) {
        return 6597069766656u64; // Kings - Hearts and Diamonds
    }
    if has_combination(hand, 10995116277760u64) {
        return 10995116277760u64; // Kings - Hearts and Clubs
    }
    if has_combination(hand, 19791209299968u64) {
        return 19791209299968u64; // Kings - Hearts and Spades
    }
    if has_combination(hand, 13194139533312u64) {
        return 13194139533312u64; // Kings - Diamonds and Clubs
    }
    if has_combination(hand, 21990232555520u64) {
        return 21990232555520u64; // Kings - Diamonds and Spades
    }
    if has_combination(hand, 26388279066624u64) {
        return 26388279066624u64; // Kings - Clubs and Spades
    }

    // Pairs of Queens
    if has_combination(hand, 412316860416u64) {
        return 412316860416u64; // Queens - Hearts and Diamonds
    }
    if has_combination(hand, 687194767360u64) {
        return 687194767360u64; // Queens - Hearts and Clubs
    }
    if has_combination(hand, 1236950581248u64) {
        return 1236950581248u64; // Queens - Hearts and Spades
    }
    if has_combination(hand, 824633720832u64) {
        return 824633720832u64; // Queens - Diamonds and Clubs
    }
    if has_combination(hand, 1374389534720u64) {
        return 1374389534720u64; // Queens - Diamonds and Spades
    }
    if has_combination(hand, 1649267441664u64) {
        return 1649267441664u64; // Queens - Clubs and Spades
    }

    // Pairs of Jacks
    if has_combination(hand, 25769803776u64) {
        return 25769803776u64; // Jacks - Hearts and Diamonds
    }
    if has_combination(hand, 42949672960u64) {
        return 42949672960u64; // Jacks - Hearts and Clubs
    }
    if has_combination(hand, 77309411328u64) {
        return 77309411328u64; // Jacks - Hearts and Spades
    }
    if has_combination(hand, 51539607552u64) {
        return 51539607552u64; // Jacks - Diamonds and Clubs
    }
    if has_combination(hand, 85899345920u64) {
        return 85899345920u64; // Jacks - Diamonds and Spades
    }
    if has_combination(hand, 103079215104u64) {
        return 103079215104u64; // Jacks - Clubs and Spades
    }

    // Pairs of 10s
    if has_combination(hand, 12884901888u64) {
        return 12884901888u64; // 10s - Hearts and Diamonds
    }
    if has_combination(hand, 21474836480u64) {
        return 21474836480u64; // 10s - Hearts and Clubs
    }
    if has_combination(hand, 38654705664u64) {
        return 38654705664u64; // 10s - Hearts and Spades
    }
    if has_combination(hand, 25769803776u64) {
        return 25769803776u64; // 10s - Diamonds and Clubs
    }
    if has_combination(hand, 42949672960u64) {
        return 42949672960u64; // 10s - Diamonds and Spades
    }
    if has_combination(hand, 51539607552u64) {
        return 51539607552u64; // 10s - Clubs and Spades
    }

    // Pairs of 9s
    if has_combination(hand, 805306368u64) {
        return 805306368u64; // 9s - Hearts and Diamonds
    }
    if has_combination(hand, 1342177280u64) {
        return 1342177280u64; // 9s - Hearts and Clubs
    }
    if has_combination(hand, 2415919104u64) {
        return 2415919104u64; // 9s - Hearts and Spades
    }
    if has_combination(hand, 1610612736u64) {
        return 1610612736u64; // 9s - Diamonds and Clubs
    }
    if has_combination(hand, 2684354560u64) {
        return 2684354560u64; // 9s - Diamonds and Spades
    }
    if has_combination(hand, 3221225472u64) {
        return 3221225472u64; // 9s - Clubs and Spades
    }

    // Pairs of 8s
    if has_combination(hand, 50331648u64) {
        return 50331648u64; // 8s - Hearts and Diamonds
    }
    if has_combination(hand, 83886080u64) {
        return 83886080u64; // 8s - Hearts and Clubs
    }
    if has_combination(hand, 150994944u64) {
        return 150994944u64; // 8s - Hearts and Spades
    }
    if has_combination(hand, 100663296u64) {
        return 100663296u64; // 8s - Diamonds and Clubs
    }
    if has_combination(hand, 167772160u64) {
        return 167772160u64; // 8s - Diamonds and Spades
    }
    if has_combination(hand, 201326592u64) {
        return 201326592u64; // 8s - Clubs and Spades
    }

    // Pairs of 7s
    if has_combination(hand, 3145728u64) {
        return 3145728u64; // 7s - Hearts and Diamonds
    }
    if has_combination(hand, 5242880u64) {
        return 5242880u64; // 7s - Hearts and Clubs
    }
    if has_combination(hand, 9437184u64) {
        return 9437184u64; // 7s - Hearts and Spades
    }
    if has_combination(hand, 6291456u64) {
        return 6291456u64; // 7s - Diamonds and Clubs
    }
    if has_combination(hand, 10485760u64) {
        return 10485760u64; // 7s - Diamonds and Spades
    }
    if has_combination(hand, 12582912u64) {
        return 12582912u64; // 7s - Clubs and Spades
    }
    
    // Pairs of 6s
    if has_combination(hand, 196608u64) {
        return 196608u64; // 6s - Hearts and Diamonds
    }
    if has_combination(hand, 327680u64) {
        return 327680u64; // 6s - Hearts and Clubs
    }
    if has_combination(hand, 589824u64) {
        return 589824u64; // 6s - Hearts and Spades
    }
    if has_combination(hand, 393216u64) {
        return 393216u64; // 6s - Diamonds and Clubs
    }
    if has_combination(hand, 655360u64) {
        return 655360u64; // 6s - Diamonds and Spades
    }
    if has_combination(hand, 786432u64) {
        return 786432u64; // 6s - Clubs and Spades
    }
    
    // Pairs of 5s
    if has_combination(hand, 12288u64) {
        return 12288u64; // 5s - Hearts and Diamonds
    }
    if has_combination(hand, 20480u64) {
        return 20480u64; // 5s - Hearts and Clubs
    }
    if has_combination(hand, 36864u64) {
        return 36864u64; // 5s - Hearts and Spades
    }
    if has_combination(hand, 24576u64) {
        return 24576u64; // 5s - Diamonds and Clubs
    }
    if has_combination(hand, 40960u64) {
        return 40960u64; // 5s - Diamonds and Spades
    }
    if has_combination(hand, 49152u64) {
        return 49152u64; // 5s - Clubs and Spades
    }

    // Pairs of 4s
    if has_combination(hand, 768u64) {
        return 768u64; // 4s - Hearts and Diamonds
    }
    if has_combination(hand, 1280u64) {
        return 1280u64; // 4s - Hearts and Clubs
    }
    if has_combination(hand, 2304u64) {
        return 2304u64; // 4s - Hearts and Spades
    }
    if has_combination(hand, 1536u64) {
        return 1536u64; // 4s - Diamonds and Clubs
    }
    if has_combination(hand, 2560u64) {
        return 2560u64; // 4s - Diamonds and Spades
    }
    if has_combination(hand, 3072u64) {
        return 3072u64; // 4s - Clubs and Spades
    }

    // Pairs of 3s
    if has_combination(hand, 48u64) {
      return 48u64; // 3s - Hearts and Diamonds
    }
    if has_combination(hand, 80u64) {
      return 80u64; // 3s - Hearts and Clubs
    }
    if has_combination(hand, 144u64) {
      return 144u64; // 3s - Hearts and Spades
    }
    if has_combination(hand, 96u64) {
      return 96u64; // 3s - Diamonds and Clubs
    }
    if has_combination(hand, 160u64) {
      return 160u64; // 3s - Diamonds and Spades
    }
    if has_combination(hand, 192u64) {
      return 192u64; // 3s - Clubs and Spades
    }

    // Pairs of 2s
    if has_combination(hand, 3u64) {
      return 3u64; // 2s - Hearts and Diamonds
    }
    if has_combination(hand, 5u64) {
      return 5u64; // 2s - Hearts and Clubs
    }
    if has_combination(hand, 9u64) {
      return 9u64; // 2s - Hearts and Spades
    }
    if has_combination(hand, 6u64) {
      return 6u64; // 2s - Diamonds and Clubs
    }
    if has_combination(hand, 10u64) {
      return 10u64; // 2s - Diamonds and Spades
    }
    if has_combination(hand, 12u64) {
      return 12u64; // 2s - Clubs and Spades
    }

    return 0u64;
  }

  inline has_combination(hand: u64, combination: u64) -> bool {
    let hand_combination: u64 = hand & combination;
    let has_hand_combination : bool = hand_combination == combination;
    
    return has_hand_combination;
  }
}
