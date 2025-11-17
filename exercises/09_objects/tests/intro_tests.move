#[test_only]
module intro::intro_tests {
    use intro::intro;

    #[test]
    fun test_create_object() {
        let mut ctx = sui::tx_context::dummy();
        let obj = intro::create_object(42, &mut ctx);
        assert!(intro::get_value(&obj) == 42, 1);
        intro::destroy_my_object(obj);
    }

    #[test]
    fun test_get_value() {
        let mut ctx = sui::tx_context::dummy();
        let obj = intro::create_object(100, &mut ctx);
        let value = intro::get_value(&obj);
        assert!(value == 100, 2);
        intro::destroy_my_object(obj);
    }

    #[test]
    fun test_set_value() {
        let mut ctx = sui::tx_context::dummy();
        let mut obj = intro::create_object(50, &mut ctx);
        intro::set_value(&mut obj, 75);
        assert!(intro::get_value(&obj) == 75, 3);
        intro::destroy_my_object(obj);
    }

    #[test]
    fun test_transfer_to_sender() {
        let mut ctx = sui::tx_context::dummy();
        let obj = intro::create_object(42, &mut ctx);
        let _sender = sui::tx_context::sender(&ctx);
        intro::transfer_to_sender(obj, &mut ctx);
        // 对象已转移给发送者
    }

    #[test]
    fun test_increment_value() {
        let mut ctx = sui::tx_context::dummy();
        let mut obj = intro::create_object(10, &mut ctx);
        intro::increment_value(&mut obj, 5);
        assert!(intro::get_value(&obj) == 15, 4);
        intro::destroy_my_object(obj);
    }

    #[test]
    fun test_decrement_value() {
        let mut ctx = sui::tx_context::dummy();
        let mut obj = intro::create_object(10, &mut ctx);
        intro::decrement_value(&mut obj, 3);
        assert!(intro::get_value(&obj) == 7, 5);
        intro::destroy_my_object(obj);
    }

    #[test]
    fun test_decrement_value_underflow() {
        let mut ctx = sui::tx_context::dummy();
        let mut obj = intro::create_object(5, &mut ctx);
        intro::decrement_value(&mut obj, 10);  // 会设为 0
        assert!(intro::get_value(&obj) == 0, 6);
        intro::destroy_my_object(obj);
    }

    #[test]
    fun test_get_id() {
        let mut ctx = sui::tx_context::dummy();
        let obj = intro::create_object(42, &mut ctx);
        let _id = intro::get_id(&obj);
        // 测试获取 ID
        intro::destroy_my_object(obj);
    }

    #[test]
    fun test_create_complex_object() {
        let mut ctx = sui::tx_context::dummy();
        let name = b"test";
        let obj = intro::create_complex_object(10, name, true, &mut ctx);
        assert!(intro::get_counter(&obj) == 10, 7);
        assert!(intro::is_enabled(&obj) == true, 8);
        intro::destroy_complex_object(obj);
    }

    #[test]
    fun test_get_counter() {
        let mut ctx = sui::tx_context::dummy();
        let obj = intro::create_complex_object(20, b"test", false, &mut ctx);
        let counter = intro::get_counter(&obj);
        assert!(counter == 20, 9);
        intro::destroy_complex_object(obj);
    }

    #[test]
    fun test_get_name() {
        let mut ctx = sui::tx_context::dummy();
        let name = b"myname";
        let obj = intro::create_complex_object(0, name, true, &mut ctx);
        let retrieved_name = intro::get_name(&obj);
        assert!(retrieved_name == name, 10);
        intro::destroy_complex_object(obj);
    }

    #[test]
    fun test_is_enabled() {
        let mut ctx = sui::tx_context::dummy();
        let obj = intro::create_complex_object(0, b"test", true, &mut ctx);
        assert!(intro::is_enabled(&obj) == true, 11);
        intro::destroy_complex_object(obj);
    }

    #[test]
    fun test_increment_counter() {
        let mut ctx = sui::tx_context::dummy();
        let mut obj = intro::create_complex_object(5, b"test", true, &mut ctx);
        intro::increment_counter(&mut obj);
        assert!(intro::get_counter(&obj) == 6, 12);
        intro::destroy_complex_object(obj);
    }

    #[test]
    fun test_toggle_enabled() {
        let mut ctx = sui::tx_context::dummy();
        let mut obj = intro::create_complex_object(0, b"test", true, &mut ctx);
        intro::toggle_enabled(&mut obj);
        assert!(intro::is_enabled(&obj) == false, 13);
        intro::toggle_enabled(&mut obj);
        assert!(intro::is_enabled(&obj) == true, 14);
        intro::destroy_complex_object(obj);
    }

    #[test]
    fun test_compare_ids() {
        let mut ctx = sui::tx_context::dummy();
        let obj1 = intro::create_object(42, &mut ctx);
        let obj2 = intro::create_object(42, &mut ctx);
        
        // 不同的对象应该有不同的 ID
        let are_same = intro::compare_ids(&obj1, &obj2);
        assert!(are_same == false, 15);
        
        // 相同的对象应该有相同的 ID
        let are_same_self = intro::compare_ids(&obj1, &obj1);
        assert!(are_same_self == true, 16);
        
        intro::destroy_my_object(obj1);
        intro::destroy_my_object(obj2);
    }

    #[test]
    fun test_delete_object() {
        let mut ctx = sui::tx_context::dummy();
        let obj = intro::create_object(100, &mut ctx);
        let value = intro::delete_object(obj);
        assert!(value == 100, 17);
        // 对象已被删除
    }
}
