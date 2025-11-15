/*
这是您的第十八个 Move 练习 - 深入所有权和生命周期（Ownership）！

// HINT: 所有权是 Move 的核心概念，每个值只有一个所有者
// HINT: 复杂类型（vector, struct）使用移动语义，不能被复制（除非有 copy 能力）
// HINT: 简单类型（u64, bool）使用复制语义，可以被复制
// HINT: 使用 & 创建不可变引用，使用 &mut 创建可变引用
// HINT: 引用不能比被引用的值活得更久
// HINT: 可以有多个不可变引用，但只能有一个可变引用
// HINT: 可变引用和不可变引用不能同时存在
// HINT: 值在作用域结束时被销毁（如果有 drop 能力）
// TODO: 深入理解所有权的基本概念和规则
// TODO: 掌握值的移动和复制
// TODO: 理解引用和借用的使用
// TODO: 了解引用的生命周期和作用域
// 1. 理解所有权的基本规则
// 2. 掌握值的移动和复制
// 3. 学习引用和借用的使用
// 4. 理解引用的生命周期
// 5. 了解多个引用的规则
*/

/// Module: intro
module intro::intro {
    use std::vector;
    
    /// === 基本所有权规则 ===
    
    /// 移动值
    public fun move_value(vec: vector<u64>): vector<u64> {
        // TODO: 直接返回 vec（移动所有权）
        // HINT: 返回 vec，所有权转移给返回值
        
        vec
    }
    
    /// 不能移动后再次使用
    public fun cannot_use_after_move(vec: vector<u64>): u64 {
        // TODO: 先移动 vec，然后尝试获取长度（这会失败）
        // HINT: 先返回 vec（移动），但这里我们需要返回长度
        // HINT: 正确的做法是先获取长度，然后移动 vec
        
        let len = vector::length(&vec);
        vec; // 移动并丢弃
        len
    }
    
    /// === 复制语义（简单类型） ===
    
    /// 复制数字
    public fun copy_number(x: u64): (u64, u64) {
        // TODO: 返回 (x, x) - 简单类型可以被复制
        
        (x, x)
    }
    
    /// 多次使用简单类型
    public fun use_number_multiple_times(x: u64): u64 {
        // TODO: 计算 x * 2 + x，可以多次使用 x
        // HINT: 简单类型可以被复制
        
        x * 2 + x
    }
    
    /// === 移动语义（复杂类型） ===
    
    /// 移动向量
    public fun move_vector(vec: vector<u64>): vector<u64> {
        // TODO: 直接返回 vec（移动）
        
        vec
    }
    
    /// 消费向量
    public fun consume_vector(vec: vector<u64>): u64 {
        // TODO: 获取向量长度后，向量被销毁
        // HINT: 移动 vec，获取长度并返回，vec 在函数结束时被销毁
        
        let len = vector::length(&vec);
        vec; // 移动并丢弃
        len
    }
    
    /// === 引用和借用 ===
    
    /// 不可变借用
    public fun borrow_immutable(vec: &vector<u64>): u64 {
        // TODO: 使用不可变引用获取长度
        // HINT: vec 不会被移动，只是借用
        
        vector::length(vec)
    }
    
    /// 可变借用
    public fun borrow_mutable(vec: &mut vector<u64>, value: u64) {
        // TODO: 使用可变引用添加元素
        // HINT: vec 不会被移动，只是可变借用
        
        vector::push_back(vec, value);
    }
    
    /// 同时使用值和引用
    public fun use_value_and_reference(mut vec: vector<u64>): (u64, vector<u64>) {
        // TODO: 先通过引用获取长度，然后修改向量，最后返回
        // HINT: 先获取长度（不可变借用），然后修改（可变借用），最后返回（移动）
        
        let len = vector::length(&vec);
        vector::push_back(&mut vec, 100);
        (len, vec)
    }
    
    /// === 多个引用规则 ===
    
    /// 多个不可变引用
    public fun multiple_immutable_refs(vec: &vector<u64>): (u64, u64) {
        // TODO: 创建多个不可变引用
        // HINT: 可以有多个不可变引用同时存在
        
        let len1 = vector::length(vec);
        let len2 = vector::length(vec);
        (len1, len2)
    }
    
    /// 不能同时有可变和不可变引用
    public fun conflicting_refs(mut vec: vector<u64>): u64 {
        // TODO: 先创建不可变引用，用完后再创建可变引用
        // HINT: 必须先完成不可变引用的使用，才能创建可变引用
        
        let len = vector::length(&vec);  // 不可变引用
        // len 使用完毕，可以创建可变引用
        vector::push_back(&mut vec, 42);  // 可变引用
        len
    }
    
    /// === 引用的生命周期 ===
    
    /// 引用在作用域内有效
    public fun reference_lifetime(vec: vector<u64>): u64 {
        // TODO: 在内部作用域创建引用，使用完毕后引用失效
        // HINT: 使用大括号创建作用域
        
        let len = {
            let vec_ref = &vec;
            vector::length(vec_ref)
        };  // vec_ref 在这里失效
        len
    }
    
    /// === 值的销毁 ===
    
    /// 值在作用域结束时被销毁
    public fun value_destruction() {
        // TODO: 创建值，函数结束时自动销毁
        // HINT: 如果有 drop 能力，会自动销毁
        
        let vec = vector[1, 2, 3];
        // vec 在函数结束时被销毁（如果有 drop 能力）
    }
    
    /// === 显式销毁 ===
    
    /// 资源类型（没有 drop 能力）
    struct Resource has store {
        value: u64,
    }
    
    /// 创建资源
    public fun create_resource(value: u64): Resource {
        // TODO: 创建并返回 Resource
        
        Resource { value }
    }
    
    /// 销毁资源（必须显式解构）
    public fun destroy_resource(r: Resource): u64 {
        // TODO: 解构 Resource 并返回值
        // HINT: Resource 没有 drop 能力，必须通过解构销毁
        
        let Resource { value } = r;
        value
    }
    
    /// === 条件移动 ===
    
    /// 根据条件决定是否移动
    public fun conditional_move(vec: vector<u64>, should_move: bool): vector<u64> {
        // TODO: 如果 should_move 为 true，返回 vec；否则返回空向量
        // HINT: 在 if 表达式中移动值
        
        if (should_move) {
            vec
        } else {
            vec; // 丢弃
            vector::empty<u64>()
        }
    }
    
    /// === 复杂的所有权场景 ===
    
    /// 向量的分解
    public fun destructure_vector(mut vec: vector<u64>): (u64, vector<u64>) {
        // TODO: 取出第一个元素，返回 (第一个元素, 剩余向量)
        // HINT: 如果向量为空，返回 (0, vec)
        // HINT: 使用 vector::remove 取出元素
        
        if (vector::is_empty(&vec)) {
            (0, vec)
        } else {
            let first = vector::remove(&mut vec, 0);
            (first, vec)
        }
    }
    
    /// 向量的重建
    public fun rebuild_vector(elements: vector<u64>, additional: u64): vector<u64> {
        // TODO: 将 additional 添加到 elements 并返回
        // HINT: 需要修改向量，所以需要 mut
        
        let mut result = elements;
        vector::push_back(&mut result, additional);
        result
    }
    
    /// === 所有权与函数调用 ===
    
    /// 函数参数的所有权
    public fun take_ownership(vec: vector<u64>) {
        // TODO: 函数体可以为空，vec 的所有权转移到这个函数
        // HINT: vec 在函数结束时被销毁（如果有 drop 能力）
        
        // vec 的所有权在这里
        // vec 在函数结束时被销毁
    }
    
    /// 返回值转移所有权
    public fun return_ownership() -> vector<u64> {
        // TODO: 创建向量并返回，所有权转移给调用者
        
        vector[1, 2, 3]
    }
    
    /// === 引用不能比值活得更久 ===
    
    /// 错误的引用使用（注释掉的示例）
    public fun invalid_reference() -> u64 {
        // TODO: 演示错误的引用使用
        // HINT: 不能返回局部值的引用
        // 错误示例：
        // let vec = vector[1, 2, 3];
        // return &vec;  // 错误！vec 会被销毁，引用无效
        
        // 正确的做法：返回值本身
        let vec = vector[1, 2, 3];
        let len = vector::length(&vec);
        vec; // 丢弃
        len
    }
    
    /// === 所有权的实际应用 ===
    
    /// 转移所有权给调用者
    public fun transfer_ownership(mut vec: vector<u64>): vector<u64> {
        // TODO: 修改向量后返回，所有权转移给调用者
        
        vector::push_back(&mut vec, 100);
        vec
    }
    
    /// 通过引用修改，不转移所有权
    public fun modify_by_reference(vec: &mut vector<u64>, value: u64) {
        // TODO: 通过引用修改，不获取所有权
        
        vector::push_back(vec, value);
    }
}
