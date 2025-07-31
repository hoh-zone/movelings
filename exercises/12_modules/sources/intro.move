/*
这是您的第十三个 Move 练习 - 学习模块系统（Modules）！

// HINT: 模块是 Move 代码的组织单元
// HINT: 使用 public 关键字导出函数
// HINT: 使用 use 语句导入其他模块
// HINT: 模块名格式：package::module
// TODO: 学习模块的定义和组织
// TODO: 掌握可见性控制
// TODO: 理解模块间的依赖关系
*/

/// Module: intro
module intro::intro {
    
    /// === 公共函数 ===
    
    /// 公共函数可以被其他模块调用
    public fun public_add(a: u64, b: u64): u64 {
        a + b
    }
    
    /// 公共函数：获取向量长度
    public fun get_length(v: &vector<u64>): u64 {
        vector::length(v)
    }
    
    /// === 私有函数 ===
    
    /// 私有函数只能在本模块内调用
    fun private_multiply(a: u64, b: u64): u64 {
        a * b
    }
    
    /// === 使用私有函数的公共函数 ===
    
    /// 公共函数可以调用私有函数
    public fun calculate_area(width: u64, height: u64): u64 {
        private_multiply(width, height)
    }
    
    /// === 结构体和常量 ===
    
  
    const MAX_VALUE: u64 = 1000;
    const DEFAULT_SIZE: u64 = 10;
    
    /// 给 Counter 添加 drop 能力
    public struct Counter has drop {
        value: u64,
    }
    
    /// 创建计数器
    public fun create_counter(): Counter {
        Counter { value: 0 }
    }
    
    /// 增加计数器
    public fun increment(counter: &mut Counter) {
        counter.value = counter.value + 1;
    }
    
    /// 获取计数器值
    public fun get_value(counter: &Counter): u64 {
        counter.value
    }
    
    /// 检查计数器是否达到最大值
    public fun is_at_max(counter: &Counter): bool {
        counter.value >= MAX_VALUE
    }
    
    /// 获取最大值（公共函数访问私有常量）
    public fun get_max_value(): u64 {
        MAX_VALUE
    }
    
    /// === 友元函数（package internal） ===
    
    /// 只能被同一包内的模块调用
    public(package) fun package_only_function(): u64 {
        DEFAULT_SIZE
    }
    
    /// 重置计数器（仅包内可用）
    public(package) fun reset_counter(counter: &mut Counter) {
        counter.value = 0;
    }
    
    /// === 模块初始化 ===
    
    /// 模块级别的初始化函数（可选）
    fun init(_ctx: &mut TxContext) {
        // 模块部署时执行的初始化代码
        // 在这个简单例子中不需要特殊初始化
    }
}