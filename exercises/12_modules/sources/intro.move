/*
这是您的第十三个 Move 练习 - 学习模块系统（Modules）！

// HINT: 模块是 Move 中的代码组织单元
// HINT: 使用 module 关键字定义模块：module address::module_name { ... }
// HINT: 使用 use 导入其他模块：use address::module_name;
// HINT: 使用 use 导入特定项：use address::module_name::Item;
// HINT: 使用 use 导入多项：use address::module_name::{Item1, Item2};
// HINT: 使用别名导入：use address::module_name::{Self as Alias};
// HINT: 可见性修饰符：public, public(package), entry, private
// HINT: public(package) 函数：同包模块可调用（Move 2024 中替代了 friend）
// TODO: 理解模块的定义和结构
// TODO: 学习导入语句的使用
// TODO: 掌握可见性修饰符
// TODO: 了解包级可见性的概念
// 1. 学习模块的定义语法
// 2. 掌握导入语句的各种形式
// 3. 理解可见性修饰符
// 4. 学习包级可见性的使用
// 5. 了解模块间的依赖关系
*/

/// Module: intro
module intro::intro {
    use std::string;
    
    /// === 基本函数和类型 ===
    
    /// 公共函数
    public fun add(a: u64, b: u64): u64 {
        // TODO: 返回 a + b
        // 在此处填写代码
    }
    
    /// 私有函数（只能在模块内部使用）
    fun multiply(a: u64, b: u64): u64 {
        // TODO: 返回 a * b
        // 在此处填写代码
    }
    
    /// 包级可见函数（同包模块可调用）
    public(package) fun friend_function(value: u64): u64 {
        // TODO: 返回 value * 2
        // 在此处填写代码
    }
    
    /// 入口函数（可以直接调用）
    entry fun entry_function(value: u64, _ctx: &mut sui::tx_context::TxContext): u64 {
        // TODO: 返回 value + 1
        // HINT: entry 函数可以作为交易入口点，通常需要 ctx 参数
        // 在此处填写代码
    }
    
    /// 公共结构体
    public struct Point has copy, drop {
        x: u64,
        y: u64,
    }
    
    /// 创建点
    public fun create_point(x: u64, y: u64): Point {
        // TODO: 创建并返回 Point 实例
        // 在此处填写代码
    }
    
    /// 访问 Point 的 x
    public fun point_x(p: &Point): u64 { p.x }
    /// 访问 Point 的 y
    public fun point_y(p: &Point): u64 { p.y }
    
    /// 私有结构体（只能在模块内部使用）
    public struct InternalStruct has copy, drop {
        value: u64,
    }
    
    /// 使用内部结构体，避免未使用字段告警
    public fun use_internal_struct(s: InternalStruct): u64 {
        let InternalStruct { value } = s;
        value
    }
    
    /// === 常量 ===
    
    /// 模块常量
    const MAX_VALUE: u64 = 1000;
    
    /// 私有常量
    const MIN_VALUE: u64 = 0;
    
    /// === 使用导入的标准库 ===
    
    /// 创建向量
    public fun create_vector(): vector<u64> {
        // TODO: 使用 vector::empty 创建空向量
        // HINT: 已经导入了 std::vector，可以直接使用 vector::empty<u64>()
        // 在此处填写代码
    }
    
    /// 创建包含值的向量
    public fun create_vector_with_values(): vector<u64> {
        // TODO: 创建包含 [1, 2, 3] 的向量
        // HINT: 使用向量字面量或 vector::empty 然后 push_back
        // 在此处填写代码
    }
    
    /// 创建 Option
    public fun create_some(value: u64): option::Option<u64> {
        // TODO: 使用 option::some 创建 Some 值
        // HINT: 已经导入了 std::option，使用 option::some(value)
        // 在此处填写代码
    }
    
    /// 创建 None
    public fun create_none(): option::Option<u64> {
        // TODO: 使用 option::none 创建 None 值
        // 在此处填写代码
    }
    
    /// === 使用导入的类型 ===
    
    /// 创建字符串
    public fun create_string(): string::String {
        // TODO: 使用 .to_string() 方法创建字符串
        // HINT: 已经导入了 std::string，使用 b"Hello".to_string()
        // 在此处填写代码
    }
    
    /// 比较两个字符串（按字节）
    public fun string_equals(a: &string::String, b: &string::String): bool {
        *string::as_bytes(a) == *string::as_bytes(b)
    }
    
    /// === 模块内部函数调用 ===
    
    /// 使用私有函数
    public fun use_private_function(a: u64, b: u64): u64 {
        // TODO: 调用 multiply 函数
        // HINT: 直接调用 multiply(a, b)
        // 在此处填写代码
    }
    
    /// 组合多个函数
    public fun calculate(x: u64, y: u64, z: u64): u64 {
        // TODO: 计算 (x + y) * z
        // HINT: 先调用 add(x, y)，然后调用 multiply 结果和 z
        // 在此处填写代码
    }
    
    /// === 使用模块常量 ===
    
    /// 获取最大值
    public fun get_max_value(): u64 {
        // TODO: 返回 MAX_VALUE 常量
        // 在此处填写代码
    }
    
    /// 验证值是否在范围内
    public fun is_in_range(value: u64): bool {
        // TODO: 检查 value 是否在 MIN_VALUE 和 MAX_VALUE 之间
        // HINT: 使用 MIN_VALUE 和 MAX_VALUE 常量
        // 在此处填写代码
    }
}

/// 同包模块（可以调用 public(package) 函数）
module intro::friend_module {
    use intro::intro;
    
    /// 调用包级可见函数
    public fun call_friend_function(value: u64): u64 {
        // TODO: 调用 intro::friend_function
        // HINT: 因为 friend_module 和 intro::intro 在同一个包中，可以调用 public(package) 函数
        // 在此处填写代码
    }
    
    /// 使用公共函数
    public fun use_public_function(a: u64, b: u64): u64 {
        // TODO: 调用 intro::add
        // 在此处填写代码
    }
    
    /// 使用公共结构体
    public fun create_point(x: u64, y: u64): intro::Point {
        // TODO: 调用 intro::create_point
        // 在此处填写代码
    }
}

/// 另一个模块（非友元）
module intro::other_module {
    use intro::intro;
    
    /// 使用公共函数
    public fun use_public_function(a: u64, b: u64): u64 {
        // TODO: 调用 intro::add
        // HINT: 非友元模块只能调用公共函数
        // 在此处填写代码
    }
    
    /// 使用公共结构体
    public fun use_public_struct(): intro::Point {
        // TODO: 调用 intro::create_point(10, 20)
        // 在此处填写代码
    }
    
    // 尝试调用包级可见函数（这会失败，因为不是同包模块）
    // public fun try_call_friend_function(value: u64): u64 {
    //     intro::friend_function(value)  // 这行代码会编译失败，因为 other_module 不在同一个包中
    // }
}
