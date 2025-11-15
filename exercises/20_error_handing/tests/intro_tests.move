#[test_only]
module intro::intro_tests {
    use std::option;
    use intro::intro;

    #[test]
    fun test_divide() {
        let result = intro::divide(10, 2);
        assert!(result == 5, 1);
    }

    #[test, expected_failure(abort_code = intro::EZero)]
    fun test_divide_by_zero() {
        intro::divide(10, 0);
    }

    #[test]
    fun test_require_positive() {
        let result = intro::require_positive(42);
        assert!(result == 42, 2);
    }

    #[test, expected_failure(abort_code = intro::ENegative)]
    fun test_require_positive_zero() {
        intro::require_positive(0);
    }

    #[test]
    fun test_assert_positive() {
        let result = intro::assert_positive(10);
        assert!(result == 10, 3);
    }

    #[test, expected_failure(abort_code = intro::ENegative)]
    fun test_assert_positive_fail() {
        intro::assert_positive(0);
    }

    #[test]
    fun test_assert_equal() {
        intro::assert_equal(5, 5);
        // 测试通过
    }

    #[test, expected_failure]
    fun test_assert_equal_fail() {
        intro::assert_equal(5, 10);
    }

    #[test]
    fun test_assert_range() {
        let result = intro::assert_range(5, 0, 10);
        assert!(result == 5, 4);
    }

    #[test, expected_failure(abort_code = intro::EInvalidIndex)]
    fun test_assert_range_fail() {
        intro::assert_range(15, 0, 10);
    }

    #[test]
    fun test_safe_divide() {
        let result1 = intro::safe_divide(10, 2);
        assert!(option::is_some(&result1), 5);
        assert!(*option::borrow(&result1) == 5, 6);
        
        let result2 = intro::safe_divide(10, 0);
        assert!(option::is_none(&result2), 7);
    }

    #[test]
    fun test_safe_get() {
        let vec = vector[1, 2, 3];
        
        let result1 = intro::safe_get(&vec, 0);
        assert!(option::is_some(&result1), 8);
        assert!(*option::borrow(&result1) == 1, 9);
        
        let result2 = intro::safe_get(&vec, 10);
        assert!(option::is_none(&result2), 10);
    }

    #[test]
    fun test_find_value() {
        let vec = vector[10, 20, 30, 40];
        
        let result1 = intro::find_value(&vec, 20);
        assert!(option::is_some(&result1), 11);
        assert!(*option::borrow(&result1) == 1, 12);
        
        let result2 = intro::find_value(&vec, 100);
        assert!(option::is_none(&result2), 13);
    }

    #[test]
    fun test_divide_or_abort() {
        let result = intro::divide_or_abort(10, 2);
        assert!(result == 5, 14);
    }

    #[test, expected_failure(abort_code = intro::EZero)]
    fun test_divide_or_abort_fail() {
        intro::divide_or_abort(10, 0);
    }

    #[test]
    fun test_admin_only() {
        let admin = @0x123;
        let result = intro::admin_only(admin, 42);
        assert!(result == 42, 15);
    }

    #[test, expected_failure(abort_code = intro::EUnauthorized)]
    fun test_admin_only_fail() {
        let non_admin = @0x456;
        intro::admin_only(non_admin, 42);
    }

    #[test]
    fun test_safe_index() {
        let vec = vector[1, 2, 3];
        
        let result1 = intro::safe_index(&vec, 0);
        assert!(option::is_some(&result1), 16);
        
        let result2 = intro::safe_index(&vec, 5);
        assert!(option::is_none(&result2), 17);
    }

    #[test]
    fun test_assert_index_valid() {
        let vec = vector[1, 2, 3];
        let value = intro::assert_index_valid(&vec, 1);
        assert!(value == 2, 18);
    }

    #[test, expected_failure(abort_code = intro::EInvalidIndex)]
    fun test_assert_index_valid_fail() {
        let vec = vector[1, 2, 3];
        intro::assert_index_valid(&vec, 10);
    }

    #[test]
    fun test_safe_add() {
        let result1 = intro::safe_add(10, 20);
        assert!(option::is_some(&result1), 19);
        assert!(*option::borrow(&result1) == 30, 20);
        
        // 测试不溢出的情况
        let result2 = intro::safe_add(1, 2);
        assert!(option::is_some(&result2), 21);
    }

    #[test]
    fun test_organized_divide() {
        let result = intro::organized_divide(10, 2);
        assert!(result == 5, 22);
    }

    #[test, expected_failure(abort_code = intro::Errors::Zero)]
    fun test_organized_divide_fail() {
        intro::organized_divide(10, 0);
    }

    #[test]
    fun test_early_return() {
        let result1 = intro::early_return(42);
        assert!(option::is_some(&result1), 23);
        
        let result2 = intro::early_return(0);
        assert!(option::is_none(&result2), 24);
    }

    #[test]
    fun test_validate_and_process() {
        let result = intro::validate_and_process(5);
        assert!(result == 10, 25);  // 5 * 2 = 10
    }

    #[test, expected_failure(abort_code = intro::ENegative)]
    fun test_validate_and_process_fail() {
        intro::validate_and_process(0);
    }
}
