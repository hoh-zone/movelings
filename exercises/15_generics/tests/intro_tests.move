#[test_only]
module intro::intro_tests {
    use intro::intro;

    #[test]
    fun test_identity() {
        let value = intro::identity(42);
        assert!(value == 42, 1);
        
        let str = intro::identity(b"hello");
        assert!(str == b"hello", 2);
    }

    #[test]
    fun test_swap() {
        let (a, b) = intro::swap(1, 2);
        assert!(a == 2, 3);
        assert!(b == 1, 4);
    }

    #[test]
    fun test_duplicate() {
        let coin = intro::create_box(100);
        let (_coin1, _coin2) = intro::duplicate(coin);
        // 测试复制成功
    }

    #[test]
    fun test_consume() {
        let coin = intro::create_box(50);
        intro::consume(coin);
        // 测试消费成功
    }

    #[test]
    fun test_store_value() {
        let coin = intro::create_box(75);
        let _stored = intro::store_value(coin);
        // 测试存储成功
    }

    #[test]
    fun test_create_box() {
        let box = intro::create_box(42);
        let value = *intro::get_value(&box);
        assert!(value == 42, 5);
    }

    #[test]
    fun test_get_value() {
        let box = intro::create_box(100);
        let value_ref = intro::get_value(&box);
        assert!(*value_ref == 100, 6);
    }

    #[test]
    fun test_unwrap() {
        let box = intro::create_box(50);
        let value = intro::unwrap(box);
        assert!(value == 50, 7);
    }

    #[test]
    fun test_set_value() {
        let mut box = intro::create_box(10);
        intro::set_value(&mut box, 20);
        assert!(*intro::get_value(&box) == 20, 8);
    }

    #[test]
    fun test_create_pair() {
        let pair = intro::create_pair(1, b"hello");
        assert!(*intro::get_first(&pair) == 1, 9);
        assert!(*intro::get_second(&pair) == b"hello", 10);
    }

    #[test]
    fun test_get_first() {
        let pair = intro::create_pair(10, 20);
        let first = *intro::get_first(&pair);
        assert!(first == 10, 11);
    }

    #[test]
    fun test_get_second() {
        let pair = intro::create_pair(10, 20);
        let second = *intro::get_second(&pair);
        assert!(second == 20, 12);
    }

    #[test]
    fun test_swap_pair() {
        let pair = intro::create_pair(1, 2);
        let swapped = intro::swap_pair(pair);
        assert!(*intro::get_first(&swapped) == 2, 13);
        assert!(*intro::get_second(&swapped) == 1, 14);
    }

    #[test]
    fun test_some() {
        let _some = intro::some(42);
        // 测试创建成功
    }

    #[test]
    fun test_none() {
        let _none = intro::none<u64>();
        // 测试创建成功
    }

    #[test]
    fun test_copy_and_drop() {
        let coin = intro::create_box(100);
        let _copied = intro::copy_and_drop(coin);
        // 测试复制和丢弃
    }

    #[test]
    fun test_copy_drop_store() {
        let coin = intro::create_box(50);
        let _result = intro::copy_drop_store(coin);
        // 测试成功
    }

    #[test]
    fun test_create_some_box() {
        let _box = intro::create_some_box(42);
        // 测试创建成功
    }

    #[test]
    fun test_create_none_box() {
        let _box = intro::create_none_box<u64>();
        // 测试创建成功
    }

    #[test]
    fun test_unwrap_option_box() {
        let box = intro::create_some_box(100);
        let value = intro::unwrap_option_box(box);
        assert!(value == 100, 15);
    }

    #[test]
    fun test_first() {
        let vec = vector[1, 2, 3];
        let first = intro::first(&vec);
        assert!(*first == 1, 16);
    }

    #[test]
    fun test_last() {
        let vec = vector[1, 2, 3, 4];
        let last = intro::last(&vec);
        assert!(*last == 4, 17);
    }

    #[test]
    fun test_singleton() {
        let vec = intro::singleton(42);
        assert!(vector::length(&vec) == 1, 18);
        assert!(*vector::borrow(&vec, 0) == 42, 19);
    }

    #[test]
    fun test_create_box_vector() {
        let items = vector[1, 2, 3];
        let boxes = intro::create_box_vector(items);
        assert!(vector::length(&boxes) == 3, 20);
        assert!(*intro::get_value(vector::borrow(&boxes, 0)) == 1, 21);
    }

    #[test]
    fun test_unwrap_boxes() {
        let boxes = vector[
            intro::create_box(1),
            intro::create_box(2),
            intro::create_box(3)
        ];
        let values = intro::unwrap_boxes(boxes);
        assert!(vector::length(&values) == 3, 22);
        assert!(*vector::borrow(&values, 0) == 1, 23);
        assert!(*vector::borrow(&values, 1) == 2, 24);
        assert!(*vector::borrow(&values, 2) == 3, 25);
    }
}
