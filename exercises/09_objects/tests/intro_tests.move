#[test_only]
module intro::intro_tests {
    use intro::intro;
    use sui::test_scenario::{Self as ts};

    #[test]
    fun test_simple_object() {
        let mut scenario = ts::begin(@0x1);
        let ctx = ts::ctx(&mut scenario);
        
        // 创建简单对象
        let mut obj = intro::create_simple_object(42, ctx);
        assert!(intro::get_simple_object_value(&obj) == 42, 1);
        
        // 更新对象
        intro::update_object(&mut obj, 100);
        assert!(intro::get_simple_object_value(&obj) == 100, 2);
        
        // 删除对象
        intro::delete_object(obj);
        
        ts::end(scenario);
    }

    #[test]
    fun test_object_transfer() {
        let mut scenario = ts::begin(@0x1);
        let ctx = ts::ctx(&mut scenario);
        
        let obj = intro::create_simple_object(50, ctx);
        let recipient = @0x2;
        
        // 转移对象
        intro::transfer_object(obj, recipient);
        
        ts::end(scenario);
    }
    
    #[test]
    fun test_shared_counter() {
        let mut scenario = ts::begin(@0x1);
        let ctx = ts::ctx(&mut scenario);
        
        // 创建共享计数器
        intro::create_shared_counter(ctx);
        
        ts::end(scenario);
    }
    
    #[test]
    fun test_frozen_config() {
        let mut scenario = ts::begin(@0x1);
        let ctx = ts::ctx(&mut scenario);
        
        let settings = b"config_data";
        intro::create_frozen_config(settings, ctx);
        
        ts::end(scenario);
    }
    
    #[test]
    fun test_wrapper_object() {
        let mut scenario = ts::begin(@0x1);
        let ctx = ts::ctx(&mut scenario);
        
        let data = intro::create_test_data();
        let wrapper = intro::wrap_object(data, ctx);
        
        // 访问包装的对象
        let inner_ref = intro::borrow_wrapped(&wrapper);
        assert!(*inner_ref == b"test_data", 3);
        
        // 解包对象
        let unwrapped = intro::unwrap_object(wrapper);
        assert!(unwrapped == b"test_data", 4);
        
        ts::end(scenario);
    }
    
    #[test]
    fun test_dynamic_fields() {
        let mut scenario = ts::begin(@0x1);
        let ctx = ts::ctx(&mut scenario);
        
        let mut container = intro::create_container(ctx);
        
        // 添加动态字段
        intro::add_dynamic_field(&mut container, b"key1", 42u64);
        intro::add_dynamic_field(&mut container, b"key2", b"value2");
        
        // 获取动态字段
        let value1 = intro::get_dynamic_field<u64>(&container, b"key1");
        assert!(value1 == 42, 5);
        
        let value2 = intro::get_dynamic_field<vector<u8>>(&container, b"key2");
        assert!(value2 == b"value2", 6);
        
        // 移除动态字段
        let removed = intro::remove_dynamic_field<u64>(&mut container, b"key1");
        assert!(removed == 42, 7);
        
        // 清理容器
        intro::delete_container(container);
        
        ts::end(scenario);
    }
}