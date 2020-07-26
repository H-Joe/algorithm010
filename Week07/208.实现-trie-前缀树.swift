/*
 * @lc app=leetcode.cn id=208 lang=swift
 *
 * [208] 实现 Trie (前缀树)
 *
 * https://leetcode-cn.com/problems/implement-trie-prefix-tree/description/
 *
 * algorithms
 * Medium (67.27%)
 * Likes:    352
 * Dislikes: 0
 * Total Accepted:    45.2K
 * Total Submissions: 66.6K
 * Testcase Example:  '["Trie","insert","search","search","startsWith","insert","search"]\n[[],["apple"],["apple"],["app"],["app"],["app"],["app"]]'
 *
 * 实现一个 Trie (前缀树)，包含 insert, search, 和 startsWith 这三个操作。
 * 
 * 示例:
 * 
 * Trie trie = new Trie();
 * 
 * trie.insert("apple");
 * trie.search("apple");   // 返回 true
 * trie.search("app");     // 返回 false
 * trie.startsWith("app"); // 返回 true
 * trie.insert("app");   
 * trie.search("app");     // 返回 true
 * 
 * 说明:
 * 
 * 
 * 你可以假设所有的输入都是由小写字母 a-z 构成的。
 * 保证所有输入均为非空字符串。
 * 
 * 
 */

// @lc code=start
/// 思路一： 参考官解 
class Trie {
    static let R = 26
    static let aSVal = Int(Character("a").asciiValue ?? 97)

    class TrieNode {
        var root = [TrieNode?](repeating: nil, count: R)
        var isEnd = false 
        init(){}
        func containsKey(_ char: Character) -> Bool {
            guard let _ = root[Int(char.asciiValue!) - aSVal] else { return false }
            return true
        }
        func put(_ char: Character, _ node: TrieNode?) {
            guard let targetASval = char.asciiValue else { return }
            root[Int(targetASval) - aSVal] = node
        }
        func get(_ char: Character) -> TrieNode? {
            guard let target = root[Int(char.asciiValue!) - aSVal] else { return nil }
            return target
        }
    }

    var root = TrieNode()
    /** Initialize your data structure here. */
    init() {

    }
    
    /// O(m) O(m)
    /** Inserts a word into the trie. */
    func insert(_ word: String) {
        guard !word.isEmpty else { return }
        var node = root
        for c in word {
            if !node.containsKey(c) { node.put(c, TrieNode()) }
            node = node.get(c)!
        }
        node.isEnd = true
    }
    
    /// O(m) O(1)
    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        guard !word.isEmpty else { return false }
        var node = root 
        for c in word {
            if !node.containsKey(c) { return false }
            node = node.get(c)!
        }
        return node.isEnd
    }
     /// O(m) O(1)
    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {
        guard !prefix.isEmpty else { return false }
        var node = root
        for c in prefix {
            if !node.containsKey(c) { return false }
            node = node.get(c)!
        }
        return true 
    }
}

/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */
// @lc code=end

