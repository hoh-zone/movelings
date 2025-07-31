#[test_only]
module intro::intro_tests {
    use intro::intro;

    #[test]
    fun test_basic_person() {
        let person = intro::create_person(b"Alice", 25, b"alice@example.com");
        
        // 测试字段访问
        assert!(intro::get_person_name(&person) == b"Alice", 1);
        assert!(intro::is_adult(&person) == true, 2);
        
        // 测试年龄更新
        let mut person_mut = person;
        intro::update_person_age(&mut person_mut, 30);
        
        // 测试解构
        let (name, age, email) = intro::extract_person_info(person_mut);
        assert!(name == b"Alice", 3);
        assert!(age == 30, 4);
        assert!(email == b"alice@example.com", 5);
    }

    #[test]
    fun test_nested_structs() {
        let person = intro::create_person(b"Bob", 22, b"bob@example.com");
        let address = intro::create_address(b"456 Oak Ave", b"Los Angeles", b"USA");
        let full_person = intro::create_full_person(person, address, b"555-1234");
        
        // 测试嵌套字段访问
        assert!(intro::get_full_person_name(&full_person) == b"Bob", 6);
        assert!(intro::get_city(&full_person) == b"Los Angeles", 7);
    }
    
    #[test]
    fun test_generic_container() {
        // 测试 u64 容器
        let mut container_u64 = intro::create_container(42u64, b"number");
        assert!(*intro::get_container_value(&container_u64) == 42, 8);
        
        intro::update_container_value(&mut container_u64, 100u64);
        let (value, label) = intro::extract_container(container_u64);
        assert!(value == 100, 9);
        assert!(label == b"number", 10);
        
        // 测试字符串容器
        let container_string = intro::create_container(b"hello", b"text");
        assert!(*intro::get_container_value(&container_string) == b"hello", 11);
    }
    
    #[test]
    fun test_struct_operations() {
        let mut person1 = intro::create_person(b"Alice", 25, b"alice@example.com");
        let mut person2 = intro::create_person(b"Bob", 30, b"bob@example.com");
        
        // 测试姓名比较
        assert!(intro::same_name(&person1, &person2) == false, 12);
        
        // 测试姓名交换
        intro::swap_names(&mut person1, &mut person2);
        assert!(intro::get_person_name(&person1) == b"Bob", 13);
        assert!(intro::get_person_name(&person2) == b"Alice", 14);
        
        // 测试克隆并修改年龄
        let person3 = intro::clone_with_new_age(&person1, 35);
        assert!(intro::get_person_name(&person3) == b"Bob", 15);
        // 注意：这里需要额外的 getter 函数来测试年龄
    }
    
    #[test]
    fun test_partial_extraction() {
        let person = intro::create_person(b"Charlie", 40, b"charlie@example.com");
        let (name, age) = intro::extract_name_age(person);
        
        assert!(name == b"Charlie", 16);
        assert!(age == 40, 17);
    }
    
    #[test]
    fun test_address_comparison() {
        let addr1 = intro::create_address(b"123 Main St", b"New York", b"USA");
        let addr2 = intro::create_address(b"456 Oak Ave", b"New York", b"USA");
        let addr3 = intro::create_address(b"789 Pine St", b"Boston", b"USA");
        
        assert!(intro::same_city(&addr1, &addr2) == true, 18);
        assert!(intro::same_city(&addr1, &addr3) == false, 19);
    }
}