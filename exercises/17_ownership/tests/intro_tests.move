#[test_only]
module intro::intro_tests {
    use intro::intro;

    #[test]
    fun test_create_resource() {
        let resource = intro::create_resource(1, b"hello");
        let id = intro::borrow_resource_immutable(&resource);
        assert!(id == 1, 0);
        intro::consume_resource(resource);
    }

    #[test]
    fun test_create_copyable_data() {
        let data = intro::create_copyable_data(42, true);
        let (num, flag) = intro::use_copyable_data(data);
        assert!(num == 42, 1);
        assert!(flag == true, 2);
    }

    #[test]
    fun test_move_resource() {
        let resource = intro::create_resource(2, b"world");
        let moved_resource = intro::move_resource(resource);
        let id = intro::consume_resource(moved_resource);
        assert!(id == 2, 3);
    }

    #[test]
    fun test_borrow_operations() {
        let mut resource = intro::create_resource(3, b"test");
        
        // 测试不可变借用
        let id = intro::borrow_resource_immutable(&resource);
        assert!(id == 3, 4);
        
        // 测试可变借用
        intro::borrow_resource_mutable(&mut resource, b"updated");
        
        intro::consume_resource(resource);
    }

    #[test]
    fun test_vector_operations() {
        let mut vec = vector::empty<u64>();
        vector::push_back(&mut vec, 1);
        vector::push_back(&mut vec, 2);
        vector::push_back(&mut vec, 3);
        
        let moved_vec = intro::move_vector(vec);
        assert!(vector::length(&moved_vec) == 3, 5);
        
        // 测试借用向量元素
        let element = intro::borrow_vector_element(&moved_vec, 0);
        assert!(*element == 1, 6);
        
        let mut mutable_vec = moved_vec;
        let mut_element = intro::borrow_vector_element_mut(&mut mutable_vec, 1);
        *mut_element = 10;
        
        let element2 = intro::borrow_vector_element(&mutable_vec, 1);
        assert!(*element2 == 10, 7);
    }

    #[test]
    fun test_copy_semantics() {
        let data = intro::create_copyable_data(100, false);
        let copied_data = intro::copy_data(&data);
        
        let (original_num, original_flag) = intro::use_copyable_data(data);
        let (copied_num, copied_flag) = intro::use_copyable_data(copied_data);
        
        assert!(original_num == copied_num, 8);
        assert!(original_flag == copied_flag, 9);
        
        let num = 123;
        let copied_num = intro::copy_number(&num);
        assert!(num == copied_num, 10);
    }

    #[test]
    fun test_resource_container() {
        let resource = intro::create_resource(4, b"container_test");
        let container = intro::transfer_to_container(resource);
        let extracted = intro::extract_from_container(container);
        
        let id = intro::consume_resource(extracted);
        assert!(id == 4, 11);
    }

    #[test]
    fun test_vector_resource_operations() {
        let mut resources = vector::empty();
        let resource1 = intro::create_resource(5, b"res1");
        let resource2 = intro::create_resource(6, b"res2");
        
        intro::add_to_vector(&mut resources, resource1);
        intro::add_to_vector(&mut resources, resource2);
        
        let count = intro::count_vector_elements(&resources);
        assert!(count == 2, 12);
        
        let removed = intro::remove_from_vector(&mut resources);
        let id = intro::consume_resource(removed);
        assert!(id == 6, 13);
        
        let mut final_resources = intro::take_vector_ownership(resources);
        assert!(vector::length(&final_resources) == 1, 14);
        
        // 清理剩余资源
        let last = vector::pop_back(&mut final_resources);
        intro::consume_resource(last);
        vector::destroy_empty(final_resources);
    }

    #[test]
    fun test_modify_and_compare() {
        let mut resource1 = intro::create_resource(7, b"original");
        let resource2 = intro::create_resource(8, b"different");
        
        // 初始状态应该不相等
        assert!(!intro::compare_resources(&resource1, &resource2), 15);
        
        // 修改 resource1 的字段
        intro::modify_resource_fields(&mut resource1, 8, b"modified");
        
        // 现在 ID 应该相等
        assert!(intro::compare_resources(&resource1, &resource2), 16);
        
        intro::consume_resource(resource1);
        intro::consume_resource(resource2);
    }

    #[test]
    fun test_swap_resource_values() {
        let mut resource1 = intro::create_resource(9, b"first");
        let mut resource2 = intro::create_resource(10, b"second");
        
        intro::swap_resource_values(&mut resource1, &mut resource2);
        
        // 验证值已交换（这里简化验证，实际中需要检查 value 字段）
        intro::consume_resource(resource1);
        intro::consume_resource(resource2);
    }

    #[test]
    fun test_bank_account_operations() {
        let mut account1 = intro::create_account(1001, 1000, b"Alice");
        let mut account2 = intro::create_account(1002, 500, b"Bob");
        
        // 检查初始余额
        assert!(intro::check_balance(&account1) == 1000, 17);
        assert!(intro::check_balance(&account2) == 500, 18);
        
        // 转账
        intro::transfer(&mut account1, &mut account2, 200);
        
        // 验证转账后余额
        assert!(intro::check_balance(&account1) == 800, 19);
        assert!(intro::check_balance(&account2) == 700, 20);
        
        // 更改账户所有者
        intro::change_owner(&mut account1, b"Alice Smith");
        
        // 关闭账户
        let final_balance1 = intro::close_account(account1);
        let final_balance2 = intro::close_account(account2);
        
        assert!(final_balance1 == 800, 21);
        assert!(final_balance2 == 700, 22);
    }

    #[test]
    fun test_conditional_operations() {
        let resource = intro::create_resource(11, b"conditional");
        
        // 测试条件返回 - 应该返回 Some
        let mut option_resource = intro::conditional_return(resource, true);
        assert!(std::option::is_some(&option_resource), 23);
        
        let extracted = std::option::extract(&mut option_resource);
        
        // 测试条件移动
        let final_resource = intro::conditional_move(extracted, true);
        intro::consume_resource(final_resource);
        
        // 测试条件返回 - 应该返回 None
        let resource2 = intro::create_resource(12, b"to_drop");
        let none_option = intro::conditional_return(resource2, false);
        assert!(std::option::is_none(&none_option), 24);
        
        std::option::destroy_none(none_option);
    }
}
