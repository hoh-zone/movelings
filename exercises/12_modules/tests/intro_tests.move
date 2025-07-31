#[test_only]
module intro::intro_tests {
    use intro::intro;

    #[test]
    fun test_public_functions() {
        // 测试公共函数
        assert!(intro::public_add(5, 3) == 8, 1);
        
        // 测试向量操作
        let numbers = vector[1, 2, 3, 4, 5];
        assert!(intro::get_length(&numbers) == 5, 2);
        
        // 测试面积计算
        assert!(intro::calculate_area(4, 5) == 20, 3);
    }

    #[test]
    fun test_counter_operations() {
        let mut counter = intro::create_counter();
        
        // 测试初始值
        assert!(intro::get_value(&counter) == 0, 4);
        assert!(intro::is_at_max(&counter) == false, 5);
        
        // 测试增加
        intro::increment(&mut counter);
        assert!(intro::get_value(&counter) == 1, 6);
        
        // 测试包内函数
        intro::reset_counter(&mut counter);
        assert!(intro::get_value(&counter) == 0, 7);
    }
    
    #[test]
    fun test_private_functions_via_public() {
        // 通过公共函数间接测试私有函数
        let area = intro::calculate_area(6, 7);
        assert!(area == 42, 8);
    }
    
    #[test]
    fun test_package_functions() {
        // 测试包级别函数
        assert!(intro::package_only_function() == 10, 9);
    }
    
    #[test]
    fun test_constants() {
        let mut counter = intro::create_counter();
        
        // 增加计数器到最大值
        let mut i = 0;
        while (i < 1000) {
            intro::increment(&mut counter);
            i = i + 1;
        };
        
        assert!(intro::is_at_max(&counter) == true, 10);
        
        // 测试通过公共函数访问常量
        assert!(intro::get_max_value() == 1000, 11);
    }
}