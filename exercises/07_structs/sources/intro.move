/*
这是您的第八个 Move 练习 - 学习 struct 结构体定义和实例化！

// HINT: 结构是包含类型字段的自定义数据结构
// HINT: 结构体必须在模块内部定义
// HINT: 必须以大写字母A-Z开头，其余部分可以是字母A-Z, a-z, 数字0-9或下划线_
// HINT: 不能递归定义结构体
// HINT: 创建结构体
// HINT: 销毁结构体实例
// HINT: 访问结构体字段、子结构体
// TODO: 请在模块内部定义一个结构体 Foo
// TODO: 请将结构体名称改为正确的大写开头
// TODO: 注释递归错误
// TODO: 创建结构体Foo的实例
// TODO: 销毁结构体Foo的实例
// TODO: 访问结构体Foo的字段x和y
// 1. 学习 struct 定义
// 2. 掌握 struct 定义代码位置
// 3. 掌握 struct 命名规则
// 4. 掌握 struct 不能递归
// 5. 掌握 struct支持多种不同类型：
//    无符号整数、布尔值bool、地址address、字符串String、向量vector、struct
// 6. 掌握 struct 的创建和销毁
// 7. 掌握 struct 的字段访问
*/

/// HINT: 结构体必须在模块内部定义，这是错误的位置
// TODO: 请将结构体定义移动到模块内部
// public struct Foo {

// }

module intro::intro {


    public struct Foo {
        x: u64,
        y: bool,
    }


/// HINT: 必须以大写字母A-Z开头，其余部分可以是字母A-Z, a-z, 数字0-9或下划线_
// TODO: 请将结构体名称改为大写开头
    // public struct 0foo {
    //     /// HINT: 结构体可以包含多个字段
    //     /// TODO: 添加字段 x:u64, y:bool

    //     /// HINT: 不能递归定义结构体
    //     // TODO: 注释掉递归错误
    //     foo: 0foo
    // }

    public struct Bar {
        name:vector<u8>,
       /// HINT: 结构体可以包含多个字段
       // TODO: 添加字段 foo: Foo
       foo: Foo, 
    }

    /// 创建返回一个 Foo 结构体的实例
    public fun create_foo(): Foo {
        // TODO: 创建一个foo x，值为 42，y值为 false
        Foo { x: 42, y: false }
        
    }

    /// HINT: 访问 Foo 结构体x值
    /// TODO: 返回 x 
    public fun get_foo_x(foo: &Foo):u64 {
        /// TODO: 访问 foo 的字段 x 
        foo.x
        
        //0 // 临时返回值，需要替换成 foo.x
    }

    /// HINT: 访问 Foo 结构体y值
    /// TODO: 返回 y
    public fun get_foo_y( foo: &Foo):bool {
        /// TODO: 访问 foo 的字段 y
        foo.y
        // true // 临时返回值，需要替换成 foo.y
    }


    /// 销毁 Foo 结构体的实例
    public fun destroy_foo(foo: Foo): (u64,bool){

        /// HINT: 销毁结构体实例
        /// TODO: 销毁 foo 实例
        let Foo {x,y}=foo;
        (x, y)
        //(0, true) // 临时返回值，需要替换
    }

    /// 销毁 Foo 结构体的实例，使用通配符
    /// HINT: 通配符 _ 可以匹配任何值
    public fun destroy_foo_wildcard(foo: Foo)  {
        /// TODO: 使用通配符解构foo
        let Foo { x: _, y: _ } = foo;
    }

    public fun destroy_foo_assignment(foo: Foo): (u64, bool) {
        /// HINT: 使用赋值语句解构 foo
        /// TODO: 申明变量 x:u64, y:bool
        /// TODO: 使用赋值语句解构 foo
        let x: u64;
        let y: bool;
        let Foo { x, y } = foo;
        (x,y)
        //(0, true) // 临时返回值，需要替换成(x,y)
    }

    /// 创建返回一个 Bar 结构体的实例
    public fun create_bar(): Bar {
        /// HINT: 创建 Bar 结构体实例,结构体包含一个 Foo 字段
        /// TODO: 创建 Bar 实例并返回
        
        let foo = create_foo();
        let name = b"Move";
        Bar { name,foo }

    }

     /// HINT: 访问 Bar 结构体的 name 字段
    public fun get_bar_name(bar: &Bar): vector<u8> {
        /// TODO: 访问 Bar 的字段 name
        bar.name
    }

    /// HINT: 访问 Bar 结构体的 Foo 字段
    public fun get_bar_foo(bar: &Bar): &Foo {
        //TODO: 访问 Bar 的字段 foo
        &bar.foo
    }


    /// 销毁 Bar 结构体的实例
    public fun destroy_bar(bar: Bar) {
        /// HINT: 销毁 Bar 结构体实例
        /// TODO: 销毁 bar 实例
       
        let Bar { name:_,foo } = bar;
        destroy_foo(foo);
        
       

    }

}
