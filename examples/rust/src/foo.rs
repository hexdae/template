pub fn function() -> i32 {
    return 42;
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_function() {
        assert_eq!(function(), 42);
    }
}
