/*
这是您的第十七个 Move 练习 - 学习可选类型和错误处理（Options）！

// HINT: Option 类型用于表示一个值可能存在也可能不存在
// HINT: 使用 std::option 模块：use std::option::{Self, Option};
// HINT: option::some(value) 创建 Some 值
// HINT: option::none() 创建 None 值
// HINT: option::is_some(opt) 检查是否为 Some
// HINT: option::is_none(opt) 检查是否为 None
// HINT: option::borrow(opt) 获取值的不可变引用（必须是 Some）
// HINT: option::borrow_mut(opt) 获取值的可变引用（必须是 Some）
// HINT: option::extract(opt) 提取值（必须是 Some，会消耗 Option）
// HINT: option::fill(ref, value) 将 None 填充为 Some
// HINT: 向量操作应使用索引语法 vec[i] 而不是 vector::borrow(&vec, i)（Move 2024）
// TODO: 理解 Option 类型的含义和使用场景
// TODO: 学习 Some 和 None 的创建和使用
// TODO: 掌握 Option 的模式匹配和操作
// TODO: 了解 Option 在错误处理中的应用
// 1. 学习 Option 类型的创建
// 2. 掌握 Option 的检查和提取
// 3. 理解 Option 的模式匹配
// 4. 学习 Option 的常用操作
// 5. 了解 Option 与错误处理的关系
*/

/// Module: intro
module intro::intro {
    /// === Option 的创建 ===
    
    /// 创建 Some 值
    public fun create_some(value: u64): Option<u64> {
        // TODO: 使用 option::some 创建 Some 值
        // 在此处填写代码
    }
    
    /// 创建 None 值
    public fun create_none(): Option<u64> {
        // TODO: 使用 option::none 创建 None 值
        // 在此处填写代码
    }
    
    /// === Option 的检查 ===
    
    /// 检查是否为 Some
    public fun is_some(opt: &Option<u64>): bool {
        // TODO: 使用 option::is_some 检查是否为 Some
        // 在此处填写代码
    }
    
    /// 检查是否为 None
    public fun is_none(opt: &Option<u64>): bool {
        // TODO: 使用 option::is_none 检查是否为 None
        // 在此处填写代码
    }
    
    /// === Option 的值提取 ===
    
    /// 获取值的引用（必须是 Some）
    public fun borrow(opt: &Option<u64>): &u64 {
        // TODO: 使用 option::borrow 获取值的不可变引用
        // 在此处填写代码
    }
    
    /// 获取值的可变引用（必须是 Some）
    public fun borrow_mut(opt: &mut Option<u64>): &mut u64 {
        // TODO: 使用 option::borrow_mut 获取值的可变引用
        // 在此处填写代码
    }
    
    /// 提取值（必须是 Some，会消耗 Option）
    public fun extract(mut opt: Option<u64>): u64 {
        // TODO: 使用 option::extract 提取值
        // HINT: 这会消耗 Option，返回其中的值
        // 在此处填写代码
    }
    
    /// === Option 的实用操作 ===
    
    /// 获取值或返回默认值
    public fun unwrap_or(opt: &Option<u64>, default: u64): u64 {
        // TODO: 如果是 Some，返回其中的值；否则返回 default
        // HINT: 使用 option::is_some 检查，然后使用 option::borrow 获取值
        // 在此处填写代码
    }
    
    /// 如果为 None，则填充为 Some
    public fun fill_if_none(opt: &mut Option<u64>, value: u64) {
        // TODO: 如果 opt 是 None，则填充为 Some(value)
        // HINT: 使用 option::fill 填充
        // 在此处填写代码
    }
    
    /// 如果为 Some，则更新值
    public fun update_if_some(opt: &mut Option<u64>, new_value: u64) {
        // TODO: 如果 opt 是 Some，则更新其值
        // HINT: 使用 option::borrow_mut 获取可变引用
        // 在此处填写代码
    }
    
    /// 交换两个 Option
    public fun swap(opt1: &mut option::Option<u64>, opt2: &mut option::Option<u64>) {
        // TODO: 交换两个 Option<u64> 的内容
        // HINT: 使用 option::extract 和 option::fill 进行交换
        // 在此处填写代码
    }
    
    /// 检查 Option 是否包含特定值
    public fun contains(opt: &Option<u64>, value: u64): bool {
        // TODO: 使用 option::contains 检查是否包含特定值
        // 在此处填写代码
    }
    
    /// === Option 与错误处理 ===
    
    /// 安全除法（返回 Option）
    public fun safe_divide(dividend: u64, divisor: u64): Option<u64> {
        // TODO: 如果 divisor 不为 0，返回 Some(dividend / divisor)；否则返回 None
        // 在此处填写代码
    }
    
    /// 安全访问向量元素（返回 Option）
    public fun safe_get(vec: &vector<u64>, index: u64): Option<u64> {
        // TODO: 如果 index 有效，返回 Some(value)；否则返回 None
        // HINT: 检查 index < vector::length(vec)
        // HINT: 使用索引语法 vec[index] 访问元素（Move 2024）
        // 在此处填写代码
    }
    
    /// 查找向量中的值（返回索引的 Option）
    public fun find_index(vec: &vector<u64>, target: u64): Option<u64> {
        // TODO: 查找 target 在向量中的索引
        // HINT: 如果找到，返回 Some(index)；否则返回 None
        // HINT: 使用 while 循环遍历向量
        // HINT: 使用索引语法 vec[i] 访问元素（Move 2024）
        // 在此处填写代码
    }
    
    /// === Option 的转换 ===
    
    /// 将 Option 转换为向量
    public fun to_vector(opt: Option<u64>): vector<u64> {
        // TODO: 如果是 Some，返回包含一个元素的向量；否则返回空向量
        // HINT: 使用 option::to_vec 转换
        // 在此处填写代码
    }
    
    /// 从向量创建 Option
    public fun from_vector(vec: vector<u64>): Option<u64> {
        // TODO: 如果向量非空，返回 Some(第一个元素)；否则返回 None
        // HINT: 使用 vector::length 检查，使用索引语法 vec[0] 获取第一个元素（Move 2024）
        // 在此处填写代码
    }
    
    /// === Option 的组合 ===
    
    /// 如果两个 Option 都是 Some，返回它们的和
    public fun add_options(opt1: &Option<u64>, opt2: &Option<u64>): Option<u64> {
        // TODO: 如果两个都是 Some，返回 Some(value1 + value2)；否则返回 None
        // 在此处填写代码
    }
    
    /// 展开嵌套的 Option
    public fun flatten(opt: Option<Option<u64>>): Option<u64> {
        // TODO: 如果外层是 Some 且内层也是 Some，返回内层 Some；否则返回 None
        // HINT: 检查外层是否为 Some，然后检查内层
        // 在此处填写代码
    }
    
    /// === Option 的模式匹配 ===
    
    /// 使用模式匹配处理 Option
    public fun match_option(opt: Option<u64>): vector<u8> {
        // TODO: 如果是 Some，返回 b"Some"；如果是 None，返回 b"None"
        // HINT: 使用 option::is_some 检查，然后处理
        // 在此处填写代码
    }
}
