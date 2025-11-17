/*
这是您的第十一个 Move 练习 - 学习枚举类型（Enums）！

// HINT: Move 中使用 enum 关键字定义枚举
// HINT: 枚举可以有多个变体：public enum Name has copy, drop { Variant1, Variant2 }
// HINT: 变体可以携带位置字段：enum Name { Variant1(u64), Variant2 }
// HINT: 变体可以携带命名字段：enum Name { Variant { field: u64 } }
// HINT: 使用枚举名称::变体名称创建：EnumName::Variant
// HINT: 枚举是 internal 的，只能在定义它的模块内创建、读取和解包
// HINT: 使用 match 表达式进行模式匹配
// TODO: 理解枚举的定义和变体
// TODO: 学习带数据的枚举变体
// TODO: 掌握枚举的模式匹配和解构
// TODO: 了解枚举的能力限制
// 1. 学习枚举的基本定义
// 2. 掌握单元变体、位置字段变体、命名字段变体
// 3. 理解枚举的实例化和使用
// 4. 学习枚举的模式匹配（match）
// 5. 掌握枚举的解构
*/

/// Module: intro
module intro::intro {
    /// === 简单枚举 ===
    
    /// 颜色枚举：无字段的变体
    public enum Color has copy, drop {
        Red,
        Green,
        Blue,
    }
    
    /// 创建红色
    public fun create_red(): Color {
        // TODO: 返回 Color::Red
        // HINT: 使用 Color::Red 创建枚举变体
        // 在此处填写代码
    }
    
    /// 创建绿色
    public fun create_green(): Color {
        // TODO: 返回 Color::Green
        // 在此处填写代码
    }
    
    /// 创建蓝色
    public fun create_blue(): Color {
        // TODO: 返回 Color::Blue
        // 在此处填写代码
    }
    
    /// === 带位置字段的枚举 ===
    
    /// 自定义 Option 枚举（用于演示，实际应使用 std::option）
    public enum MyOption<T: drop> has drop {
        Some(T),
        None,
    }
    
    /// 创建 Some 值
    public fun create_some<T: drop>(value: T): MyOption<T> {
        // TODO: 返回 MyOption::Some(value)
        // HINT: 使用 MyOption::Some(value) 创建带位置字段的变体
        // 在此处填写代码
    }
    
    /// 创建 None 值
    public fun create_none<T: drop>(): MyOption<T> {
        // TODO: 返回 MyOption::None
        // 在此处填写代码
    }
    
    /// 检查是否为 Some
    public fun is_some<T: drop>(opt: &MyOption<T>): bool {
        // TODO: 使用 match 检查是否为 Some
        // HINT: match (opt) { MyOption::Some(_) => true, _ => false }
        // 在此处填写代码
    }
    
    /// 检查是否为 None
    public fun is_none<T: drop>(opt: &MyOption<T>): bool {
        // TODO: 使用 match 检查是否为 None
        // 在此处填写代码
    }
    
    /// 从 Some 中提取值
    public fun extract<T: drop>(opt: MyOption<T>): T {
        // TODO: 使用 match 提取值，如果是 None 则 abort
        // HINT: match (opt) { MyOption::Some(value) => value, MyOption::None => abort 1 }
        // 在此处填写代码
    }
    
    /// 获取值或返回默认值
    public fun unwrap_or<T: copy + drop>(opt: MyOption<T>, default: T): T {
        // TODO: 使用 match 提取值，如果是 None 则返回 default
        // 在此处填写代码
    }
    
    /// === 带命名字段的枚举 ===
    
    /// Result 枚举：使用命名字段
    public enum Result has drop {
        Ok { value: u64 },
        Err { error: u64 },
    }
    
    /// 创建 Ok 值
    public fun create_ok(value: u64): Result {
        // TODO: 返回 Result::Ok { value }
        // HINT: 使用命名字段语法：Result::Ok { value: value } 或 Result::Ok { value }
        // 在此处填写代码
    }
    
    /// 创建 Err 值
    public fun create_err(error: u64): Result {
        // TODO: 返回 Result::Err { error }
        // 在此处填写代码
    }
    
    /// 检查是否为 Ok
    public fun is_ok(result: &Result): bool {
        // TODO: 使用 match 检查是否为 Ok
        // HINT: match (result) { Result::Ok { .. } => true, _ => false }
        // 在此处填写代码
    }
    
    /// 检查是否为 Err
    public fun is_err(result: &Result): bool {
        // TODO: 使用 match 检查是否为 Err
        // 在此处填写代码
    }
    
    /// 从 Ok 中提取值
    public fun unwrap_ok(result: Result): u64 {
        // TODO: 使用 match 提取 value，如果是 Err 则 abort
        // HINT: match (result) { Result::Ok { value } => value, Result::Err { .. } => abort 2 }
        // 在此处填写代码
    }
    
    /// 从 Err 中提取错误
    public fun unwrap_err(result: Result): u64 {
        // TODO: 使用 match 提取 error，如果是 Ok 则 abort
        // 在此处填写代码
    }
    
    /// === 枚举与能力 ===
    
    /// 代币类型枚举
    public enum CoinType has copy, drop {
        USD,
        EUR,
        CNY,
    }
    
    /// 创建美元类型
    public fun create_usd(): CoinType {
        // TODO: 返回 CoinType::USD
        // 在此处填写代码
    }
    
    /// 创建欧元类型
    public fun create_eur(): CoinType {
        // TODO: 返回 CoinType::EUR
        // 在此处填写代码
    }
    
    /// === 枚举的模式匹配 ===
    
    /// 根据颜色返回数字
    public fun color_to_number(color: Color): u64 {
        // TODO: 使用 match 根据颜色返回不同的数字
        // HINT: Red -> 1, Green -> 2, Blue -> 3
        // HINT: match (color) { Color::Red => 1, Color::Green => 2, Color::Blue => 3 }
        // 在此处填写代码
    }
    
    /// 处理 Option，返回字符串表示
    public fun option_to_string<T: drop>(opt: MyOption<T>): vector<u8> {
        // TODO: 使用 match 判断，如果是 Some 返回 b"Some"；如果是 None 返回 b"None"
        // 在此处填写代码
    }
    
    /// === 嵌套枚举 ===
    
    /// 嵌套枚举：Option<Result>
    public enum MaybeResult has drop {
        Some { result: Result },
        None,
    }
    
    /// 创建 Some Ok
    public fun create_some_ok(value: u64): MaybeResult {
        // TODO: 创建包含 Ok 的 Some
        // HINT: MaybeResult::Some { result: create_ok(value) }
        // 在此处填写代码
    }
    
    /// 创建 Some Err
    public fun create_some_err(error: u64): MaybeResult {
        // TODO: 创建包含 Err 的 Some
        // 在此处填写代码
    }
    
    /// === 枚举的实用函数 ===
    
    /// 将 MyOption<u64> 转换为 MyOption<vector<u8>>
    public fun option_u64_to_string(opt: MyOption<u64>): MyOption<vector<u8>> {
        // TODO: 使用 match 处理，如果是 Some，将值转换为字符串并返回新的 Some
        // HINT: 如果是 None，返回 None
        // HINT: 简化处理，直接返回 b"number" 作为字符串
        // 在此处填写代码
    }
    
    /// 过滤 MyOption<u64>，只保留大于阈值的值
    public fun filter_option_u64(opt: MyOption<u64>, threshold: u64): MyOption<u64> {
        // TODO: 使用 match 处理，如果是 Some 且值大于 threshold，返回 Some；否则返回 None
        // 在此处填写代码
    }
}
