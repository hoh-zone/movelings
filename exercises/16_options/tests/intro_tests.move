#[test_only]
module intro::intro_tests {
    use intro::intro;

    #[test]
    fun test_create_some() {
        let some = intro::create_some(42);
        assert!(intro::is_some(&some), 1);
        assert!(intro::is_none(&some) == false, 2);
    }

    #[test]
    fun test_create_none() {
        let none = intro::create_none();
        assert!(intro::is_some(&none) == false, 3);
        assert!(intro::is_none(&none), 4);
    }

    #[test]
    fun test_is_some() {
        let some = intro::create_some(100);
        let is_some = intro::is_some(&some);
        assert!(is_some, 5);
    }

    #[test]
    fun test_is_none() {
        let none = intro::create_none();
        let is_none = intro::is_none(&none);
        assert!(is_none, 6);
    }

    #[test]
    fun test_borrow() {
        let some = intro::create_some(50);
        let value = intro::borrow(&some);
        assert!(*value == 50, 7);
    }

    #[test]
    fun test_borrow_mut() {
        let mut some = intro::create_some(10);
        let value_ref = intro::borrow_mut(&mut some);
        *value_ref = 20;
        assert!(*intro::borrow(&some) == 20, 8);
    }

    #[test]
    fun test_extract() {
        let some = intro::create_some(75);
        let value = intro::extract(some);
        assert!(value == 75, 9);
    }

    #[test]
    fun test_unwrap_or() {
        let some = intro::create_some(100);
        let value1 = intro::unwrap_or(&some, 0);
        assert!(value1 == 100, 10);
        
        let none = intro::create_none();
        let value2 = intro::unwrap_or(&none, 200);
        assert!(value2 == 200, 11);
    }

    #[test]
    fun test_fill_if_none() {
        let mut none = intro::create_none();
        intro::fill_if_none(&mut none, 42);
        assert!(intro::is_some(&none), 12);
        assert!(*intro::borrow(&none) == 42, 13);
        
        let mut some = intro::create_some(100);
        intro::fill_if_none(&mut some, 42);
        assert!(*intro::borrow(&some) == 100, 14);  // 值不变
    }

    #[test]
    fun test_update_if_some() {
        let mut some = intro::create_some(10);
        intro::update_if_some(&mut some, 20);
        assert!(*intro::borrow(&some) == 20, 15);
        
        let mut none = intro::create_none();
        intro::update_if_some(&mut none, 20);
        assert!(intro::is_none(&none), 16);  // 仍然是 None
    }

    #[test]
    fun test_swap() {
        let mut opt1 = intro::create_some(1);
        let mut opt2 = intro::create_some(2);
        intro::swap(&mut opt1, &mut opt2);
        assert!(*intro::borrow(&opt1) == 2, 17);
        assert!(*intro::borrow(&opt2) == 1, 18);
    }

    #[test]
    fun test_contains() {
        let some = intro::create_some(42);
        assert!(intro::contains(&some, 42), 19);
        assert!(intro::contains(&some, 100) == false, 20);
        
        let none = intro::create_none();
        assert!(intro::contains(&none, 42) == false, 21);
    }

    #[test]
    fun test_safe_divide() {
        let result1 = intro::safe_divide(10, 2);
        assert!(intro::is_some(&result1), 22);
        assert!(*intro::borrow(&result1) == 5, 23);
        
        let result2 = intro::safe_divide(10, 0);
        assert!(intro::is_none(&result2), 24);
    }

    #[test]
    fun test_safe_get() {
        let vec = vector[1, 2, 3];
        
        let result1 = intro::safe_get(&vec, 0);
        assert!(intro::is_some(&result1), 25);
        assert!(*intro::borrow(&result1) == 1, 26);
        
        let result2 = intro::safe_get(&vec, 5);
        assert!(intro::is_none(&result2), 27);
    }

    #[test]
    fun test_find_index() {
        let vec = vector[10, 20, 30, 40];
        
        let result1 = intro::find_index(&vec, 20);
        assert!(intro::is_some(&result1), 28);
        assert!(*intro::borrow(&result1) == 1, 29);
        
        let result2 = intro::find_index(&vec, 100);
        assert!(intro::is_none(&result2), 30);
    }

    #[test]
    fun test_to_vector() {
        let some = intro::create_some(42);
        let vec1 = intro::to_vector(some);
        assert!(vector::length(&vec1) == 1, 31);
        assert!(*vector::borrow(&vec1, 0) == 42, 32);
        
        let none = intro::create_none();
        let vec2 = intro::to_vector(none);
        assert!(vector::length(&vec2) == 0, 33);
    }

    #[test]
    fun test_from_vector() {
        let vec1 = vector[42];
        let opt1 = intro::from_vector(vec1);
        assert!(intro::is_some(&opt1), 34);
        assert!(*intro::borrow(&opt1) == 42, 35);
        
        let vec2 = vector::empty<u64>();
        let opt2 = intro::from_vector(vec2);
        assert!(intro::is_none(&opt2), 36);
    }

    #[test]
    fun test_add_options() {
        let opt1 = intro::create_some(10);
        let opt2 = intro::create_some(20);
        let result = intro::add_options(&opt1, &opt2);
        assert!(intro::is_some(&result), 37);
        assert!(*intro::borrow(&result) == 30, 38);
        
        let none = intro::create_none();
        let result2 = intro::add_options(&opt1, &none);
        assert!(intro::is_none(&result2), 39);
    }

    #[test]
    fun test_flatten() {
        let inner = intro::create_some(42);
        let outer = std::option::some(inner);
        let result = intro::flatten(outer);
        assert!(intro::is_some(&result), 40);
        assert!(*intro::borrow(&result) == 42, 41);
        
        let none_inner = intro::create_none();
        let outer2 = std::option::some(none_inner);
        let result2 = intro::flatten(outer2);
        assert!(intro::is_none(&result2), 42);
    }

    #[test]
    fun test_match_option() {
        let some = intro::create_some(42);
        let str1 = intro::match_option(some);
        assert!(str1 == b"Some", 43);
        
        let none = intro::create_none();
        let str2 = intro::match_option(none);
        assert!(str2 == b"None", 44);
    }
}
