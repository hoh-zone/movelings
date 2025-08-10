/*
这是您的第十六个 Move 练习 - 学习泛型（Generics）！

// HINT: 泛型允许编写可以处理多种类型的代码
// HINT: 使用 <T> 语法定义类型参数
// HINT: 泛型类型必须满足能力约束
// HINT: phantom 类型参数用于类型安全
// TODO: 学习泛型函数的定义和使用
// TODO: 掌握泛型结构体的创建
// TODO: 理解类型参数的约束
*/

/// Module: intro
module intro::intro {
    
    /// === 泛型结构体 ===
    
    /// 简单的泛型容器
    public struct Container<T> has drop {
        value: T,
    }
    
    /// 带约束的泛型容器
    public struct Box<T: store> has key, store {
        id: UID,
        content: T,
    }
    
    /// === 基本泛型函数 ===
    
    /// 创建容器
    public fun create_container<T>(value: T): Container<T> {
        // TODO: 创建包含值的容器
        // HINT: Container { value }
    }
    
    /// 获取容器中的值
    public fun get_value<T>(container: Container<T>): T {
        // TODO: 从容器中提取值
        // HINT: container.value
 
    }
    
    /// 创建带 ID 的盒子
    public fun create_box<T: store>(content: T, ctx: &mut TxContext): Box<T> {
        // TODO: 创建包含内容的盒子
        // HINT: Box { id: object::new(ctx), content }
    }
    
    /// 获取盒子内容的引用
    public fun borrow_content<T: store>(box: &Box<T>): &T {
        // TODO: 获取盒子内容的不可变引用
        // HINT: &box.content
    }
    
    /// 获取盒子内容的可变引用
    public fun borrow_content_mut<T: store>(box: &mut Box<T>): &mut T {
        // TODO: 获取盒子内容的可变引用
        // HINT: &mut box.content
    }
    
    /// 销毁盒子的函数
    public fun destroy_box<T: store>(box: Box<T>): T {
        // TODO: 销毁盒子并返回内容
        // HINT: let Box { id, content } = box;
        // HINT: object::delete(id);
        // HINT: 返回 content
    }
    
    /// === 泛型实用函数 ===
    
    /// 比较两个相同类型的值（需要具有 drop 能力）
    public fun are_equal<T: drop>(_a: T, _b: T): bool {
        // TODO: 比较两个值是否相等
        // HINT: 在 Move 中，我们通过字节比较来检查相等性
        // HINT: 这里简化为总是返回 false，实际实现需要更复杂的逻辑
        false
    }
    
    /// 交换两个值
    public fun swap<T>(_a: &mut T, _b: &mut T) {
        // TODO: 交换两个值的内容
        // HINT: 使用临时变量进行交换
        // HINT: let temp = *a; *a = *b; *b = temp;
        // 注意：这在 Move 中需要 T 具有 copy 能力
        // 这里我们用更安全的方式，但需要调用者处理
        
        // 在 Move 中，交换需要特殊处理，这里我们留空
        // 实际使用中会用 std::mem::swap 或类似的标准库函数
    }
    
    /// 创建包含两个值的对
    public struct Pair<T, U> has drop {
        first: T,
        second: U,
    }
    
    /// 创建值对
    public fun create_pair<T, U>(first: T, second: U): Pair<T, U> {
        // TODO: 创建包含两个值的对
        // HINT: Pair { first, second }
    }
    
    /// 获取第一个值
    public fun get_first<T: copy, U>(pair: &Pair<T, U>): T {
        // TODO: 获取对中的第一个值
        // HINT: pair.first
    }
    
    /// 获取第二个值
    public fun get_second<T, U: copy>(pair: &Pair<T, U>): U {
        // TODO: 获取对中的第二个值
        // HINT: pair.second
    }
    
    /// === 向量泛型操作 ===
    
    /// 获取向量的第一个元素
    public fun get_first_element<T: copy>(vec: &vector<T>): T {
        // TODO: 获取向量的第一个元素
        // HINT: *vector::borrow(vec, 0)
    }
    
    /// 向向量添加元素
    public fun push_element<T>(vec: &mut vector<T>, element: T) {
        // TODO: 向向量末尾添加元素
        // HINT: vector::push_back(vec, element)
    }
    
    /// 检查向量是否为空
    public fun is_vector_empty<T>(vec: &vector<T>): bool {
        // TODO: 检查向量是否为空
        // HINT: vector::is_empty(vec)
    }
    
    /// === Option 类型模拟 ===
    
    /// 简单的 Option 类型
    public struct Option<T> has drop {
        is_some: bool,
        value: T,
    }
    
    /// 创建包含值的 Some
    public fun some<T>(value: T): Option<T> {
        // TODO: 创建包含值的 Option
        // HINT: Option { is_some: true, value }
    }
    
    /// 检查 Option 是否包含值
    public fun is_some<T>(opt: &Option<T>): bool {
        // TODO: 检查 Option 是否为 Some
        // HINT: opt.is_some
    }
    
    /// 从 Option 中提取值（不安全，仅用于演示）
    public fun unwrap<T>(opt: Option<T>): T {
        // TODO: 从 Option 中提取值
        // HINT: assert!(opt.is_some, 0); opt.value
        assert!(opt.is_some, 0);
        let Option { is_some: _, value } = opt;
        value
    }

}