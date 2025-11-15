/*
这是您的第十四个 Move 练习 - 学习表结构（Tables）！

// HINT: Table 是 Sui 中用于存储键值对的动态集合
// HINT: 使用 table::new(ctx) 创建新表
// HINT: 使用 table::add(table, key, value) 添加条目
// HINT: 使用 table::borrow(table, key) 获取不可变引用
// HINT: 使用 table::borrow_mut(table, key) 获取可变引用
// HINT: 使用 table::contains(table, key) 检查键是否存在
// HINT: 使用 table::remove(table, key) 移除条目
// HINT: 使用 table::length(table) 获取表大小
// HINT: 键类型必须有 copy + drop + store 能力
// HINT: 值类型必须有 store 能力
// TODO: 理解表的创建和初始化
// TODO: 掌握键值对的添加和访问
// TODO: 学习表的查找和修改操作
// TODO: 了解表的删除和大小查询
// 1. 学习表的创建方法
// 2. 掌握键值对的添加和访问
// 3. 理解表的查找操作
// 4. 学习表的修改和删除
// 5. 了解表的实际应用场景
*/

/// Module: intro
module intro::intro {
    use sui::table::{Self, Table};
    use sui::tx_context::{Self, TxContext};
    
    /// === 表的创建 ===
    
    /// 创建新表
    public fun create_table(ctx: &mut TxContext): Table<u64, u64> {
        // TODO: 使用 table::new 创建新表
        // HINT: table::new<键类型, 值类型>(ctx)
        
        table::new<u64, u64>(ctx)
    }
    
    /// 创建字符串表
    public fun create_string_table(ctx: &mut TxContext): Table<u64, vector<u8>> {
        // TODO: 创建键为 u64，值为 vector<u8> 的表
        
        table::new<u64, vector<u8>>(ctx)
    }
    
    /// === 表的添加操作 ===
    
    /// 添加条目
    public fun add_entry(
        table: &mut Table<u64, u64>,
        key: u64,
        value: u64
    ) {
        // TODO: 使用 table::add 添加键值对
        // HINT: table::add(table, key, value)
        
        table::add(table, key, value);
    }
    
    /// 添加多个条目
    public fun add_multiple_entries(
        table: &mut Table<u64, u64>,
        keys: vector<u64>,
        values: vector<u64>
    ) {
        // TODO: 遍历 keys 和 values 向量，添加多个条目
        // HINT: 使用 while 循环，同时遍历两个向量
        
        let i = 0;
        let len = vector::length(&keys);
        
        while (i < len) {
            let key = *vector::borrow(&keys, i);
            let value = *vector::borrow(&values, i);
            table::add(table, key, value);
            i = i + 1;
        };
    }
    
    /// === 表的查找操作 ===
    
    /// 获取值（不可变引用）
    public fun get_value(
        table: &Table<u64, u64>,
        key: u64
    ): &u64 {
        // TODO: 使用 table::borrow 获取值的不可变引用
        // HINT: table::borrow(table, key)
        
        table::borrow(table, key)
    }
    
    /// 获取值（可变引用）
    public fun get_value_mut(
        table: &mut Table<u64, u64>,
        key: u64
    ): &mut u64 {
        // TODO: 使用 table::borrow_mut 获取值的可变引用
        
        table::borrow_mut(table, key)
    }
    
    /// 检查键是否存在
    public fun contains_key(
        table: &Table<u64, u64>,
        key: u64
    ): bool {
        // TODO: 使用 table::contains 检查键是否存在
        
        table::contains(table, key)
    }
    
    /// === 表的修改操作 ===
    
    /// 更新值
    public fun update_value(
        table: &mut Table<u64, u64>,
        key: u64,
        new_value: u64
    ) {
        // TODO: 获取可变引用并更新值
        // HINT: 使用 table::borrow_mut 获取引用，然后赋值
        
        let value_ref = table::borrow_mut(table, key);
        *value_ref = new_value;
    }
    
    /// 增加值
    public fun increment_value(
        table: &mut Table<u64, u64>,
        key: u64,
        amount: u64
    ) {
        // TODO: 获取可变引用并将值增加 amount
        
        let value_ref = table::borrow_mut(table, key);
        *value_ref = *value_ref + amount;
    }
    
    /// === 表的删除操作 ===
    
    /// 移除条目
    public fun remove_entry(
        table: &mut Table<u64, u64>,
        key: u64
    ): u64 {
        // TODO: 使用 table::remove 移除条目并返回值
        
        table::remove(table, key)
    }
    
    /// === 表的查询操作 ===
    
    /// 获取表大小
    public fun get_size(table: &Table<u64, u64>): u64 {
        // TODO: 使用 table::length 获取表的大小
        
        table::length(table)
    }
    
    /// === 表的实用函数 ===
    
    /// 安全获取值（如果存在）
    public fun safe_get(
        table: &Table<u64, u64>,
        key: u64
    ): (bool, u64) {
        // TODO: 如果键存在，返回 (true, value)；否则返回 (false, 0)
        // HINT: 使用 table::contains 检查，然后使用 table::borrow 获取值
        
        if (table::contains(table, key)) {
            let value_ref = table::borrow(table, key);
            (true, *value_ref)
        } else {
            (false, 0)
        }
    }
    
    /// 插入或更新值
    public fun upsert(
        table: &mut Table<u64, u64>,
        key: u64,
        value: u64
    ) {
        // TODO: 如果键存在则更新，否则添加
        // HINT: 使用 table::contains 检查，然后决定是更新还是添加
        
        if (table::contains(table, key)) {
            let value_ref = table::borrow_mut(table, key);
            *value_ref = value;
        } else {
            table::add(table, key, value);
        };
    }
    
    /// 获取或插入默认值
    public fun get_or_insert(
        table: &mut Table<u64, u64>,
        key: u64,
        default_value: u64
    ): &u64 {
        // TODO: 如果键存在则返回值的引用，否则插入默认值并返回引用
        // HINT: 使用 table::contains 检查，然后决定是获取还是插入
        
        if (!table::contains(table, key)) {
            table::add(table, key, default_value);
        };
        table::borrow(table, key)
    }
    
    /// === 字符串表操作 ===
    
    /// 添加字符串条目
    public fun add_string_entry(
        table: &mut Table<u64, vector<u8>>,
        key: u64,
        value: vector<u8>
    ) {
        // TODO: 添加键值对到字符串表
        
        table::add(table, key, value);
    }
    
    /// 检查字符串表中的键是否存在
    public fun contains_key_string(
        table: &Table<u64, vector<u8>>,
        key: u64
    ): bool {
        // TODO: 使用 table::contains 检查键是否存在
        
        table::contains(table, key)
    }
    
    /// 获取字符串值
    public fun get_string_value(
        table: &Table<u64, vector<u8>>,
        key: u64
    ): &vector<u8> {
        // TODO: 获取字符串值的引用
        
        table::borrow(table, key)
    }
    
    /// 连接字符串值
    public fun append_to_string(
        table: &mut Table<u64, vector<u8>>,
        key: u64,
        suffix: vector<u8>
    ) {
        // TODO: 获取字符串值的可变引用，然后追加 suffix
        // HINT: 使用 vector::append 追加
        
        let value_ref = table::borrow_mut(table, key);
        vector::append(value_ref, suffix);
    }
}
