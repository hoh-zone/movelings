
#[test_only]
module intro::intro_tests {
    // uncomment this line to import the module
     use intro::intro::{Self,Foo, Bar,get_foo_x,get_foo_y,get_bar_name,get_bar_foo};


    #[test]
    fun test_create_foo() {
        let foo = intro::create_foo();
        assert!(get_foo_x(&foo) == 42, 1);
        assert!(get_foo_y(&foo)== false, 2);
        let (_,_) =intro::destroy_foo(foo);
    }


        #[test]
    fun test_destroy_foo() {
        let foo = intro::create_foo();
        let (x, y) = intro::destroy_foo(foo);
        assert!(x == 42, 1);
        assert!(y == false, 2);

    }

    #[test]
    fun test_destroy_foo_wildcard() {
        let foo = intro::create_foo();
        intro::destroy_foo_wildcard(foo);
        // 这里不需要断言，因为使用通配符解构后不会返回值
    }

    #[test]
    fun test_destroy_foo_assignment() {
        let foo = intro::create_foo();
        let (x, y) = intro::destroy_foo_assignment(foo);
        assert!(x == 42, 1);
        assert!(y == false, 2);
    }

    #[test]
    fun test_create_bar() {
        let bar = intro::create_bar();
        assert!(get_bar_name(&bar) == b"Move", 1);
        let foo = get_bar_foo(&bar);
        assert!(get_foo_x(foo) == 42, 2);
        assert!(get_foo_y(foo) == false, 3);
        intro::destroy_bar(bar);
    }

    #[test]
    fun test_destroy_bar() {
        let bar = intro::create_bar();
        intro::destroy_bar(bar);
        // 这里不需要断言，因为 Bar 的字段已经被销毁

    }


}

