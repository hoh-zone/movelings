#[test_only]
module intro::intro_tests {
    use sui::bag::{Self, Bag};
    use sui::tx_context::{Self, TxContext};
    use intro::intro;

    #[test]
    fun test_create_bag() {
        let mut ctx = tx_context::dummy();
        let bag = intro::create_bag(&mut ctx);
        assert!(intro::get_size(&bag) == 0, 1);
    }

    #[test]
    fun test_add_u64() {
        let mut ctx = tx_context::dummy();
        let mut bag = intro::create_bag(&mut ctx);
        intro::add_u64(&mut bag, 42);
        assert!(intro::get_size(&bag) == 1, 2);
        assert!(intro::contains_u64(&bag), 3);
    }

    #[test]
    fun test_add_string() {
        let mut ctx = tx_context::dummy();
        let mut bag = intro::create_bag(&mut ctx);
        intro::add_string(&mut bag, b"hello");
        assert!(intro::get_size(&bag) == 1, 4);
        assert!(intro::contains_string(&bag), 5);
    }

    #[test]
    fun test_add_multiple_types() {
        let mut ctx = tx_context::dummy();
        let mut bag = intro::create_bag(&mut ctx);
        intro::add_multiple_types(&mut bag, 100, b"test");
        assert!(intro::get_size(&bag) == 2, 6);
        assert!(intro::contains_u64(&bag), 7);
        assert!(intro::contains_string(&bag), 8);
    }

    #[test]
    fun test_get_u64() {
        let mut ctx = tx_context::dummy();
        let mut bag = intro::create_bag(&mut ctx);
        intro::add_u64(&mut bag, 50);
        let value = intro::get_u64(&bag);
        assert!(*value == 50, 9);
    }

    #[test]
    fun test_get_u64_mut() {
        let mut ctx = tx_context::dummy();
        let mut bag = intro::create_bag(&mut ctx);
        intro::add_u64(&mut bag, 10);
        let value_ref = intro::get_u64_mut(&mut bag);
        assert!(*value_ref == 10, 10);
    }

    #[test]
    fun test_get_string() {
        let mut ctx = tx_context::dummy();
        let mut bag = intro::create_bag(&mut ctx);
        intro::add_string(&mut bag, b"test");
        let value = intro::get_string(&bag);
        assert!(*value == b"test", 11);
    }

    #[test]
    fun test_contains_u64() {
        let mut ctx = tx_context::dummy();
        let mut bag = intro::create_bag(&mut ctx);
        assert!(intro::contains_u64(&bag) == false, 12);
        intro::add_u64(&mut bag, 42);
        assert!(intro::contains_u64(&bag), 13);
    }

    #[test]
    fun test_contains_string() {
        let mut ctx = tx_context::dummy();
        let mut bag = intro::create_bag(&mut ctx);
        assert!(intro::contains_string(&bag) == false, 14);
        intro::add_string(&mut bag, b"test");
        assert!(intro::contains_string(&bag), 15);
    }

    #[test]
    fun test_update_u64() {
        let mut ctx = tx_context::dummy();
        let mut bag = intro::create_bag(&mut ctx);
        intro::add_u64(&mut bag, 10);
        intro::update_u64(&mut bag, 20);
        assert!(*intro::get_u64(&bag) == 20, 16);
    }

    #[test]
    fun test_increment_u64() {
        let mut ctx = tx_context::dummy();
        let mut bag = intro::create_bag(&mut ctx);
        intro::add_u64(&mut bag, 5);
        intro::increment_u64(&mut bag, 3);
        assert!(*intro::get_u64(&bag) == 8, 17);
    }

    #[test]
    fun test_append_string() {
        let mut ctx = tx_context::dummy();
        let mut bag = intro::create_bag(&mut ctx);
        intro::add_string(&mut bag, b"hello");
        intro::append_string(&mut bag, b", world");
        let value = intro::get_string(&bag);
        assert!(*value == b"hello, world", 18);
    }

    #[test]
    fun test_remove_u64() {
        let mut ctx = tx_context::dummy();
        let mut bag = intro::create_bag(&mut ctx);
        intro::add_u64(&mut bag, 42);
        let value = intro::remove_u64(&mut bag);
        assert!(value == 42, 19);
        assert!(intro::get_size(&bag) == 0, 20);
        assert!(intro::contains_u64(&bag) == false, 21);
    }

    #[test]
    fun test_remove_string() {
        let mut ctx = tx_context::dummy();
        let mut bag = intro::create_bag(&mut ctx);
        intro::add_string(&mut bag, b"test");
        let value = intro::remove_string(&mut bag);
        assert!(value == b"test", 22);
    }

    #[test]
    fun test_get_size() {
        let mut ctx = tx_context::dummy();
        let mut bag = intro::create_bag(&mut ctx);
        assert!(intro::get_size(&bag) == 0, 23);
        intro::add_u64(&mut bag, 1);
        assert!(intro::get_size(&bag) == 1, 24);
        intro::add_string(&mut bag, b"test");
        assert!(intro::get_size(&bag) == 2, 25);
    }

    #[test]
    fun test_safe_get_u64() {
        let mut ctx = tx_context::dummy();
        let mut bag = intro::create_bag(&mut ctx);
        
        let (exists1, value1) = intro::safe_get_u64(&bag);
        assert!(exists1 == false, 26);
        assert!(value1 == 0, 27);
        
        intro::add_u64(&mut bag, 42);
        let (exists2, value2) = intro::safe_get_u64(&bag);
        assert!(exists2, 28);
        assert!(value2 == 42, 29);
    }

    #[test]
    fun test_get_or_insert_u64() {
        let mut ctx = tx_context::dummy();
        let mut bag = intro::create_bag(&mut ctx);
        
        // 不存在，插入默认值
        let value1 = intro::get_or_insert_u64(&mut bag, 100);
        assert!(*value1 == 100, 30);
        
        // 已存在，返回现有值
        let value2 = intro::get_or_insert_u64(&mut bag, 200);
        assert!(*value2 == 100, 31);  // 仍然是 100，不是 200
    }

    #[test]
    fun test_add_item() {
        let mut ctx = tx_context::dummy();
        let mut bag = intro::create_bag(&mut ctx);
        let item = intro::create_item(1, b"item1");
        intro::add_item(&mut bag, item);
        assert!(intro::get_size(&bag) == 1, 32);
    }

    #[test]
    fun test_get_item() {
        let mut ctx = tx_context::dummy();
        let mut bag = intro::create_bag(&mut ctx);
        let item = intro::create_item(1, b"test");
        intro::add_item(&mut bag, item);
        let item_ref = intro::get_item(&bag);
        assert!(item_ref.id == 1, 33);
        assert!(item_ref.name == b"test", 34);
    }

    #[test]
    fun test_update_item_name() {
        let mut ctx = tx_context::dummy();
        let mut bag = intro::create_bag(&mut ctx);
        let item = intro::create_item(1, b"old");
        intro::add_item(&mut bag, item);
        intro::update_item_name(&mut bag, b"new");
        let item_ref = intro::get_item(&bag);
        assert!(item_ref.name == b"new", 35);
    }
}
