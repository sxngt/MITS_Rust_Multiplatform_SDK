mod signal_processing;uniffi::include_scaffolding!("mits_ndk_lib");
pub fn reverse_string(input_string: &str) -> String {
    signal_processing::reverse::reverse_string(input_string)
}

pub fn reverse_integer(input_integer: i32) -> i32 {
    signal_processing::reverse::reverse_integer(input_integer)
}


#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_reverses_strings() {
        let result = reverse_string("hello world");
        assert_eq!(result, "dlrow olleh");
    }
    #[test]
    fn it_reverses_integers() {
        let result = reverse_integer(123);
        assert_eq!(result, 321);
    }
}