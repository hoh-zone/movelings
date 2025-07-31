/*
这是您的第十一个 Move 练习 - 学习枚举（Enums）！

// HINT: 枚举允许定义具有多个变体的类型
// HINT: 使用 enum 关键字定义枚举
// HINT: 枚举变体可以携带不同类型的数据
// HINT: 使用模式匹配来处理枚举变体
// TODO: 定义和使用枚举类型
// TODO: 学习枚举的模式匹配
// TODO: 掌握带数据的枚举变体
*/

/// Module: intro
module intro::intro {
    
    /// === 简单枚举 ===
    
    /// 表示颜色的简单枚举
    public enum Color {
        Red,
        Green,
        Blue,
    }
    
    /// 创建红色
    public fun create_red(): Color {
        // TODO: 返回红色枚举变体
        // HINT: Color::Red
        
    }
    
    /// 检查是否为红色
    public fun is_red(color: &Color): bool {
        // TODO: 使用模式匹配检查是否为红色
        // HINT: match (color) { Color::Red => true, _ => false }
        
    }
    
    /// 获取颜色名称
    public fun color_name(color: &Color): vector<u8> {
        // TODO: 使用模式匹配返回颜色名称
        // HINT: match (color) { 
        //   Color::Red => b"red",
        //   Color::Green => b"green", 
        //   Color::Blue => b"blue"
        // }
        
    }
    
    /// === 带数据的枚举 ===
    
    /// 表示形状的枚举，每个变体携带不同数据
    public enum Shape {
        Circle { radius: u64 },
        Rectangle { width: u64, height: u64 },
        Triangle { base: u64, height: u64 },
    }
    
    /// 创建圆形
    public fun create_circle(radius: u64): Shape {
        // TODO: 创建圆形变体
        // HINT: Shape::Circle { radius }
        
    }
    
    /// 创建矩形
    public fun create_rectangle(width: u64, height: u64): Shape {
        // TODO: 创建矩形变体
        // HINT: Shape::Rectangle { width, height }
        
    }
    
    /// 计算形状面积
    public fun calculate_area(shape: &Shape): u64 {
        // TODO: 使用模式匹配计算不同形状的面积
        // HINT: match (shape) {
        //   Shape::Circle { radius } => 3 * radius * radius,  // 简化的圆面积
        //   Shape::Rectangle { width, height } => width * height,
        //   Shape::Triangle { base, height } => base * height / 2
        // }
        
    }
    
    /// 获取形状类型名称
    public fun shape_type(shape: &Shape): vector<u8> {
        // TODO: 返回形状类型的名称
        // HINT: 使用模式匹配，但忽略数据字段
        
    }
    
    /// === 嵌套枚举 ===
    
    /// 表示可选值的枚举
    public enum Option<T> {
        Some { value: T },
        None,
    }
    
    /// 创建包含值的选项
    public fun create_some<T>(value: T): Option<T> {
        // TODO: 创建 Some 变体
        // HINT: Option::Some { value }
        
    }
    
    /// 创建空选项
    public fun create_none<T>(): Option<T> {
        // TODO: 创建 None 变体
        // HINT: Option::None
        
    }
    
    /// 检查选项是否有值
    public fun is_some<T>(option: &Option<T>): bool {
        // TODO: 检查是否为 Some 变体
        
    }
    
    /// 获取选项中的值（如果存在）
    public fun get_value<T: copy>(option: &Option<T>): T {
        // TODO: 从 Some 变体中提取值
        // HINT: match (option) { 
        //   Option::Some { value } => *value,
        //   Option::None => abort 1  // 简单错误处理
        // }
        
    }
    
    /// === 结果枚举 ===
    
    /// 表示操作结果的枚举
    public enum Result<T, E> {
        Ok { value: T },
        Err { error: E },
    }
    
    /// 创建成功结果
    public fun create_ok<T, E>(value: T): Result<T, E> {
        // TODO: 创建成功结果
        
    }
    
    /// 创建错误结果
    public fun create_error<T, E>(error: E): Result<T, E> {
        // TODO: 创建错误结果
        
    }
    
    /// 检查结果是否成功
    public fun is_ok<T, E>(result: &Result<T, E>): bool {
        // TODO: 检查是否为 Ok 变体
        
    }
    
    /// 安全地获取结果值
    public fun get_ok_value<T: copy, E>(result: &Result<T, E>): Option<T> {
        // TODO: 如果是 Ok 则返回 Some(value)，否则返回 None
        // HINT: 这里需要组合使用两个枚举
        
    }
    
    /// === 枚举转换 ===
    
    /// 将颜色转换为数字
    public fun color_to_number(color: &Color): u8 {
        // TODO: 将颜色枚举转换为数字
        // HINT: Red => 1, Green => 2, Blue => 3
        
    }
    
    /// 从数字创建颜色（可能失败）
    public fun number_to_color(num: u8): Option<Color> {
        // TODO: 从数字创建颜色，无效数字返回 None
        // HINT: 1 => Some(Red), 2 => Some(Green), 3 => Some(Blue), _ => None
        
    }
    
    /// === 枚举比较 ===
    
    /// 比较两个颜色是否相同
    public fun colors_equal(color1: &Color, color2: &Color): bool {
        // TODO: 比较两个颜色枚举是否相同
        // HINT: 可以使用嵌套的 match 或者转换为数字后比较
        
    }
    
    /// 比较两个形状类型是否相同（忽略数据）
    public fun same_shape_type(shape1: &Shape, shape2: &Shape): bool {
        // TODO: 比较形状类型是否相同，但不比较具体数据
        
    }
}