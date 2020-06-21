/*
 * @lc app=leetcode.cn id=242 lang=swift
 *
 * [242] 有效的字母异位词
 *
 * https://leetcode-cn.com/problems/valid-anagram/description/
 *
 * algorithms
 * Easy (60.10%)
 * Likes:    203
 * Dislikes: 0
 * Total Accepted:    107.1K
 * Total Submissions: 177.9K
 * Testcase Example:  '"anagram"\n"nagaram"'
 *
 * 给定两个字符串 s 和 t ，编写一个函数来判断 t 是否是 s 的字母异位词。
 * 
 * 示例 1:
 * 
 * 输入: s = "anagram", t = "nagaram"
 * 输出: true
 * 
 * 
 * 示例 2:
 * 
 * 输入: s = "rat", t = "car"
 * 输出: false
 * 
 * 说明:
 * 你可以假设字符串只包含小写字母。
 * 
 * 进阶:
 * 如果输入字符串包含 unicode 字符怎么办？你能否调整你的解法来应对这种情况？
 * 
 */

// @lc code=start
class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        /// 思路一： 排序比较 O(nlogn) and O(1)
        // return func1(s, t)

        /// 思路二： 统计相同字符的个数 O(n) and O(1)
        return func2(s, t)
    }

    func func1(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return  false }
        return s.sorted() == t.sorted()
    }

    func func2(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }
        var counter = Array(repeating: 0, count: 26)
        let aus = Int("a".unicodeScalars.first!.value)
        for c in s.unicodeScalars {
            counter[Int(c.value) - aus] += 1
        }
        for c in t.unicodeScalars {
            counter[Int(c.value) - aus] -= 1
        }
        
        if counter.first(where: { $0 != 0}) != nil {
            return false
        }
        return true
    }
}
// @lc code=end

