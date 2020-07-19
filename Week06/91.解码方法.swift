/*
 * @lc app=leetcode.cn id=91 lang=swift
 *
 * [91] 解码方法
 *
 * https://leetcode-cn.com/problems/decode-ways/description/
 *
 * algorithms
 * Medium (23.70%)
 * Likes:    437
 * Dislikes: 0
 * Total Accepted:    55.8K
 * Total Submissions: 233K
 * Testcase Example:  '"12"'
 *
 * 一条包含字母 A-Z 的消息通过以下方式进行了编码：
 * 
 * 'A' -> 1
 * 'B' -> 2
 * ...
 * 'Z' -> 26
 * 
 * 
 * 给定一个只包含数字的非空字符串，请计算解码方法的总数。
 * 
 * 示例 1:
 * 
 * 输入: "12"
 * 输出: 2
 * 解释: 它可以解码为 "AB"（1 2）或者 "L"（12）。
 * 
 * 
 * 示例 2:
 * 
 * 输入: "226"
 * 输出: 3
 * 解释: 它可以解码为 "BZ" (2 26), "VF" (22 6), 或者 "BBF" (2 2 6) 。
 * 
 * 
 */

// @lc code=start
class Solution {
    func numDecodings(_ s: String) -> Int {
        /// 思路一： 动态规划 O(n) O(n)
        // return func1(s)

        /// 思路一： 动态规划 优化空间复杂度 O(n) O(1)
        // return func2(s)
        return func3(s)
    }
    func func1(_ s: String) -> Int {
        guard s.count > 0, s.first != "0" else { return 0 }
        var dp = [Int](repeating: 0, count: s.count)
        dp[0] = 1
        var sa = Array(s)
        for i in 1..<sa.count {
            if sa[i] != "0" { dp[i] = dp[i - 1] }
            if let num = Int(String(sa[i-1...i])), num >= 10, num <= 26 {
                i == 1 ? ( dp[i] += 1 ) : ( dp[i] += dp[i - 2] )
            }
        }
        return dp.last!
    }
    func func2(_ s: String) -> Int {
        guard s.count > 0, s.first != "0" else { return 0 }
        var count = 1, pre = 1
        var sa = Array(s)
        for i in 1..<sa.count {
            var cur = 0
            if sa[i] > "0" { cur += count }
            if let num = Int(String(sa[i-1...i])), num >= 10, num <= 26 {
                cur += pre
            }
            pre = count 
            count = cur
            if pre == 0 { return 0 } 
        }
        return count 
    }
    func func3(_ s: String) -> Int {
        guard s.count > 0, s.first != "0" else { return 0 }
        var count = 1, pre = 1
        var sa = Array(s)
        for i in 1..<sa.count {
            let temp = count 
            if sa[i] == "0" { 
                if sa[i - 1] == "1" || sa[i - 1] == "2" { count = pre }
                else { return 0 } 
            }else if let num = Int(String(sa[i-1...i])), num >= 10, num <= 26 {
                count += pre
            }
            pre = temp 
        }
        return count 
    }
}
// @lc code=end

