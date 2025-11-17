#[test_only]
module intro::intro_tests {
    use intro::intro;

    #[test]
    fun test_create_red() {
        let color = intro::create_red();
        let num = intro::color_to_number(color);
        assert!(num == 1, 1);
    }

    #[test]
    fun test_create_green() {
        let color = intro::create_green();
        let num = intro::color_to_number(color);
        assert!(num == 2, 2);
    }

    #[test]
    fun test_create_blue() {
        let color = intro::create_blue();
        let num = intro::color_to_number(color);
        assert!(num == 3, 3);
    }

    #[test]
    fun test_create_some() {
        let some = intro::create_some(42);
        assert!(intro::is_some(&some), 4);
        assert!(intro::is_none(&some) == false, 5);
    }

    #[test]
    fun test_create_none() {
        let none = intro::create_none<u64>();
        assert!(intro::is_some(&none) == false, 6);
        assert!(intro::is_none(&none), 7);
    }

    #[test]
    fun test_is_some() {
        let some = intro::create_some(100);
        let is_some = intro::is_some(&some);
        assert!(is_some, 8);
    }

    #[test]
    fun test_is_none() {
        let none = intro::create_none<u64>();
        let is_none = intro::is_none(&none);
        assert!(is_none, 9);
    }

    #[test]
    fun test_extract() {
        let some = intro::create_some(50);
        let value = intro::extract(some);
        assert!(value == 50, 10);
    }

    #[test]
    fun test_unwrap_or() {
        let some = intro::create_some(100);
        let value1 = intro::unwrap_or(some, 0);
        assert!(value1 == 100, 11);
        
        let none = intro::create_none<u64>();
        let value2 = intro::unwrap_or(none, 200);
        assert!(value2 == 200, 12);
    }

    #[test]
    fun test_create_ok() {
        let ok = intro::create_ok(42);
        assert!(intro::is_ok(&ok), 13);
        assert!(intro::is_err(&ok) == false, 14);
    }

    #[test]
    fun test_create_err() {
        let err = intro::create_err(100);
        assert!(intro::is_ok(&err) == false, 15);
        assert!(intro::is_err(&err), 16);
    }

    #[test]
    fun test_is_ok() {
        let ok = intro::create_ok(50);
        let is_ok = intro::is_ok(&ok);
        assert!(is_ok, 17);
    }

    #[test]
    fun test_is_err() {
        let err = intro::create_err(99);
        let is_err = intro::is_err(&err);
        assert!(is_err, 18);
    }

    #[test]
    fun test_unwrap_ok() {
        let ok = intro::create_ok(75);
        let value = intro::unwrap_ok(ok);
        assert!(value == 75, 19);
    }

    #[test]
    fun test_unwrap_err() {
        let err = intro::create_err(88);
        let error = intro::unwrap_err(err);
        assert!(error == 88, 20);
    }

    #[test]
    fun test_create_usd() {
        let _coin_type = intro::create_usd();
        // 测试创建成功
    }

    #[test]
    fun test_create_eur() {
        let _coin_type = intro::create_eur();
        // 测试创建成功
    }

    #[test]
    fun test_color_to_number() {
        let red = intro::create_red();
        let green = intro::create_green();
        let blue = intro::create_blue();
        
        assert!(intro::color_to_number(red) == 1, 21);
        assert!(intro::color_to_number(green) == 2, 22);
        assert!(intro::color_to_number(blue) == 3, 23);
    }

    #[test]
    fun test_option_to_string() {
        let some = intro::create_some(42);
        let str1 = intro::option_to_string(some);
        assert!(str1 == b"Some", 24);
        
        let none = intro::create_none<u64>();
        let str2 = intro::option_to_string(none);
        assert!(str2 == b"None", 25);
    }

    #[test]
    fun test_create_some_ok() {
        let _maybe = intro::create_some_ok(42);
        // 测试创建成功
    }

    #[test]
    fun test_create_some_err() {
        let _maybe = intro::create_some_err(99);
        // 测试创建成功
    }
}
