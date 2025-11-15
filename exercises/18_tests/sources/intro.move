/*
这是您的第十九个 Move 练习 - 学习单元测试和集成测试（Tests）！

// HINT: Move 提供了内置的测试框架
// HINT: 使用 #[test_only] 标记测试模块：#[test_only] module ... { ... }
// HINT: 使用 #[test] 标记测试函数：#[test] fun test_name() { ... }
// HINT: 使用 assert! 进行断言：assert!(condition, error_code)
// HINT: 使用 #[expected_failure] 标记预期失败的测试
// HINT: 使用 #[expected_failure(abort_code = module::Error)] 指定预期的错误代码
// HINT: 测试函数名通常以 test_ 开头
// HINT: 测试模块可以使用 #[test_only] 函数辅助测试
// TODO: 理解测试模块和函数的定义
// TODO: 学习断言的使用
// TODO: 掌握预期失败的测试
// TODO: 了解测试辅助函数
// 1. 学习测试模块的定义
// 2. 掌握测试函数的编写
// 3. 理解断言的使用方法
// 4. 学习预期失败的测试
// 5. 了解测试的最佳实践
*/

/// Module: intro
module intro::intro {
    
    /// === 基本函数（用于测试） ===
    
    /// 添加两个数字
    public fun add(a: u64, b: u64): u64 {
        // TODO: 返回 a + b
        
        a + b
    }
    
    /// 乘以两个数字
    public fun multiply(a: u64, b: u64): u64 {
        // TODO: 返回 a * b
        
        a * b
    }
    
    /// 检查数字是否为偶数
    public fun is_even(num: u64): bool {
        // TODO: 返回 num % 2 == 0
        
        num % 2 == 0
    }
    
    /// 获取最大值
    public fun max(a: u64, b: u64): u64 {
        // TODO: 返回 a 和 b 中的较大值
        
        if (a > b) {
            a
        } else {
            b
        }
    }
    
    /// === 错误处理 ===
    
    /// 错误代码
    const EZero: u64 = 0;
    const ENegative: u64 = 1;
    
    /// 除法（如果除数为 0 则中止）
    public fun divide(a: u64, b: u64): u64 {
        // TODO: 如果 b == 0，中止并返回错误代码 EZero；否则返回 a / b
        
        if (b == 0) {
            abort EZero
        };
        a / b
    }
    
    /// 断言正数（如果不是正数则中止）
    public fun assert_positive(num: u64): u64 {
        // TODO: 如果 num == 0，中止并返回错误代码 ENegative；否则返回 num
        
        if (num == 0) {
            abort ENegative
        };
        num
    }
    
    /// === 结构体（用于测试） ===
    
    /// 点结构体
    public struct Point has copy, drop {
        x: u64,
        y: u64,
    }
    
    /// 创建点
    public fun create_point(x: u64, y: u64): Point {
        // TODO: 创建并返回 Point 实例
        
        Point { x, y }
    }
    
    /// 获取 x 坐标
    public fun get_x(p: &Point): u64 {
        // TODO: 返回点的 x 坐标
        
        p.x
    }
    
    /// 获取 y 坐标
    public fun get_y(p: &Point): u64 {
        // TODO: 返回点的 y 坐标
        
        p.y
    }
    
    /// === 向量操作（用于测试） ===
    
    /// 创建包含指定值的向量
    public fun create_vector(values: vector<u64>): vector<u64> {
        // TODO: 直接返回 values（移动）
        
        values
    }
    
    /// 向向量添加元素
    public fun add_element(vec: &mut vector<u64>, value: u64) {
        // TODO: 使用 vector::push_back 添加元素
        
        vector::push_back(vec, value);
    }
    
    /// 获取向量长度
    public fun get_length(vec: &vector<u64>): u64 {
        // TODO: 使用 vector::length 获取长度
        
        vector::length(vec)
    }
}
