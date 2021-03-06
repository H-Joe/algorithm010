/*
 * @lc app=leetcode.cn id=312 lang=swift
 *
 * [312] 戳气球
 *
 * https://leetcode-cn.com/problems/burst-balloons/description/
 *
 * algorithms
 * Hard (60.21%)
 * Likes:    426
 * Dislikes: 0
 * Total Accepted:    22.2K
 * Total Submissions: 34.1K
 * Testcase Example:  '[3,1,5,8]'
 *
 * 有 n 个气球，编号为0 到 n-1，每个气球上都标有一个数字，这些数字存在数组 nums 中。
 * 
 * 现在要求你戳破所有的气球。如果你戳破气球 i ，就可以获得 nums[left] * nums[i] * nums[right] 个硬币。 这里的
 * left 和 right 代表和 i 相邻的两个气球的序号。注意当你戳破了气球 i 后，气球 left 和气球 right 就变成了相邻的气球。
 * 
 * 求所能获得硬币的最大数量。
 * 
 * 说明:
 * 
 * 
 * 你可以假设 nums[-1] = nums[n] = 1，但注意它们不是真实存在的所以并不能被戳破。
 * 0 ≤ n ≤ 500, 0 ≤ nums[i] ≤ 100
 * 
 * 
 * 示例:
 * 
 * 输入: [3,1,5,8]
 * 输出: 167 
 * 解释: nums = [3,1,5,8] --> [3,5,8] -->   [3,8]   -->  [8]  --> []
 * coins =  3*1*5      +  3*5*8    +  1*3*8      + 1*8*1   = 167
 * 
 * 
 */

// @lc code=start
class Solution {
    func maxCoins(_ nums: [Int]) -> Int {
        /// 思路一： 动态规划 O(n^3) O(n^2)
        return func1(nums)
    }
    func func1(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        var nums = [1] + nums + [1]
        var dp = [[Int]](repeating: [Int](repeating: 0, count: nums.count), count: nums.count)
        for i in (0..<nums.count - 2).reversed() {
            for j in i + 2..<nums.count {
                for k in i + 1...j - 1 {
                    dp[i][j] = max(dp[i][j], dp[i][k] + nums[i] * nums[k] * nums[j] + dp[k][j])
                }
            }
        }
        return dp[0][nums.count - 1]
    }
    
}
// @lc code=end

