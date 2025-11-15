#[test_only]
module intro::intro_tests {
    use sui::object::{Self, UID};
    use sui::tx_context::{Self, TxContext};
    use intro::intro;

    #[test]
    fun test_create_copyable() {
        let s = intro::create_copyable(42);
        let (s1, s2) = intro::duplicate_copyable(s);
        // s1 和 s2 都是副本
        // s 已经不可用了（被移动到 duplicate_copyable）
    }

    #[test]
    fun test_duplicate_copyable() {
        let s = intro::create_copyable(100);
        let (s1, s2) = intro::duplicate_copyable(s);
        // 测试复制成功
    }

    #[test]
    fun test_create_no_copy() {
        let s = intro::create_no_copy(42);
        let moved = intro::move_no_copy(s);
        // s 已经移动，不可用了
    }

    #[test]
    fun test_move_no_copy() {
        let s = intro::create_no_copy(50);
        let moved = intro::move_no_copy(s);
        // 测试移动成功
    }

    #[test]
    fun test_create_droppable() {
        use std::string;
        let name = string::utf8(b"test");
        let s = intro::create_droppable(name);
        intro::auto_drop(s);  // 自动丢弃
    }

    #[test]
    fun test_auto_drop() {
        use std::string;
        let name = string::utf8(b"droppable");
        let s = intro::create_droppable(name);
        intro::auto_drop(s);
        // s 被自动丢弃
    }

    #[test]
    fun test_create_no_drop() {
        let s = intro::create_no_drop(42);
        let returned = intro::must_return(s);
        // 必须返回，不能丢弃
    }

    #[test]
    fun test_must_return() {
        let s = intro::create_no_drop(100);
        let returned = intro::must_return(s);
        // 测试返回成功
    }

    #[test]
    fun test_create_storable() {
        use std::string;
        let name = string::utf8(b"storable");
        let s = intro::create_storable(42, name);
        // 测试创建成功
    }

    #[test]
    fun test_create_key() {
        let mut ctx = tx_context::dummy();
        let id = object::new(&mut ctx);
        let key_struct = intro::create_key(id, 100);
        // 测试创建成功
    }

    #[test]
    fun test_create_coin() {
        let coin = intro::create_coin(200);
        // 测试创建成功
    }

    #[test]
    fun test_duplicate_generic() {
        let coin = intro::create_coin(100);
        let (coin1, coin2) = intro::duplicate(coin);
        // 测试泛型复制
    }

    #[test]
    fun test_consume_generic() {
        let coin = intro::create_coin(50);
        intro::consume(coin);
        // 测试泛型消费
    }

    #[test]
    fun test_store_item() {
        let coin = intro::create_coin(75);
        let stored = intro::store_item(coin);
        // 测试存储
    }

    #[test]
    fun test_copy_and_drop() {
        let coin = intro::create_coin(150);
        let copy = intro::copy_and_drop(coin);
        // 测试复制和丢弃
    }

    #[test]
    fun test_create_resource() {
        let r = intro::create_resource(42);
        let value = intro::extract_resource(r);
        assert!(value == 42, 1);
    }

    #[test]
    fun test_extract_resource() {
        let r = intro::create_resource(100);
        let value = intro::extract_resource(r);
        assert!(value == 100, 2);
    }

    #[test]
    fun test_copy_ability() {
        intro::test_copy();
    }

    #[test]
    fun test_drop_ability() {
        intro::test_drop();
    }
}
