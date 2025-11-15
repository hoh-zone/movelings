#[test_only]
module intro::intro_tests {
    use std::option;
    use intro::intro;

    #[test]
    fun test_validate_positive() {
        let result = intro::validate_positive(42, 0);
        assert!(result == 42, 1);
    }

    #[test, expected_failure(abort_code = 0)]
    fun test_validate_positive_fail() {
        intro::validate_positive(0, 0);
    }

    #[test]
    fun test_validate_range() {
        let result = intro::validate_range(5, 0, 10, 0);
        assert!(result == 5, 2);
    }

    #[test, expected_failure(abort_code = 0)]
    fun test_validate_range_fail() {
        intro::validate_range(15, 0, 10, 0);
    }

    #[test]
    fun test_create_default_config() {
        let config = intro::create_default_config();
        assert!(config.max_size == 1000, 3);
        assert!(config.min_size == 10, 4);
        assert!(config.enabled == true, 5);
    }

    #[test]
    fun test_create_config() {
        let config = intro::create_config(500, 5, false);
        assert!(config.max_size == 500, 6);
        assert!(config.min_size == 5, 7);
        assert!(config.enabled == false, 8);
    }

    #[test]
    fun test_first() {
        let vec = vector[1, 2, 3];
        let result = intro::first(&vec);
        assert!(option::is_some(&result), 9);
        assert!(*option::borrow(&result) == 1, 10);
        
        let empty = vector::empty<u64>();
        let result2 = intro::first(&empty);
        assert!(option::is_none(&result2), 11);
    }

    #[test]
    fun test_last() {
        let vec = vector[1, 2, 3, 4];
        let result = intro::last(&vec);
        assert!(option::is_some(&result), 12);
        assert!(*option::borrow(&result) == 4, 13);
        
        let empty = vector::empty<u64>();
        let result2 = intro::last(&empty);
        assert!(option::is_none(&result2), 14);
    }

    #[test]
    fun test_map_values() {
        let vec = vector[1, 2, 3];
        let result = intro::map_values(vec);
        assert!(vector::length(&result) == 3, 15);
        assert!(*vector::borrow(&result, 0) == 2, 16);
        assert!(*vector::borrow(&result, 1) == 4, 17);
        assert!(*vector::borrow(&result, 2) == 6, 18);
    }

    #[test]
    fun test_filter_positive() {
        let vec = vector[0, 1, 0, 2, 0, 3];
        let result = intro::filter_positive(vec);
        assert!(vector::length(&result) == 3, 19);
        assert!(*vector::borrow(&result, 0) == 1, 20);
        assert!(*vector::borrow(&result, 1) == 2, 21);
        assert!(*vector::borrow(&result, 2) == 3, 22);
    }

    #[test]
    fun test_create_origin() {
        let point = intro::create_origin();
        assert!(point.x == 0, 23);
        assert!(point.y == 0, 24);
    }

    #[test]
    fun test_create_point() {
        let point = intro::create_point(10, 20);
        assert!(point.x == 10, 25);
        assert!(point.y == 20, 26);
    }

    #[test]
    fun test_safe_divide_with_code() {
        let result1 = intro::safe_divide_with_code(10, 2, 0);
        assert!(option::is_some(&result1), 27);
        assert!(*option::borrow(&result1) == 5, 28);
        
        let result2 = intro::safe_divide_with_code(10, 0, 0);
        assert!(option::is_none(&result2), 29);
    }

    #[test]
    fun test_assert_and_return() {
        let result = intro::assert_and_return(42, true, 0);
        assert!(result == 42, 30);
    }

    #[test, expected_failure(abort_code = 0)]
    fun test_assert_and_return_fail() {
        intro::assert_and_return(42, false, 0);
    }

    #[test]
    fun test_swap_values() {
        let (a, b) = intro::swap_values(1, 2);
        assert!(a == 2, 31);
        assert!(b == 1, 32);
    }

    #[test]
    fun test_duplicate_value() {
        let (a, b) = intro::duplicate_value(42);
        assert!(a == 42, 33);
        assert!(b == 42, 34);
    }

    #[test]
    fun test_find_index() {
        let vec = vector[10, 20, 30, 40];
        
        let result1 = intro::find_index(&vec, 20);
        assert!(option::is_some(&result1), 35);
        assert!(*option::borrow(&result1) == 1, 36);
        
        let result2 = intro::find_index(&vec, 100);
        assert!(option::is_none(&result2), 37);
    }

    #[test]
    fun test_contains_value() {
        let vec = vector[1, 2, 3, 4];
        
        assert!(intro::contains_value(&vec, 2), 38);
        assert!(intro::contains_value(&vec, 5) == false, 39);
    }

    #[test]
    fun test_combine_vectors() {
        let vec1 = vector[1, 2];
        let vec2 = vector[3, 4];
        let result = intro::combine_vectors(vec1, vec2);
        
        assert!(vector::length(&result) == 4, 40);
        assert!(*vector::borrow(&result, 0) == 1, 41);
        assert!(*vector::borrow(&result, 1) == 2, 42);
        assert!(*vector::borrow(&result, 2) == 3, 43);
        assert!(*vector::borrow(&result, 3) == 4, 44);
    }

    #[test]
    fun test_take_n() {
        let vec = vector[1, 2, 3, 4, 5];
        
        let result1 = intro::take_n(vec, 3);
        assert!(vector::length(&result1) == 3, 45);
        assert!(*vector::borrow(&result1, 0) == 1, 46);
        assert!(*vector::borrow(&result1, 2) == 3, 47);
        
        let vec2 = vector[1, 2];
        let result2 = intro::take_n(vec2, 5);
        assert!(vector::length(&result2) == 2, 48);  // 只取可用的元素
    }
}
