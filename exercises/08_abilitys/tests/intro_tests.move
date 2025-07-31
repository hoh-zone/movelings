#[test_only]
module intro::intro_tests {
    use intro::intro;
    use sui::test_scenario;

    #[test]
    fun test_copy_ability() {
        let data = intro::create_copyable(42);
        let (copy1, copy2) = intro::duplicate_data(data);
        
        // 验证两个副本都有正确的值
        assert!(copy1.value == 42, 1);
        assert!(copy2.value == 42, 2);
    }

    #[test]
    fun test_drop_ability() {
        // 测试使用数据
        let data = intro::create_droppable(b"test");
        let info = intro::maybe_use_data(data, true);
        assert!(info == b"test", 3);
        
        // 测试丢弃数据
        let data2 = intro::create_droppable(b"drop me");
        let empty = intro::maybe_use_data(data2, false);
        assert!(vector::is_empty(&empty), 4);
    }
    
    #[test]
    fun test_store_ability() {
        let mut container = intro::create_container();
        assert!(intro::get_item_count(&container) == 0, 5);
        
        let item1 = intro::create_item(1, b"item1");
        let item2 = intro::create_item(2, b"item2");
        
        intro::add_item(&mut container, item1);
        intro::add_item(&mut container, item2);
        
        assert!(intro::get_item_count(&container) == 2, 6);
    }
    
    #[test]
    fun test_key_ability() {
        let mut scenario = test_scenario::begin(@0x1);
        let ctx = test_scenario::ctx(&mut scenario);
        
        let mut obj = intro::create_object(ctx);
        intro::update_object(&mut obj, 100);
        
        let data = intro::delete_object(obj);
        assert!(data == 100, 7);
        
        test_scenario::end(scenario);
    }
    
    #[test]
    fun test_no_abilities() {
        let secret = intro::create_secret(123);
        let revealed = intro::reveal_secret(secret);
        assert!(revealed == 123, 8);
    }
    
    #[test]
    fun test_ability_constraints() {
        let copyable = intro::create_copyable(50);
        let (item1, item2) = intro::copy_if_copyable(copyable);
        assert!(item1.value == 50, 9);
        assert!(item2.value == 50, 10);
        
        let storable = intro::create_item(1, b"test");
        let vec = intro::store_if_storable(storable);
        assert!(vector::length(&vec) == 1, 11);
    }
}