/*
这是您的第二十个 Move 练习 - 学习见证模式（Witness Pattern）！

// HINT: Witness 模式是 Move 中的一种设计模式，用于确保某些操作只能在特定条件下执行
// HINT: 见证类型通常是一次性使用的类型，用于证明某种权限或状态
// HINT: 见证类型通常没有能力（或只有 drop），确保只能使用一次
// HINT: 使用 witness 类型作为函数参数来验证权限
// HINT: Phantom 类型参数用于类型级别的区分
// HINT: OTW (One-Time Witness) 是 Sui 的特性，模块发布时自动创建，只能在 init 中接收一次
// HINT: 使用 OTW 可以确保某些资源只能初始化一次
// TODO: 理解见证类型的概念和用途
// TODO: 学习基本见证模式的实现
// TODO: 掌握一次性见证的使用
// TODO: 了解权限验证的实现
// TODO: 学习 OTW 模式的使用
// 1. 学习见证类型的基本概念
// 2. 掌握见证类型的定义和使用
// 3. 理解一次性见证的实现
// 4. 学习权限验证模式
// 5. 了解 Phantom 类型参数
// 6. 学习 OTW 模式
*/

/// Module: intro
module intro::intro {
    
    /// === 基本见证模式 ===
    
    /// 见证类型：没有能力，只能被移动和销毁
    public struct WITNESS has drop {}
    
    /// 受保护的结构体
    public struct ProtectedResource has key {
        id: sui::object::UID,
        value: u64,
    }
    
    /// 只有见证类型才能创建受保护的资源
    public fun create_resource(witness: WITNESS, value: u64, ctx: &mut sui::tx_context::TxContext): ProtectedResource {
        // TODO: 消耗见证类型并创建资源
        // HINT: witness; 消耗见证类型，然后创建资源
        // 在此处填写代码
    }
    
    /// 销毁受保护资源（供测试清理使用）
    public fun delete_protected(resource: ProtectedResource) {
        let ProtectedResource { id, value: _ } = resource;
        sui::object::delete(id);
    }
    
    /// === 模块级见证 ===
    
    /// 模块级别的见证类型（只能通过模块创建）
    public struct ModuleWitness has drop {
        // 空的，仅作为见证
    }
    
    /// 只能通过模块的函数创建
    fun create_module_witness(): ModuleWitness {
        // TODO: 创建并返回 ModuleWitness 实例
        // 在此处填写代码
    }
    
    /// 使用见证执行一次性操作
    public fun do_something_once(_witness: ModuleWitness) {
        // TODO: 使用见证，见证被移动后不能再使用
        // HINT: 函数体可以为空，witness 会被移动并销毁
        // 在此处填写代码
    }
    
    /// 通过公开函数创建见证（演示）
    public fun get_module_witness(): ModuleWitness {
        // TODO: 调用内部函数创建见证
        // 在此处填写代码
    }
    
    /// 创建空见证（供测试）
    public fun new_witness(): WITNESS {
        WITNESS {}
    }
    
    /// === OTW (One-Time Witness) 模式 ===
    
    /// 使用 OTW 进行一次性初始化
    /// OTW 类型名必须与模块名相同（这里是 INTRO）
    public struct INTRO has drop {}
    
    /// 使用 OTW 初始化的资源
    public struct OTWResource has key {
        id: sui::object::UID,
        initialized: bool,
    }
    
    /// 创建 OTW（供测试使用）
    #[test_only]
    public fun create_otw(): INTRO {
        INTRO {}
    }
    
    /// 使用 OTW 进行一次性初始化
    /// 注意：在实际应用中，这应该在 init 函数中调用
    public fun init_with_otw(otw: INTRO, ctx: &mut sui::tx_context::TxContext): OTWResource {
        // TODO: 消耗 OTW 并创建 OTWResource
        // HINT: otw; 消耗 OTW，确保只能使用一次
        // HINT: OTW 模式确保资源只能初始化一次
        // 在此处填写代码
    }
    
    /// 销毁 OTWResource（供测试清理）
    public fun delete_otw_resource(resource: OTWResource) {
        let OTWResource { id, initialized: _ } = resource;
        sui::object::delete(id);
    }
    
    /// 读取初始化标志（供测试）
    public fun is_otw_initialized(obj: &OTWResource): bool {
        obj.initialized
    }
    
    /// === 权限验证 ===
    
    /// 管理员能力（应该持久存在）
    public struct AdminCap has key {
        id: sui::object::UID,
    }
    
    /// 管理员见证（临时使用）
    public struct AdminWitness has drop {}
    
    /// 创建 AdminCap（供测试）
    public fun new_admin_cap(ctx: &mut sui::tx_context::TxContext): AdminCap {
        AdminCap { id: sui::object::new(ctx) }
    }
    
    /// 从 AdminCap 引用创建 AdminWitness（不销毁 cap）
    public fun create_admin_witness(_cap: &AdminCap): AdminWitness {
        // TODO: 从引用创建见证，不销毁 cap
        // HINT: AdminWitness {} - 从引用创建见证，cap 应该持久存在
        // 在此处填写代码
    }
    
    /// 销毁管理员能力（供测试清理）
    public fun delete_admin_cap(cap: AdminCap) {
        let AdminCap { id } = cap;
        sui::object::delete(id);
    }
    
    /// 需要管理员权限的操作
    public fun admin_only_action(_witness: AdminWitness, value: u64): u64 {
        // TODO: 执行管理员操作，返回 value * 2
        // HINT: 见证类型作为参数验证权限
        // 在此处填写代码
    }
    
    /// === 类型级别的见证 ===
    
    /// Phantom 类型参数（不实际存储，仅用于类型区分）
    public struct TypeWitness<phantom T> has drop {}
    
    /// 使用泛型见证的类型
    public struct Coin<phantom T> has key {
        id: sui::object::UID,
        value: u64,
    }
    
    /// 标记类型
    public struct USD has drop {}
    public struct EUR has drop {}
    
    /// 使用泛型见证铸造币种
    public fun mint<T>(
        _witness: TypeWitness<T>,
        value: u64,
        ctx: &mut sui::tx_context::TxContext
    ): Coin<T> {
        // TODO: 创建 Coin<T>，使用见证类型确保只能通过特定方式创建
        // 在此处填写代码
    }
    
    /// 销毁 Coin（供测试清理）
    public fun delete_coin<T>(coin: Coin<T>) {
        let Coin { id, value: _ } = coin;
        sui::object::delete(id);
    }
    
    /// 创建美元币种
    public fun mint_usd(value: u64, ctx: &mut sui::tx_context::TxContext): Coin<USD> {
        // TODO: 创建 USD 类型的见证并铸造美元
        // HINT: 需要 TypeWitness<USD>，然后调用 mint
        // 在此处填写代码
    }
    
    /// 创建欧元币种
    public fun mint_eur(value: u64, ctx: &mut sui::tx_context::TxContext): Coin<EUR> {
        // TODO: 创建 EUR 类型的见证并铸造欧元
        // 在此处填写代码
    }
    
    /// === 一次性操作见证 ===
    
    /// 初始化见证
    public struct InitWitness has drop {}
    
    /// 只能初始化一次
    public struct Initialized has key {
        id: sui::object::UID,
        initialized: bool,
    }
    
    /// 使用见证进行初始化
    public fun initialize(witness: InitWitness, ctx: &mut sui::tx_context::TxContext): Initialized {
        // TODO: 消耗见证并创建 Initialized 对象
        // HINT: witness 只能使用一次，确保只能初始化一次
        // 在此处填写代码
    }
    
    /// 创建初始化见证（私有函数）
    fun create_init_witness(): InitWitness {
        // TODO: 创建并返回 InitWitness
        // 在此处填写代码
    }
    
    /// === 见证的模块保护 ===
    
    /// 只有模块可以创建见证
    public fun get_init_witness(): InitWitness {
        // TODO: 调用内部函数创建见证
        // 在此处填写代码
    }
    
    /// 读取初始化标志（供测试）
    public fun is_initialized(obj: &Initialized): bool {
        obj.initialized
    }
    
    /// 销毁 Initialized（供测试清理）
    public fun delete_initialized(obj: Initialized) {
        let Initialized { id, initialized: _ } = obj;
        sui::object::delete(id);
    }
}
