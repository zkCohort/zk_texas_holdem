use wasm_bindgen::prelude::*;
use snarkvm_wasm::network::Testnet3;
use snarkvm_wasm::types::Field;
use std::str::FromStr;
use num_bigint::{BigInt, RandBigInt, ToBigInt};
use num_traits::{One, Zero};
use rand::{rngs::OsRng, Rng};

#[wasm_bindgen]
extern "C" {
    #[wasm_bindgen(js_namespace = console)]
    fn log(s: &str);
}

#[wasm_bindgen]
pub fn cantors_pairing(x: &str, y: &str) -> String {
    let one = Field::<Testnet3>::from_str("1field").unwrap();
    let two = Field::<Testnet3>::from_str("2field").unwrap();
    let a = Field::<Testnet3>::from_str(x).unwrap();
    let b = Field::<Testnet3>::from_str(y).unwrap();
    let result = (((a + b) * (a + b + one)) / two) + b;
    result.to_string()
}

// Using Miller-Rabin rounds not FIPS 186-4 Compliant but good enough for our purposes.
// 512 bits is the minimum for FIPS 186-4
#[wasm_bindgen]
pub fn rnd_prime() -> String {
    let mut rng = rand::thread_rng();
    let two = BigInt::from(2);

    loop {
        // Generate a 511-bit random number, then add 2^511 to ensure the number is 512-bit
        let mut big_rand = rng.gen_bigint(511);
        big_rand += two.pow(511u32);

        if is_prime(&big_rand, 10) {  // 10 rounds for the primality test
            return big_rand.to_string();
        }
    }
}

pub fn is_prime(n: u64, rounds: u32) -> bool {
    if n < 4 {
        return n == 2 || n == 3;
    }

    let mut rng = OsRng;

    // write n - 1 as 2^s * d
    let mut s = 0;
    let mut d = n - 1;
    while d % 2 == 0 {
        d /= 2;
        s += 1;
    }

    'witness_loop: for _ in 0..rounds {
        let a = rng.gen_range(2..n - 2);
        let mut x = pow_mod(a, d, n); // Compute a^d % n
        if x == 1 || x == n - 1 {
            continue;
        }

        for _r in 1..s {
            x = pow_mod(x, 2, n); // Compute x^2 % n
            if x == n - 1 {
                continue 'witness_loop;
            }
        }

        return false; // composite
    }

    true // probably prime
}

fn pow_mod(mut base: u64, mut exponent: u64, modulus: u64) -> u64 {
    if modulus == 1 {
        return 0;
    }
    let mut result = 1;
    base = base % modulus;
    while exponent > 0 {
        if exponent % 2 == 1 {
            result = result * base % modulus;
        }
        exponent >>= 1;
        base = base.pow(2) % modulus;
    }
    result
}

#[cfg(test)]
mod tests {
    use super::*;
    use wasm_bindgen_test::wasm_bindgen_test;

    #[wasm_bindgen_test]
    fn it_works() {
        let result = cantors_pairing("6620725176063038515001622937675038563827406628391465806478602334180190206522field", "2field");
        assert_eq!(result, "1523534527618700274211601211314655639838278312746489101125542475404695911424field");
    }
}