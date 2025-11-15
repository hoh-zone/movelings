/*
这是您的第十一个 Move 练习 - 学习枚举类型（Enums）！

// HINT: Move 中使用 enum 关键字定义枚举
// HINT: 枚举可以有多个变体：enum Name { Variant1, Variant2 }
// HINT: 变体可以携带数据：enum Name { Variant1(u64), Variant2 }
// HINT: 变体可以是结构体风格：enum Name { Variant { field: u64 } }
// HINT: 使用枚举名称::变体名称创建：EnumName::Variant
// HINT: 使用 if 和 matches 检查枚举变体
// HINT: 使用解构获取变体数据：let EnumName::Variant(value) = enum_var;
// TODO: 理解枚举的定义和变体
// TODO: 学习带数据的枚举变体
// TODO: 掌握枚举的模式匹配和解构
// TODO: 了解泛型枚举
// 1. 学习枚举的基本定义
// 2. 掌握单元变体、元组变体、结构体变体
// 3. 理解枚举的实例化和使用
// 4. 学习枚举的模式匹配
// 5. 掌握枚举的解构
*/

/// Module: intro
module intro::intro {
    
    /// === 简单枚举 ===
    
    /// 颜色枚举（单元变体）
    enum Color {
        Red,
        Green,
        Blue,
    }
    
    /// 创建红色
    public fun create_red(): Color {
        // TODO: 返回 Color::Red
        
        Color::Red
    }
    
    /// 创建绿色
    public fun create_green(): Color {
        // TODO: 返回 Color::Green
        
        Color::Green
    }
    
    /// 创建蓝色
    public fun create_blue(): Color {
        // TODO: 返回 Color::Blue
        
        Color::Blue
    }
    
    /// === 带数据的枚举 ===
    
    /// 可选值枚举（元组变体）
    enum Option<T> {
        None,
        Some(T),
    }
    
    /// 创建 Some 值
    public fun create_some<T>(value: T): Option<T> {
        // TODO: 返回 Option::Some(value)
        
        Option::Some(value)
    }
    
    /// 创建 None 值
    public fun create_none<T>(): Option<T> {
        // TODO: 返回 Option::None
        
        Option::None
    }
    
    /// 检查是否为 Some
    public fun is_some<T>(opt: &Option<T>): bool {
        // TODO: 使用 matches 检查是否为 Some
        // HINT: matches(&opt, &Option::Some(_))
        
        matches(opt, &Option::Some(_))
    }
    
    /// 检查是否为 None
    public fun is_none<T>(opt: &Option<T>): bool {
        // TODO: 使用 matches 检查是否为 None
        
        matches(opt, &Option::None)
    }
    
    /// 从 Some 中提取值
    public fun extract<T: drop>(opt: Option<T>): T {
        // TODO: 解构 Option 并返回值
        // HINT: 使用 let Option::Some(value) = opt;
        
        let Option::Some(value) = opt;
        value
    }
    
    /// 获取值或返回默认值
    public fun unwrap_or<T: copy + drop>(opt: Option<T>, default: T): T {
        // TODO: 如果是 Some，返回其中的值；否则返回 default
        // HINT: 使用 if 和 matches 检查，然后解构
        
        if (matches(&opt, &Option::Some(_))) {
            let Option::Some(value) = opt;
            value
        } else {
            opt; // 丢弃 None
            default
        }
    }
    
    /// === 结构体变体 ===
    
    /// 结果枚举（结构体变体）
    enum Result<T, E> {
        Ok(T),
        Err(E),
    }
    
    /// 创建 Ok 值
    public fun create_ok<T, E>(value: T): Result<T, E> {
        // TODO: 返回 Result::Ok(value)
        
        Result::Ok(value)
    }
    
    /// 创建 Err 值
    public fun create_err<T, E>(error: E): Result<T, E> {
        // TODO: 返回 Result::Err(error)
        
        Result::Err(error)
    }
    
    /// 检查是否为 Ok
    public fun is_ok<T, E>(result: &Result<T, E>): bool {
        // TODO: 使用 matches 检查是否为 Ok
        
        matches(result, &Result::Ok(_))
    }
    
    /// 检查是否为 Err
    public fun is_err<T, E>(result: &Result<T, E>): bool {
        // TODO: 使用 matches 检查是否为 Err
        
        matches(result, &Result::Err(_))
    }
    
    /// 从 Ok 中提取值
    public fun unwrap_ok<T: drop, E: drop>(result: Result<T, E>): T {
        // TODO: 解构 Result 并返回 Ok 中的值
        // HINT: let Result::Ok(value) = result;
        
        let Result::Ok(value) = result;
        value
    }
    
    /// 从 Err 中提取错误
    public fun unwrap_err<T: drop, E: drop>(result: Result<T, E>): E {
        // TODO: 解构 Result 并返回 Err 中的错误值
        
        let Result::Err(error) = result;
        error
    }
    
    /// === 枚举与能力 ===
    
    /// 带能力的枚举
    enum CoinType has copy, drop {
        USD,
        EUR,
        CNY,
    }
    
    /// 创建美元类型
    public fun create_usd(): CoinType {
        // TODO: 返回 CoinType::USD
        
        CoinType::USD
    }
    
    /// 创建欧元类型
    public fun create_eur(): CoinType {
        // TODO: 返回 CoinType::EUR
        
        CoinType::EUR
    }
    
    /// === 枚举的模式匹配 ===
    
    /// 根据颜色返回数字
    public fun color_to_number(color: Color): u64 {
        // TODO: 根据颜色返回不同的数字
        // HINT: Red -> 1, Green -> 2, Blue -> 3
        // HINT: 使用 if 和 matches 进行模式匹配
        
        if (matches(&color, &Color::Red)) {
            1
        } else if (matches(&color, &Color::Green)) {
            2
        } else {
            3
        }
    }
    
    /// 处理 Option，返回字符串表示
    public fun option_to_string<T: drop>(opt: Option<T>): vector<u8> {
        // TODO: 如果是 Some，返回 b"Some"；如果是 None，返回 b"None"
        
        if (matches(&opt, &Option::Some(_))) {
            opt; // 丢弃
            b"Some"
        } else {
            opt; // 丢弃
            b"None"
        }
    }
    
    /// === 嵌套枚举 ===
    
    /// 包含 Option 的结果
    enum MaybeResult<T> {
        None,
        Some(Result<T, u64>),
    }
    
    /// 创建 Some Ok
    public fun create_some_ok<T>(value: T): MaybeResult<T> {
        // TODO: 创建包含 Ok 的 Some
        // HINT: MaybeResult::Some(Result::Ok(value))
        
        MaybeResult::Some(Result::Ok(value))
    }
    
    /// 创建 Some Err
    public fun create_some_err<T>(error: u64): MaybeResult<T> {
        // TODO: 创建包含 Err 的 Some
        
        MaybeResult::Some(Result::Err(error))
    }
    
    /// === 枚举的实用函数 ===
    
    /// 将 Option<u64> 转换为 Option<vector<u8>>
    public fun option_u64_to_string(opt: Option<u64>): Option<vector<u8>> {
        // TODO: 如果是 Some，将值转换为字符串并返回新的 Some
        // HINT: 如果是 None，返回 None
        // HINT: 使用 string::utf8 将数字转换为字符串（这里简化，直接返回示例）
        
        if (matches(&opt, &Option::Some(_))) {
            let Option::Some(value) = opt;
            Option::Some(b"number")  // 简化示例
        } else {
            opt;
            Option::None
        }
    }
    
    /// 过滤 Option<u64>，只保留大于阈值的值
    public fun filter_option_u64(opt: Option<u64>, threshold: u64): Option<u64> {
        // TODO: 如果是 Some 且值大于 threshold，返回 Some；否则返回 None
        
        if (matches(&opt, &Option::Some(_))) {
            let Option::Some(value) = opt;
            if (value > threshold) {
                Option::Some(value)
            } else {
                Option::None
            }
        } else {
            opt
        }
    }
}
