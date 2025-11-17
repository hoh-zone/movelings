#[test_only]
module intro::intro_tests {
    use intro::intro;

    #[test]
    fun test_validate_positive() {
        let result = intro::validate_positive!(42, 0);
        assert!(result == 42, 1);
    }

    #[test, expected_failure(abort_code = 0)]
    fun test_validate_positive_fail() {
        intro::validate_positive!(0, 0);
    }

    #[test]
    fun test_assert_eq() {
        intro::assert_eq!(5, 5, 0);
    }

    #[test, expected_failure(abort_code = 1)]
    fun test_assert_eq_fail() {
        intro::assert_eq!(5, 6, 1);
    }

    #[test]
    fun test_map() {
        let vec = vector[1, 2, 3];
        let doubled: vector<u64> = intro::map!(vec, |x| 2 * x);
        assert!(doubled.length() == 3, 2);
        assert!(doubled[0] == 2, 3);
        assert!(doubled[1] == 4, 4);
        assert!(doubled[2] == 6, 5);
    }

    #[test]
    fun test_for_imm() {
        let vec = vector[1, 2, 3];
        let mut sum = 0;
        intro::for_imm!(&vec, |x| {
            sum = sum + *x;
        });
        assert!(sum == 6, 6);
    }

    #[test]
    fun test_for_mut() {
        let mut vec = vector[1, 2, 3];
        intro::for_mut!(&mut vec, |x| {
            *x = *x * 2;
        });
        assert!(vec[0] == 2, 7);
        assert!(vec[1] == 4, 8);
        assert!(vec[2] == 6, 9);
    }

    #[test]
    fun test_inspect() {
        let opt = option::some(42);
        let mut value = 0;
        intro::inspect!(&opt, |x| {
            value = *x;
        });
        assert!(value == 42, 10);
        
        let none = option::none<u64>();
        let mut called = false;
        intro::inspect!(&none, |_x| {
            called = true;
        });
        assert!(called == false, 11);
    }

    #[test]
    fun test_is_some_and() {
        let opt = option::some(42);
        let is_zero = intro::is_some_and!(&opt, |x| *x == 0);
        assert!(is_zero == false, 12);
        
        let is_forty_two = intro::is_some_and!(&opt, |x| *x == 42);
        assert!(is_forty_two, 13);
        
        let none = option::none<u64>();
        let result = intro::is_some_and!(&none, |_x| true);
        assert!(result == false, 14);
    }

    #[test]
    fun test_add() {
        let result1 = intro::add!(10u64, 20u64);
        assert!(result1 == 30, 15);
        
        let result2 = intro::add!(5u8, 3u8);
        assert!(result2 == 8, 16);
    }

    #[test]
    fun test_swap() {
        let (a, b): (u64, u64) = intro::swap!(1, 2);
        assert!(a == 2, 17);
        assert!(b == 1, 18);
    }

    #[test]
    fun test_when() {
        let mut executed = false;
        intro::when!(true, || {
            executed = true;
        });
        assert!(executed, 19);
        
        let mut not_executed = false;
        intro::when!(false, || {
            not_executed = true;
        });
        assert!(not_executed == false, 20);
    }

    #[test]
    fun test_repeat() {
        let mut count = 0;
        intro::repeat!(5, || {
            count = count + 1;
        });
        assert!(count == 5, 21);
    }
}
