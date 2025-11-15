/*
这是您的第十五个 Move 练习 - 学习包结构（Bags）！

// HINT: Bag 是 Sui 中的异构集合，可以存储不同类型的值
// HINT: 使用 bag::new(ctx) 创建新 Bag
// HINT: 使用 bag::add(bag, value) 添加值
// HINT: 使用 bag::borrow<T>(bag) 获取不可变引用
// HINT: 使用 bag::borrow_mut<T>(bag) 获取可变引用
// HINT: 使用 bag::contains<T>(bag) 检查类型是否存在
// HINT: 使用 bag::remove<T>(bag) 移除值
// HINT: 使用 bag::size(bag) 获取 Bag 大小
// HINT: 值类型必须有 store 能力
// HINT: 通过类型参数 <T> 指定要访问的类型
// TODO: 理解 Bag 的创建和使用
// TODO: 学习异构值的存储
// TODO: 掌握类型化的值访问
// TODO: 了解 Bag 与 Table 的区别
// 1. 学习 Bag 的创建方法
// 2. 掌握异构值的存储
// 3. 理解类型化的值访问
// 4. 学习 Bag 的修改和删除
// 5. 了解 Bag 的实际应用场景
*/

/// Module: intro
module intro::intro {
    use sui::bag::{Self, Bag};
    use sui::tx_context::{Self, TxContext};
    
    /// === Bag 的创建 ===
    
    /// 创建新 Bag
    public fun create_bag(ctx: &mut TxContext): Bag {
        // TODO: 使用 bag::new 创建新 Bag
        
        bag::new(ctx)
    }
    
    /// === 添加值到 Bag ===
    
    /// 添加 u64 值
    public fun add_u64(bag: &mut Bag, value: u64) {
        // TODO: 使用 bag::add 添加 u64 值
        // HINT: bag::add(bag, value)
        
        bag::add(bag, value);
    }
    
    /// 添加字符串值
    public fun add_string(bag: &mut Bag, value: vector<u8>) {
        // TODO: 添加 vector<u8> 值到 Bag
        
        bag::add(bag, value);
    }
    
    /// 添加多个不同类型的值
    public fun add_multiple_types(
        bag: &mut Bag,
        num: u64,
        text: vector<u8>
    ) {
        // TODO: 添加 u64 和 vector<u8> 到 Bag
        
        bag::add(bag, num);
        bag::add(bag, text);
    }
    
    /// === 从 Bag 获取值 ===
    
    /// 获取 u64 值（不可变引用）
    public fun get_u64(bag: &Bag): &u64 {
        // TODO: 使用 bag::borrow 获取 u64 的不可变引用
        // HINT: bag::borrow<u64>(bag)
        
        bag::borrow<u64>(bag)
    }
    
    /// 获取 u64 值（可变引用）
    public fun get_u64_mut(bag: &mut Bag): &mut u64 {
        // TODO: 使用 bag::borrow_mut 获取 u64 的可变引用
        
        bag::borrow_mut<u64>(bag)
    }
    
    /// 获取字符串值
    public fun get_string(bag: &Bag): &vector<u8> {
        // TODO: 获取 vector<u8> 的不可变引用
        
        bag::borrow<vector<u8>>(bag)
    }
    
    /// === 检查 Bag 中的类型 ===
    
    /// 检查是否包含 u64
    public fun contains_u64(bag: &Bag): bool {
        // TODO: 使用 bag::contains 检查是否包含 u64 类型
        
        bag::contains<u64>(bag)
    }
    
    /// 检查是否包含字符串
    public fun contains_string(bag: &Bag): bool {
        // TODO: 检查是否包含 vector<u8> 类型
        
        bag::contains<vector<u8>>(bag)
    }
    
    /// === 修改 Bag 中的值 ===
    
    /// 更新 u64 值
    public fun update_u64(bag: &mut Bag, new_value: u64) {
        // TODO: 获取 u64 的可变引用并更新值
        
        let value_ref = bag::borrow_mut<u64>(bag);
        *value_ref = new_value;
    }
    
    /// 增加 u64 值
    public fun increment_u64(bag: &mut Bag, amount: u64) {
        // TODO: 获取 u64 的可变引用并增加 amount
        
        let value_ref = bag::borrow_mut<u64>(bag);
        *value_ref = *value_ref + amount;
    }
    
    /// 追加字符串
    public fun append_string(bag: &mut Bag, suffix: vector<u8>) {
        // TODO: 获取 vector<u8> 的可变引用并追加 suffix
        // HINT: 使用 vector::append
        
        let string_ref = bag::borrow_mut<vector<u8>>(bag);
        vector::append(string_ref, suffix);
    }
    
    /// === 从 Bag 移除值 ===
    
    /// 移除 u64 值
    public fun remove_u64(bag: &mut Bag): u64 {
        // TODO: 使用 bag::remove 移除并返回 u64 值
        
        bag::remove<u64>(bag)
    }
    
    /// 移除字符串值
    public fun remove_string(bag: &mut Bag): vector<u8> {
        // TODO: 移除并返回 vector<u8> 值
        
        bag::remove<vector<u8>>(bag)
    }
    
    /// === 查询 Bag ===
    
    /// 获取 Bag 大小
    public fun get_size(bag: &Bag): u64 {
        // TODO: 使用 bag::size 获取 Bag 的大小
        
        bag::size(bag)
    }
    
    /// === 实用函数 ===
    
    /// 安全获取 u64（如果存在）
    public fun safe_get_u64(bag: &Bag): (bool, u64) {
        // TODO: 如果包含 u64，返回 (true, value)；否则返回 (false, 0)
        // HINT: 使用 bag::contains 检查，然后使用 bag::borrow 获取值
        
        if (bag::contains<u64>(bag)) {
            let value_ref = bag::borrow<u64>(bag);
            (true, *value_ref)
        } else {
            (false, 0)
        }
    }
    
    /// 获取或插入默认 u64 值
    public fun get_or_insert_u64(
        bag: &mut Bag,
        default_value: u64
    ): &u64 {
        // TODO: 如果包含 u64 则返回引用，否则插入默认值并返回引用
        
        if (!bag::contains<u64>(bag)) {
            bag::add(bag, default_value);
        };
        bag::borrow<u64>(bag)
    }
    
    /// === 结构体在 Bag 中 ===
    
    /// 可存储在 Bag 中的结构体
    struct Item has store {
        id: u64,
        name: vector<u8>,
    }
    
    /// 添加 Item 到 Bag
    public fun add_item(bag: &mut Bag, item: Item) {
        // TODO: 添加 Item 到 Bag
        
        bag::add(bag, item);
    }
    
    /// 获取 Item
    public fun get_item(bag: &Bag): &Item {
        // TODO: 获取 Item 的不可变引用
        
        bag::borrow<Item>(bag)
    }
    
    /// 获取 Item 的可变引用
    public fun get_item_mut(bag: &mut Bag): &mut Item {
        // TODO: 获取 Item 的可变引用
        
        bag::borrow_mut<Item>(bag)
    }
    
    /// 更新 Item 的名称
    public fun update_item_name(
        bag: &mut Bag,
        new_name: vector<u8>
    ) {
        // TODO: 获取 Item 的可变引用并更新 name 字段
        
        let item_ref = bag::borrow_mut<Item>(bag);
        item_ref.name = new_name;
    }
    
    /// 创建 Item
    public fun create_item(id: u64, name: vector<u8>): Item {
        // TODO: 创建并返回 Item 实例
        
        Item { id, name }
    }
}
