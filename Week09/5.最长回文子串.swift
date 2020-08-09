/*
 * @lc app=leetcode.cn id=5 lang=swift
 *
 * [5] 最长回文子串
 *
 * https://leetcode-cn.com/problems/longest-palindromic-substring/description/
 *
 * algorithms
 * Medium (30.67%)
 * Likes:    2429
 * Dislikes: 0
 * Total Accepted:    317.7K
 * Total Submissions: 1M
 * Testcase Example:  '"babad"'
 *
 * 给定一个字符串 s，找到 s 中最长的回文子串。你可以假设 s 的最大长度为 1000。
 * 
 * 示例 1：
 * 
 * 输入: "babad"
 * 输出: "bab"
 * 注意: "aba" 也是一个有效答案。
 * 
 * 
 * 示例 2：
 * 
 * 输入: "cbbd"
 * 输出: "bb"
 * 
 * 
 */

// @lc code=start
class Solution {
    func longestPalindrome(_ s: String) -> String {
        /// 思路一： 动态规划 O(n^2) O(n^2)
        return func1(s)
        /// 思路二： 中心扩展 O(n^2) O(1)
        // return func2(s)
    }
    func func1(_ s: String) -> String {
        guard s.count > 1 else { return s }
        var sa = Array(s), maxStart = 0, maxEnd = 0
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: s.count), count: s.count)
        for j in 0..<sa.count {
            for i in 0...j {
                if sa[i] == sa[j], (j - i < 2 || dp[i + 1][j - 1]) {
                    dp[i][j] = true
                    if j - i > maxEnd - maxStart { 
                        maxStart = i; maxEnd = j
                    }
                }
            }
        }
        return  String(sa[maxStart...maxEnd])
    }

    func func2(_ s: String) -> String {
        guard s.count > 1 else { return s }
        var sa = Array(s), maxStart = 0, maxEnd = 0
        for j in 0..<2 * sa.count - 1 {
            var l = j / 2, r = l + j % 2
            while l >= 0, r < sa.count , sa[l] == sa[r] {
                if r - l > maxEnd - maxStart {
                    maxStart = l; maxEnd = r
                }
                l -= 1; r += 1
            }
        }
        return  String(sa[maxStart...maxEnd])
    }
}
// @lc code=end

