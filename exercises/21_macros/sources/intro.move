/*
这是您的第二十二个 Move 练习 - 学习宏函数（Macro Functions）！

// HINT: Move 宏函数使用 macro fun 关键字定义
// HINT: 所有类型参数和参数名必须以 $ 开头
// HINT: 宏函数的参数是表达式替换，不是值传递
// HINT: 可以使用 lambda 表达式传递代码
// HINT: 可以使用 _ 类型来放松类型约束
// HINT: 宏函数在编译时展开，支持延迟求值
// HINT: 调用宏函数时使用 ! 语法：macro_name!(args)
// TODO: 理解宏函数的基本概念
// TODO: 学习宏函数的定义和使用
// TODO: 掌握 lambda 表达式的使用
// TODO: 了解宏函数的展开机制
// 1. 学习宏函数的语法
// 2. 掌握 lambda 表达式的使用
// 3. 理解延迟求值的概念
// 4. 学习宏函数的实际应用
// 5. 了解宏函数的限制
*/

/// Module: intro
module intro::intro {
    
    /// === 基本宏函数 ===
    
    /// 断言相等宏（延迟求值）
    public macro fun assert_eq<$T>($left: $T, $right: $T, $code: u64) {
        // TODO: 实现断言相等宏
        // HINT: 比较 left 和 right，如果不相等则 abort code
        // HINT: 使用 let 绑定参数以避免多次求值
        // 在此处填写代码
    }
    
    /// 验证正数宏（延迟求值）
    public macro fun validate_positive($value: u64, $error_code: u64): u64 {
        // TODO: 验证 value > 0，否则 abort error_code
        // HINT: 使用 assert! 进行验证
        // 在此处填写代码
    }
    
    /// === Lambda 宏函数 ===
    
    /// 映射向量元素（使用 lambda）
    public macro fun map<$T, $U>($v: vector<$T>, $f: |$T| -> $U): vector<$U> {
        // TODO: 实现 map 宏，对向量中的每个元素应用 lambda
        // HINT: 遍历向量，对每个元素调用 $f
        // HINT: 使用索引语法 v[i] 访问元素
        // 在此处填写代码
    }
    
    /// 遍历向量（不可变）
    public macro fun for_imm<$T>($v: &vector<$T>, $f: |&$T|) {
        // TODO: 遍历向量，对每个元素调用 lambda
        // HINT: 使用 while 循环，使用索引语法
        // 在此处填写代码
    }
    
    /// 遍历向量（可变）
    public macro fun for_mut<$T>($v: &mut vector<$T>, $f: |&mut $T|) {
        // TODO: 遍历向量，对每个元素调用 lambda（可变引用）
        // HINT: 使用 while 循环，使用索引语法
        // 在此处填写代码
    }
    
    /// === Option 宏函数 ===
    
    /// 检查 Option 并执行代码
    public macro fun inspect<$T>($opt: &option::Option<$T>, $f: |&$T|) {
        // TODO: 如果 Option 是 Some，则调用 lambda
        // HINT: 使用 option::is_some 检查，使用 option::borrow 获取值
        // 在此处填写代码
    }
    
    /// 检查 Option 是否满足条件
    public macro fun is_some_and<$T>($opt: &option::Option<$T>, $f: |&$T| -> bool): bool {
        // TODO: 如果 Option 是 Some 且满足条件，返回 true；否则返回 false
        // HINT: 使用 option::is_some 和 option::borrow
        // 在此处填写代码
    }
    
    /// === 通用宏函数 ===
    
    /// 使用 _ 类型的通用加法宏
    public macro fun add($x: _, $y: _): u256 {
        // TODO: 将两个值转换为 u256 并相加
        // HINT: 使用 as 进行类型转换
        // 在此处填写代码
    }
    
    /// 交换两个值（使用 _ 类型）
    public macro fun swap($x: _, $y: _): (_) {
        // TODO: 返回交换后的值 (y, x)
        // HINT: 使用 _ 类型允许不同类型
        // 在此处填写代码
    }
    
    /// === 实用宏函数 ===
    
    /// 条件执行宏
    public macro fun when($condition: bool, $action: ||) {
        // TODO: 如果 condition 为 true，执行 action
        // HINT: 使用 if 语句
        // 在此处填写代码
    }
    
    /// 重复执行宏
    public macro fun repeat($n: u64, $action: ||) {
        // TODO: 重复执行 action n 次
        // HINT: 使用 while 循环
        // 在此处填写代码
    }
}
