#[test_only]
module intro::intro_tests {
    use intro::intro;

    #[test]
    fun test_basic_option_creation() {
        // 测试创建 Some 和 None
        let some_val = intro::create_some(42u64);
        let none_val = intro::create_none<u64>();
        
        assert!(intro::is_some(&some_val) == true, 1);
        assert!(intro::is_none(&none_val) == true, 2);
        assert!(intro::is_some(&none_val) == false, 3);
        assert!(intro::is_none(&some_val) == false, 4);
    }

    #[test]
    fun test_value_extraction() {
        let some_val = intro::create_some(100u64);
        
        // 测试引用访问
        assert!(*intro::get_value(&some_val) == 100, 5);
        
        // 测试提取值
        assert!(intro::extract(some_val) == 100, 6);
    }
    
    #[test]
    fun test_default_values() {
        let some_val = intro::create_some(50u64);
        let none_val = intro::create_none<u64>();
        
        // 测试带默认值的获取
        assert!(intro::get_with_default(&some_val, 0) == 50, 7);
        assert!(intro::get_with_default(&none_val, 0) == 0, 8);
    }
    
    #[test]
    fun test_option_operations() {
        let mut opt = intro::create_none<u64>();
        
        // 测试填充
        intro::fill(&mut opt, 75);
        assert!(intro::is_some(&opt) == true, 9);
        assert!(*intro::get_value(&opt) == 75, 10);
        
        // 测试提取到 None
        let extracted = intro::extract_to_none(&mut opt);
        assert!(extracted == 75, 11);
        assert!(intro::is_none(&opt) == true, 12);
    }
    
    #[test]
    fun test_conditional_creation() {
        let some_result = intro::create_if(true, 123u64);
        let none_result = intro::create_if(false, 123u64);
        
        assert!(intro::is_some(&some_result) == true, 18);
        assert!(intro::is_none(&none_result) == true, 19);
    }
    
    #[test]
    fun test_user_profile() {
        // 测试成人配置文件创建
        let adult_profile = intro::create_profile_if_adult(b"Alice", 25);
        let minor_profile = intro::create_profile_if_adult(b"Bob", 15);
        
        assert!(intro::is_some(&adult_profile) == true, 20);
        assert!(intro::is_none(&minor_profile) == true, 21);
        
        // 测试获取姓名
        let name_opt = intro::get_profile_name(&adult_profile);
        assert!(intro::is_some(&name_opt) == true, 22);
    }
    
    #[test]
    fun test_profile_updates() {
        let mut profile_opt = intro::create_profile_if_adult(b"Charlie", 20);
        
        // 更新年龄
        intro::update_profile_age(&mut profile_opt, 21);
        
        // 验证更新
        assert!(intro::is_some(&profile_opt) == true, 23);
        // 这里我们只验证操作成功，具体值验证需要额外的访问方法
    }
    
    #[test]
    fun test_wrap_value() {
        let wrapped = intro::wrap_value(999u64);
        assert!(intro::is_some(&wrapped) == true, 24);
        assert!(*intro::get_value(&wrapped) == 999, 25);
    }
    
    #[test]
    #[expected_failure]
    fun test_extract_from_none() {
        let none_val = intro::create_none<u64>();
        // 尝试从 None 中提取值应该失败
        intro::extract(none_val);
    }
}