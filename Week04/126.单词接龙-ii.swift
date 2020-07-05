/*
 * @lc app=leetcode.cn id=126 lang=swift
 *
 * [126] 单词接龙 II
 *
 * https://leetcode-cn.com/problems/word-ladder-ii/description/
 *
 * algorithms
 * Hard (38.33%)
 * Likes:    280
 * Dislikes: 0
 * Total Accepted:    20.1K
 * Total Submissions: 52.4K
 * Testcase Example:  '"hit"\n"cog"\n["hot","dot","dog","lot","log","cog"]'
 *
 * 给定两个单词（beginWord 和 endWord）和一个字典 wordList，找出所有从 beginWord 到 endWord
 * 的最短转换序列。转换需遵循如下规则：
 * 
 * 
 * 每次转换只能改变一个字母。
 * 转换后得到的单词必须是字典中的单词。
 * 
 * 
 * 说明:
 * 
 * 
 * 如果不存在这样的转换序列，返回一个空列表。
 * 所有单词具有相同的长度。
 * 所有单词只由小写字母组成。
 * 字典中不存在重复的单词。
 * 你可以假设 beginWord 和 endWord 是非空的，且二者不相同。
 * 
 * 
 * 示例 1:
 * 
 * 输入:
 * beginWord = "hit",
 * endWord = "cog",
 * wordList = ["hot","dot","dog","lot","log","cog"]
 * 
 * 输出:
 * [
 * ⁠ ["hit","hot","dot","dog","cog"],
 * ["hit","hot","lot","log","cog"]
 * ]
 * 
 * 
 * 示例 2:
 * 
 * 输入:
 * beginWord = "hit"
 * endWord = "cog"
 * wordList = ["hot","dot","dog","lot","log"]
 * 
 * 输出: []
 * 
 * 解释: endWord "cog" 不在字典中，所以不存在符合要求的转换序列。
 * 
 */

// @lc code=start
class Solution {
    func findLadders(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> [[String]] {
        guard !wordList.isEmpty, wordList.contains(endWord) else { return [] }
        var res = [[String]](), paris = [String]()
        var wordSet = Set(wordList)
        var levelDic = [String: Set<String>]()

        let found = bfs(beginWord, endWord, wordSet, &levelDic)
        if !found { return res }

        paris.append(beginWord)
        dfs(beginWord, endWord, levelDic, &paris, &res)
        return res
        
    }

    func bfs(_ beginWord: String, _ endWord: String, _ wordSet: Set<String>, _ levelDic: inout [String: Set<String>]) -> Bool {
            var visited = Set<String>(), beginVisited = Set<String>(), endVisited = Set<String>()
            visited.update(with: beginWord); visited.update(with: endWord)
            beginVisited.update(with: beginWord); endVisited.update(with: endWord)

            var found = false, forward = true
            func addToLevelDic(_ str1: String, _ str2: String, _ forward: Bool, _ levelDic: inout [String: Set<String>]) {
                var s1 = str1, s2 = str2
                if !forward { swap(&s1, &s2) }
                if !levelDic.keys.contains(s1) {
                    levelDic[s1] = Set<String>()
                }
                levelDic[s1]!.update(with: s2)
            }

            while !beginVisited.isEmpty && !endVisited.isEmpty {
                if beginVisited.count > endVisited.count {
                    swap(&beginVisited, &endVisited)
                    forward = !forward
                }
                var nextLevelVisited = Set<String>()
                for currentWord in beginVisited {
                    for i in 0..<currentWord.count {
                        var wa = Array(currentWord)
                        for c in "abcdefghijklmnopqrstuvwxyz" where  c != wa[i] {
                            wa[i] = c
                            let newWord = String(wa)
                            if wordSet.contains(newWord){
                                if endVisited.contains(newWord) {
                                    found = true 
                                    addToLevelDic(currentWord, newWord, forward, &levelDic)
                                }
                                if !visited.contains(newWord) {
                                    nextLevelVisited.update(with: newWord)
                                    addToLevelDic(currentWord, newWord, forward, &levelDic)
                                }
                            }
                        }
                    }
                }
                beginVisited = nextLevelVisited
                visited.formUnion(nextLevelVisited)
                if found { break }
            }
            return found
        }

        func dfs(_ beginWord: String, _ endWord: String, _ levelDic: [String: Set<String>], _ paris: inout [String], _ res: inout [[String]]) {
            if beginWord == endWord {
                res.append(paris)
                return
            }
            if !levelDic.keys.contains(beginWord) { return }
            let levelWords = levelDic[beginWord]!
            for word in levelWords {
                paris.append(word)
                dfs(word, endWord, levelDic, &paris, &res)
                paris.removeLast()
            }
        }
}
// @lc code=end

