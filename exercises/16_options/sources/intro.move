/*
这是您的第十七个 Move 练习 - 学习 Option 类型！

// HINT: Option 类型用于表示可能存在或不存在的值
// HINT: Option 有两种状态：Some(value) 和 None
// HINT: 使用 std::option 模块操作 Option
// HINT: Option 可以避免空指针异常
// TODO: 学习 Option 类型的创建和使用
// TODO: 掌握 Option 的模式匹配
// TODO: 理解安全的空值处理
*/

/// Module: intro
module intro::intro {
    
    /// === 基本 Option 操作 ===
    
    /// 创建包含值的 Some
    public fun create_some<T>(value: T): std::option::Option<T> {
        // TODO: 创建包含值的 Option
        // HINT: option::some(value)
    }
    
    /// 创建空的 None
    public fun create_none<T>(): std::option::Option<T> {
        // TODO: 创建空的 Option
        // HINT: option::none()
    }
    
    /// 检查 Option 是否包含值
    public fun is_some<T>(opt: &std::option::Option<T>): bool {
        // TODO: 检查 Option 是否为 Some
        // HINT: option::is_some(opt)
    }
    
    /// 检查 Option 是否为空
    public fun is_none<T>(opt: &std::option::Option<T>): bool {
        // TODO: 检查 Option 是否为 None
        // HINT: option::is_none(opt)
    }
    
    /// === 安全的值提取 ===
    
    /// 获取 Option 中的值（如果存在）
    public fun get_value<T>(opt: &std::option::Option<T>): &T {
        // TODO: 获取 Option 中值的引用
        // HINT: option::borrow(opt)
    }
    
    /// 获取 Option 中的可变值
    public fun get_value_mut<T>(opt: &mut std::option::Option<T>): &mut T {
        // TODO: 获取 Option 中值的可变引用
        // HINT: option::borrow_mut(opt)
    }
    
    /// 提取 Option 中的值
    public fun extract<T>(mut opt: std::option::Option<T>): T {
        // TODO: 从 Option 中提取值
        // HINT: option::extract(&mut opt)

    }
    
    /// 带默认值的提取
    public fun get_with_default<T: copy + drop>(opt: &std::option::Option<T>, default: T): T {
        // TODO: 如果有值则返回值，否则返回默认值
        // HINT: if (option::is_some(opt)) *option::borrow(opt) else default
    }
    
    /// === Option 变换操作 ===
    
    /// 向 Option 中填充值
    public fun fill<T>(opt: &mut std::option::Option<T>, value: T) {
        // TODO: 向空的 Option 中填充值
        // HINT: option::fill(opt, value)
    }
    
    /// 从 Option 中取出值，留下 None
    public fun extract_to_none<T>(opt: &mut std::option::Option<T>): T {
        // TODO: 取出值并将 Option 设为 None
        // HINT: option::extract(opt)
    }
    
    /// === 实用函数 ===
    
    /// 将值包装成 Option
    public fun wrap_value<T>(value: T): std::option::Option<T> {
        // TODO: 将普通值包装成 Some
        // HINT: option::some(value)
    }
    
    /// 条件性创建 Option
    public fun create_if<T: drop>(condition: bool, value: T): std::option::Option<T> {
        // TODO: 根据条件创建 Some 或 None
        // HINT: if (condition) option::some(value) else option::none()
    }
    
    /// 检查 Option 是否包含特定值
    public fun contains<T: drop>(_opt: &std::option::Option<T>, _target: &T): bool {
        // TODO: 检查 Option 是否包含指定值
        // HINT: if (option::is_some(opt)) { /* 比较值 */ } else false
        // 注意：这里简化实现，实际需要相等性比较
        false
    }
    
    /// === 用户信息示例 ===
    
    /// 用户配置文件
    public struct UserProfile has drop {
        name: vector<u8>,
        age: u8,
    }
    
    /// 创建用户配置文件
    public fun create_profile(name: vector<u8>, age: u8): UserProfile {
        // TODO: 创建用户配置文件
        // HINT: UserProfile { name, age }
    }
    
    /// 根据年龄创建配置文件（可选）
    public fun create_profile_if_adult(name: vector<u8>, age: u8): std::option::Option<UserProfile> {
        // TODO: 如果年龄>= 18则创建配置文件，否则返回 None
        // HINT: if (age >= 18) option::some(UserProfile { name, age }) else option::none()
    }
    
    /// 获取用户姓名（如果存在）
    public fun get_profile_name(profile_opt: &std::option::Option<UserProfile>): std::option::Option<vector<u8>> {
        // TODO: 如果有配置文件则返回姓名，否则返回 None
        // HINT: if (option::is_some(profile_opt)) option::some(option::borrow(profile_opt).name) else option::none()
    }
    
    /// 更新配置文件年龄
    public fun update_profile_age(profile_opt: &mut std::option::Option<UserProfile>, new_age: u8) {
        // TODO: 如果配置文件存在则更新年龄
        // HINT: if (option::is_some(profile_opt)) { option::borrow_mut(profile_opt).age = new_age; }
    }
}