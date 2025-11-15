#[test_only]
module intro::intro_tests {
    use intro::intro;
    use intro::friend_module;
    use intro::other_module;

    #[test]
    fun test_add() {
        let result = intro::add(2, 3);
        assert!(result == 5, 1);
    }

    #[test]
    fun test_create_point() {
        let point = intro::create_point(10, 20);
        assert!(point.x == 10, 2);
        assert!(point.y == 20, 3);
    }

    #[test]
    fun test_create_vector() {
        let vec = intro::create_vector();
        assert!(vector::length(&vec) == 0, 4);
    }

    #[test]
    fun test_create_vector_with_values() {
        let vec = intro::create_vector_with_values();
        assert!(vector::length(&vec) == 3, 5);
        assert!(*vector::borrow(&vec, 0) == 1, 6);
    }

    #[test]
    fun test_create_some() {
        let some = intro::create_some(42);
        use std::option;
        assert!(option::is_some(&some), 7);
    }

    #[test]
    fun test_create_none() {
        let none = intro::create_none();
        use std::option;
        assert!(option::is_none(&none), 8);
    }

    #[test]
    fun test_create_string() {
        let s = intro::create_string();
        use std::string;
        assert!(string::equals(&s, &string::utf8(b"Hello")), 9);
    }

    #[test]
    fun test_use_private_function() {
        let result = intro::use_private_function(5, 6);
        assert!(result == 30, 10);  // 5 * 6 = 30
    }

    #[test]
    fun test_calculate() {
        let result = intro::calculate(2, 3, 4);
        assert!(result == 20, 11);  // (2 + 3) * 4 = 20
    }

    #[test]
    fun test_get_max_value() {
        let max = intro::get_max_value();
        assert!(max == 1000, 12);
    }

    #[test]
    fun test_is_in_range() {
        assert!(intro::is_in_range(500), 13);
        assert!(intro::is_in_range(0), 14);
        assert!(intro::is_in_range(1000), 15);
        assert!(intro::is_in_range(1001) == false, 16);
    }

    #[test]
    fun test_friend_module() {
        let result = friend_module::call_friend_function(10);
        assert!(result == 20, 17);  // 10 * 2 = 20
    }

    #[test]
    fun test_friend_module_use_public() {
        let result = friend_module::use_public_function(3, 4);
        assert!(result == 7, 18);
    }

    #[test]
    fun test_friend_module_create_point() {
        let point = friend_module::create_point(15, 25);
        assert!(point.x == 15, 19);
        assert!(point.y == 25, 20);
    }

    #[test]
    fun test_other_module_use_public() {
        let result = other_module::use_public_function(5, 6);
        assert!(result == 11, 21);
    }

    #[test]
    fun test_other_module_use_public_struct() {
        let point = other_module::use_public_struct();
        assert!(point.x == 10, 22);
        assert!(point.y == 20, 23);
    }
}
