/*
这是您的第十八个 Move 练习 - 学习所有权(Ownership)！

// HINT: Move 中的所有权是内存安全的基础
// HINT: 每个值都有一个所有者，所有者负责清理值
// HINT: 值可以被移动(move)、借用(borrow)或复制(copy)
// HINT: 移动转移所有权，借用不转移所有权
// HINT: 具有 copy 能力的类型可以被隐式复制
// TODO: 理解值的移动语义
// TODO: 掌握引用和借用
// TODO: 学习所有权转移
*/

/// Module: intro
module intro::intro {
    
    /// === 基本所有权概念 ===
    
    /// 资源类型（不可复制）
    public struct Resource has drop {
        id: u64,
        value: vector<u8>,
    }
    
    /// 可复制类型
    public struct CopyableData has copy, drop {
        number: u64,
        flag: bool,
    }
    
    /// 创建资源
    public fun create_resource(id: u64, value: vector<u8>): Resource {
        // TODO: 创建一个资源实例
        // HINT: Resource { id, value }
    }
    
    /// 创建可复制数据
    public fun create_copyable_data(number: u64, flag: bool): CopyableData {
        // TODO: 创建可复制数据实例
        // HINT: CopyableData { number, flag }
    }
    
    /// === 值的移动 ===
    
    /// 移动资源（转移所有权）
    public fun move_resource(resource: Resource): Resource {
        // TODO: 将资源移动并返回
        // HINT: 直接返回 resource，这会转移所有权
    }
    
    /// 消费资源
    public fun consume_resource(resource: Resource): u64 {
        // TODO: 消费资源并返回其 ID
        // HINT: let Resource { id, value: _ } = resource; id

    }
    
    /// 移动向量
    public fun move_vector(vec: vector<u64>): vector<u64> {
        // TODO: 移动向量
        // HINT: 直接返回 vec
    }
    
    /// === 借用和引用 ===
    
    /// 不可变借用资源
    public fun borrow_resource_immutable(resource: &Resource): u64 {
        // TODO: 借用资源的 ID
        // HINT: resource.id
    }
    
    /// 可变借用资源
    public fun borrow_resource_mutable(resource: &mut Resource, new_value: vector<u8>) {
        // TODO: 修改资源的值
        // HINT: resource.value = new_value;
        resource.value = new_value;
    }
    
    /// 借用向量元素
    public fun borrow_vector_element(vec: &vector<u64>, index: u64): &u64 {
        // TODO: 借用向量中指定索引的元素
        // HINT: vector::borrow(vec, index)
    }
    
    /// 可变借用向量元素
    public fun borrow_vector_element_mut(vec: &mut vector<u64>, index: u64): &mut u64 {
        // TODO: 可变借用向量中指定索引的元素
        // HINT: vector::borrow_mut(vec, index)
    }
    
    /// === 复制语义 ===
    
    /// 复制可复制数据
    public fun copy_data(data: &CopyableData): CopyableData {
        // TODO: 复制数据
        // HINT: *data (解引用会触发复制)
    }
    
    /// 复制基础类型
    public fun copy_number(num: &u64): u64 {
        // TODO: 复制数字
        // HINT: *num
    }
    
    /// 使用复制数据（不转移所有权）
    public fun use_copyable_data(data: CopyableData): (u64, bool) {
        // TODO: 使用并返回数据的字段
        // HINT: (data.number, data.flag)
    }
    
    /// === 所有权转移模式 ===
    
    /// 交换两个资源的值
    public fun swap_resource_values(res1: &mut Resource, res2: &mut Resource) {
        // TODO: 交换两个资源的值字段
        // HINT: 使用临时变量或者 std::mem::swap（如果有的话）

    }
    
    /// 转移资源所有权到新结构
    public fun transfer_to_container(resource: Resource): ResourceContainer {
        // TODO: 将资源移动到容器中
        // HINT: ResourceContainer { inner: resource }
    }
    
    /// 资源容器
    public struct ResourceContainer has drop {
    }
    
    /// 从容器中提取资源
    public fun extract_from_container(container: ResourceContainer): Resource {
        // TODO: 从容器中提取资源
        // HINT: let ResourceContainer { inner } = container; inner

    }
    
    /// === 向量所有权操作 ===
    
    /// 添加元素到向量（移动语义）
    public fun add_to_vector(vec: &mut vector<Resource>, resource: Resource) {
        // TODO: 将资源添加到向量中
        // HINT: vector::push_back(vec, resource);
    }
    
    /// 从向量中移除元素
    public fun remove_from_vector(vec: &mut vector<Resource>): Resource {
        // TODO: 从向量末尾移除并返回元素
        // HINT: vector::pop_back(vec)
    }
    
    /// 移动整个向量
    public fun take_vector_ownership(vec: vector<Resource>): vector<Resource> {
        // TODO: 获取向量的所有权
        // HINT: 直接返回 vec
    }
    
    /// === 引用传递模式 ===
    
    /// 通过引用修改多个字段
    public fun modify_resource_fields(resource: &mut Resource, new_id: u64, new_value: vector<u8>) {
        // TODO: 修改资源的所有字段
        // HINT: resource.id = new_id; resource.value = new_value;

    }
    
    /// 比较两个资源（通过引用）
    public fun compare_resources(res1: &Resource, res2: &Resource): bool {
        // TODO: 比较两个资源的 ID 是否相等
        // HINT: res1.id == res2.id
    }
    
    /// 统计向量长度（不获取所有权）
    public fun count_vector_elements(vec: &vector<Resource>): u64 {
        // TODO: 返回向量的长度
        // HINT: vector::length(vec)
    }
    
    /// === 条件所有权转移 ===
    
    /// 根据条件返回资源或销毁
    public fun conditional_return(resource: Resource, should_return: bool): std::option::Option<Resource> {
        // TODO: 如果应该返回则返回 Some，否则销毁并返回 None
        // HINT: if (should_return) option::some(resource) else { drop(resource); option::none() }

    }
    
    /// 有条件的移动
    public fun conditional_move(resource: Resource, condition: bool): Resource {
        // TODO: 根据条件决定是否处理资源
        // HINT: if (condition) { /* 处理资源 */ resource } else resource

    }
    
    /// === 实际应用示例 ===
    
    /// 银行账户（资源类型）
    public struct BankAccount has drop {
        account_id: u64,
        balance: u64,
        owner: vector<u8>,
    }
    
    /// 创建银行账户
    public fun create_account(account_id: u64, initial_balance: u64, owner: vector<u8>): BankAccount {
        // TODO: 创建新的银行账户
        // HINT: BankAccount { account_id, balance: initial_balance, owner }
    }
    
    /// 转账（移动余额）
    public fun transfer(from: &mut BankAccount, to: &mut BankAccount, amount: u64) {
        // TODO: 从一个账户转账到另一个账户
        // HINT: from.balance = from.balance - amount; to.balance = to.balance + amount;

    }
    
    /// 关闭账户并返回余额
    public fun close_account(account: BankAccount): u64 {
        // TODO: 关闭账户并返回最终余额
        // HINT: let BankAccount { account_id: _, balance, owner: _ } = account; balance

    }
    
    /// 检查账户余额（不转移所有权）
    public fun check_balance(account: &BankAccount): u64 {
        // TODO: 返回账户余额
        // HINT: account.balance
    }
    
    /// 更新账户所有者
    public fun change_owner(account: &mut BankAccount, new_owner: vector<u8>) {
        // TODO: 更改账户所有者
        // HINT: account.owner = new_owner;
    }
}
