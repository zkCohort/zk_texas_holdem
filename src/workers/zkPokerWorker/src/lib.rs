use wasm_bindgen::prelude::*;
use snarkvm_wasm::network::Testnet3;
use snarkvm_wasm::types::Field;
use std::str::FromStr;

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