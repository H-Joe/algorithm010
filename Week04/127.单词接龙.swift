/*
 * @lc app=leetcode.cn id=127 lang=swift
 *
 * [127] 单词接龙
 *
 * https://leetcode-cn.com/problems/word-ladder/description/
 *
 * algorithms
 * Medium (42.19%)
 * Likes:    357
 * Dislikes: 0
 * Total Accepted:    46.5K
 * Total Submissions: 109.5K
 * Testcase Example:  '"hit"\n"cog"\n["hot","dot","dog","lot","log","cog"]'
 *
 * 给定两个单词（beginWord 和 endWord）和一个字典，找到从 beginWord 到 endWord
 * 的最短转换序列的长度。转换需遵循如下规则：
 * 
 * 
 * 每次转换只能改变一个字母。
 * 转换过程中的中间单词必须是字典中的单词。
 * 
 * 
 * 说明:
 * 
 * 
 * 如果不存在这样的转换序列，返回 0。
 * 所有单词具有相同的长度。
 * 所有单词只由小写字母组成。
 * 字典中不存在重复的单词。
 * 你可以假设 beginWord 和 endWord 是非空的，且二者不相同。
 * 
 * 
 * 示例 1:
 * 
 * 输入:
 * beginWord = "hit",
 * endWord = "cog",
 * wordList = ["hot","dot","dog","lot","log","cog"]
 * 
 * 输出: 5
 * 
 * 解释: 一个最短转换序列是 "hit" -> "hot" -> "dot" -> "dog" -> "cog",
 * ⁠    返回它的长度 5。
 * 
 * 
 * 示例 2:
 * 
 * 输入:
 * beginWord = "hit"
 * endWord = "cog"
 * wordList = ["hot","dot","dog","lot","log"]
 * 
 * 输出: 0
 * 
 * 解释: endWord "cog" 不在字典中，所以无法进行转换。
 * 
 */

// @lc code=start
class Solution {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        /// 思路一： BFS 待优化
        return func1(beginWord, endWord, wordList)
    }
    func func1(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        guard !wordList.isEmpty, wordList.contains(endWord) else { return 0 }
        // var wordCharactorSet = Set<Character>()
        // wordList.map{ $0.map{ wordCharactorSet.update(with: $0) } }
        var queue = [(String, Int)]()
        // var visited = [String]()
        var wordSet = Set(wordList)
        queue.append((beginWord, 1))
        while !queue.isEmpty {
                let first = queue.removeFirst()
                if first.0 == endWord { return first.1 }
                for i in 0..<first.0.count {
                    var fa = Array(first.0)
                    for cell in "abcdefghijklmnopqrstuvwxyz" where cell != fa[i] {
                        /// process current level 
                        fa[i] = cell
                        let newWord = String(fa)
                        if newWord == endWord { return first.1 + 1 }
                        if wordSet.contains(newWord) {
                            queue.append((newWord, first.1 + 1))
                            wordSet.remove(newWord)                           
                        }
                    }
                }
        }
        return 0
    }
}
// @lc code=end

