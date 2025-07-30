/*
这是您的第九个 Move 练习 - 学习 Move 能力系统（Abilities）！

// HINT: Move 有四种基本能力：Copy, Drop, Store, Key
// HINT: Copy - 允许值被复制
// HINT: Drop - 允许值被丢弃/销毁
// HINT: Store - 允许值被存储在结构中
// HINT: Key - 允许值作为对象使用（Sui 对象）
// TODO: 理解不同能力的作用
// TODO: 学习如何为结构体添加能力
// TODO: 掌握能力的组合使用
*/

/// Module: intro
module intro::intro {
    
    /// === Copy 能力：允许值被复制 ===
    
    /// 具有 Copy 能力的结构体（已提供）
    public struct CopyableData has copy, drop {
        value: u64,
    }
    
    /// 创建可复制的数据
    public fun create_copyable(value: u64): CopyableData {
        // TODO: 创建并返回 CopyableData 实例
        // HINT: 使用结构体字面量语法：CopyableData { value }
        
    }
    
    /// 演示复制能力
    public fun duplicate_data(data: CopyableData): (CopyableData, CopyableData) {
        // TODO: 返回两个相同的数据副本
        // HINT: 有 copy 能力的类型可以被多次使用：(data, data)
        
    }
    
    /// === Drop 能力：允许值被自动销毁 ===
    
    /// 具有 Drop 能力的结构体（已提供）
    public struct DroppableData has drop {
        info: vector<u8>,
    }
    
    /// 创建可丢弃的数据
    public fun create_droppable(info: vector<u8>): DroppableData {
        // TODO: 创建并返回 DroppableData 实例
        // HINT: DroppableData { info }
        
    }
    
    /// 演示条件性使用或丢弃
    public fun maybe_use_data(data: DroppableData, use_it: bool): vector<u8> {
        // TODO: 如果 use_it 为 true，解构 data 并返回 info
        // TODO: 否则让 data 被自动丢弃，返回空向量
        // HINT: 使用 if 表达式和结构体解构
        // HINT: 有 drop 能力的类型会在超出作用域时自动销毁
        
    }
    
    /// === Store 能力：允许值被存储 ===
    
    /// 具有 Store 能力的结构体（已提供）
    public struct StorableItem has store, drop {
        id: u64,
        name: vector<u8>,
    }
    
    /// 容器结构体（已提供）
    public struct Container has drop {
        items: vector<StorableItem>,
    }
    
    /// 创建可存储的项目
    public fun create_item(id: u64, name: vector<u8>): StorableItem {
        // TODO: 创建并返回 StorableItem 实例
        // HINT: StorableItem { id, name }
        
    }
    
    /// 创建空容器
    public fun create_container(): Container {
        // TODO: 创建并返回空的容器
        // HINT: Container { items: vector::empty() }
        
    }
    
    /// 向容器添加项目
    public fun add_item(container: &mut Container, item: StorableItem) {
        // TODO: 将项目添加到容器的 items 向量中
        // HINT: 使用 vector::push_back(&mut container.items, item)
        
    }
    
    /// 获取容器中的项目数量
    public fun get_item_count(container: &Container): u64 {
        // TODO: 返回容器中的项目数量
        // HINT: 使用 vector::length(&container.items)
        
    }
    
    /// === Key 能力：Sui 对象 ===
    
    /// 具有 Key 能力的对象（已提供）
    public struct MyObject has key {
        id: UID,
        data: u64,
    }
    
    /// 创建新的 Sui 对象
    public fun create_object(ctx: &mut TxContext): MyObject {
        // TODO: 创建新的 Sui 对象
        // HINT: 使用 object::new(ctx) 创建 UID
        // HINT: MyObject { id: object::new(ctx), data: 0 }
        
    }
    
    /// 更新对象的数据
    public fun update_object(obj: &mut MyObject, new_data: u64) {
        // TODO: 更新对象的 data 字段
        // HINT: obj.data = new_data;
        
    }
    
    /// 销毁对象并返回数据
    public fun delete_object(obj: MyObject): u64 {
        // TODO: 解构对象，删除 UID，返回数据
        // HINT: let MyObject { id, data } = obj;
        // HINT: object::delete(id);
        // HINT: 返回 data
        
    }
    
    /// === 无能力结构体 ===
    
    /// 没有任何能力的结构体（已提供）
    public struct NoAbilities {
        secret: u64,
    }
    
    /// 创建无能力结构体
    public fun create_secret(secret: u64): NoAbilities {
        // TODO: 创建并返回 NoAbilities 实例
        // HINT: NoAbilities { secret }
        // HINT: 这种结构体不能被复制、丢弃或存储
        
    }
    
    /// 手动销毁无能力结构体
    public fun reveal_secret(data: NoAbilities): u64 {
        // TODO: 手动解构结构体并返回秘密值
        // HINT: let NoAbilities { secret } = data;
        // HINT: 返回 secret
        // HINT: 必须手动解构，因为没有 drop 能力
        
    }
    
    /// === 能力约束的泛型函数 ===
    
    /// 复制具有 copy 能力的类型
    public fun copy_if_copyable<T: copy>(item: T): (T, T) {
        // TODO: 返回两个相同的项目
        // HINT: (item, item)
        // HINT: 只有具有 copy 能力的类型才能调用此函数
        
    }
    
    /// 存储具有 store 能力的类型
    public fun store_if_storable<T: store>(item: T): vector<T> {
        // TODO: 创建包含单个项目的向量
        // HINT: vector[item]
        // HINT: 只有具有 store 能力的类型才能被放入向量
        
    }
}