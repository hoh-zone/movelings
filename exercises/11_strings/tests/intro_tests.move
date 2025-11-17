#[test_only]
module intro::intro_tests {
    use std::string::Self;
    use intro::intro;

    #[test]
    fun test_create_string_literal() {
        let s = intro::create_string_literal();
        assert!(s == b"Hello, Move!", 1);
    }

    #[test]
    fun test_create_multiple_literals() {
        let (s1, s2) = intro::create_multiple_literals();
        assert!(s1 == b"Hello", 2);
        assert!(s2 == b"World", 3);
    }

    #[test]
    fun test_create_string() {
        let s = intro::create_string();
        assert!(intro::equals(&s, &string::utf8(b"Hello")), 4);
    }

    #[test]
    fun test_bytes_to_string() {
        let bytes = b"test";
        let s = intro::bytes_to_string(bytes);
        assert!(intro::equals(&s, &string::utf8(b"test")), 5);
    }

    #[test]
    fun test_string_to_bytes() {
        let s = string::utf8(b"test");
        let bytes = intro::string_to_bytes(s);
        assert!(bytes == b"test", 6);
    }

    #[test]
    fun test_get_length() {
        let s = string::utf8(b"Hello");
        let len = intro::get_length(&s);
        assert!(len == 5, 7);
    }

    #[test]
    fun test_is_empty() {
        let empty = string::utf8(b"");
        let non_empty = string::utf8(b"test");
        
        assert!(intro::is_empty(&empty), 8);
        assert!(intro::is_empty(&non_empty) == false, 9);
    }

    #[test]
    fun test_concatenate() {
        let s1 = string::utf8(b"Hello, ");
        let s2 = string::utf8(b"Move!");
        let result = intro::concatenate(s1, s2);
        assert!(intro::equals(&result, &string::utf8(b"Hello, Move!")), 10);
    }

    #[test]
    fun test_concatenate_literal() {
        let s = string::utf8(b"Hello, ");
        let result = intro::concatenate_literal(s, b"World!");
        assert!(intro::equals(&result, &string::utf8(b"Hello, World!")), 11);
    }

    #[test]
    fun test_substring() {
        let s = string::utf8(b"Hello, Move!");
        let sub = intro::substring(s, 0, 5);
        assert!(intro::equals(&sub, &string::utf8(b"Hello")), 12);
    }

    #[test]
    fun test_take_prefix() {
        let s = string::utf8(b"Hello, Move!");
        let prefix = intro::take_prefix(s, 5);
        assert!(intro::equals(&prefix, &string::utf8(b"Hello")), 13);
    }

    #[test]
    fun test_take_suffix() {
        let s = string::utf8(b"Hello, Move!");
        let suffix = intro::take_suffix(s, 7);
        assert!(intro::equals(&suffix, &string::utf8(b"Move!")), 14);
    }

    #[test]
    fun test_equals() {
        let s1 = string::utf8(b"test");
        let s2 = string::utf8(b"test");
        let s3 = string::utf8(b"different");
        
        assert!(intro::equals(&s1, &s2), 15);
        assert!(intro::equals(&s1, &s3) == false, 16);
    }

    #[test]
    fun test_contains() {
        let s = string::utf8(b"Hello, Move!");
        let sub = string::utf8(b"Move");
        let not_sub = string::utf8(b"Rust");
        
        assert!(intro::contains(&s, &sub), 17);
        assert!(intro::contains(&s, &not_sub) == false, 18);
    }

    #[test]
    fun test_number_to_string() {
        let s0 = intro::number_to_string(0);
        let s1 = intro::number_to_string(1);
        let s42 = intro::number_to_string(42);
        
        assert!(intro::equals(&s0, &string::utf8(b"0")), 19);
        assert!(intro::equals(&s1, &string::utf8(b"1")), 20);
        assert!(intro::equals(&s42, &string::utf8(b"42")), 21);
    }

    #[test]
    fun test_repeat_string() {
        let s = string::utf8(b"Hi");
        let repeated = intro::repeat_string(s, 3);
        assert!(intro::equals(&repeated, &string::utf8(b"HiHiHi")), 22);
    }

    #[test]
    fun test_trim_start() {
        let s = string::utf8(b"Hello, Move!");
        let prefix = string::utf8(b"Hello, ");
        let trimmed = intro::trim_start(s, &prefix);
        assert!(intro::equals(&trimmed, &string::utf8(b"Move!")), 23);
    }

    #[test]
    fun test_create_string_vector() {
        let strings = intro::create_string_vector();
        assert!(vector::length(&strings) == 3, 24);
    }

    #[test]
    fun test_join_strings() {
        let strings = vector[
            string::utf8(b"Hello"),
            string::utf8(b", "),
            string::utf8(b"Move")
        ];
        let joined = intro::join_strings(strings);
        assert!(intro::equals(&joined, &string::utf8(b"Hello, Move")), 25);
    }
}

