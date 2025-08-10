#[test_only]
module intro::intro_tests {
    use intro::intro;

    #[test]
    fun test_simple_colors() {
        let red = intro::create_red();
        
        // 测试颜色检查
        assert!(intro::is_red(&red) == true, 1);
        assert!(intro::color_name(&red) == b"red", 2);
        
        // 测试颜色转换
        assert!(intro::color_to_number(&red) == 1, 3);
        
        // 测试从数字创建颜色
        let blue_opt = intro::number_to_color(3);
        assert!(intro::is_some(&blue_opt) == true, 4);
    }

    #[test]
    fun test_shapes_with_data() {
        let circle = intro::create_circle(5);
        let rectangle = intro::create_rectangle(4, 6);
        
        // 测试面积计算
        assert!(intro::calculate_area(&circle) == 75, 5);  // 3 * 5 * 5
        assert!(intro::calculate_area(&rectangle) == 24, 6);  // 4 * 6
        
        // 测试形状类型
        assert!(intro::shape_type(&circle) == b"circle", 7);
        assert!(intro::shape_type(&rectangle) == b"rectangle", 8);
        
        // 测试形状类型比较
        let another_circle = intro::create_circle(10);
        assert!(intro::same_shape_type(&circle, &another_circle) == true, 9);
        assert!(intro::same_shape_type(&circle, &rectangle) == false, 10);
    }
    
    #[test]
    fun test_option_enum() {
        // 测试 Some 变体
        let some_value = intro::create_some(42u64);
        assert!(intro::is_some(&some_value) == true, 11);
        assert!(intro::get_value(&some_value) == 42, 12);
        
        // 测试 None 变体
        let none_value = intro::create_none<u64>();
        assert!(intro::is_some(&none_value) == false, 13);
    }
    
    #[test]
    fun test_result_enum() {
        // 测试成功结果
        let ok_result = intro::create_ok<u64, vector<u8>>(100);
        assert!(intro::is_ok(&ok_result) == true, 14);
        
        let ok_value = intro::get_ok_value(&ok_result);
        assert!(intro::is_some(&ok_value) == true, 15);
        
        // 测试错误结果
        let err_result = intro::create_error<u64, vector<u8>>(b"error");
        assert!(intro::is_ok(&err_result) == false, 16);
        
        let err_value = intro::get_ok_value(&err_result);
        assert!(intro::is_some(&err_value) == false, 17);
    }
    
    #[test]
    fun test_enum_comparisons() {
        let red1 = intro::create_red();
        let red2 = intro::create_red();
        
        // 测试颜色比较
        assert!(intro::colors_equal(&red1, &red2) == true, 18);
        
        // 测试无效数字转换
        let invalid_color = intro::number_to_color(99);
        assert!(intro::is_some(&invalid_color) == false, 19);
    }
    
    #[test, expected_failure(abort_code = 1)]
    fun test_get_value_from_none() {
        let none_value = intro::create_none<u64>();
        intro::get_value(&none_value);  // 应该触发 abort
    }
}