/*
 * @lc app=leetcode.cn id=46 lang=swift
 *
 * [46] 全排列
 *
 * https://leetcode-cn.com/problems/permutations/description/
 *
 * algorithms
 * Medium (76.16%)
 * Likes:    757
 * Dislikes: 0
 * Total Accepted:    143.8K
 * Total Submissions: 188.6K
 * Testcase Example:  '[1,2,3]'
 *
 * 给定一个 没有重复 数字的序列，返回其所有可能的全排列。
 * 
 * 示例:
 * 
 * 输入: [1,2,3]
 * 输出:
 * [
 * ⁠ [1,2,3],
 * ⁠ [1,3,2],
 * ⁠ [2,1,3],
 * ⁠ [2,3,1],
 * ⁠ [3,1,2],
 * ⁠ [3,2,1]
 * ]
 * 
 */

// @lc code=start
class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        guard !nums.isEmpty else { return [[]] }
        var res = [[Int]](), paris = [Int](), visited = Array(repeating: false, count: nums.count)


        func backTrack(_ nums: [Int], _ paris: inout [Int]) {
            guard paris.count < nums.count else {
                res.append(paris)
                return 
            }
            for i in 0..<nums.count {
                if paris.contains(nums[i]) {
                    continue
                }
                paris.append(nums[i])
                backTrack(nums, &paris)
                paris.removeLast()
            }
        }
        func backTrack1(_ nums: [Int], _ paris: inout [Int], _ visited: inout [Bool]) {
            guard paris.count < nums.count else {
                res.append(paris)
                return 
            }
            for i in 0..<nums.count {
                if visited[i] {
                    continue
                }
                visited[i] = true
                paris.append(nums[i])
                backTrack(nums, &paris)
                paris.removeLast()
                visited[i] = false
            }
        }
        
        // backTrack(nums, &paris)
        backTrack1(nums, &paris, &visited)
        return res
    }

    /// 国际站的一种写法
    /*
    func permute(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 0 else { return [] }
        guard nums.count > 1 else { return [nums] }
        var output = [[Int]]()
        
        if nums.count == 2 {
            return [nums] + [nums.reversed()]
        }
        
        if nums.count > 2 {
            for (index, num) in nums.enumerated().reversed() {
                var workingNums = nums
                workingNums.remove(at: index)
                let subNums = permute(workingNums).map { [num] + $0 }
                output.append(contentsOf: subNums)
            }
        }
        
        return output
    }
    */
}
// @lc code=end

