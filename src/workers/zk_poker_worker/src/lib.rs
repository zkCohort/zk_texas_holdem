use wasm_bindgen::prelude::*;
// use snarkvm_wasm::network::Testnet3;
// use snarkvm_wasm::types::Field;
use num_integer::Integer;
use std::str::FromStr;
use num_prime::{RandPrime, BitTest};
use num_bigint::BigInt;
use num_traits::{One, Zero};
use num_traits::FromPrimitive;
use rand::Rng;


#[wasm_bindgen]
extern "C" {
    #[wasm_bindgen(js_namespace = console)]
    fn log(s: &str);
}

#[wasm_bindgen]
pub fn js_generate_phi_n(bit_size: usize) -> JsValue {
    // bit_size = 248
    let (phi, n) = generate_phi_n(bit_size);
    let obj = js_sys::Object::new();
    js_sys::Reflect::set(&obj, &"phi".into(), &JsValue::from_str(&phi.to_string())).unwrap();
    js_sys::Reflect::set(&obj, &"n".into(), &JsValue::from_str(&n.to_string())).unwrap();
    obj.into()
}

#[wasm_bindgen]
pub fn js_generate_key_pair(js_phi: &str, js_n: &str) -> JsValue {
    let phi = BigInt::from_str(js_phi).unwrap();
    let n = BigInt::from_str(js_n).unwrap();
    let (e, d) = generate_key_pair(&phi, &n);
    let obj = js_sys::Object::new();
    js_sys::Reflect::set(&obj, &"e".into(), &JsValue::from_str(&e.to_string())).unwrap();
    js_sys::Reflect::set(&obj, &"d".into(), &JsValue::from_str(&d.to_string())).unwrap();
    obj.into()
}

#[wasm_bindgen]
pub fn js_encrypt(js_message: &str, js_e: &str, js_n: &str) -> JsValue {
    // parse string into u32 instead of bigint
    let message: u32 = js_message.parse().unwrap();
    let e = BigInt::from_str(js_e).unwrap();
    let n = BigInt::from_str(js_n).unwrap();
    
    let cipher = encrypt(&BigInt::from(message), &e, &n);
    JsValue::from_str(&cipher.to_string())
}

#[wasm_bindgen]
pub fn js_decrypt(js_cipher: &str, js_d: &str, js_n: &str) -> JsValue {
    // parse string into u32 instead of bigint
    let cipher: BigInt = BigInt::from_str(js_cipher).unwrap();
    let d = BigInt::from_str(js_d).unwrap();
    let n = BigInt::from_str(js_n).unwrap();

    let decrypted = decrypt(&cipher, &d, &n);
    JsValue::from_str(&decrypted.to_string())
}

fn exp_by_squaring(base: &BigInt, exp: &BigInt, modulus: &BigInt) -> BigInt {
    if *exp == Zero::zero() {
        return One::one();
    } else if exp.is_even() {
        let half = exp.clone() >> 1; // Divide by 2
        let half_exp = exp_by_squaring(base, &half, modulus);
        return (&half_exp * &half_exp) % modulus;
    } else {
        let half = (exp.clone() - BigInt::one()) >> 1; // (exp - 1) / 2
        let half_exp = exp_by_squaring(base, &half, modulus);
        return (base * &half_exp * &half_exp) % modulus;
    }
}


fn encrypt(message: &BigInt, e: &BigInt, n: &BigInt) -> BigInt {
    let cipher: BigInt = exp_by_squaring(message, e, n);
    log(&format!("cipher: {} cipher bits: {}", &cipher, &cipher.bits()));
    cipher
}

fn decrypt(cipher: &BigInt, d: &BigInt, n: &BigInt) -> BigInt {
    let message: BigInt = exp_by_squaring(cipher, d, n);
    log(&format!("message: {} message bits: {}", &message, &message.bits()));
    message
}


fn get_fixed_sized_prime(bit_size: usize) -> BigInt {
    let mut rng = rand::thread_rng();

    let mut prime: u128;
    loop {
        prime = rng.gen_prime(bit_size, None);
        if prime.bits() == bit_size {
            break;
        }
    }
    BigInt::from_u128(prime).unwrap()
}

// Generate a shared phi and N, while keeping p and q secret.
fn generate_phi_n(bit_size: usize) -> (BigInt, BigInt) {
    let p = get_fixed_sized_prime(bit_size / 2);
    let q = get_fixed_sized_prime(bit_size / 2);
    let phi = (p.clone() - BigInt::one()) * (q.clone() - BigInt::one());
    let n = p.clone() * q.clone();
    if n.bits() != bit_size as u64 {
        return generate_phi_n(bit_size);
    }
    (phi, n)
}

fn extended_gcd(a: &BigInt, b: &BigInt) -> (BigInt, BigInt, BigInt) {
    if *a == BigInt::zero() {
        (b.clone(), BigInt::zero(), BigInt::one())
    } else {
        let (g, x, y) = extended_gcd(&(b % a), a);
        (g, y.clone() - (b / a) * x.clone(), x)
    }
}

fn mod_inverse(a: &BigInt, m: &BigInt) -> Option<BigInt> {
    let (g, x, _) = extended_gcd(a, m);
    if g != BigInt::one() {
        None
    } else {
        Some((x % m + m) % m)
    }
}

// Generate a key pair.
fn generate_key_pair(phi: &BigInt, n: &BigInt) -> (BigInt, BigInt) {
    let mut rng = rand::thread_rng();
    let mut e: BigInt;
    let limit: usize = u128::MAX as usize / 2;

    // Generate a random e
    loop {
        e = BigInt::from(rng.gen_range(3..limit));
        if &e % 2 != BigInt::zero() && phi.gcd(&e) == BigInt::one() {
            break;
        }
    }

    if let Some(d) = mod_inverse(&e, &phi) {
        (e, d)
    } else {
        generate_key_pair(phi, n)
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use wasm_bindgen_test::wasm_bindgen_test;

    #[wasm_bindgen_test]
    fn test_get_fixed_prime() {
        log(&format!("\n\n"));
        let mut old_prime: BigInt = BigInt::zero();
        for i in 0..52 {
            let prime = get_fixed_sized_prime(32 / 2);
            assert!(old_prime != prime);
            assert_eq!(prime.bits(), 16);
            if (i % 8) == 0 {
                log(&format!("==================="));
                log(&format!("prime = {}", prime));
                log(&format!("bits = {}", prime.bits()));
            }
            old_prime = prime;
        }
        log(&format!("==================="));
    }

    #[wasm_bindgen_test]
    fn test_generate_phi_n() {
        log(&format!("\n\n"));
        let mut old_phi_n: (BigInt, BigInt) = (BigInt::zero(), BigInt::zero());
        for i in 0..64 {
            let (phi, n) = generate_phi_n(32);
            assert!(n.bits() == 32);
            assert!(old_phi_n != (phi.clone(), n.clone()));
            if (i % 8) == 0 {
                log(&format!("==================="));
                log(&format!("phi = {} n = {}", phi, n));
                log(&format!("phi bits = {}", phi.bits()));
                log(&format!("n bits = {}", n.bits()));
            }
            old_phi_n = (phi, n);
        }
        log(&format!("==================="));
    }

    #[wasm_bindgen_test]
    fn test_generate_key_pair() {
        log(&format!("\n\n"));
        // let (phi, n) = generate_phi_n(32);
        let (phi, n): (BigInt, BigInt) = (BigInt::from(2801307600u32), BigInt::from(2801413507u32));
        let (e, d) = generate_key_pair(&phi, &n);
        let midpoint = 52u8 / 2;
        
        // Initialize with default values
        let mut deck_e: [[String; 26]; 2] = Default::default();
        let mut deck_d: [[String; 26]; 2] = Default::default();

        for i in 0u8..52u8 {
            let value: JsValue = js_generate_key_pair(&phi.to_string(), &n.to_string());
            let e1 = js_sys::Reflect::get(&value, &"e".into()).unwrap().as_string().unwrap().parse::<u32>().unwrap();
            let d1 = js_sys::Reflect::get(&value, &"d".into()).unwrap().as_string().unwrap().parse::<u32>().unwrap();
            
            if i < midpoint {
                deck_e[0][i as usize] = format!("{}u32", e1);
                deck_d[0][i as usize] = format!("{}u32", d1);
            } else {
                deck_e[1][i as usize - midpoint as usize] = format!("{}u32", e1);
                deck_d[1][i as usize - midpoint as usize] = format!("{}u32", d1);
            }
            
        }

        log(&format!("==================="));
        log(&format!("deck_e {:?}", deck_e));
        log(&format!("deck_d {:?}", deck_d));
        log(&format!("==================="));
        // e and d are the encryption and decryption key pair.
        // e is the public key, d is the private key.
        log(&format!("==================="));
        log(&format!("phi = {} n = {}", phi, n));
        log(&format!("e = {} d = {}", e, d));
        log(&format!("phi bits = {}", phi.bits()));
        log(&format!("n bits = {}", n.bits()));
        log(&format!("e bits = {}", e.bits()));
        log(&format!("d bits = {}", d.bits()));
        assert!(BigInt::one() < e);
        assert!(e < phi);
        assert!(BigInt::one() < d);
        assert!(d < phi);
        assert!(d != BigInt::zero() && e != BigInt::zero());
        assert_eq!((e * d) % phi, BigInt::one());
        log(&format!("==================="));
    }


    #[wasm_bindgen_test]
    fn test_sra() {
        log(&format!("\n\n"));
        // Shared p, q, n
        let (phi, n) = generate_phi_n(32);
        // Alice key pair (e1, d1)
        let (e1, d1) = generate_key_pair(&phi, &n);
        // Bob key pair (e2, d2)
        // let (e2, d2) = generate_key_pair_given_n(248, &n);
        let (e2, d2) = generate_key_pair(&phi, &n);
        assert!(e1 < n);
        assert!(e2 < n);
        assert!(e1 != e2);
        // The card
        let message = BigInt::from(63);
        log(&format!("==================="));
        log(&format!("phi = {} n = {}", phi, n));
        log(&format!("==================="));
        log(&format!("e1 = {} d1 = {}", e1, d1));
        log(&format!("e2 = {} d2 = {}", e2, d2));
        log(&format!("n = {}", n));
        log(&format!("Message = {}", message));
        log(&format!("==================="));
        let alice_cipher = encrypt(&message, &e1, &n);
        log(&format!("  Cipher result (after Alice encrypt): {}", alice_cipher));

        let bob_cipher = encrypt(&alice_cipher, &e2, &n);
        log(&format!("  Cipher result (after Bob encrypt): {}", bob_cipher));

        let decipher_1 = decrypt(&bob_cipher, &d2, &n);
        log(&format!("  Cipher result (After Bob decrypt): {}", decipher_1));

        let decipher_2 = decrypt(&decipher_1, &d1, &n);
        log(&format!("  Cipher result (After Alice decrypt): {}", decipher_2));

        log(&format!("A -> B -> B -> A: {}", decipher_2));

        let decipher_1 = decrypt(&bob_cipher, &d1, &n);
        log(&format!("  Cipher result (After Alice decrypt): {}", decipher_1));

        let decipher_2 = decrypt(&decipher_1, &d2, &n);
        log(&format!("  Cipher result (After Bob decrypt): {}", decipher_2));

        log(&format!("A -> B -> A -> B: {}", decipher_2));

        assert_eq!(decipher_2, message);
    }

    #[wasm_bindgen_test]
    fn test_sra_mock() {
        log(&format!("\n\n"));
        let e1: BigInt = BigInt::from(5);
        let d1: BigInt = BigInt::from(29);
        let e2: BigInt = BigInt::from(7);
        let d2: BigInt = BigInt::from(31);
        let n: BigInt = BigInt::from(91);
        let message: BigInt = BigInt::from(5);
    
        log(&format!("==================="));
        log(&format!("d1 = {}, d2 = {}", d1, d2));
        log(&format!("e1 = {}, e2 = {}", e1, e2));
        log(&format!("n = {}", n));
        log(&format!("Message = {}", message));
        log(&format!("==================="));
    
        let alice_cipher = encrypt(&message, &e1, &n);
        log(&format!("Cipher result (after Alice encrypt): {}", alice_cipher));
        assert_eq!(BigInt::from(31), alice_cipher);
    
        let bob_cipher = encrypt(&alice_cipher, &e2, &n);
        log(&format!("Cipher result (after Bob encrypt): {}", bob_cipher));
        assert_eq!(BigInt::from(73), bob_cipher);
    
        log(&format!("==================="));
    
        let decipher_1 = decrypt(&bob_cipher, &d2, &n);
        log(&format!("Cipher result (After Bob decrypt): {}", decipher_1));
        assert_eq!(BigInt::from(31), decipher_1);
        let decipher_2 = decrypt(&decipher_1, &d1, &n);
        log(&format!("Cipher result (After Alice decrypt): {}", decipher_2));
        log(&format!("A -> B -> B -> A: {}", decipher_2));
        assert_eq!(BigInt::from(5), decipher_2);

        let decipher_1 = decrypt(&bob_cipher, &d1, &n);
        log(&format!("Cipher result (After Alice decrypt): {}", decipher_1));
        assert_eq!(BigInt::from(47), decipher_1);
        let decipher_2 = decrypt(&decipher_1, &d2, &n);
        log(&format!("Cipher result (After Bob decrypt): {}", decipher_2));
        log(&format!("A -> B -> A -> B: {}", decipher_2));
        assert_eq!(BigInt::from(5), decipher_2);
    }
    
}