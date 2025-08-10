#[test_only]
module intro::intro_tests {
    use intro::intro;

    #[test]
    fun test_basic_bag_operations() {
        let mut ctx = sui::tx_context::dummy();
        let mut store = intro::create_store(&mut ctx);
        
        // 测试空 Bag
        assert!(intro::is_empty(&store) == true, 1);
        assert!(intro::get_size(&store) == 0, 2);
        
        // 添加不同类型的数据
        intro::add_string(&mut store, b"name", b"Alice");
        intro::add_number(&mut store, b"age", 25);
        
        assert!(intro::get_size(&store) == 2, 3);
        assert!(intro::is_empty(&store) == false, 4);
        
        // 验证数据
        assert!(intro::contains_key(&store, b"name") == true, 5);
        assert!(intro::contains_key(&store, b"age") == true, 6);
        assert!(intro::get_string(&store, b"name") == b"Alice", 7);
        assert!(intro::get_number(&store, b"age") == 25, 8);
        
        // 清理
        let _name: vector<u8> = intro::remove_data(&mut store, b"name");
        let _age: u64 = intro::remove_data(&mut store, b"age");
        intro::destroy_empty_store(store);
    }

    #[test]
    fun test_heterogeneous_data() {
        let mut ctx = sui::tx_context::dummy();
        let mut store = intro::create_store(&mut ctx);
        
        // 添加不同类型的数据到同一个 Bag
        intro::add_string(&mut store, b"city", b"Beijing");
        intro::add_number(&mut store, b"population", 21000000);
        
        // 创建并添加结构体
        let profile = intro::create_profile(b"Bob", 30);
        intro::add_profile(&mut store, b"user1", profile);
        
        // 验证不同类型的数据
        assert!(intro::get_string(&store, b"city") == b"Beijing", 9);
        assert!(intro::get_number(&store, b"population") == 21000000, 10);
        
        let user_profile = intro::get_profile(&store, b"user1");
        // 这里我们只验证获取成功，具体字段访问需要额外的方法
        
        assert!(intro::get_size(&store) == 3, 11);
        
        // 清理
        let _city: vector<u8> = intro::remove_data(&mut store, b"city");
        let _pop: u64 = intro::remove_data(&mut store, b"population");
        let _profile: intro::UserProfile = intro::remove_data(&mut store, b"user1");
        intro::destroy_empty_store(store);
    }
    
    #[test]
    fun test_update_operations() {
        let mut ctx = sui::tx_context::dummy();
        let mut store = intro::create_store(&mut ctx);
        
        // 添加数据
        intro::add_string(&mut store, b"status", b"active");
        
        // 更新数据
        intro::update_string(&mut store, b"status", b"inactive");
        assert!(intro::get_string(&store, b"status") == b"inactive", 12);
        
        // 清理
        let _status: vector<u8> = intro::remove_data(&mut store, b"status");
        intro::destroy_empty_store(store);
    }
    
    #[test]
    fun test_key_existence() {
        let mut ctx = sui::tx_context::dummy();
        let mut store = intro::create_store(&mut ctx);
        
        // 测试不存在的键
        assert!(intro::contains_key(&store, b"nonexistent") == false, 13);
        
        // 添加数据后测试
        intro::add_string(&mut store, b"test", b"value");
        assert!(intro::contains_key(&store, b"test") == true, 14);
        assert!(intro::contains_key(&store, b"other") == false, 15);
        
        // 清理
        let _test: vector<u8> = intro::remove_data(&mut store, b"test");
        intro::destroy_empty_store(store);
    }
    
    #[test]
    #[expected_failure]
    fun test_access_nonexistent_key() {
        let mut ctx = sui::tx_context::dummy();
        let store = intro::create_store(&mut ctx);
        
        // 尝试访问不存在的键应该失败
        intro::get_string(&store, b"nonexistent");
        
        intro::destroy_empty_store(store);
    }
}