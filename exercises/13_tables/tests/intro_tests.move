/*
这是您的第十四个 Move 练习 - 学习表格（Tables）！

// HINT: Table 是 Move 中的键值映射数据结构
// HINT: 使用 sui::table 模块操作表格
// HINT: 表格支持动态添加和删除键值对
// HINT: 表格的键必须具有 copy + drop + store 能力
// TODO: 学习表格的创建和基本操作
// TODO: 掌握表格的增删改查
// TODO: 理解表格的生命周期管理
*/

/// Module: intro
module intro::intro {
    use sui::table::{Self, Table};
    
    /// === 基本表格操作 ===
    
    /// 修复1: 给 UserInfo 添加 drop 能力
    public struct UserInfo has store, drop {
        name: vector<u8>,
        age: u8,
    }
    
    /// 包含表格的容器
    public struct UserRegistry has key {
        id: UID,
        users: Table<u64, UserInfo>,  // ID -> 用户信息
    }
    
    /// 创建用户注册表
    public fun create_registry(ctx: &mut TxContext): UserRegistry {
        // TODO: 创建包含空表格的用户注册表
        // HINT: UserRegistry { id: object::new(ctx), users: table::new(ctx) }

    }
    
    /// 添加用户
    public fun add_user(registry: &mut UserRegistry, id: u64, name: vector<u8>, age: u8) {
        // TODO: 向表格中添加用户信息
        // HINT: let user_info = UserInfo { name, age };
        // HINT: table::add(&mut registry.users, id, user_info);

    }
    
    /// 检查用户是否存在
    public fun user_exists(registry: &UserRegistry, id: u64): bool {
        // TODO: 检查表格中是否存在指定 ID 的用户
        // HINT: table::contains(&registry.users, id)
    }
    
    /// 获取用户信息
    public fun get_user_name(registry: &UserRegistry, id: u64): vector<u8> {
        // TODO: 获取用户的姓名
        // HINT: table::borrow(&registry.users, id).name
    }
    
    /// 更新用户年龄
    public fun update_user_age(registry: &mut UserRegistry, id: u64, new_age: u8) {
        // TODO: 更新用户的年龄
        // HINT: let user = table::borrow_mut(&mut registry.users, id);
        // HINT: user.age = new_age;

    }
    
    /// 移除用户
    public fun remove_user(registry: &mut UserRegistry, id: u64) {
        // TODO: 从表格中移除用户
        // HINT: table::remove(&mut registry.users, id);
        // 修复2: 移除的值现在可以被丢弃，因为 UserInfo 有 drop 能力
    }
    
    /// 获取表格大小
    public fun get_user_count(registry: &UserRegistry): u64 {
        // TODO: 返回表格中用户的数量
        // HINT: table::length(&registry.users)
    }
    
    /// === 表格清理 ===
    
    /// 检查表格是否为空
    public fun is_empty(registry: &UserRegistry): bool {
        // TODO: 检查表格是否为空
        // HINT: table::is_empty(&registry.users)
    }
    
    /// 销毁空的用户注册表
    public fun destroy_empty_registry(registry: UserRegistry) {
        // TODO: 销毁包含空表格的注册表
        // HINT: let UserRegistry { id, users } = registry;
        // HINT: table::destroy_empty(users);
        // HINT: object::delete(id);

    }
    
    /// === 实用函数 ===
    
    /// 创建用户信息
    public fun create_user_info(name: vector<u8>, age: u8): UserInfo {
        // TODO: 创建用户信息结构体
        // HINT: UserInfo { name, age }
    }
    
    /// 获取用户年龄
    public fun get_user_age(registry: &UserRegistry, id: u64): u8 {
        // TODO: 获取用户的年龄
        // HINT: table::borrow(&registry.users, id).age
    }

}