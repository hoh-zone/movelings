/*
这是您的第九个 Move 练习 - 学习 Move 能力系统（Abilities）！

// HINT: Move 有四种能力：copy, drop, store, key
// HINT: Copy 能力允许值被复制
// HINT: Drop 能力允许值被隐式丢弃
// HINT: Store 能力允许值存储在全局存储中
// HINT: Key 能力允许值作为全局存储的键（用于 Sui）
// HINT: 结构体可以组合多个能力：struct Name has copy, drop { ... }
// HINT: 泛型类型参数可以指定能力约束：fun foo<T: copy + drop>(x: T) { ... }
// TODO: 理解四种能力的含义和使用场景
// TODO: 学习如何为结构体添加能力
// TODO: 掌握能力约束在泛型中的应用
// TODO: 了解没有某些能力时的限制
// 1. 学习 Copy 能力的作用
// 2. 理解 Drop 能力的重要性
// 3. 掌握 Store 和 Key 能力的区别
// 4. 学习能力组合和约束规则
// 5. 了解能力对类型行为的影响
*/

/// Module: intro
module intro::intro {
    use std::string::String;
    
    /// === Copy 能力 ===
    
    /// 可复制的结构体
    public struct CopyableStruct has copy, drop {
        value: u64,
    }
    
    /// 创建可复制结构体
    public fun create_copyable(value: u64): CopyableStruct {
        // TODO: 创建并返回 CopyableStruct 实例
        // 在此处填写代码
    }
    
    /// 复制结构体
    public fun duplicate_copyable(s: CopyableStruct): (CopyableStruct, CopyableStruct) {
        // TODO: 返回 (s, s) - 因为有 copy 能力可以复制
        // HINT: 使用 *s 可以复制值，或者直接使用 s（Move 会自动复制）
        // 在此处填写代码
    }
    
    /// 在没有 copy 能力的情况下尝试复制会失败
    public struct NoCopyStruct has drop {
        value: u64,
    }
    
    /// 创建不可复制的结构体
    public fun create_no_copy(value: u64): NoCopyStruct {
        // TODO: 创建并返回 NoCopyStruct 实例
        // 在此处填写代码
    }
    
    /// 移动值（不是复制）
    public fun move_no_copy(s: NoCopyStruct): NoCopyStruct {
        // TODO: 直接返回 s（移动而不是复制）
        // 在此处填写代码
    }
    
    /// === Drop 能力 ===
    
    /// 可丢弃的结构体
    public struct DroppableStruct has copy, drop {
        name: String,
    }
    
    /// 创建可丢弃结构体
    public fun create_droppable(name: String): DroppableStruct {
        // TODO: 创建并返回 DroppableStruct 实例
        // 在此处填写代码
    }
    
    /// 函数结束时值会被自动丢弃
    public fun auto_drop(_s: DroppableStruct) {
        // TODO: 函数体可以为空，s 会在函数结束时被自动丢弃
        // HINT: 因为有 drop 能力，不需要显式销毁
        // 在此处填写代码
        // s 在这里会被自动丢弃
    }
    
    /// 没有 drop 能力的结构体
    public struct NoDropStruct has copy {
        value: u64,
    }
    
    /// 创建不可丢弃的结构体
    public fun create_no_drop(value: u64): NoDropStruct {
        // TODO: 创建并返回 NoDropStruct 实例
        // 在此处填写代码
    }
    
    /// 必须显式返回或销毁
    public fun must_return(s: NoDropStruct): NoDropStruct {
        // TODO: 必须返回 s，不能丢弃
        // 在此处填写代码
    }
    
    /// === Store 能力 ===
    
    /// 可存储的结构体（所有字段都必须是 store）
    public struct StorableStruct has store {
        value: u64,
        name: String,
    }
    
    /// 创建可存储结构体
    public fun create_storable(value: u64, name: String): StorableStruct {
        // TODO: 创建并返回 StorableStruct 实例
        // 在此处填写代码
    }
    
    /// === Key 能力 ===
    
    /// 具有 Key 能力的结构体（用于 Sui 对象）
    public struct KeyStruct has key {
        id: sui::object::UID,
        value: u64,
    }
    
    /// 创建 Key 结构体（需要 UID）
    public fun create_key(ctx: &mut sui::tx_context::TxContext, value: u64): KeyStruct {
        // TODO: 创建并返回 KeyStruct 实例
        // HINT: Key 能力通常用于 Sui 对象，必须有一个 id: UID 字段
        // 在此处填写代码
    }
    
    /// === 能力组合 ===
    
    /// 具有多个能力的结构体
    public struct Coin has copy, drop, store {
        value: u64,
    }
    
    /// 创建硬币
    public fun create_coin(value: u64): Coin {
        // TODO: 创建并返回 Coin 实例
        // 在此处填写代码
    }
    
    /// === 泛型能力约束 ===
    
    /// 函数接受有 copy 能力的类型
    public fun duplicate<T: copy + drop>(item: T): (T, T) {
        // TODO: 返回 (item, item) - T 必须有 copy 能力
        // HINT: 能力约束 <T: copy + drop> 表示 T 必须同时有 copy 和 drop 能力
        // 在此处填写代码
    }
    
    /// 函数接受有 drop 能力的类型
    public fun consume<T: drop>(_item: T) {
        // TODO: 函数体可以为空，item 会被自动丢弃
        // HINT: T 必须有 drop 能力才能在函数结束时被丢弃
        // 在此处填写代码
        // item 在这里会被自动丢弃
    }
    
    /// 函数接受有 store 能力的类型
    public fun store_item<T: store>(item: T): T {
        // TODO: 直接返回 item
        // HINT: 因为有 store 能力，可以存储在全局存储中（这里只是返回）
        // 在此处填写代码
    }
    
    /// === 能力约束的组合 ===
    
    /// 接受有 copy 和 drop 能力的类型
    public fun copy_and_drop<T: copy + drop>(item: T): T {
        // TODO: 返回 item 的副本
        // HINT: 先复制 item，然后丢弃原始值，返回副本
        // HINT: 使用 (item, item) 可以同时获取两个副本
        // 在此处填写代码
    }
    
    /// === 没有能力的限制 ===
    
    /// 资源类型（没有 copy 和 drop）
    public struct Resource has store {
        value: u64,
    }
    
    /// 创建资源
    public fun create_resource(value: u64): Resource {
        // TODO: 创建并返回 Resource 实例
        // 在此处填写代码
    }
    
    /// 获取资源值（需要解构）
    public fun extract_resource(r: Resource): u64 {
        // TODO: 解构 Resource 并返回 value
        // HINT: Resource 没有 drop 能力，必须通过解构来销毁
        // 在此处填写代码
    }
    
    /// === 测试不同能力组合 ===
    
    /// 测试 copy 能力
    public fun test_copy() {
        let coin = create_coin(100);
        let (coin1, coin2) = duplicate(coin);  // 可以复制
        consume(coin1);
        consume(coin2);
    }
    
    /// 测试 drop 能力
    public fun test_drop() {
        let coin = create_coin(50);
        consume(coin);  // 可以丢弃
    }
    
    /// 测试 copy_and_drop
    public fun test_copy_and_drop() {
        let coin = create_coin(75);
        let copied = copy_and_drop(coin);
        consume(copied);
    }
    
    /// 释放 NoDropStruct，避免在调用端留下无 drop 的值
    public fun destroy_no_drop(s: NoDropStruct): u64 {
        let NoDropStruct { value } = s;
        value
    }
    
    /// 释放 StorableStruct，返回内部字段，避免无 drop 值遗留
    public fun destroy_storable(s: StorableStruct): (u64, String) {
        let StorableStruct { value, name } = s;
        (value, name)
    }
    
    /// 销毁 KeyStruct，对应删除其 UID 对象
    public fun destroy_key(obj: KeyStruct) {
        let KeyStruct { id, value: _ } = obj;
        sui::object::delete(id);
    }
}
