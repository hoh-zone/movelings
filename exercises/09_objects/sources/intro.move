/*
这是您的第十个 Move 练习 - 学习 Sui 对象模型（Objects）！

// HINT: Sui 对象是具有 key 能力的结构体
// HINT: 每个 Sui 对象必须有一个 id: UID 字段
// HINT: 使用 object::new(ctx) 创建新的 UID
// HINT: 使用 transfer::transfer(obj, recipient) 转移对象所有权
// HINT: 使用 transfer::share_object(obj) 创建共享对象
// HINT: 使用 transfer::freeze_object(obj) 创建不可变对象
// HINT: 对象可以是拥有的（owned）、共享的（shared）或不可变的（immutable）
// TODO: 理解 Sui 对象模型的基本概念
// TODO: 学习对象的创建和初始化
// TODO: 掌握对象的所有权转移
// TODO: 了解共享对象和不可变对象
// 1. 学习对象的定义（必须有 key 能力和 id 字段）
// 2. 掌握对象的创建方法
// 3. 理解对象的所有权转移
// 4. 学习共享对象的创建
// 5. 了解对象的读取和修改
*/

/// Module: intro
module intro::intro {
    
    /// === 基本对象定义 ===
    
    /// 一个简单的 Sui 对象
    public struct MyObject has key {
        id: sui::object::UID,
        value: u64,
    }
    
    /// 创建对象
    public fun create_object(value: u64, ctx: &mut sui::tx_context::TxContext): MyObject {
        // TODO: 创建并返回 MyObject 实例
        // HINT: 使用 object::new(ctx) 创建新的 UID
        // HINT: 结构体字面量：MyObject { id: object::new(ctx), value }
        // 在此处填写代码
    }
    
    /// 获取对象的值
    public fun get_value(obj: &MyObject): u64 {
        // TODO: 返回对象的 value 字段
        // 在此处填写代码
    }
    
    /// 设置对象的值（需要可变引用）
    public fun set_value(obj: &mut MyObject, value: u64) {
        // TODO: 设置对象的 value 字段为新的值
        // 在此处填写代码
    }
    
    /// === 对象所有权转移 ===
    
    /// 转移对象所有权给指定地址
    public fun transfer_object(
        obj: MyObject,
        recipient: address,
        _ctx: &mut sui::tx_context::TxContext
    ) {
        // TODO: 使用 transfer::transfer 将对象转移给 recipient
        // HINT: transfer::transfer(obj, recipient)
        // HINT: entry 函数可以被直接调用
        // 在此处填写代码
    }
    
    /// 转移对象给交易发送者
    public fun transfer_to_sender(
        obj: MyObject,
        ctx: &mut sui::tx_context::TxContext
    ) {
        // TODO: 获取交易发送者并转移对象
        // HINT: 使用 tx_context::sender(ctx) 获取发送者地址
        // HINT: 使用 transfer::transfer 转移对象
        // 在此处填写代码
    }
    
    /// === 共享对象 ===
    
    /// 创建共享对象
    public fun share_object(
        obj: MyObject,
        ctx: &mut sui::tx_context::TxContext
    ) {
        // TODO: 使用 transfer::share_object 创建共享对象
        // HINT: 共享对象可以被多个账户访问
        // HINT: transfer::share_object(obj)
        // 避免 "possible owned object share"：在本函数中创建新对象并分享
        // 在此处填写代码
    }
    
    /// === 不可变对象 ===
    
    /// 创建不可变对象
    public fun freeze_object(
        obj: MyObject,
        _ctx: &mut sui::tx_context::TxContext
    ) {
        // TODO: 使用 transfer::freeze_object 创建不可变对象
        // HINT: 不可变对象不能被修改，但可以被所有人读取
        // HINT: transfer::freeze_object(obj)
        // 在此处填写代码
    }
    
    /// === 对象操作 ===
    
    /// 增加对象的值
    public fun increment_value(obj: &mut MyObject, amount: u64) {
        // TODO: 将对象的 value 增加 amount
        // HINT: obj.value = obj.value + amount
        // 在此处填写代码
    }
    
    /// 减少对象的值（带边界检查）
    public fun decrement_value(obj: &mut MyObject, amount: u64) {
        // TODO: 将对象的 value 减少 amount，但不能小于 0
        // HINT: 如果 value >= amount，则 value = value - amount
        // HINT: 否则 value = 0
        // 在此处填写代码
    }
    
    /// 获取对象 ID
    public fun get_id(obj: &MyObject): sui::object::ID {
        // TODO: 返回对象的 id
        // HINT: 返回 obj.id
        // 在此处填写代码
    }
    
    /// === 复合对象 ===
    
    /// 包含多个字段的对象
    public struct ComplexObject has key {
        id: sui::object::UID,
        counter: u64,
        name: vector<u8>,
        enabled: bool,
    }
    
    /// 创建复合对象
    public fun create_complex_object(
        counter: u64,
        name: vector<u8>,
        enabled: bool,
        ctx: &mut sui::tx_context::TxContext
    ): ComplexObject {
        // TODO: 创建并返回 ComplexObject 实例
        // HINT: 包含多个字段的对象
        // 在此处填写代码
    }
    
    /// 获取计数器值
    public fun get_counter(obj: &ComplexObject): u64 {
        // TODO: 返回 counter 字段
        // 在此处填写代码
    }
    
    /// 获取名称
    public fun get_name(obj: &ComplexObject): vector<u8> {
        // TODO: 返回 name 字段
        // HINT: 返回 *&obj.name 来获取值的副本，或者直接返回
        // 在此处填写代码
    }
    
    /// 检查是否启用
    public fun is_enabled(obj: &ComplexObject): bool {
        // TODO: 返回 enabled 字段
        // 在此处填写代码
    }
    
    /// 增加计数器
    public fun increment_counter(obj: &mut ComplexObject) {
        // TODO: 将 counter 字段加 1
        // 在此处填写代码
    }
    
    /// 切换启用状态
    public fun toggle_enabled(obj: &mut ComplexObject) {
        // TODO: 切换 enabled 字段的值
        // HINT: 如果当前是 true，设为 false；如果是 false，设为 true
        // 在此处填写代码
    }
    
    /// === 对象 ID 操作 ===
    
    /// 比较两个对象的 ID
    public fun compare_ids(obj1: &MyObject, obj2: &MyObject): bool {
        // TODO: 比较两个对象的 id 是否相等
        // HINT: 使用 object::id(obj) 获取对象的 ID
        // HINT: 使用 object::uid_to_address(&uid) 将 UID 转换为地址进行比较
        // 在此处填写代码
    }
    
    /// === 对象删除 ===
    
    /// 删除对象并返回其值
    public fun delete_object(obj: MyObject): u64 {
        // TODO: 删除对象并返回其 value
        // HINT: 使用 object::delete(id) 删除对象
        // HINT: 先提取 value，然后删除对象
        // 在此处填写代码
    }
    
    /// 帮助函数：销毁 MyObject
    public fun destroy_my_object(obj: MyObject) {
        let MyObject { id, value: _ } = obj;
        sui::object::delete(id);
    }
    
    /// 帮助函数：销毁 ComplexObject
    public fun destroy_complex_object(obj: ComplexObject) {
        let ComplexObject { id, counter: _, name: _, enabled: _ } = obj;
        sui::object::delete(id);
    }
}
