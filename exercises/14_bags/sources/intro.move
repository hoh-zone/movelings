/*
这是您的第十五个 Move 练习 - 学习动态字段包（Bags）！

// HINT: Bag 是 Move 中可以存储不同类型值的动态容器
// HINT: 使用 sui::bag 模块操作动态字段包
// HINT: Bag 支持异构数据存储，键值可以是不同类型
// HINT: Bag 的键必须具有 copy + drop + store 能力
// TODO: 学习 Bag 的创建和基本操作
// TODO: 掌握异构数据的存储和访问
// TODO: 理解 Bag 与 Table 的区别
*/

/// Module: intro
module intro::intro {
    use sui::bag::{Self, Bag};
    
    /// === 基本动态字段包操作 ===
    
    /// 包含动态字段包的容器
    public struct DataStore has key {
        id: UID,
        data: Bag,  // 可以存储不同类型的数据
    }
    
    /// 创建数据存储
    public fun create_store(ctx: &mut TxContext): DataStore {
        // TODO: 创建包含空 Bag 的数据存储
        // HINT: DataStore { id: object::new(ctx), data: bag::new(ctx) }
        
    }
    
    /// 添加字符串数据
    public fun add_string(store: &mut DataStore, key: vector<u8>, value: vector<u8>) {
        // TODO: 向 Bag 中添加字符串数据
        // HINT: bag::add(&mut store.data, key, value);
    }
    
    /// 添加数字数据
    public fun add_number(store: &mut DataStore, key: vector<u8>, value: u64) {
        // TODO: 向 Bag 中添加数字数据
        // HINT: bag::add(&mut store.data, key, value);
    }
    
    /// 检查键是否存在
    public fun contains_key(store: &DataStore, key: vector<u8>): bool {
        // TODO: 检查 Bag 中是否存在指定键
        // HINT: bag::contains(&store.data, key)
    }
    
    /// 获取字符串数据
    public fun get_string(store: &DataStore, key: vector<u8>): vector<u8> {
        // TODO: 从 Bag 中获取字符串数据
        // HINT: *bag::borrow<vector<u8>, vector<u8>>(&store.data, key)
    }
    
    /// 获取数字数据
    public fun get_number(store: &DataStore, key: vector<u8>): u64 {
        // TODO: 从 Bag 中获取数字数据
        // HINT: *bag::borrow<vector<u8>, u64>(&store.data, key)
    }
    
    /// 更新字符串数据
    public fun update_string(store: &mut DataStore, key: vector<u8>, new_value: vector<u8>) {
        // TODO: 更新 Bag 中的字符串数据
        // HINT: let data = bag::borrow_mut<vector<u8>, vector<u8>>(&mut store.data, key);
        // HINT: *data = new_value;

    }
    
    /// 移除数据
    public fun remove_data<T: store>(store: &mut DataStore, key: vector<u8>): T {
        // TODO: 从 Bag 中移除指定类型的数据
        // HINT: bag::remove<vector<u8>, T>(&mut store.data, key)
        
    }
    
    /// === Bag 属性 ===
    
    /// 获取 Bag 大小
    public fun get_size(store: &DataStore): u64 {
        // TODO: 返回 Bag 中元素的数量
        // HINT: bag::length(&store.data)
        
    }
    
    /// 检查 Bag 是否为空
    public fun is_empty(store: &DataStore): bool {
        // TODO: 检查 Bag 是否为空
        // HINT: bag::is_empty(&store.data)
    }
    
    /// === Bag 清理 ===
    
    /// 销毁空的数据存储
    public fun destroy_empty_store(store: DataStore) {
        // TODO: 销毁包含空 Bag 的数据存储
        // HINT: let DataStore { id, data } = store;
        // HINT: bag::destroy_empty(data);
        // HINT: object::delete(id);

    }
    
    /// === 实用函数 ===
    
    /// 添加用户信息（结构体类型）
    public struct UserProfile has store, drop {
        name: vector<u8>,
        age: u8,
    }
    
    /// 创建用户配置文件
    public fun create_profile(name: vector<u8>, age: u8): UserProfile {
        // TODO: 创建用户配置文件
        // HINT: UserProfile { name, age }
        
    }
    
    /// 添加用户配置文件到 Bag
    public fun add_profile(store: &mut DataStore, key: vector<u8>, profile: UserProfile) {
        // TODO: 向 Bag 中添加用户配置文件
        // HINT: bag::add(&mut store.data, key, profile);
    }
    
    /// 获取用户配置文件
    public fun get_profile(store: &DataStore, key: vector<u8>): &UserProfile {
        // TODO: 从 Bag 中获取用户配置文件的引用
        // HINT: bag::borrow<vector<u8>, UserProfile>(&store.data, key)
    }

}