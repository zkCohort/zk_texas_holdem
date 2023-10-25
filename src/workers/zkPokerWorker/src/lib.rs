use wasm_bindgen::prelude::*;
use snarkvm_wasm::network::Testnet3;
use snarkvm_wasm::types::Field;
use num_integer::Integer;
use std::str::FromStr;
use num_prime::{RandPrime, BitTest};
use num_bigint::BigInt;
use num_traits::{One, Zero};
use num_traits::FromPrimitive;
use rand::Rng;
// use wasm_bindgen::prelude::*;


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

#[wasm_bindgen]
pub fn generate_phi_n_js() -> JsValue {
    let (phi, n) = generate_phi_n(248);
    let obj = js_sys::Object::new();
    js_sys::Reflect::set(&obj, &"phi".into(), &JsValue::from_str(&phi.to_string())).unwrap();
    js_sys::Reflect::set(&obj, &"n".into(), &JsValue::from_str(&n.to_string())).unwrap();
    obj.into()
}

#[wasm_bindgen]
pub fn generate_key_pair_js(p_js: &str, q_js: &str) -> JsValue {
    // parse string into u32 instead of bigint
    let p = BigInt::from_str(p_js).unwrap();
    let q = BigInt::from_str(q_js).unwrap();
    let (e, d) = generate_key_pair(&p, &q);
    let obj = js_sys::Object::new();
    js_sys::Reflect::set(&obj, &"e".into(), &JsValue::from_str(&e.to_string())).unwrap();
    js_sys::Reflect::set(&obj, &"d".into(), &JsValue::from_str(&d.to_string())).unwrap();
    obj.into()
}

// #[wasm_bindgen]
// pub fn generate_key_pair_given_n_js(n: &str) -> JsValue {
//     // parse string into u32 instead of bigint
//     let n = BigInt::from_str(n).unwrap();
//     let (e, d) = generate_key_pair_given_n(248, &n);
//     let obj = js_sys::Object::new();
//     js_sys::Reflect::set(&obj, &"e".into(), &JsValue::from_str(&e.to_string())).unwrap();
//     js_sys::Reflect::set(&obj, &"d".into(), &JsValue::from_str(&d.to_string())).unwrap();
//     obj.into()
// }

#[wasm_bindgen]
pub fn encrypt_js(message_js: &str, e_js: &str, n_js: &str) -> JsValue {
    // parse string into u32 instead of bigint
    let message: u32 = message_js.parse().unwrap();
    let e = BigInt::from_str(e_js).unwrap();
    let n = BigInt::from_str(n_js).unwrap();
    
    let cipher = encrypt(&BigInt::from(message), &e, &n);
    JsValue::from_str(&cipher.to_string())
}

#[wasm_bindgen]
pub fn decrypt_js(cipher_js: &str, d_js: &str, n_js: &str) -> JsValue {
    // parse string into u32 instead of bigint
    let cipher: BigInt = BigInt::from_str(cipher_js).unwrap();
    let d = BigInt::from_str(d_js).unwrap();
    let n = BigInt::from_str(n_js).unwrap();

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
    exp_by_squaring(message, e, n) % n
}

fn decrypt(cipher: &BigInt, d: &BigInt, n: &BigInt) -> BigInt {
    exp_by_squaring(cipher, d, n) % n
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
    log(&format!("prime = {} bits = {}", prime, prime.bits()));
    BigInt::from_u128(prime).unwrap()
}

// Generate a shared p, q, N
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

// Generate an e, d for Bob when he knows N
// fn generate_key_pair_given_n(bit_size: usize, n: &BigInt) -> (BigInt, BigInt) {
//     let mut e: BigInt;
//     loop {
//         e = get_fixed_sized_prime(bit_size / 2);
//         if e.gcd(n) == BigInt::one() {
//             break;
//         }
//     }
//     let d = mod_inverse(&e, n).unwrap_or_else(|| BigInt::zero());
//     if (&d * &e) % n != BigInt::one() {
//         return generate_key_pair_given_n(bit_size, n);
//     }
//     (e, d)
// }

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

    // Generate a random e
    loop {
        e = BigInt::from(rng.gen_range(3..10000)); // Arbitrarily chose 10000, you can adjust
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
    fn it_works() {
        let result = cantors_pairing("6620725176063038515001622937675038563827406628391465806478602334180190206522field", "2field");
        assert_eq!(result, "1523534527618700274211601211314655639838278312746489101125542475404695911424field");
    }

    #[wasm_bindgen_test]
    fn test_get_fixed_prime() {
        let mut old_prime: BigInt = BigInt::zero();
        for _ in 0..52 {
            let prime = get_fixed_sized_prime(248 / 2);
            assert!(old_prime != prime);
            assert_eq!(prime.bits(), 124);
            old_prime = prime;
        }
    }

    #[wasm_bindgen_test]
    fn test_generate_phi_n() {
        let mut old_phi_n: (BigInt, BigInt) = (BigInt::zero(), BigInt::zero());
        for _ in 0..64 {
            let (phi, n) = generate_phi_n(248);
            // log the values of p and q to see if they are the same bit size
            log(&format!("\n\n"));
            log(&format!("==================="));
            log(&format!("phi = {} n = {}", phi, n));
            log(&format!("n = {}", n));
            assert!(n.bits() == 248);
            assert!(old_phi_n != (phi.clone(), n.clone()));
            old_phi_n = (phi, n);
        }
    }

    #[wasm_bindgen_test]
    fn test_generate_key_pair() {
        let (phi, n) = generate_phi_n(248);
        let (e, d) = generate_key_pair(&phi, &n);
        log(&format!("\n\n"));
        log(&format!("==================="));
        log(&format!("phi = {} n = {}", phi, n));
        log(&format!("e = {} d = {}", e, d));
        // e and d are the encryption and decryption key pair.
        // e is the public key, d is the private key.
        assert!(BigInt::one() < e);
        assert!(e < phi);
        assert!(BigInt::one() < d);
        assert!(d < phi);
        assert!(d != BigInt::zero() && e != BigInt::zero());
        assert_eq!((e * d) % phi, BigInt::one());
    }

    #[wasm_bindgen_test]
    fn test_sra() {
        // Shared p, q, n
        let (phi, n) = generate_phi_n(248);
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
        log(&format!("\n\n"));
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
        let e1: BigInt = BigInt::from(5);
        let d1: BigInt = BigInt::from(29);
        let e2: BigInt = BigInt::from(7);
        let d2: BigInt = BigInt::from(31);
        let n: BigInt = BigInt::from(91);
        let message: BigInt = BigInt::from(5);
    
        log(&format!("\n\n"));
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