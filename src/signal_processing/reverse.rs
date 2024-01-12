pub fn reverse_string(input_string: &str) -> String {
    input_string.chars().rev().collect()
}

pub fn reverse_integer(input_integer: i32) -> i32 {
    let reversed = input_integer.to_string().chars().rev().collect::<String>();
    reversed.parse::<i32>().unwrap()
}

