/*
这是您的第二十个 Move 练习 - 学习见证模式（Witness Pattern）！

// HINT: Witness 模式是 Move 中的一种设计模式，用于确保某些操作只能在特定条件下执行
// HINT: 见证类型通常是一次性使用的类型，用于证明某种权限或状态
// HINT: 见证类型通常没有能力（或只有 drop），确保只能使用一次
// HINT: 使用 witness 类型作为函数参数来验证权限
// HINT: Phantom 类型参数用于类型级别的区分
// HINT: 见证类型通常在模块级别创建，确保只能通过特定方式获取
// TODO: 理解见证类型的概念和用途
// TODO: 学习基本见证模式的实现
// TODO: 掌握一次性见证的使用
// TODO: 了解权限验证的实现
// 1. 学习见证类型的基本概念
// 2. 掌握见证类型的定义和使用
// 3. 理解一次性见证的实现
// 4. 学习权限验证模式
// 5. 了解 Phantom 类型参数
*/

/// Module: intro
module intro::intro {
    use sui::object::{Self, UID};
    use sui::tx_context::{Self, TxContext};
    use sui::transfer;
    
    /// === 基本见证模式 ===
    
    /// 见证类型：没有能力，只能被移动和销毁
    struct WITNESS has drop;
    
    /// 受保护的结构体
    struct ProtectedResource has key {
        id: UID,
        value: u64,
    }
    
    /// 只有见证类型才能创建受保护的资源
    public fun create_resource(witness: WITNESS, value: u64, ctx: &mut TxContext): ProtectedResource {
        // TODO: 消耗见证类型并创建资源
        // HINT: witness; 消耗见证类型，然后创建资源
        
        witness; // 消耗见证类型
        ProtectedResource {
            id: object::new(ctx),
            value,
        }
    }
    
    /// === 模块级见证 ===
    
    /// 模块级别的见证类型（只能通过模块创建）
    struct ModuleWitness has drop {
        // 空的，仅作为见证
    }
    
    /// 只能通过模块的函数创建
    fun create_module_witness(): ModuleWitness {
        // TODO: 创建并返回 ModuleWitness 实例
        
        ModuleWitness {}
    }
    
    /// 使用见证执行一次性操作
    public fun do_something_once(witness: ModuleWitness) {
        // TODO: 使用见证，见证被移动后不能再使用
        // HINT: 函数体可以为空，witness 会被移动并销毁
        
        // witness 在这里被使用并销毁
    }
    
    /// 通过公开函数创建见证（演示）
    public fun get_module_witness(): ModuleWitness {
        // TODO: 调用内部函数创建见证
        
        create_module_witness()
    }
    
    /// === 权限验证 ===
    
    /// 管理员能力
    struct AdminCap has key {
        id: UID,
    }
    
    /// 管理员见证
    struct AdminWitness has drop;
    
    /// 从 AdminCap 创建 AdminWitness
    public fun create_admin_witness(
        cap: AdminCap,
        ctx: &mut TxContext
    ): (AdminWitness, AdminCap) {
        // TODO: 创建见证并返回新的 cap
        // HINT: 实际应用中可能会销毁旧的 cap
        
        let AdminCap { id } = cap;
        let obj_id = object::id(&id);
        object::delete(obj_id);
        (AdminWitness {}, AdminCap { id: object::new(ctx) })
    }
    
    /// 需要管理员权限的操作
    public fun admin_only_action(_witness: AdminWitness, value: u64): u64 {
        // TODO: 执行管理员操作，返回 value * 2
        // HINT: 见证类型作为参数验证权限
        
        value * 2
    }
    
    /// === 类型级别的见证 ===
    
    /// Phantom 类型参数（不实际存储，仅用于类型区分）
    struct TypeWitness<phantom T> has drop;
    
    /// 使用泛型见证的类型
    struct Coin<phantom T> has key {
        id: UID,
        value: u64,
    }
    
    /// 标记类型
    struct USD;
    struct EUR;
    
    /// 使用泛型见证铸造币种
    public fun mint<T>(
        _witness: TypeWitness<T>,
        value: u64,
        ctx: &mut TxContext
    ): Coin<T> {
        // TODO: 创建 Coin<T>，使用见证类型确保只能通过特定方式创建
        
        Coin {
            id: object::new(ctx),
            value,
        }
    }
    
    /// 创建美元币种
    public fun mint_usd(value: u64, ctx: &mut TxContext): Coin<USD> {
        // TODO: 创建 USD 类型的见证并铸造美元
        // HINT: 需要 TypeWitness<USD>，但实际中通常从模块内部创建
        
        let witness = TypeWitness<USD> {};
        mint(witness, value, ctx)
    }
    
    /// 创建欧元币种
    public fun mint_eur(value: u64, ctx: &mut TxContext): Coin<EUR> {
        // TODO: 创建 EUR 类型的见证并铸造欧元
        
        let witness = TypeWitness<EUR> {};
        mint(witness, value, ctx)
    }
    
    /// === 一次性操作见证 ===
    
    /// 初始化见证
    struct InitWitness has drop;
    
    /// 只能初始化一次
    struct Initialized has key {
        id: UID,
        initialized: bool,
    }
    
    /// 使用见证进行初始化
    public fun initialize(witness: InitWitness, ctx: &mut TxContext): Initialized {
        // TODO: 消耗见证并创建 Initialized 对象
        // HINT: witness 只能使用一次，确保只能初始化一次
        
        witness; // 消耗见证
        Initialized {
            id: object::new(ctx),
            initialized: true,
        }
    }
    
    /// 创建初始化见证（私有函数）
    fun create_init_witness(): InitWitness {
        // TODO: 创建并返回 InitWitness
        
        InitWitness {}
    }
    
    /// === 见证的模块保护 ===
    
    /// 只有模块可以创建见证
    public fun get_init_witness(): InitWitness {
        // TODO: 调用内部函数创建见证
        
        create_init_witness()
    }
}
