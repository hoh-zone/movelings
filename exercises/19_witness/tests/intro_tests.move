#[test_only]
module intro::intro_tests {
    use intro::intro;

    #[test]
    fun test_create_resource() {
        let mut ctx = sui::tx_context::dummy();
        let witness = intro::new_witness();
        let resource = intro::create_resource(witness, 42, &mut ctx);
        // 测试创建成功
        intro::delete_protected(resource);
    }

    #[test]
    fun test_get_module_witness() {
        let witness = intro::get_module_witness();
        intro::do_something_once(witness);
        // 测试见证使用成功
    }

    #[test]
    fun test_create_admin_witness() {
        let mut ctx = sui::tx_context::dummy();
        let cap = intro::new_admin_cap(&mut ctx);
        let witness = intro::create_admin_witness(&cap);
        let result = intro::admin_only_action(witness, 10);
        assert!(result == 20, 1);  // 10 * 2 = 20
        intro::delete_admin_cap(cap);
    }

    #[test]
    fun test_admin_only_action() {
        let mut ctx = sui::tx_context::dummy();
        let cap = intro::new_admin_cap(&mut ctx);
        let witness = intro::create_admin_witness(&cap);
        let result = intro::admin_only_action(witness, 50);
        assert!(result == 100, 2);  // 50 * 2 = 100
        intro::delete_admin_cap(cap);
    }
    
    #[test]
    fun test_init_with_otw() {
        let mut ctx = sui::tx_context::dummy();
        let otw = intro::create_otw();
        let resource = intro::init_with_otw(otw, &mut ctx);
        assert!(intro::is_otw_initialized(&resource), 4);
        intro::delete_otw_resource(resource);
    }

    #[test]
    fun test_mint_usd() {
        let mut ctx = sui::tx_context::dummy();
        let coin = intro::mint_usd(100, &mut ctx);
        // 测试创建 USD 币种成功
        intro::delete_coin(coin);
    }

    #[test]
    fun test_mint_eur() {
        let mut ctx = sui::tx_context::dummy();
        let coin = intro::mint_eur(200, &mut ctx);
        // 测试创建 EUR 币种成功
        intro::delete_coin(coin);
    }

    #[test]
    fun test_initialize() {
        let mut ctx = sui::tx_context::dummy();
        let witness = intro::get_init_witness();
        let initialized = intro::initialize(witness, &mut ctx);
        assert!(intro::is_initialized(&initialized), 3);
        intro::delete_initialized(initialized);
    }

    #[test]
    fun test_get_init_witness() {
        let witness = intro::get_init_witness();
        let mut ctx = sui::tx_context::dummy();
        let initialized = intro::initialize(witness, &mut ctx);
        // 测试初始化成功
        intro::delete_initialized(initialized);
    }
}
