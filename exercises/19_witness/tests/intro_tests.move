#[test_only]
module intro::intro_tests {
    use sui::object::{Self, UID};
    use sui::tx_context::{Self, TxContext};
    use sui::transfer;
    use intro::intro;

    #[test]
    fun test_create_resource() {
        let mut ctx = tx_context::dummy();
        let witness = intro::WITNESS {};
        let resource = intro::create_resource(witness, 42, &mut ctx);
        // 测试创建成功
        object::delete(object::id(&resource.id));
    }

    #[test]
    fun test_get_module_witness() {
        let witness = intro::get_module_witness();
        intro::do_something_once(witness);
        // 测试见证使用成功
    }

    #[test]
    fun test_create_admin_witness() {
        let mut ctx = tx_context::dummy();
        let cap = intro::AdminCap {
            id: object::new(&mut ctx)
        };
        let (witness, new_cap) = intro::create_admin_witness(cap, &mut ctx);
        let result = intro::admin_only_action(witness, 10);
        assert!(result == 20, 1);  // 10 * 2 = 20
        object::delete(object::id(&new_cap.id));
    }

    #[test]
    fun test_admin_only_action() {
        let mut ctx = tx_context::dummy();
        let cap = intro::AdminCap {
            id: object::new(&mut ctx)
        };
        let (witness, new_cap) = intro::create_admin_witness(cap, &mut ctx);
        let result = intro::admin_only_action(witness, 50);
        assert!(result == 100, 2);  // 50 * 2 = 100
        object::delete(object::id(&new_cap.id));
    }

    #[test]
    fun test_mint_usd() {
        let mut ctx = tx_context::dummy();
        let coin = intro::mint_usd(100, &mut ctx);
        // 测试创建 USD 币种成功
        object::delete(object::id(&coin.id));
    }

    #[test]
    fun test_mint_eur() {
        let mut ctx = tx_context::dummy();
        let coin = intro::mint_eur(200, &mut ctx);
        // 测试创建 EUR 币种成功
        object::delete(object::id(&coin.id));
    }

    #[test]
    fun test_initialize() {
        let mut ctx = tx_context::dummy();
        let witness = intro::get_init_witness();
        let initialized = intro::initialize(witness, &mut ctx);
        assert!(initialized.initialized, 3);
        object::delete(object::id(&initialized.id));
    }

    #[test]
    fun test_get_init_witness() {
        let witness = intro::get_init_witness();
        let mut ctx = tx_context::dummy();
        let initialized = intro::initialize(witness, &mut ctx);
        // 测试初始化成功
        object::delete(object::id(&initialized.id));
    }
}
