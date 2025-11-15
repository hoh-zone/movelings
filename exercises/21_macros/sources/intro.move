/*
这是您的第二十二个 Move 练习 - 学习代码生成和减少重复（Macros）！

// HINT: Move 没有宏系统，但可以使用其他方式减少代码重复
// HINT: 使用泛型函数减少重复代码
// HINT: 使用辅助函数封装重复逻辑
// HINT: 使用代码模板（通过脚本生成）
// HINT: 充分利用标准库提供的通用函数
// HINT: 创建通用的验证函数
// HINT: 使用通用的初始化函数
// TODO: 理解 Move 中没有宏系统
// TODO: 学习使用泛型减少代码重复
// TODO: 掌握辅助函数的使用
// TODO: 了解代码生成的最佳实践
// 1. 理解 Move 宏系统的局限性
// 2. 学习使用泛型减少重复
// 3. 掌握辅助函数的创建
// 4. 学习通用验证函数
// 5. 了解代码生成的最佳实践
*/

/// Module: intro
module intro::intro {
    use std::option::{Self, Option};
    
    /// === 通用验证函数 ===
    
    /// 验证正数（通用错误代码）
    public fun validate_positive(value: u64, error_code: u64): u64 {
        // TODO: 使用 assert! 验证 value > 0，使用 error_code 作为错误代码
        
        assert!(value > 0, error_code);
        value
    }
    
    /// 验证范围（通用错误代码）
    public fun validate_range(value: u64, min: u64, max: u64, error_code: u64): u64 {
        // TODO: 使用 assert! 验证 value >= min && value <= max
        
        assert!(value >= min, error_code);
        assert!(value <= max, error_code);
        value
    }
    
    /// === 通用初始化函数 ===
    
    /// 配置结构体
    struct Config has copy, drop {
        max_size: u64,
        min_size: u64,
        enabled: bool,
    }
    
    /// 创建默认配置
    public fun create_default_config(): Config {
        // TODO: 创建并返回默认配置
        // HINT: max_size: 1000, min_size: 10, enabled: true
        
        Config {
            max_size: 1000,
            min_size: 10,
            enabled: true,
        }
    }
    
    /// 创建自定义配置
    public fun create_config(max_size: u64, min_size: u64, enabled: bool): Config {
        // TODO: 创建并返回自定义配置
        
        Config {
            max_size,
            min_size,
            enabled,
        }
    }
    
    /// === 泛型辅助函数 ===
    
    /// 获取向量的第一个元素（如果存在）
    public fun first<T>(vec: &vector<T>): Option<T> {
        // TODO: 如果向量非空，返回 Some(第一个元素)；否则返回 None
        // HINT: 使用泛型 T，检查向量长度
        
        let len = vector::length(vec);
        if (len > 0) {
            let value = *vector::borrow(vec, 0);
            option::some(value)
        } else {
            option::none()
        }
    }
    
    /// 获取向量的最后一个元素（如果存在）
    public fun last<T>(vec: &vector<T>): Option<T> {
        // TODO: 如果向量非空，返回 Some(最后一个元素)；否则返回 None
        
        let len = vector::length(vec);
        if (len > 0) {
            let last_idx = len - 1;
            let value = *vector::borrow(vec, last_idx);
            option::some(value)
        } else {
            option::none()
        }
    }
    
    /// === 通用操作函数 ===
    
    /// 映射向量元素（泛型）
    public fun map_values(vec: vector<u64>): vector<u64> {
        // TODO: 将向量中的每个元素乘以 2
        // HINT: 遍历向量，对每个元素乘以 2
        
        let mut result = vector::empty<u64>();
        let i = 0;
        let len = vector::length(&vec);
        
        while (i < len) {
            let value = *vector::borrow(&vec, i);
            vector::push_back(&mut result, value * 2);
            i = i + 1;
        };
        
        result
    }
    
    /// 过滤向量元素
    public fun filter_positive(vec: vector<u64>): vector<u64> {
        // TODO: 过滤出大于 0 的元素
        // HINT: 遍历向量，只添加满足条件的元素
        
        let mut result = vector::empty<u64>();
        let i = 0;
        let len = vector::length(&vec);
        
        while (i < len) {
            let value = *vector::borrow(&vec, i);
            if (value > 0) {
                vector::push_back(&mut result, value);
            };
            i = i + 1;
        };
        
        result
    }
    
    /// === 通用创建函数 ===
    
    /// 创建点结构体
    struct Point has copy, drop {
        x: u64,
        y: u64,
    }
    
    /// 创建原点
    public fun create_origin(): Point {
        // TODO: 创建并返回原点 (0, 0)
        
        Point { x: 0, y: 0 }
    }
    
    /// 创建点（通用函数）
    public fun create_point(x: u64, y: u64): Point {
        // TODO: 创建并返回点 (x, y)
        
        Point { x, y }
    }
    
    /// === 通用错误处理 ===
    
    /// 错误代码
    const EInvalid: u64 = 0;
    const EOutOfRange: u64 = 1;
    
    /// 安全除法（带错误代码）
    public fun safe_divide_with_code(dividend: u64, divisor: u64, error_code: u64): Option<u64> {
        // TODO: 如果 divisor != 0，返回 Some(dividend / divisor)；否则返回 None
        // HINT: 使用通用的错误处理模式
        
        if (divisor == 0) {
            option::none()
        } else {
            option::some(dividend / divisor)
        }
    }
    
    /// 断言并返回
    public fun assert_and_return<T: copy>(value: T, condition: bool, error_code: u64): T {
        // TODO: 如果 condition 为 true，返回 value；否则 abort error_code
        
        assert!(condition, error_code);
        value
    }
    
    /// === 通用辅助函数 ===
    
    /// 交换两个值（泛型）
    public fun swap_values<T: copy + drop>(x: T, y: T): (T, T) {
        // TODO: 返回 (y, x)，交换两个值
        
        (y, x)
    }
    
    /// 复制值（泛型）
    public fun duplicate_value<T: copy + drop>(item: T): (T, T) {
        // TODO: 返回 (item, item)，复制值
        
        (item, item)
    }
    
    /// === 通用查询函数 ===
    
    /// 查找值的索引（如果存在）
    public fun find_index(vec: &vector<u64>, target: u64): Option<u64> {
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
    
    /// 检查向量是否包含值
    public fun contains_value(vec: &vector<u64>, target: u64): bool {
        // TODO: 检查向量是否包含 target
        // HINT: 可以使用 find_index 并检查结果
        
        let result = find_index(vec, target);
        option::is_some(&result)
    }
    
    /// === 通用组合函数 ===
    
    /// 组合两个向量的元素
    public fun combine_vectors(vec1: vector<u64>, vec2: vector<u64>): vector<u64> {
        // TODO: 将 vec2 的元素追加到 vec1
        // HINT: 使用 vector::append
        
        let mut result = vec1;
        vector::append(&mut result, vec2);
        result
    }
    
    /// 获取向量的切片（前 n 个元素）
    public fun take_n(vec: vector<u64>, n: u64): vector<u64> {
        // TODO: 返回向量的前 n 个元素
        // HINT: 遍历前 n 个元素并添加到新向量
        
        let mut result = vector::empty<u64>();
        let len = vector::length(&vec);
        let count = if (n < len) { n } else { len };
        let i = 0;
        
        while (i < count) {
            let value = *vector::borrow(&vec, i);
            vector::push_back(&mut result, value);
            i = i + 1;
        };
        
        result
    }
}
