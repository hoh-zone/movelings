#[test_only]
module intro::intro_tests {
    use intro::intro;
    use std::string;

    #[test]
    fun test_basic_string_operations() {
        let s = intro::create_string(b"hello");
        
        // 测试长度和空检查
        assert!(intro::string_length(&s) == 5, 1);
        assert!(intro::is_empty_string(&s) == false, 2);
        
        // 测试转换
        let bytes = intro::string_to_bytes(s);
        assert!(bytes == b"hello", 3);
        
        // 测试空字符串
        let empty = intro::create_string(b"");
        assert!(intro::is_empty_string(&empty) == true, 4);
        assert!(intro::string_length(&empty) == 0, 5);
    }

    #[test]
    fun test_string_concatenation() {
        let s1 = string::utf8(b"hello");
        let s2 = string::utf8(b"world");
        
        // 测试连接
        let result = intro::concat_strings(&s1, &s2);
        assert!(intro::string_to_bytes(result) == b"helloworld", 6);
        
        // 测试添加字节
        let mut s = string::utf8(b"hello");
        intro::append_bytes(&mut s, b" world");
        assert!(intro::string_to_bytes(s) == b"hello world", 7);
        
        // 测试前缀
        let prefixed = intro::prepend_string(string::utf8(b"Mr. "), string::utf8(b"Smith"));
        assert!(intro::string_to_bytes(prefixed) == b"Mr. Smith", 8);
    }
    
    #[test]
    fun test_string_comparison() {
        let s1 = string::utf8(b"hello");
        let s2 = string::utf8(b"hello");
        let s3 = string::utf8(b"world");
        
        // 测试相等性
        assert!(intro::strings_equal(&s1, &s2) == true, 9);
        assert!(intro::strings_equal(&s1, &s3) == false, 10);
        
        // 测试空字符串比较
        let empty1 = intro::create_string(b"");
        let empty2 = intro::create_string(b"");
        assert!(intro::strings_equal(&empty1, &empty2) == true, 11);
    }
    
    #[test]
    fun test_edge_cases() {
        // 测试空字符串操作
        let empty = intro::create_string(b"");
        let hello = string::utf8(b"hello");
        
        let concat_result = intro::concat_strings(&empty, &hello);
        assert!(intro::string_to_bytes(concat_result) == b"hello", 12);
        
        let prepend_result = intro::prepend_string(empty, hello);
        assert!(intro::string_to_bytes(prepend_result) == b"hello", 13);
    }
    
    #[test]
    fun test_unicode_strings() {
        // 测试 UTF-8 字符串
        let utf8_str = intro::create_string(b"\xE4\xB8\xAD\xE6\x96\x87"); // "中文" 的 UTF-8 编码
        assert!(intro::string_length(&utf8_str) == 6, 14); // UTF-8 字节长度
        assert!(intro::is_empty_string(&utf8_str) == false, 15);
    }
    
    #[test]
    fun test_string_mutations() {
        // 测试字符串修改
        let mut s = string::utf8(b"hello");
        intro::append_bytes(&mut s, b" ");
        intro::append_bytes(&mut s, b"world");
        
        assert!(intro::string_to_bytes(s) == b"hello world", 16);
        assert!(intro::string_length(&string::utf8(b"hello world")) == 11, 17);
    }
}