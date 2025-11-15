/*
这是您的第十二个 Move 练习 - 学习字符串处理（Strings）！

// HINT: 在 Move 中，字符串实际上是 vector<u8>，表示 UTF-8 编码的字节序列
// HINT: 使用 b"..." 语法创建字符串字面量：b"Hello, Move!"
// HINT: 使用 std::string 模块的函数处理字符串
// HINT: String 类型是 std::string::String，它封装了 vector<u8>
// HINT: 使用 string::utf8(bytes) 从字节创建字符串
// HINT: 使用 string::bytes(s) 获取字符串的字节
// HINT: 使用 string::append(s1, s2) 连接字符串
// HINT: 使用 string::sub_string(s, start, end) 获取子字符串
// TODO: 理解字符串与字节向量的关系
// TODO: 学习字符串的常见操作（创建、连接、切片、比较）
// TODO: 掌握 String 类型的使用
// TODO: 了解 UTF-8 编码
// 1. 学习字符串字面量语法
// 2. 掌握字符串的创建方法
// 3. 理解字符串与字节向量的转换
// 4. 学习字符串的连接和切片
// 5. 掌握字符串的比较操作
*/

/// Module: intro
module intro::intro {
    use std::string::{Self, String};
    
    /// === 字符串字面量 ===
    
    /// 创建字符串字面量
    public fun create_string_literal(): vector<u8> {
        // TODO: 返回字符串字面量 b"Hello, Move!"
        
        b"Hello, Move!"
    }
    
    /// 创建多个字符串字面量
    public fun create_multiple_literals(): (vector<u8>, vector<u8>) {
        // TODO: 返回两个字符串：(b"Hello", b"World")
        
        (b"Hello", b"World")
    }
    
    /// === String 类型 ===
    
    /// 创建 String 对象
    public fun create_string(): String {
        // TODO: 使用 string::utf8 从字节创建字符串
        // HINT: string::utf8(b"Hello")
        
        string::utf8(b"Hello")
    }
    
    /// 从字节创建字符串
    public fun bytes_to_string(bytes: vector<u8>): String {
        // TODO: 使用 string::utf8 将字节向量转换为字符串
        
        string::utf8(bytes)
    }
    
    /// 从字符串获取字节
    public fun string_to_bytes(s: String): vector<u8> {
        // TODO: 使用 string::bytes 获取字符串的字节
        // HINT: string::bytes(&s) 返回 &vector<u8>，需要用 * 解引用
        
        *string::bytes(&s)
    }
    
    /// === 字符串操作 ===
    
    /// 获取字符串长度
    public fun get_length(s: &String): u64 {
        // TODO: 使用 string::length 获取字符串长度
        
        string::length(s)
    }
    
    /// 检查字符串是否为空
    public fun is_empty(s: &String): bool {
        // TODO: 使用 string::is_empty 检查是否为空
        
        string::is_empty(s)
    }
    
    /// 连接两个字符串
    public fun concatenate(s1: String, s2: String): String {
        // TODO: 使用 string::append 连接字符串
        // HINT: string::append(&mut s1, s2) 会将 s2 添加到 s1 后面
        // HINT: s1 会被修改，s2 会被移动
        
        string::append(&mut s1, s2);
        s1
    }
    
    /// 连接字符串和字面量
    public fun concatenate_literal(s: String, literal: vector<u8>): String {
        // TODO: 将字符串和字面量连接
        // HINT: 先使用 string::utf8 将字面量转换为 String，然后连接
        
        let literal_str = string::utf8(literal);
        string::append(&mut s, literal_str);
        s
    }
    
    /// 获取子字符串
    public fun substring(s: String, start: u64, end: u64): String {
        // TODO: 使用 string::sub_string 获取子字符串
        // HINT: string::sub_string(s, start, end) 返回从 start 到 end（不包括 end）的子字符串
        
        string::sub_string(s, start, end)
    }
    
    /// 获取字符串的前 n 个字符
    public fun take_prefix(s: String, n: u64): String {
        // TODO: 获取字符串的前 n 个字符
        // HINT: 使用 string::sub_string(s, 0, n)
        
        string::sub_string(s, 0, n)
    }
    
    /// 获取字符串的后缀（从索引 n 开始到结尾）
    public fun take_suffix(s: String, n: u64): String {
        // TODO: 获取从索引 n 开始到结尾的子字符串
        // HINT: 先获取长度，然后使用 string::sub_string(s, n, length)
        
        let len = string::length(&s);
        string::sub_string(s, n, len)
    }
    
    /// === 字符串比较 ===
    
    /// 比较两个字符串是否相等
    public fun equals(s1: &String, s2: &String): bool {
        // TODO: 使用 string::equals 比较两个字符串
        
        string::equals(s1, s2)
    }
    
    /// 检查字符串是否包含子串
    public fun contains(s: &String, substring: &String): bool {
        // TODO: 使用 string::contains 检查是否包含子串
        
        string::contains(s, substring)
    }
    
    /// === 字符串转换 ===
    
    /// 将数字转换为字符串（简化版本）
    public fun number_to_string(num: u64): String {
        // TODO: 将数字转换为字符串表示
        // HINT: 这里简化，可以直接返回字符串字面量
        // HINT: 实际应用中需要使用数字格式化函数
        
        if (num == 0) {
            string::utf8(b"0")
        } else if (num == 1) {
            string::utf8(b"1")
        } else if (num == 42) {
            string::utf8(b"42")
        } else {
            string::utf8(b"number")
        }
    }
    
    /// === 字符串实用函数 ===
    
    /// 重复字符串（简化版本）
    public fun repeat_string(s: String, times: u64): String {
        // TODO: 重复字符串指定次数
        // HINT: 使用循环，每次将 s 连接到结果字符串
        
        let mut result = string::utf8(b"");
        let i = 0;
        
        while (i < times) {
            let copy = *string::bytes(&s);
            let copy_str = string::utf8(copy);
            string::append(&mut result, copy_str);
            i = i + 1;
        };
        
        result
    }
    
    /// 修剪字符串开头（简化版本）
    public fun trim_start(s: String, prefix: &String): String {
        // TODO: 如果字符串以 prefix 开头，则移除该前缀
        // HINT: 检查是否以 prefix 开头，如果是则返回子字符串
        
        let prefix_len = string::length(prefix);
        let s_len = string::length(&s);
        
        if (s_len >= prefix_len) {
            let prefix_of_s = string::sub_string(*&s, 0, prefix_len);
            if (string::equals(&prefix_of_s, prefix)) {
                string::sub_string(s, prefix_len, s_len)
            } else {
                s
            }
        } else {
            s
        }
    }
    
    /// === 字符串与向量 ===
    
    /// 创建字符串向量
    public fun create_string_vector(): vector<String> {
        // TODO: 创建包含多个字符串的向量
        // HINT: vector[s1, s2, s3] 其中 s1, s2, s3 是 String 类型
        
        vector[
            string::utf8(b"first"),
            string::utf8(b"second"),
            string::utf8(b"third")
        ]
    }
    
    /// 连接字符串向量中的所有字符串
    public fun join_strings(strings: vector<String>): String {
        // TODO: 连接向量中的所有字符串
        // HINT: 遍历向量，依次连接每个字符串
        
        let mut result = string::utf8(b"");
        let i = 0;
        let len = vector::length(&strings);
        
        while (i < len) {
            let s = *vector::borrow(&strings, i);
            string::append(&mut result, s);
            i = i + 1;
        };
        
        result
    }
}

