/*
这是您的第八个 Move 练习 - 学习结构体（Structs）！

// HINT: Move 中使用 `struct` 关键字定义结构体
// HINT: 结构体使用大括号定义字段：struct Name { field1: Type1, field2: Type2 }
// HINT: 使用结构体字面量创建实例：Name { field1: value1, field2: value2 }
// HINT: 通过点号访问字段：instance.field_name
// HINT: 结构体可以附加能力：struct Name has copy, drop { ... }
// HINT: 字段名与变量名相同时可以省略：Point { x, y } 等价于 Point { x: x, y: y }
// TODO: 学习结构体的定义和实例化
// TODO: 掌握字段的访问和修改
// TODO: 理解结构体的解构和所有权
// TODO: 了解结构体与能力的关系
// 1. 学习结构体的定义语法
// 2. 掌握结构体的实例化方法
// 3. 理解字段访问和修改
// 4. 学习结构体的解构（destructuring）
// 5. 了解结构体与能力的关系
*/

/// Module: intro
module intro::intro {
    
    /// === 基本结构体定义 ===
    
    /// 定义一个表示二维点的结构体
    public struct Point has copy, drop {
        x: u64,
        y: u64,
    }
    
    /// 创建一个点
    public fun create_point(x: u64, y: u64): Point {
        // TODO: 创建并返回一个 Point 结构体实例
        // HINT: 使用结构体字面量语法 Point { x: x, y: y }
        // HINT: 字段名与变量名相同时可以简写为 Point { x, y }
        // 在此处填写代码
    }
    
    /// 获取点的 x 坐标
    public fun get_x(p: &Point): u64 {
        // TODO: 返回点的 x 坐标
        // HINT: 使用点号访问字段：p.x
        // 在此处填写代码
    }
    
    /// 获取点的 y 坐标
    public fun get_y(p: &Point): u64 {
        // TODO: 返回点的 y 坐标
        // 在此处填写代码
    }
    
    /// 设置点的 x 坐标（需要可变引用）
    public fun set_x(p: &mut Point, x: u64) {
        // TODO: 设置点的 x 坐标为新的值
        // HINT: 对可变引用使用点号：p.x = x
        // 在此处填写代码
    }
    
    /// === 带能力的结构体 ===
    
    /// 可复制的硬币结构体
    public struct Coin has copy, drop {
        value: u64,
    }
    
    /// 创建一个硬币
    public fun create_coin(value: u64): Coin {
        // TODO: 创建并返回一个 Coin 实例
        // HINT: Coin 有 copy 和 drop 能力，可以复制和丢弃
        // 在此处填写代码
    }
    
    /// 获取硬币的价值
    public fun get_value(coin: &Coin): u64 {
        // TODO: 返回硬币的价值
        
    }
    
    /// 复制硬币
    public fun duplicate_coin(coin: &Coin): Coin {
        // TODO: 创建一个硬币的副本
        // HINT: 因为有 copy 能力，可以使用 *coin 复制
        // HINT: 或者解构后重新创建
        
    }
    
    /// === 结构体的解构 ===
    
    /// 解构点并返回坐标
    public fun destructure_point(p: Point): (u64, u64) {
        // TODO: 解构 Point 并返回 (x, y)
        // HINT: 使用解构语法：let Point { x, y } = p;
        // 在此处填写代码
    }
    
    /// 从点中提取 x 坐标
    public fun extract_x(p: Point): u64 {
        // TODO: 解构 Point 并返回 x 坐标
        // HINT: 可以使用 let Point { x, y } = p; 然后忽略 y
        // 在此处填写代码
    }
    
    /// === 嵌套结构体 ===
    
    /// 表示矩形的结构体
    public struct Rectangle has copy, drop {
        top_left: Point,
        bottom_right: Point,
    }
    
    /// 创建一个矩形
    public fun create_rectangle(x1: u64, y1: u64, x2: u64, y2: u64): Rectangle {
        // TODO: 创建两个 Point，然后用它们创建 Rectangle
        // HINT: 先创建 top_left 和 bottom_right，然后创建 Rectangle
        // 在此处填写代码
    }
    
    /// 获取矩形的宽度
    public fun get_width(rect: &Rectangle): u64 {
        // TODO: 计算矩形的宽度（bottom_right.x - top_left.x）
        // HINT: 访问嵌套字段：rect.top_left.x
        // 在此处填写代码
    }
    
    /// === 结构体作为返回值 ===
    
    /// 交换点的坐标
    public fun swap_coordinates(p: Point): Point {
        // TODO: 创建一个新点，x 和 y 坐标互换
        // HINT: 解构原点的坐标，然后创建新点 Point { x: y, y: x }
        // 在此处填写代码
    }
    
    /// 移动点
    public fun move_point(p: Point, dx: u64, dy: u64): Point {
        // TODO: 创建一个新点，坐标加上偏移量
        // HINT: 解构原点的坐标，然后创建新点 Point { x: x + dx, y: y + dy }
        // 在此处填写代码
    }
    
    /// === 结构体与向量 ===
    
    /// 创建点的向量
    public fun create_points_vector(): vector<Point> {
        // TODO: 创建一个包含三个点的向量
        // HINT: 使用 vector[Point { x: 1, y: 2 }, Point { x: 3, y: 4 }, ...]
        // HINT: 创建点 (1, 2), (3, 4), (5, 6)
        // 在此处填写代码
    }
    
    /// 计算点的向量中所有 x 坐标的和
    public fun sum_x_coordinates(points: &vector<Point>): u64 {
        // TODO: 遍历点的向量，累加所有 x 坐标
        // HINT: 使用 while 循环和 vector::borrow 访问元素
        // HINT: 使用 (*vector::borrow(points, i)).x 访问字段
        // 在此处填写代码
    }
    
    /// === 结构体与能力的关系 ===
    
    /// 只能被丢弃的结构体（不能复制）
    public struct Counter has drop {
        count: u64,
    }
    
    /// 创建计数器
    public fun create_counter(initial: u64): Counter {
        // TODO: 创建并返回 Counter
        // 在此处填写代码
    }
    
    /// 增加计数器的值
    public fun increment_counter(counter: &mut Counter) {
        // TODO: 将计数器的 count 字段加 1
        
    }
    
    /// 获取计数值
    public fun get_count(counter: &Counter): u64 {
        // TODO: 返回计数器的 count 值
        // 在此处填写代码
    }
    
    /// 销毁计数器并返回最终计数值
    public fun destroy_counter(counter: Counter): u64 {
        // TODO: 解构 Counter 并返回 count 值
        // HINT: 因为 Counter 有 drop 能力，可以直接解构
        // 在此处填写代码
    }
}
