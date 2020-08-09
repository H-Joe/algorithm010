/*
 * @lc app=leetcode.cn id=300 lang=swift
 *
 * [300] 最长上升子序列
 *
 * https://leetcode-cn.com/problems/longest-increasing-subsequence/description/
 *
 * algorithms
 * Medium (44.49%)
 * Likes:    873
 * Dislikes: 0
 * Total Accepted:    125.3K
 * Total Submissions: 278.5K
 * Testcase Example:  '[10,9,2,5,3,7,101,18]'
 *
 * 给定一个无序的整数数组，找到其中最长上升子序列的长度。
 * 
 * 示例:
 * 
 * 输入: [10,9,2,5,3,7,101,18]
 * 输出: 4 
 * 解释: 最长的上升子序列是 [2,3,7,101]，它的长度是 4。
 * 
 * 说明:
 * 
 * 
 * 可能会有多种最长上升子序列的组合，你只需要输出对应的长度即可。
 * 你算法的时间复杂度应该为 O(n^2) 。
 * 
 * 
 * 进阶: 你能将算法的时间复杂度降低到 O(n log n) 吗?
 * 
 */

// @lc code=start
class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        /// 思路一： 动态规划 O(n^2) O(n)
        // return func1(nums)

        /// 思路一： 动态规划 + 二分查找 O(nlogn) O(n)
        return func2(nums)
    }
    func func1(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        // dp[i] 表示以 nums[i] 结尾的「上升子序列」的长度
        var dp = [Int](repeating: 1, count: nums.count)
        for i in 0..<nums.count {
            for j in 0..<i {
                if nums[i] > nums[j] {
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
        }
        return dp.max()!
    }

    func func2(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        // dp[i] 表示长度为 i + 1 的所有上升子序列的结尾的最小值。
        var dp = [Int](repeating: nums[0], count: nums.count)
        var end = 0
        for i in 0..<nums.count {
            if nums[i] > dp[end] {
                end += 1
                dp[end] = nums[i]
            }else {
                var l = 0, r = end
                while l <= r {
                    let mid = l + (r - l) >> 1
                    if dp[mid] < nums[i] { l = mid + 1 }
                    else { r = mid - 1 }
                }
                dp[l] = nums[i]
            }
        }
        return end + 1
    }
}
// @lc code=end

