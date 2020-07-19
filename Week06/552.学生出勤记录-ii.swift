/*
 * @lc app=leetcode.cn id=552 lang=swift
 *
 * [552] 学生出勤记录 II
 *
 * https://leetcode-cn.com/problems/student-attendance-record-ii/description/
 *
 * algorithms
 * Hard (40.54%)
 * Likes:    82
 * Dislikes: 0
 * Total Accepted:    2.8K
 * Total Submissions: 6.9K
 * Testcase Example:  '1'
 *
 * 给定一个正整数 n，返回长度为 n 的所有可被视为可奖励的出勤记录的数量。 答案可能非常大，你只需返回结果mod 10^9 + 7的值。
 * 
 * 学生出勤记录是只包含以下三个字符的字符串：
 * 
 * 
 * 'A' : Absent，缺勤
 * 'L' : Late，迟到
 * 'P' : Present，到场
 * 
 * 
 * 如果记录不包含多于一个'A'（缺勤）或超过两个连续的'L'（迟到），则该记录被视为可奖励的。
 * 
 * 示例 1:
 * 
 * 
 * 输入: n = 2
 * 输出: 8 
 * 解释：
 * 有8个长度为2的记录将被视为可奖励：
 * "PP" , "AP", "PA", "LP", "PL", "AL", "LA", "LL"
 * 只有"AA"不会被视为可奖励，因为缺勤次数超过一次。
 * 
 * 注意：n 的值不会超过100000。
 * 
 */

// @lc code=start
class Solution {
    public let M = 1000000007
    func checkRecord(_ n: Int) -> Int {
        /// 思路一： 暴力 O(3^n) O(n^n)
        // return func1(n)

        /// 思路二： 动态规划 O(n) O(n)
        // return func2(n)

        /// 思路二： 动态规划 优化空间复杂度 O(n) O(1)
        return func3(n)

    }

    func func1(_ n: Int) -> Int {
        guard n > 0 else { return 0 }
        if n == 1 { return 3 } 
        var count = 0
        func dfs(_ n: Int, _ s: String) {
            if n == 0, s.count > 0, !s.contains("LLL"), (s.count - s.filter{ $0 != "A" }.count < 2){
                count = (count + 1) % M
            }
            dfs(n - 1, s + "A")
            dfs(n - 1, s + "L")
            dfs(n - 1, s + "P")
        }
        dfs(n, "")
        return count 
    }

    func func2(_ n: Int) -> Int {
        guard n > 0 else { return 0 }
        if n == 1 { return 3 }
        var dp = [[[Int]]](repeating: [[Int]](repeating:[Int](repeating: 0, count: 3), count: 2), count: n + 1)
        dp[1][0][0] = 1 // P
        dp[1][0][1] = 1 // L
        dp[1][1][0] = 1 // A
        for i in 2...n {
            // +P
            dp[i][0][0] = (dp[i - 1][0][0] + dp[i - 1][0][1] + dp[i - 1][0][2]) % M
            dp[i][1][0] = (dp[i - 1][1][0] + dp[i - 1][1][1] + dp[i - 1][1][2]) % M

            // +L
            dp[i][0][1] = dp[i - 1][0][0]
            dp[i][0][2] = dp[i - 1][0][1]
            dp[i][1][1] = dp[i - 1][1][0]
            dp[i][1][2] = dp[i - 1][1][1]

            // +A
            dp[i][1][0] += (dp[i - 1][0][0] + dp[i - 1][0][1] + dp[i - 1][0][2]) % M
        }
        return (dp[n][0][0] + dp[n][0][1] + dp[n][0][2] + dp[n][1][0] + dp[n][1][1] + dp[n][1][2]) % M
    }

    func func3(_ n: Int) -> Int {
        guard n > 0 else { return 0 }
        if n == 1 { return 3 }
        var dp00 = 1, dp01 = 1, dp02 = 0
        var dp10 = 1, dp11 = 0, dp12 = 0
        for i in 2...n {
            let m = dp00, n = dp10
            // +P +A 
            dp00 = (m + dp01 + dp02) % M
            dp10 = (n + dp11 + dp12 + m + dp01 + dp02) % M

            // +L
            dp02 = dp01
            dp01 = m
            dp12 = dp11
            dp11 = n
        }
        return (dp00 + dp01 + dp02 + dp10 + dp11 + dp12) % M
    }
}
// @lc code=end

