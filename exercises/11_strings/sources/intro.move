/*
这是您的第十二个 Move 练习 - 学习字符串处理（Strings）！

// HINT: Move 中字符串通常用 vector<u8> 表示
// HINT: 使用 std::string 模块处理 UTF-8 字符串
// HINT: 字符串字面量使用 b"hello" 语法
// HINT: string::utf8() 将字节向量转换为字符串
// TODO: 学习字符串的创建和操作
// TODO: 掌握字符串的连接、比较和处理
// TODO: 理解字节向量与字符串的转换
*/

/// Module: intro
module intro::intro {
    use std::string::{Self, String};
    
    /// === 基本字符串操作 ===
    
    /// 创建字符串
    public fun create_string(bytes: vector<u8>): String {
        // TODO: 将字节向量转换为字符串
        // HINT: string::utf8(bytes)
        
    }
    
    /// 获取字符串长度
    public fun string_length(s: &String): u64 {
        // TODO: 返回字符串的长度
        // HINT: string::length(s)
        
    }
    
    /// 检查字符串是否为空
    public fun is_empty_string(s: &String): bool {
        // TODO: 检查字符串是否为空
        // HINT: string::is_empty(s)
        
    }
    
    /// 将字符串转换回字节向量
    public fun string_to_bytes(s: String): vector<u8> {
        // TODO: 将字符串转换为字节向量
        // HINT: string::bytes(&s)
        
    }
    
    /// === 字符串连接 ===
    
    /// 连接两个字符串
    public fun concat_strings(s1: &String, s2: &String): String {
        // TODO: 连接两个字符串
        // HINT: 使用 string::append 或创建新字符串

    }
    
    /// 连接字符串和字节向量
    public fun append_bytes(s: &mut String, bytes: vector<u8>) {
        // TODO: 向字符串末尾添加字节
        // HINT: string::append_utf8(s, bytes)
        
    }
    
    /// 在字符串前添加前缀
    public fun prepend_string(prefix: String, s: String): String {
        // TODO: 在字符串前添加前缀
        // HINT: 创建新字符串并连接
        
    }
    
    /// === 字符串比较 ===
    
    /// 比较两个字符串是否相等
    public fun strings_equal(s1: &String, s2: &String): bool {
        // TODO: 比较两个字符串是否相等
        // HINT: s1 == s2 或 string::bytes(s1) == string::bytes(s2)
        
    }

}