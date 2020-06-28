/*
 * @lc app=leetcode.cn id=47 lang=swift
 *
 * [47] 全排列 II
 *
 * https://leetcode-cn.com/problems/permutations-ii/description/
 *
 * algorithms
 * Medium (58.95%)
 * Likes:    321
 * Dislikes: 0
 * Total Accepted:    66.2K
 * Total Submissions: 111.9K
 * Testcase Example:  '[1,1,2]'
 *
 * 给定一个可包含重复数字的序列，返回所有不重复的全排列。
 * 
 * 示例:
 * 
 * 输入: [1,1,2]
 * 输出:
 * [
 * ⁠ [1,1,2],
 * ⁠ [1,2,1],
 * ⁠ [2,1,1]
 * ]
 * 
 */

// @lc code=start
class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        guard !nums.isEmpty else { return [[]] }
        var res = [[Int]](), paris = [Int](), visited = Array(repeating: false, count: nums.count)

        func backTrack(_ nums: [Int], _ paris: inout [Int], _ visited: inout [Bool]) {
            guard paris.count < nums.count else {
                res.append(paris)
                return 
            }
            for i in 0..<nums.count {
                if visited[i] || i > 0 && !visited[i - 1] && nums[i] == nums[i - 1] {
                    continue
                }
                visited[i] = true
                paris.append(nums[i])
                backTrack(nums, &paris, &visited)
                paris.removeLast()
                visited[i] = false
            }
        }

        backTrack(nums.sorted(), &paris, &visited)
        return res
    }
}
// @lc code=end

