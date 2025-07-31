/*
这是您的第十个 Move 练习 - 学习 Sui 对象系统！

// HINT: Sui 对象必须有 key 能力和 UID 字段
// HINT: 使用 transfer::transfer 转移对象给特定地址
// HINT: 使用 transfer::share_object 共享对象
// HINT: 使用 transfer::freeze_object 冻结对象为不可变
// TODO: 创建和管理 Sui 对象
// TODO: 理解对象的转移、共享、冻结
// TODO: 掌握对象的生命周期管理
*/

/// Module: intro  
module intro::intro {
    use sui::dynamic_field;
    
    /// === 基本对象 ===
    
    /// 简单的 Sui 对象
    public struct SimpleObject has key {
        id: UID,
        value: u64,
    }
    
    /// 创建简单对象
    public fun create_simple_object(value: u64, ctx: &mut TxContext): SimpleObject {
        // TODO: 创建具有 UID 的对象
        // HINT: 使用 object::new(ctx) 创建 UID
        // HINT: SimpleObject { id: object::new(ctx), value }
    }
    
    /// 转移对象给指定地址
    public fun transfer_object(obj: SimpleObject, recipient: address) {
        // TODO: 将对象转移给 recipient
        // HINT: 使用 transfer::transfer(obj, recipient)
    }
    
    /// 更新对象的值
    public fun update_object(obj: &mut SimpleObject, new_value: u64) {
        // TODO: 更新对象的 value 字段
        // HINT: obj.value = new_value;
    }
    
    /// 删除对象
    public fun delete_object(obj: SimpleObject) {
        // TODO: 解构对象并删除 UID
        // HINT: let SimpleObject { id, value: _ } = obj;
        // HINT: object::delete(id);

    }
    
    /// === 共享对象 ===
    
    /// 可共享的计数器对象
    public struct SharedCounter has key {
        id: UID,
        count: u64,
    }
    
    /// 创建共享计数器
    public fun create_shared_counter(ctx: &mut TxContext) {
        // TODO: 创建计数器并立即共享
        // HINT: 先创建对象，然后使用 transfer::share_object
        let counter = SharedCounter {
            id: object::new(ctx),
            count: 0,
        };
        // TODO: 共享这个对象

    }
    
    /// 增加共享计数器
    public fun increment_counter(counter: &mut SharedCounter) {
        // TODO: 增加计数器的值
        // HINT: counter.count = counter.count + 1;
    }
    
    /// 获取计数器的值
    public fun get_counter_value(counter: &SharedCounter): u64 {
        // TODO: 返回计数器的当前值
        // HINT: counter.count
    }
    
    /// === 不可变对象 ===
    
    /// 配置对象
    public struct Config has key {
        id: UID,
        settings: vector<u8>,
    }
    
    /// 创建并冻结配置对象
    public fun create_frozen_config(settings: vector<u8>, ctx: &mut TxContext) {
        // TODO: 创建配置对象并冻结为不可变
        // HINT: 先创建对象，然后使用 transfer::freeze_object

    }
    
    /// 读取配置
    public fun read_config(config: &Config): vector<u8> {
        // TODO: 返回配置的设置
        // HINT: config.settings
    }
    
    /// === 包装对象 ===
    
    /// 包装其他对象的容器
    public struct Wrapper<T: store> has key {
        id: UID,
        inner: T,
    }
    
    /// 包装一个对象
    public fun wrap_object<T: store>(obj: T, ctx: &mut TxContext): Wrapper<T> {
        // TODO: 创建包装对象
        // HINT: Wrapper { id: object::new(ctx), inner: obj }
    }
    
    /// 解包对象
    public fun unwrap_object<T: store>(wrapper: Wrapper<T>): T {
        // TODO: 解构包装并返回内部对象
        // HINT: let Wrapper { id, inner } = wrapper;
        // HINT: object::delete(id);
        // HINT: 返回 inner

    }
    
    /// 访问包装的对象
    public fun borrow_wrapped<T: store>(wrapper: &Wrapper<T>): &T {
        // TODO: 返回内部对象的引用
        // HINT: &wrapper.inner
    }
    
    /// === 动态字段 ===
    
    /// 带有动态字段的对象
    public struct Container has key {
        id: UID,
    }
    
    /// 创建容器对象
    public fun create_container(ctx: &mut TxContext): Container {
        // TODO: 创建空的容器对象
        // HINT: Container { id: object::new(ctx) }
    }
    
    /// 添加动态字段
    public fun add_dynamic_field<T: store>(container: &mut Container, name: vector<u8>, value: T) {
        // TODO: 添加动态字段到容器
        // HINT: 使用 dynamic_field::add(&mut container.id, name, value)
    }
    
    /// 获取动态字段
    public fun get_dynamic_field<T: store + copy>(container: &Container, name: vector<u8>): T {
        // TODO: 获取动态字段的值
        // HINT: 使用 dynamic_field::borrow(&container.id, name)
        // HINT: 需要解引用：*dynamic_field::borrow(&container.id, name)
    }
    
    /// 移除动态字段
    public fun remove_dynamic_field<T: store>(container: &mut Container, name: vector<u8>): T {
        // TODO: 移除并返回动态字段的值
        // HINT: 使用 dynamic_field::remove(&mut container.id, name)
    }

}