#[test_only]
module intro::intro_tests {
    use intro::intro;

    #[test]
    fun test_move_value() {
        let vec = vector[1, 2, 3];
        let moved = intro::move_value(vec);
        // vec 已不可用
        assert!(vector::length(&moved) == 3, 1);
    }

    #[test]
    fun test_cannot_use_after_move() {
        let vec = vector[1, 2, 3];
        let len = intro::cannot_use_after_move(vec);
        assert!(len == 3, 2);
    }

    #[test]
    fun test_copy_number() {
        let x = 42u64;
        let (y, z) = intro::copy_number(x);
        assert!(y == 42, 3);
        assert!(z == 42, 4);
        assert!(x == 42, 5);  // x 仍然可用
    }

    #[test]
    fun test_use_number_multiple_times() {
        let result = intro::use_number_multiple_times(5);
        assert!(result == 15, 6);  // 5 * 2 + 5 = 15
    }

    #[test]
    fun test_move_vector() {
        let vec = vector[1, 2, 3];
        let moved = intro::move_vector(vec);
        // vec 已不可用
        assert!(vector::length(&moved) == 3, 7);
    }

    #[test]
    fun test_consume_vector() {
        let vec = vector[1, 2, 3, 4];
        let len = intro::consume_vector(vec);
        assert!(len == 4, 8);
        // vec 已被销毁
    }

    #[test]
    fun test_borrow_immutable() {
        let vec = vector[1, 2, 3];
        let len = intro::borrow_immutable(&vec);
        assert!(len == 3, 9);
        assert!(vector::length(&vec) == 3, 10);  // vec 仍然可用
    }

    #[test]
    fun test_borrow_mutable() {
        let mut vec = vector[1, 2];
        intro::borrow_mutable(&mut vec, 3);
        assert!(vector::length(&vec) == 3, 11);
        assert!(*vector::borrow(&vec, 2) == 3, 12);
    }

    #[test]
    fun test_use_value_and_reference() {
        let vec = vector[1, 2];
        let (original_len, new_vec) = intro::use_value_and_reference(vec);
        assert!(original_len == 2, 13);
        assert!(vector::length(&new_vec) == 3, 14);
        assert!(*vector::borrow(&new_vec, 2) == 100, 15);
    }

    #[test]
    fun test_multiple_immutable_refs() {
        let vec = vector[1, 2, 3, 4];
        let (len1, len2) = intro::multiple_immutable_refs(&vec);
        assert!(len1 == 4, 16);
        assert!(len2 == 4, 17);
    }

    #[test]
    fun test_conflicting_refs() {
        let vec = vector[1, 2];
        let len = intro::conflicting_refs(vec);
        assert!(len == 2, 18);
    }

    #[test]
    fun test_reference_lifetime() {
        let vec = vector[1, 2, 3];
        let len = intro::reference_lifetime(vec);
        assert!(len == 3, 19);
    }

    #[test]
    fun test_value_destruction() {
        intro::value_destruction();
        // 测试值被正确销毁
    }

    #[test]
    fun test_create_resource() {
        let r = intro::create_resource(42);
        let value = intro::destroy_resource(r);
        assert!(value == 42, 20);
    }

    #[test]
    fun test_destroy_resource() {
        let r = intro::create_resource(100);
        let value = intro::destroy_resource(r);
        assert!(value == 100, 21);
    }

    #[test]
    fun test_conditional_move() {
        let vec1 = vector[1, 2, 3];
        let vec2 = vector[4, 5, 6];
        
        let result1 = intro::conditional_move(vec1, true);
        let result2 = intro::conditional_move(vec2, false);
        
        assert!(vector::length(&result1) == 3, 22);
        assert!(vector::length(&result2) == 0, 23);
    }

    #[test]
    fun test_destructure_vector() {
        let empty_vec = vector::empty<u64>();
        let (first1, rest1) = intro::destructure_vector(empty_vec);
        assert!(first1 == 0, 24);
        assert!(vector::length(&rest1) == 0, 25);
        
        let vec = vector[10, 20, 30];
        let (first2, rest2) = intro::destructure_vector(vec);
        assert!(first2 == 10, 26);
        assert!(vector::length(&rest2) == 2, 27);
        assert!(*vector::borrow(&rest2, 0) == 20, 28);
    }

    #[test]
    fun test_rebuild_vector() {
        let vec = vector[1, 2, 3];
        let result = intro::rebuild_vector(vec, 4);
        assert!(vector::length(&result) == 4, 29);
        assert!(*vector::borrow(&result, 3) == 4, 30);
    }

    #[test]
    fun test_take_ownership() {
        let vec = vector[1, 2, 3];
        intro::take_ownership(vec);
        // vec 已被销毁
    }

    #[test]
    fun test_return_ownership() {
        let vec = intro::return_ownership();
        assert!(vector::length(&vec) == 3, 31);
    }

    #[test]
    fun test_invalid_reference() {
        let len = intro::invalid_reference();
        assert!(len == 3, 32);
    }

    #[test]
    fun test_transfer_ownership() {
        let mut vec = vector[1, 2];
        let new_vec = intro::transfer_ownership(vec);
        assert!(vector::length(&new_vec) == 3, 33);
        assert!(*vector::borrow(&new_vec, 2) == 100, 34);
    }

    #[test]
    fun test_modify_by_reference() {
        let mut vec = vector[1, 2];
        intro::modify_by_reference(&mut vec, 3);
        assert!(vector::length(&vec) == 3, 35);
        assert!(*vector::borrow(&vec, 2) == 3, 36);
    }
}
