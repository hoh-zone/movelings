/*
这是您的第十二个 Move 练习 - 学习字符串处理（Strings）！

// HINT: 在 Move 中，字符串实际上是 vector<u8>，表示 UTF-8 编码的字节序列
// HINT: 使用 b"..." 语法创建字符串字面量：b"Hello, Move!"
// HINT: 使用 std::string 模块的函数处理字符串
// HINT: String 类型是 std::string::String，它封装了 vector<u8>
// HINT: 使用 .to_string() 方法从字节创建字符串
// HINT: 使用 string::as_bytes(s) 获取字符串的字节
// HINT: 使用 string::append(s1, s2) 连接字符串
// HINT: 使用 string::substring(s, start, end) 获取子字符串
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
        // 在此处填写代码
    }
    
    /// 创建多个字符串字面量
    public fun create_multiple_literals(): (vector<u8>, vector<u8>) {
        // TODO: 返回两个字符串：(b"Hello", b"World")
        // 在此处填写代码
    }
    
    /// === String 类型 ===
    
    /// 创建 String 对象
    public fun create_string(): String {
        // TODO: 使用 .to_string() 方法从字节创建字符串
        // HINT: b"Hello".to_string()
        // 在此处填写代码
    }
    
    /// 从字节创建字符串
    public fun bytes_to_string(bytes: vector<u8>): String {
        // TODO: 使用 .to_string() 方法将字节向量转换为字符串
        // HINT: bytes.to_string()
        // 在此处填写代码
    }
    
    /// 从字符串获取字节
    public fun string_to_bytes(s: String): vector<u8> {
        // TODO: 使用 string::as_bytes 获取字符串的字节
        // HINT: string::as_bytes(&s) 返回 &vector<u8>，需要用 * 解引用
        // 在此处填写代码
    }
    
    /// === 字符串操作 ===
    
    /// 获取字符串长度
    public fun get_length(s: &String): u64 {
        // TODO: 使用 string::length 获取字符串长度
        // 在此处填写代码
    }
    
    /// 检查字符串是否为空
    public fun is_empty(s: &String): bool {
        // TODO: 使用 string::is_empty 检查是否为空
        // 在此处填写代码
    }
    
    /// 连接两个字符串
    public fun concatenate(s1: String, s2: String): String {
        // TODO: 使用 string::append 连接字符串
        // HINT: string::append(&mut s1, s2) 会将 s2 添加到 s1 后面
        // HINT: s1 会被修改，s2 会被移动
        // 在此处填写代码
    }
    
    /// 连接字符串和字面量
    public fun concatenate_literal(s: String, literal: vector<u8>): String {
        // TODO: 将字符串和字面量连接
        // HINT: 先使用 .to_string() 将字面量转换为 String，然后连接
        // 在此处填写代码
    }
    
    /// 获取子字符串
    public fun substring(s: String, start: u64, end: u64): String {
        // TODO: 使用 string::substring 获取子字符串
        // HINT: string::substring(&s, start, end) 返回从 start 到 end（不包括 end）的子字符串
        // 在此处填写代码
    }
    
    /// 获取字符串的前 n 个字符
    public fun take_prefix(s: String, n: u64): String {
        // TODO: 获取字符串的前 n 个字符
        // HINT: 使用 string::substring(&s, 0, n)
        // 在此处填写代码
    }
    
    /// 获取字符串的后缀（从索引 n 开始到结尾）
    public fun take_suffix(s: String, n: u64): String {
        // TODO: 获取从索引 n 开始到结尾的子字符串
        // HINT: 先获取长度，然后使用 string::substring(&s, n, length)
        // 在此处填写代码
    }
    
    /// === 字符串比较 ===
    
    /// 比较两个字符串是否相等
    public fun equals(s1: &String, s2: &String): bool {
        // TODO: 通过比较字节是否相等来判断
        // HINT: 使用 string::as_bytes 获取字节，然后比较
        // 在此处填写代码
    }
    
    /// 检查字符串是否包含子串
    public fun contains(s: &String, substring: &String): bool {
        // 朴素子串查找：按字节比较
        let hay = string::as_bytes(s);
        let needle = string::as_bytes(substring);
        let n = vector::length(hay);
        let m = vector::length(needle);
        if (m == 0) {
            return true
        };
        if (n < m) {
            return false
        };
        let mut i = 0;
        while (i <= n - m) {
            let mut j = 0;
            let mut matched = true;
            while (j < m) {
                // TODO: 使用索引语法比较字节
                // HINT: if (hay[i + j] != needle[j]) { matched = false; break }
                // 在此处填写代码
                j = j + 1;
            };
            if (matched) {
                return true
            };
            i = i + 1;
        };
        false
    }
    
    /// === 字符串转换 ===
    
    /// 将数字转换为字符串（简化版本）
    public fun number_to_string(num: u64): String {
        // TODO: 将数字转换为字符串表示
        // HINT: 这里简化，可以直接返回字符串字面量
        // HINT: 使用 .to_string() 方法
        // 在此处填写代码
    }
    
    /// === 字符串实用函数 ===
    
    /// 重复字符串（简化版本）
    public fun repeat_string(s: String, times: u64): String {
        // TODO: 重复字符串指定次数
        // HINT: 使用循环，每次将 s 连接到结果字符串
        // HINT: 使用 .to_string() 方法创建字符串
        // 在此处填写代码
    }
    
    /// 修剪字符串开头（简化版本）
    public fun trim_start(s: String, prefix: &String): String {
        // TODO: 如果字符串以 prefix 开头，则移除该前缀
        // HINT: 检查是否以 prefix 开头，如果是则返回子字符串
        // 在此处填写代码
    }
    
    /// === 字符串与向量 ===
    
    /// 创建字符串向量
    public fun create_string_vector(): vector<String> {
        // TODO: 创建包含多个字符串的向量
        // HINT: vector[s1, s2, s3] 其中 s1, s2, s3 是 String 类型
        // HINT: 使用 .to_string() 方法创建字符串
        // 在此处填写代码
    }
    
    /// 连接字符串向量中的所有字符串
    public fun join_strings(strings: vector<String>): String {
        // TODO: 连接向量中的所有字符串
        // HINT: 遍历向量，依次连接每个字符串
        // HINT: 使用索引语法 strings[i] 访问元素
        // 在此处填写代码
    }
}
