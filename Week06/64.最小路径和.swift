/*
 * @lc app=leetcode.cn id=64 lang=swift
 *
 * [64] 最小路径和
 *
 * https://leetcode-cn.com/problems/minimum-path-sum/description/
 *
 * algorithms
 * Medium (65.64%)
 * Likes:    517
 * Dislikes: 0
 * Total Accepted:    100.2K
 * Total Submissions: 151.6K
 * Testcase Example:  '[[1,3,1],[1,5,1],[4,2,1]]'
 *
 * 给定一个包含非负整数的 m x n 网格，请找出一条从左上角到右下角的路径，使得路径上的数字总和为最小。
 * 
 * 说明：每次只能向下或者向右移动一步。
 * 
 * 示例:
 * 
 * 输入:
 * [
 * [1,3,1],
 * ⁠ [1,5,1],
 * ⁠ [4,2,1]
 * ]
 * 输出: 7
 * 解释: 因为路径 1→3→1→1→1 的总和最小。
 * 
 * 
 */

// @lc code=start
class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        /// 思路一： 动态规划 O(mn) O(mn)
        // return func1(grid)

        /// 思路一： 动态规划 优化空间复杂度 O(mn) O(n)
        return func2(grid)
    }
    func func1(_ grid: [[Int]]) -> Int {
        guard grid.count > 0, grid[0].count > 0 else { return 0 }
        let m = grid.count , n = grid[0].count 
        var dp = grid
        for i in 0..<m {
            for j in 0..<n {
                if i == 0, j == 0 { continue }
                else if i == 0 { dp[i][j] += dp[i][j - 1] }
                else if j == 0 { dp[i][j] += dp[i - 1][j] }
                else { dp[i][j] += min(dp[i - 1][j], dp[i][j - 1]) }
            }
        }
        return dp[m - 1][n - 1]
    }

    func func2(_ grid: [[Int]]) -> Int {
        guard grid.count > 0, grid[0].count > 0 else { return 0 }
        let m = grid.count , n = grid[0].count 
        var dp = [Int](repeating: 0, count: n)
        for i in 0..<m {
            for j in 0..<n {
                if i == 0, j == 0 { dp[j] = grid[i][j] }
                else if i == 0, j != 0 { dp[j] = grid[i][j] + dp[j - 1] }
                else if j == 0, i != 0 { dp[j] = grid[i][j] + dp[j] }
                else { dp[j] = grid[i][j] + min(dp[j], dp[j - 1]) }
            }
        }
        return dp[n - 1]
    }
}
// @lc code=end

