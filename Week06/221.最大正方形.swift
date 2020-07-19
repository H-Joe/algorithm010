/*
 * @lc app=leetcode.cn id=221 lang=swift
 *
 * [221] 最大正方形
 *
 * https://leetcode-cn.com/problems/maximal-square/description/
 *
 * algorithms
 * Medium (42.46%)
 * Likes:    485
 * Dislikes: 0
 * Total Accepted:    60.9K
 * Total Submissions: 143.4K
 * Testcase Example:  '[["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]'
 *
 * 在一个由 0 和 1 组成的二维矩阵内，找到只包含 1 的最大正方形，并返回其面积。
 * 
 * 示例:
 * 
 * 输入: 
 * 
 * 1 0 1 0 0
 * 1 0 1 1 1
 * 1 1 1 1 1
 * 1 0 0 1 0
 * 
 * 输出: 4
 * 
 */

// @lc code=start
class Solution {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        /// 思路一： 动态规划 O(mn) O(mn)
        // return func1(matrix)

        /// 思路一： 动态规划 优化空间复杂度 O(mn) O(n)
        return func2(matrix)
    }

    func func1(_ matrix: [[Character]]) -> Int {
        guard matrix.count > 0, matrix[0].count > 0 else { return 0 }
        let m = matrix.count , n = matrix[0].count 
        var maxSide = 0
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
        for i in 0..<m {
            for j in 0..<n {
                if matrix[i][j] == "1" {
                    if i == 0 || j == 0 { dp[i][j] = 1 }
                    else { dp[i][j] = 1 + min(dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1]) } 
                    maxSide = max(maxSide, dp[i][j])
                }
            }
        }
        return maxSide * maxSide
    }

    func func2(_ matrix: [[Character]]) -> Int {
        guard matrix.count > 0, matrix[0].count > 0 else { return 0 }
        let m = matrix.count , n = matrix[0].count 
        var maxSide = 0
        var dp = [Int](repeating: 0, count: n)
        for i in 0..<m {
            var leftTop = 0
            for j in 0..<n {
                var curLeftTop = dp[j]
                if matrix[i][j] == "1" {
                    if j == 0 { dp[j] = 1 }
                    else { dp[j] = 1 + min(dp[j], dp[j - 1], leftTop) } 
                    maxSide = max(maxSide, dp[j])
                }else { dp[j] = 0 }
                leftTop = curLeftTop
            }
        }
        return maxSide * maxSide
    }
}
// @lc code=end

