#[test_only]
module intro::intro_tests {
    use intro::intro;
    use sui::test_scenario::{Self as ts};

    #[test]
    fun test_basic_table_operations() {
        // 修复3: 正确的测试场景创建
        let mut scenario = ts::begin(@0x1);
        let ctx = ts::ctx(&mut scenario);
        
        let mut registry = intro::create_registry(ctx);
        
        // 测试空表格
        assert!(intro::is_empty(&registry) == true, 1);
        assert!(intro::get_user_count(&registry) == 0, 2);
        
        // 添加用户
        intro::add_user(&mut registry, 1, b"Alice", 25);
        assert!(intro::user_exists(&registry, 1) == true, 3);
        assert!(intro::get_user_count(&registry) == 1, 4);
        assert!(intro::is_empty(&registry) == false, 5);
        
        // 验证用户信息
        assert!(intro::get_user_name(&registry, 1) == b"Alice", 6);
        assert!(intro::get_user_age(&registry, 1) == 25, 7);
        
        // 清理
        intro::remove_user(&mut registry, 1);
        intro::destroy_empty_registry(registry);
        
        ts::end(scenario);
    }

    #[test]
    fun test_multiple_users() {
        let mut scenario = ts::begin(@0x1);
        let ctx = ts::ctx(&mut scenario);
        
        let mut registry = intro::create_registry(ctx);
        
        // 添加多个用户
        intro::add_user(&mut registry, 1, b"Alice", 25);
        intro::add_user(&mut registry, 2, b"Bob", 30);
        intro::add_user(&mut registry, 3, b"Charlie", 35);
        
        assert!(intro::get_user_count(&registry) == 3, 8);
        assert!(intro::user_exists(&registry, 1) == true, 9);
        assert!(intro::user_exists(&registry, 2) == true, 10);
        assert!(intro::user_exists(&registry, 3) == true, 11);
        assert!(intro::user_exists(&registry, 4) == false, 12);
        
        // 清理
        intro::remove_user(&mut registry, 1);
        intro::remove_user(&mut registry, 2);
        intro::remove_user(&mut registry, 3);
        intro::destroy_empty_registry(registry);
        
        ts::end(scenario);
    }
    
    #[test]
    fun test_update_operations() {
        let mut scenario = ts::begin(@0x1);
        let ctx = ts::ctx(&mut scenario);
        
        let mut registry = intro::create_registry(ctx);
        
        // 添加用户
        intro::add_user(&mut registry, 1, b"Alice", 25);
        
        // 更新年龄
        intro::update_user_age(&mut registry, 1, 26);
        assert!(intro::get_user_age(&registry, 1) == 26, 13);
        
        // 姓名应该保持不变
        assert!(intro::get_user_name(&registry, 1) == b"Alice", 14);
        
        // 清理
        intro::remove_user(&mut registry, 1);
        intro::destroy_empty_registry(registry);
        
        ts::end(scenario);
    }
    
    #[test]
    fun test_user_info_struct() {
        let _user_info = intro::create_user_info(b"Test User", 20);
        // 修复4: 使用下划线前缀避免未使用变量警告
    }
    
    #[test]
    #[expected_failure]
    fun test_access_nonexistent_user() {
        let mut scenario = ts::begin(@0x1);
        let ctx = ts::ctx(&mut scenario);
        
        let registry = intro::create_registry(ctx);
        
        // 尝试访问不存在的用户应该失败
        intro::get_user_name(&registry, 999);
        
        intro::destroy_empty_registry(registry);
        ts::end(scenario);
    }
}