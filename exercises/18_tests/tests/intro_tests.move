#[test_only]
module intro::intro_tests {
    use intro::intro;

    /// === 基本测试 ===
    
    #[test]
    fun test_add() {
        // TODO: 测试 add 函数，断言 2 + 3 == 5
        // HINT: 使用 assert! 进行断言
        
        let result = intro::add(2, 3);
        // 在此处填写代码
    }
    
    #[test]
    fun test_multiply() {
        // TODO: 测试 multiply 函数，断言 4 * 5 == 20
        
        let result = intro::multiply(4, 5);
        // 在此处填写代码
    }
    
    #[test]
    fun test_is_even() {
        // TODO: 测试 is_even 函数
        // HINT: 测试偶数和奇数的情况
        
        // 在此处填写代码
    }
    
    #[test]
    fun test_max() {
        // TODO: 测试 max 函数
        // HINT: 测试不同的组合
        
        // 在此处填写代码
    }
    
    /// === 测试结构体 ===
    
    #[test]
    fun test_create_point() {
        // TODO: 测试 create_point 函数，创建点并验证坐标
        
        let point = intro::create_point(10, 20);
        // 在此处填写代码
    }
    
    #[test]
    fun test_get_x() {
        // TODO: 测试 get_x 函数
        
        let point = intro::create_point(5, 15);
        let x = intro::get_x(&point);
        // 在此处填写代码
    }
    
    #[test]
    fun test_get_y() {
        // TODO: 测试 get_y 函数
        
        let point = intro::create_point(5, 15);
        let y = intro::get_y(&point);
        // 在此处填写代码
    }
    
    /// === 测试向量操作 ===
    
    #[test]
    fun test_create_vector() {
        // TODO: 测试 create_vector 函数
        
        let vec = intro::create_vector(vector[1, 2, 3]);
        // 在此处填写代码
    }
    
    #[test]
    fun test_add_element() {
        // TODO: 测试 add_element 函数
        
        let mut vec = intro::create_vector(vector[1, 2]);
        intro::add_element(&mut vec, 3);
        // 在此处填写代码
    }
    
    #[test]
    fun test_get_length() {
        // TODO: 测试 get_length 函数
        
        let vec = intro::create_vector(vector[1, 2, 3, 4]);
        let len = intro::get_length(&vec);
        // 在此处填写代码
    }
    
    /// === 测试多个条件 ===
    
    #[test]
    fun test_multiple_assertions() {
        // TODO: 编写包含多个断言的测试
        // HINT: 测试多个条件和边界情况
        
        let a = 10;
        let b = 20;
        
        // 在此处填写代码
    }
    
    /// === 预期失败的测试 ===
    
    #[test, expected_failure(abort_code = intro::EZero)]
    fun test_divide_by_zero() {
        // TODO: 测试除零错误，预期会中止
        // HINT: 使用 #[expected_failure] 标记
        
        intro::divide(10, 0);
    }
    
    #[test, expected_failure(abort_code = intro::ENegative)]
    fun test_assert_positive_zero() {
        // TODO: 测试断言正数函数，传入 0 应该失败
        // HINT: 使用 #[expected_failure(abort_code = intro::ENegative)]
        
        intro::assert_positive(0);
    }
    
    #[test]
    fun test_divide_success() {
        // TODO: 测试正常除法，不应该失败
        
        let result = intro::divide(10, 2);
        // 在此处填写代码
    }
    
    #[test]
    fun test_assert_positive_success() {
        // TODO: 测试正常情况，不应该失败
        
        let result = intro::assert_positive(42);
        // 在此处填写代码
    }
    
    /// === 测试辅助函数 ===
    
    /// 测试辅助函数
    #[test_only]
    fun helper_get_five(): u64 {
        // TODO: 返回数字 5
        // HINT: 这是测试辅助函数，使用 #[test_only] 标记
        
        5
    }
    
    #[test]
    fun test_with_helper() {
        // TODO: 使用辅助函数编写测试
        
        let value = helper_get_five();
        // 在此处填写代码
    }
    
    /// === 测试边界情况 ===
    
    #[test]
    fun test_edge_cases() {
        // TODO: 测试边界情况
        // HINT: 测试最小值、最大值、零值等
        
        // 在此处填写代码
    }
    
    /// === 测试所有权 ===

    #[test]
    fun test_ownership() {
        // TODO: 测试所有权转移
        // HINT: 测试值的移动和引用
        
        let vec = vector[1, 2, 3];
        let moved = intro::create_vector(vec);
        // vec 已不可用
        // 在此处填写代码
    }
    
    /// === 测试组合操作 ===
    
    #[test]
    fun test_combined_operations() {
        // TODO: 测试多个函数组合使用
        
        let point1 = intro::create_point(1, 2);
        let point2 = intro::create_point(3, 4);
        
        let sum_x = intro::add(intro::get_x(&point1), intro::get_x(&point2));
        let sum_y = intro::add(intro::get_y(&point1), intro::get_y(&point2));
        
        // 在此处填写代码
    }
}
