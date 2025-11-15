#[test_only]
module intro::intro_tests {
    use sui::table::{Self, Table};
    use sui::tx_context::{Self, TxContext};
    use intro::intro;

    #[test]
    fun test_create_table() {
        let mut ctx = tx_context::dummy();
        let table = intro::create_table(&mut ctx);
        assert!(intro::get_size(&table) == 0, 1);
        // 表在测试结束时自动销毁
    }

    #[test]
    fun test_create_string_table() {
        let mut ctx = tx_context::dummy();
        let table = intro::create_string_table(&mut ctx);
        // 测试创建成功
    }

    #[test]
    fun test_add_entry() {
        let mut ctx = tx_context::dummy();
        let mut table = intro::create_table(&mut ctx);
        intro::add_entry(&mut table, 1, 100);
        assert!(intro::get_size(&table) == 1, 2);
        assert!(*intro::get_value(&table, 1) == 100, 3);
    }

    #[test]
    fun test_add_multiple_entries() {
        let mut ctx = tx_context::dummy();
        let mut table = intro::create_table(&mut ctx);
        let keys = vector[1, 2, 3];
        let values = vector[10, 20, 30];
        intro::add_multiple_entries(&mut table, keys, values);
        assert!(intro::get_size(&table) == 3, 4);
        assert!(*intro::get_value(&table, 1) == 10, 5);
        assert!(*intro::get_value(&table, 2) == 20, 6);
    }

    #[test]
    fun test_get_value() {
        let mut ctx = tx_context::dummy();
        let mut table = intro::create_table(&mut ctx);
        intro::add_entry(&mut table, 5, 50);
        let value = intro::get_value(&table, 5);
        assert!(*value == 50, 7);
    }

    #[test]
    fun test_get_value_mut() {
        let mut ctx = tx_context::dummy();
        let mut table = intro::create_table(&mut ctx);
        intro::add_entry(&mut table, 10, 100);
        let value_ref = intro::get_value_mut(&mut table, 10);
        assert!(*value_ref == 100, 8);
    }

    #[test]
    fun test_contains_key() {
        let mut ctx = tx_context::dummy();
        let mut table = intro::create_table(&mut ctx);
        intro::add_entry(&mut table, 1, 10);
        assert!(intro::contains_key(&table, 1), 9);
        assert!(intro::contains_key(&table, 2) == false, 10);
    }

    #[test]
    fun test_update_value() {
        let mut ctx = tx_context::dummy();
        let mut table = intro::create_table(&mut ctx);
        intro::add_entry(&mut table, 1, 10);
        intro::update_value(&mut table, 1, 20);
        assert!(*intro::get_value(&table, 1) == 20, 11);
    }

    #[test]
    fun test_increment_value() {
        let mut ctx = tx_context::dummy();
        let mut table = intro::create_table(&mut ctx);
        intro::add_entry(&mut table, 1, 10);
        intro::increment_value(&mut table, 1, 5);
        assert!(*intro::get_value(&table, 1) == 15, 12);
    }

    #[test]
    fun test_remove_entry() {
        let mut ctx = tx_context::dummy();
        let mut table = intro::create_table(&mut ctx);
        intro::add_entry(&mut table, 1, 100);
        let value = intro::remove_entry(&mut table, 1);
        assert!(value == 100, 13);
        assert!(intro::get_size(&table) == 0, 14);
        assert!(intro::contains_key(&table, 1) == false, 15);
    }

    #[test]
    fun test_get_size() {
        let mut ctx = tx_context::dummy();
        let mut table = intro::create_table(&mut ctx);
        assert!(intro::get_size(&table) == 0, 16);
        intro::add_entry(&mut table, 1, 10);
        assert!(intro::get_size(&table) == 1, 17);
        intro::add_entry(&mut table, 2, 20);
        assert!(intro::get_size(&table) == 2, 18);
    }

    #[test]
    fun test_safe_get() {
        let mut ctx = tx_context::dummy();
        let mut table = intro::create_table(&mut ctx);
        intro::add_entry(&mut table, 1, 42);
        
        let (exists1, value1) = intro::safe_get(&table, 1);
        assert!(exists1, 19);
        assert!(value1 == 42, 20);
        
        let (exists2, value2) = intro::safe_get(&table, 999);
        assert!(exists2 == false, 21);
        assert!(value2 == 0, 22);
    }

    #[test]
    fun test_upsert() {
        let mut ctx = tx_context::dummy();
        let mut table = intro::create_table(&mut ctx);
        
        // 插入新值
        intro::upsert(&mut table, 1, 10);
        assert!(*intro::get_value(&table, 1) == 10, 23);
        
        // 更新已存在的值
        intro::upsert(&mut table, 1, 20);
        assert!(*intro::get_value(&table, 1) == 20, 24);
    }

    #[test]
    fun test_get_or_insert() {
        let mut ctx = tx_context::dummy();
        let mut table = intro::create_table(&mut ctx);
        
        // 键不存在，插入默认值
        let value1 = intro::get_or_insert(&mut table, 1, 100);
        assert!(*value1 == 100, 25);
        
        // 键已存在，返回现有值
        intro::add_entry(&mut table, 2, 200);
        let value2 = intro::get_or_insert(&mut table, 2, 300);
        assert!(*value2 == 200, 26);
    }

    #[test]
    fun test_add_string_entry() {
        let mut ctx = tx_context::dummy();
        let mut table = intro::create_string_table(&mut ctx);
        intro::add_string_entry(&mut table, 1, b"hello");
        assert!(intro::contains_key_string(&table, 1), 27);
    }

    #[test]
    fun test_get_string_value() {
        let mut ctx = tx_context::dummy();
        let mut table = intro::create_string_table(&mut ctx);
        intro::add_string_entry(&mut table, 1, b"test");
        let value = intro::get_string_value(&table, 1);
        assert!(*value == b"test", 28);
    }

    #[test]
    fun test_append_to_string() {
        let mut ctx = tx_context::dummy();
        let mut table = intro::create_string_table(&mut ctx);
        intro::add_string_entry(&mut table, 1, b"hello");
        intro::append_to_string(&mut table, 1, b", world");
        let value = intro::get_string_value(&table, 1);
        assert!(*value == b"hello, world", 29);
    }
}
