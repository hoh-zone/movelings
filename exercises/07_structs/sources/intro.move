/*
这是您的第八个 Move 练习 - 学习结构体（Structs）！

// HINT: 结构体是 Move 中定义自定义类型的方式
// HINT: 使用 struct 关键字定义结构体
// HINT: 结构体字段可以是任何类型，包括其他结构体
// HINT: 使用点语法访问字段：obj.field
// TODO: 定义和使用结构体
// TODO: 学习结构体的创建、访问和修改
// TODO: 掌握结构体的解构和模式匹配
*/

/// Module: intro
module intro::intro {
    
    /// === 基本结构体 ===
    
    /// 简单的个人信息结构体
    public struct Person {
        name: vector<u8>,
        age: u8,
        email: vector<u8>,
    }
    
    /// 创建新的个人信息
    public fun create_person(name: vector<u8>, age: u8, email: vector<u8>): Person {
        // TODO: 创建并返回 Person 结构体
        // HINT: Person { name, age, email }
        
    }
    
    /// 获取个人姓名
    public fun get_person_name(person: &Person): vector<u8> {
        // TODO: 返回个人的姓名
        // HINT: person.name
        
    }
    
    /// 更新个人年龄
    public fun update_person_age(person: &mut Person, new_age: u8) {
        // TODO: 更新个人的年龄
        // HINT: person.age = new_age;
        
    }
    
    /// 检查是否为成年人
    public fun is_adult(person: &Person): bool {
        // TODO: 返回年龄是否大于等于 18
        // HINT: person.age >= 18
        
    }
    
    /// === 嵌套结构体 ===
    
    /// 地址结构体
    public struct Address {
        street: vector<u8>,
        city: vector<u8>,
        country: vector<u8>,
    }
    
    /// 带地址的完整个人信息
    public struct FullPerson {
        basic_info: Person,
        address: Address,
        phone: vector<u8>,
    }
    
    /// 创建地址
    public fun create_address(street: vector<u8>, city: vector<u8>, country: vector<u8>): Address {
        // TODO: 创建并返回 Address 结构体
        
    }
    
    /// 创建完整个人信息
    public fun create_full_person(
        person: Person,
        address: Address,
        phone: vector<u8>
    ): FullPerson {
        // TODO: 创建并返回 FullPerson 结构体
        // HINT: FullPerson { basic_info: person, address, phone }
        
    }
    
    /// 获取完整个人信息的姓名
    public fun get_full_person_name(full_person: &FullPerson): vector<u8> {
        // TODO: 返回嵌套结构体中的姓名
        // HINT: full_person.basic_info.name
        
    }
    
    /// 获取城市名称
    public fun get_city(full_person: &FullPerson): vector<u8> {
        // TODO: 返回地址中的城市名称
        // HINT: full_person.address.city
        
    }
    
    /// === 结构体解构 ===
    
    /// 解构个人信息并返回所有字段
    public fun extract_person_info(person: Person): (vector<u8>, u8, vector<u8>) {
        // TODO: 解构结构体并返回所有字段
        // HINT: let Person { name, age, email } = person;
        // HINT: 返回 (name, age, email)
        
    }
    
    /// 只提取姓名和年龄
    public fun extract_name_age(person: Person): (vector<u8>, u8) {
        // TODO: 解构结构体但只返回部分字段
        // HINT: let Person { name, age, email: _ } = person;
        // HINT: 返回 (name, age)
        
    }
    
    /// === 泛型结构体 ===
    
    /// 泛型容器结构体
    public struct Container<T> {
        value: T,
        label: vector<u8>,
    }
    
    /// 创建泛型容器
    public fun create_container<T>(value: T, label: vector<u8>): Container<T> {
        // TODO: 创建并返回泛型容器
        // HINT: Container { value, label }
        
    }
    
    /// 获取容器中的值
    public fun get_container_value<T>(container: &Container<T>): &T {
        // TODO: 返回容器中值的引用
        // HINT: &container.value
        
    }
    
    /// 更新容器中的值
    public fun update_container_value<T>(container: &mut Container<T>, new_value: T) {
        // TODO: 更新容器中的值
        // HINT: container.value = new_value;
        
    }
    
    /// 解构泛型容器
    public fun extract_container<T>(container: Container<T>): (T, vector<u8>) {
        // TODO: 解构泛型容器并返回值和标签
        // HINT: let Container { value, label } = container;
        // HINT: 返回 (value, label)
        
    }
    
    /// === 结构体作为参数和返回值 ===
    
    /// 交换两个人的姓名
    public fun swap_names(person1: &mut Person, person2: &mut Person) {
        // TODO: 交换两个人的姓名
        // HINT: 使用临时变量保存第一个人的姓名
        // HINT: let temp = person1.name;
        // HINT: person1.name = person2.name;
        // HINT: person2.name = temp;
        
    }
    
    /// 复制个人信息但修改年龄
    public fun clone_with_new_age(person: &Person, new_age: u8): Person {
        // TODO: 基于现有个人信息创建新的结构体，但使用新年龄
        // HINT: Person { name: person.name, age: new_age, email: person.email }
        
    }
    
    /// === 结构体比较 ===
    
    /// 比较两个人是否有相同的姓名
    public fun same_name(person1: &Person, person2: &Person): bool {
        // TODO: 比较两个人的姓名是否相同
        // HINT: person1.name == person2.name
        
    }
    
    /// 检查两个地址是否在同一个城市
    public fun same_city(addr1: &Address, addr2: &Address): bool {
        // TODO: 比较两个地址的城市是否相同
        
    }
}