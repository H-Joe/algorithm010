/*
 * @lc app=leetcode.cn id=115 lang=swift
 *
 * [115] 不同的子序列
 *
 * https://leetcode-cn.com/problems/distinct-subsequences/description/
 *
 * algorithms
 * Hard (47.99%)
 * Likes:    228
 * Dislikes: 0
 * Total Accepted:    16.6K
 * Total Submissions: 34K
 * Testcase Example:  '"rabbbit"\n"rabbit"'
 *
 * 给定一个字符串 S 和一个字符串 T，计算在 S 的子序列中 T 出现的个数。
 * 
 * 一个字符串的一个子序列是指，通过删除一些（也可以不删除）字符且不干扰剩余字符相对位置所组成的新字符串。（例如，"ACE" 是 "ABCDE"
 * 的一个子序列，而 "AEC" 不是）
 * 
 * 题目数据保证答案符合 32 位带符号整数范围。
 * 
 * 
 * 
 * 示例 1：
 * 
 * 输入：S = "rabbbit", T = "rabbit"
 * 输出：3
 * 解释：
 * 
 * 如下图所示, 有 3 种可以从 S 中得到 "rabbit" 的方案。
 * (上箭头符号 ^ 表示选取的字母)
 * 
 * rabbbit
 * ^^^^ ^^
 * rabbbit
 * ^^ ^^^^
 * rabbbit
 * ^^^ ^^^
 * 
 * 
 * 示例 2：
 * 
 * 输入：S = "babgbag", T = "bag"
 * 输出：5
 * 解释：
 * 
 * 如下图所示, 有 5 种可以从 S 中得到 "bag" 的方案。 
 * (上箭头符号 ^ 表示选取的字母)
 * 
 * babgbag
 * ^^ ^
 * babgbag
 * ^^    ^
 * babgbag
 * ^    ^^
 * babgbag
 * ⁠ ^  ^^
 * babgbag
 * ⁠   ^^^
 * 
 */

// @lc code=start
class Solution {
    func numDistinct(_ s: String, _ t: String) -> Int {
        /// 思路一：动态规划 O(mn) O(mn)
        // return func1(s, t)
        return func2(s, t)
        
    }

    func func1(_ s: String, _ t: String) -> Int {
        guard s.count >= t.count else { return 0 }
        let sA = Array(s), tA = Array(t)
        let m = sA.count, n = tA.count 
        // s的前 i 个字符（下标0到 i-1）有dp[i][j]种方法变为t的前 j 个字符（下标0到 j-1）
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)
        for i in 0...m { dp[i][0] = 1 }
        for i in 1...m {
            for j in 1...n {
                if sA[i - 1] == tA[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1] + dp[i - 1][j]
                }else {
                    dp[i][j] = dp[i - 1][j]
                }
            }
        }
        return dp[m][n]
    }

   func func2(_ s: String, _ t: String) -> Int {
        guard s.count >= t.count else { return 0 }
        let sA = Array(s), tA = Array(t)
        let m = sA.count, n = tA.count 
        var dp = [Int](repeating: 1, count: m + 1)
        for j in 1...n {
            var pre = dp[0]
            dp[0] = 0
            for i in 1...m {
                let temp = dp[i]
                if sA[i - 1] == tA[j - 1] {
                    dp[i] = dp[i - 1] + pre
                }else {
                    dp[i] = dp[i - 1]
                }
                pre = temp
            }
        }
        return dp[m]
    }
}
// @lc code=end

