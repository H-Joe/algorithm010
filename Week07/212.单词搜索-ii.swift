/*
 * @lc app=leetcode.cn id=212 lang=swift
 *
 * [212] 单词搜索 II
 *
 * https://leetcode-cn.com/problems/word-search-ii/description/
 *
 * algorithms
 * Hard (40.87%)
 * Likes:    197
 * Dislikes: 0
 * Total Accepted:    17.2K
 * Total Submissions: 41.4K
 * Testcase Example:  '[["o","a","a","n"],["e","t","a","e"],["i","h","k","r"],["i","f","l","v"]]\n["oath","pea","eat","rain"]'
 *
 * 给定一个二维网格 board 和一个字典中的单词列表 words，找出所有同时在二维网格和字典中出现的单词。
 * 
 * 
 * 单词必须按照字母顺序，通过相邻的单元格内的字母构成，其中“相邻”单元格是那些水平相邻或垂直相邻的单元格。同一个单元格内的字母在一个单词中不允许被重复使用。
 * 
 * 示例:
 * 
 * 输入: 
 * words = ["oath","pea","eat","rain"] and board =
 * [
 * ⁠ ['o','a','a','n'],
 * ⁠ ['e','t','a','e'],
 * ⁠ ['i','h','k','r'],
 * ⁠ ['i','f','l','v']
 * ]
 * 
 * 输出: ["eat","oath"]
 * 
 * 说明:
 * 你可以假设所有输入都由小写字母 a-z 组成。
 * 
 * 提示:
 * 
 * 
 * 你需要优化回溯算法以通过更大数据量的测试。你能否早点停止回溯？
 * 如果当前单词不存在于所有单词的前缀中，则可以立即停止回溯。什么样的数据结构可以有效地执行这样的操作？散列表是否可行？为什么？
 * 前缀树如何？如果你想学习如何实现一个基本的前缀树，请先查看这个问题： 实现Trie（前缀树）。
 * 
 * 
 */

// @lc code=start
class Solution {
    /*
    国际站的复杂度分析：
    Let m,n be the width and height of the 2D array
    L be the average length of words in "words"
    W be the number of words

    result: takes O(W) space
    buildTrie(): takes O(LW) runtime and O(LW) space
    going through every cell takes O(mn) runtime
    check(): at each cell, we check until we either reach all possible leaf nodes OR reach the end of the board (in case one word is longer than the size of the board) => takes O(min(LW, mn)) runtime, O(L) call stack space
    In total,
    Time: O(mn * min(LW, mn) + LW), Space: O(LW)
    or simpler: Time: O(mn * LW), Space: O(LW) 
    */
    class TrieNode {
        var isEnd = false
        var nodes = [Character: TrieNode]()
    }
    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        guard board.count > 0, board[0].count > 0, words.count > 0 else { return [] }
        var m = board.count , n = board[0].count , board = board
        var dx = [-1, 1, 0, 0], dy = [0, 0, -1, 1]
        var res = Set<String>()
        var root: TrieNode?

         func _buildTrie(_ words: [String]) -> TrieNode? {
             guard words.count > 0 else { return nil }
             var root = TrieNode()
             for word in words {
                var node = root
                for c in word {
                    if let target = node.nodes[c] { node = target }
                    else {
                        let target = TrieNode()
                        node.nodes[c] = target
                        node = target
                    }
                }
                node.isEnd = true
            }
            return root
        }

        func _dfs(_ board: inout [[Character]], _ i: Int, _ j: Int, _ word: String, _ root: TrieNode){
            let word = word + String(board[i][j])
            let root = root.nodes[board[i][j]]!
            if root.isEnd { res.insert(word) }
            let temp = board[i][j]
            board[i][j] = "#"
            for k in 0..<4 {
                let x = i + dx[k], y = j + dy[k]
                if x >= 0, x < m, y >= 0, y < n, board[x][y] != "#", root.nodes[board[x][y]] != nil {
                    _dfs(&board, x, y, word, root)
                }
            }
            board[i][j] = temp
        }

        root = _buildTrie(words)
        for i in 0..<m {
            for j in 0..<n {
                if root?.nodes[board[i][j]] != nil {
                    _dfs(&board, i, j, "", root!)
                }
            }
        }
        return Array(res)
        
    }
}
// @lc code=end

