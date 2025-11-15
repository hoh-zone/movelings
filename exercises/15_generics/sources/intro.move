/*
这是您的第十六个 Move 练习 - 学习泛型编程（Generics）！

// HINT: 泛型允许编写能够处理多种数据类型的代码
// HINT: 使用 <T> 定义类型参数：fun foo<T>(x: T): T { ... }
// HINT: 可以定义多个类型参数：fun foo<T1, T2>(x: T1, y: T2) { ... }
// HINT: 类型参数可以指定能力约束：fun foo<T: copy + drop>(x: T) { ... }
// HINT: 结构体可以是泛型的：struct Box<T> has copy, drop { value: T }
// HINT: 枚举可以是泛型的：enum Option<T> { Some(T), None }
// HINT: 能力约束：T: copy 表示 T 必须有 copy 能力
// HINT: 多个能力约束：T: copy + drop 表示 T 必须同时有 copy 和 drop 能力
// TODO: 理解泛型类型参数的定义
// TODO: 学习泛型函数和结构体
// TODO: 掌握能力约束的使用
// TODO: 了解多个类型参数
// 1. 学习泛型类型参数的基本语法
// 2. 掌握泛型函数的定义
// 3. 理解泛型结构体的使用
// 4. 学习能力约束
// 5. 了解多个类型参数
*/

/// Module: intro
module intro::intro {
    
    /// === 基本泛型函数 ===
    
    /// 恒等函数（返回输入值）
    public fun identity<T>(x: T): T {
        // TODO: 直接返回 x
        
        x
    }
    
    /// 交换两个值
    public fun swap<T>(x: T, y: T): (T, T) {
        // TODO: 返回 (y, x)，交换两个值的位置
        
        (y, x)
    }
    
    /// 返回两个值中较大的一个（需要比较）
    public fun max<T: copy + drop>(x: T, y: T): T {
        // TODO: 简化版本，返回第一个值
        // HINT: Move 中没有通用的比较，这里简化处理
        
        x
    }
    
    /// === 能力约束 ===
    
    /// 复制值（需要 copy 能力）
    public fun duplicate<T: copy + drop>(item: T): (T, T) {
        // TODO: 返回 (item, item) - 需要 copy 能力才能复制
        
        (item, item)
    }
    
    /// 丢弃值（需要 drop 能力）
    public fun consume<T: drop>(item: T) {
        // TODO: 函数体可以为空，item 会被自动丢弃
        // HINT: 因为有 drop 能力，可以隐式丢弃
        
        // item 在这里会被自动丢弃
    }
    
    /// 存储值（需要 store 能力）
    public fun store_value<T: store>(item: T): T {
        // TODO: 直接返回 item
        // HINT: 因为有 store 能力，可以存储在全局存储中
        
        item
    }
    
    /// === 泛型结构体 ===
    
    /// 泛型盒子
    struct Box<T> has copy, drop {
        value: T,
    }
    
    /// 创建盒子
    public fun create_box<T>(value: T): Box<T> {
        // TODO: 创建并返回 Box<T> 实例
        
        Box { value }
    }
    
    /// 获取盒子中的值
    public fun get_value<T>(box: &Box<T>): &T {
        // TODO: 返回盒子中值的引用
        
        &box.value
    }
    
    /// 从盒子中取出值
    public fun unwrap<T>(box: Box<T>): T {
        // TODO: 解构 Box 并返回值
        
        let Box { value } = box;
        value
    }
    
    /// 更新盒子中的值（需要可变引用）
    public fun set_value<T>(box: &mut Box<T>, value: T) {
        // TODO: 设置盒子中的值
        
        box.value = value;
    }
    
    /// === 多个类型参数 ===
    
    /// 泛型对
    struct Pair<T1, T2> has copy, drop {
        first: T1,
        second: T2,
    }
    
    /// 创建对
    public fun create_pair<T1, T2>(first: T1, second: T2): Pair<T1, T2> {
        // TODO: 创建并返回 Pair 实例
        
        Pair { first, second }
    }
    
    /// 获取第一个元素
    public fun get_first<T1, T2>(pair: &Pair<T1, T2>): &T1 {
        // TODO: 返回 first 字段的引用
        
        &pair.first
    }
    
    /// 获取第二个元素
    public fun get_second<T1, T2>(pair: &Pair<T1, T2>): &T2 {
        // TODO: 返回 second 字段的引用
        
        &pair.second
    }
    
    /// 交换对中的元素
    public fun swap_pair<T1, T2>(pair: Pair<T1, T2>): Pair<T2, T1> {
        // TODO: 创建新对，交换 first 和 second
        
        let Pair { first, second } = pair;
        Pair { first: second, second: first }
    }
    
    /// === 泛型枚举 ===
    
    /// 可选值枚举
    enum Option<T> {
        None,
        Some(T),
    }
    
    /// 创建 Some
    public fun some<T>(value: T): Option<T> {
        // TODO: 返回 Option::Some(value)
        
        Option::Some(value)
    }
    
    /// 创建 None
    public fun none<T>(): Option<T> {
        // TODO: 返回 Option::None
        
        Option::None
    }
    
    /// === 能力约束组合 ===
    
    /// 接受有 copy 和 drop 能力的类型
    public fun copy_and_drop<T: copy + drop>(item: T): T {
        // TODO: 复制 item 然后返回副本
        
        let (copy, _original) = (item, item);
        copy
    }
    
    /// 接受有 copy、drop 和 store 能力的类型
    public fun copy_drop_store<T: copy + drop + store>(item: T): T {
        // TODO: 直接返回 item
        
        item
    }
    
    /// === 嵌套泛型 ===
    
    /// 包含 Option 的盒子
    struct OptionBox<T> has copy, drop {
        value: Option<T>,
    }
    
    /// 创建包含 Some 的盒子
    public fun create_some_box<T>(value: T): OptionBox<T> {
        // TODO: 创建包含 Option::Some(value) 的盒子
        
        OptionBox { value: Option::Some(value) }
    }
    
    /// 创建包含 None 的盒子
    public fun create_none_box<T>(): OptionBox<T> {
        // TODO: 创建包含 Option::None 的盒子
        
        OptionBox { value: Option::None }
    }
    
    /// 获取盒子中的值（如果存在）
    public fun unwrap_option_box<T: drop>(box: OptionBox<T>): T {
        // TODO: 解构 OptionBox 和 Option，返回值
        
        let OptionBox { value } = box;
        let Option::Some(value) = value;
        value
    }
    
    /// === 泛型与向量 ===
    
    /// 获取向量的第一个元素
    public fun first<T>(vec: &vector<T>): &T {
        // TODO: 使用 vector::borrow 获取第一个元素的引用
        // HINT: vector::borrow(vec, 0)
        
        vector::borrow(vec, 0)
    }
    
    /// 获取向量的最后一个元素
    public fun last<T>(vec: &vector<T>): &T {
        // TODO: 获取最后一个元素的引用
        // HINT: 先获取长度，然后使用 vector::borrow(vec, length - 1)
        
        let len = vector::length(vec);
        let last_idx = len - 1;
        vector::borrow(vec, last_idx)
    }
    
    /// 创建包含一个元素的向量
    public fun singleton<T>(item: T): vector<T> {
        // TODO: 创建包含单个元素的向量
        // HINT: vector[item] 或使用 vector::empty 然后 push_back
        
        vector[item]
    }
    
    /// === 泛型实用函数 ===
    
    /// 创建盒子的向量
    public fun create_box_vector<T>(items: vector<T>): vector<Box<T>> {
        // TODO: 将向量中的每个元素包装成 Box，返回 Box 的向量
        // HINT: 遍历 items，为每个元素创建 Box
        
        let mut result = vector::empty<Box<T>>();
        let i = 0;
        let len = vector::length(&items);
        
        while (i < len) {
            let item = *vector::borrow(&items, i);
            let box = create_box(item);
            vector::push_back(&mut result, box);
            i = i + 1;
        };
        
        result
    }
    
    /// 从盒子向量中提取值
    public fun unwrap_boxes<T: drop>(boxes: vector<Box<T>>): vector<T> {
        // TODO: 解构每个 Box，提取值到新向量
        
        let mut result = vector::empty<T>();
        let i = 0;
        let len = vector::length(&boxes);
        
        while (i < len) {
            let box = *vector::borrow(&boxes, i);
            let Box { value } = box;
            vector::push_back(&mut result, value);
            i = i + 1;
        };
        
        result
    }
}
