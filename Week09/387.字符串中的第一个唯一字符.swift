/*
 * @lc app=leetcode.cn id=387 lang=swift
 *
 * [387] 字符串中的第一个唯一字符
 *
 * https://leetcode-cn.com/problems/first-unique-character-in-a-string/description/
 *
 * algorithms
 * Easy (45.28%)
 * Likes:    246
 * Dislikes: 0
 * Total Accepted:    90.8K
 * Total Submissions: 196.8K
 * Testcase Example:  '"leetcode"'
 *
 * 给定一个字符串，找到它的第一个不重复的字符，并返回它的索引。如果不存在，则返回 -1。
 * 
 * 
 * 
 * 示例：
 * 
 * s = "leetcode"
 * 返回 0
 * 
 * s = "loveleetcode"
 * 返回 2
 * 
 * 
 * 
 * 
 * 提示：你可以假定该字符串只包含小写字母。
 * 
 */

// @lc code=start
class Solution {
    func firstUniqChar(_ s: String) -> Int {
        return func1(s)
    }
    func func1(_ s: String) -> Int {
        var sA = Array(s)
        guard sA.count > 0 else { return -1 }
        var hashDic = sA.reduce(into: [:]) { $0[$1, default: 0] += 1 }
        for i in 0..<sA.count {
            if hashDic[sA[i]] == 1 { return i }
        }
        return -1
    }
    
}
// @lc code=end

