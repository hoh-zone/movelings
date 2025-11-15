/*
这是您的第二十一个 Move 练习 - 学习错误处理最佳实践（Error Handling）！

// HINT: Move 提供了多种错误处理机制
// HINT: 使用 abort 中止执行并返回错误代码：abort error_code
// HINT: 使用 assert! 断言条件，失败时中止：assert!(condition, error_code)
// HINT: 使用常量定义错误代码：const EError: u64 = 0;
// HINT: 使用 Option 类型表示可选值
// HINT: 错误代码通常是 u64 类型
// HINT: 错误代码应该是唯一的，便于调试
// TODO: 理解 abort 和 assert! 的使用
// TODO: 学习错误代码的定义和组织
// TODO: 掌握 Option 类型在错误处理中的应用
// TODO: 了解错误处理的最佳实践
// 1. 学习 abort 的使用方法
// 2. 掌握 assert! 的使用
// 3. 理解错误代码的组织
// 4. 学习 Option 在错误处理中的应用
// 5. 了解错误处理的最佳实践
*/

/// Module: intro
module intro::intro {
    use std::option::{Self, Option};
    
    /// === 错误代码定义 ===
    
    /// 错误代码常量
    const EZero: u64 = 0;
    const ENegative: u64 = 1;
    const EOverflow: u64 = 2;
    const ENotFound: u64 = 3;
    const EUnauthorized: u64 = 4;
    const EInvalidIndex: u64 = 5;
    
    /// === 使用 abort ===
    
    /// 除法函数（除零错误）
    public fun divide(a: u64, b: u64): u64 {
        // TODO: 如果 b == 0，使用 abort EZero 中止执行；否则返回 a / b
        
        if (b == 0) {
            abort EZero
        };
        a / b
    }
    
    /// 确保正数（负数错误）
    public fun require_positive(value: u64): u64 {
        // TODO: 如果 value == 0，使用 abort ENegative；否则返回 value
        // HINT: 这里简化，将 0 视为无效值
        
        if (value == 0) {
            abort ENegative
        };
        value
    }
    
    /// === 使用 assert! ===
    
    /// 断言条件
    public fun assert_positive(value: u64): u64 {
        // TODO: 使用 assert! 断言 value > 0，失败时返回 ENegative
        
        assert!(value > 0, ENegative);
        value
    }
    
    /// 断言相等
    public fun assert_equal(a: u64, b: u64) {
        // TODO: 使用 assert! 断言 a == b，失败时返回自定义错误代码
        
        assert!(a == b, 100);
    }
    
    /// 组合多个断言
    public fun assert_range(value: u64, min: u64, max: u64): u64 {
        // TODO: 断言 value >= min && value <= max
        // HINT: 可以使用多个 assert! 语句
        
        assert!(value >= min, EInvalidIndex);
        assert!(value <= max, EInvalidIndex);
        value
    }
    
    /// === 使用 Option 进行错误处理 ===
    
    /// 安全除法（返回 Option）
    public fun safe_divide(dividend: u64, divisor: u64): Option<u64> {
        // TODO: 如果 divisor != 0，返回 Some(dividend / divisor)；否则返回 None
        
        if (divisor == 0) {
            option::none()
        } else {
            option::some(dividend / divisor)
        }
    }
    
    /// 安全获取向量元素（返回 Option）
    public fun safe_get(vec: &vector<u64>, index: u64): Option<u64> {
        // TODO: 如果 index 有效，返回 Some(value)；否则返回 None
        // HINT: 检查 index < vector::length(vec)
        
        let len = vector::length(vec);
        if (index < len) {
            let value = *vector::borrow(vec, index);
            option::some(value)
        } else {
            option::none()
        }
    }
    
    /// 查找值（返回 Option）
    public fun find_value(vec: &vector<u64>, target: u64): Option<u64> {
        // TODO: 查找 target 在向量中的索引
        // HINT: 如果找到，返回 Some(index)；否则返回 None
        
        let i = 0;
        let len = vector::length(vec);
        
        while (i < len) {
            let value = *vector::borrow(vec, i);
            if (value == target) {
                return option::some(i)
            };
            i = i + 1;
        };
        
        option::none()
    }
    
    /// === 错误处理组合 ===
    
    /// 使用 Option 或 abort
    public fun divide_or_abort(dividend: u64, divisor: u64): u64 {
        // TODO: 使用 safe_divide，如果是 None 则 abort EZero；否则提取值
        
        let result = safe_divide(dividend, divisor);
        if (option::is_some(&result)) {
            option::extract(&mut result)
        } else {
            abort EZero
        }
    }
    
    /// 权限检查
    const ADMIN: address = @0x123;
    
    /// 仅管理员可访问
    public fun admin_only(caller: address, value: u64): u64 {
        // TODO: 如果 caller != ADMIN，使用 abort EUnauthorized；否则返回 value
        
        if (caller != ADMIN) {
            abort EUnauthorized
        };
        value
    }
    
    /// === 边界检查 ===
    
    /// 安全索引访问
    public fun safe_index(vec: &vector<u64>, index: u64): Option<u64> {
        // TODO: 安全地获取向量元素
        // HINT: 检查索引是否在有效范围内
        
        let len = vector::length(vec);
        if (index < len) {
            let value = *vector::borrow(vec, index);
            option::some(value)
        } else {
            option::none()
        }
    }
    
    /// 断言索引有效
    public fun assert_index_valid(vec: &vector<u64>, index: u64): u64 {
        // TODO: 使用 assert! 断言索引有效，然后返回元素
        
        let len = vector::length(vec);
        assert!(index < len, EInvalidIndex);
        *vector::borrow(vec, index)
    }
    
    /// === 溢出检查 ===
    
    /// 安全加法（检查溢出）
    public fun safe_add(a: u64, b: u64): Option<u64> {
        // TODO: 检查加法是否溢出，如果不溢出返回 Some(a + b)；否则返回 None
        // HINT: 检查 a + b < a 或 a + b < b（溢出情况）
        // HINT: 或者检查 (a as u128) + (b as u128) > max_u64
        
        let max_u64 = 18446744073709551615u128;
        let sum = (a as u128) + (b as u128);
        if (sum > max_u64) {
            option::none()
        } else {
            option::some(a + b)
        }
    }
    
    /// === 错误代码组织 ===
    
    /// 模块错误代码组
    module Errors {
        const Zero: u64 = 0;
        const Negative: u64 = 1;
        const Overflow: u64 = 2;
    }
    
    /// 使用组织的错误代码
    public fun organized_divide(a: u64, b: u64): u64 {
        // TODO: 使用 Errors::Zero 作为错误代码
        
        if (b == 0) {
            abort Errors::Zero
        };
        a / b
    }
    
    /// === 早期返回模式 ===
    
    /// 早期返回错误
    public fun early_return(value: u64): Option<u64> {
        // TODO: 如果 value == 0，早期返回 None；否则返回 Some(value)
        // HINT: 使用 return 语句早期返回
        
        if (value == 0) {
            return option::none()
        };
        option::some(value)
    }
    
    /// === 验证和转换 ===
    
    /// 验证并转换（简化版本）
    public fun validate_and_process(value: u64): u64 {
        // TODO: 验证 value > 0，然后返回 value * 2
        
        assert!(value > 0, ENegative);
        value * 2
    }
}
