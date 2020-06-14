/*
 * @lc app=leetcode.cn id=42 lang=swift
 *
 * [42] 接雨水
 *
 * https://leetcode-cn.com/problems/trapping-rain-water/description/
 *
 * algorithms
 * Hard (51.16%)
 * Likes:    1353
 * Dislikes: 0
 * Total Accepted:    109.3K
 * Total Submissions: 213.2K
 * Testcase Example:  '[0,1,0,2,1,0,1,3,2,1,2,1]'
 *
 * 给定 n 个非负整数表示每个宽度为 1 的柱子的高度图，计算按此排列的柱子，下雨之后能接多少雨水。
 * 
 * 
 * 
 * 上面是由数组 [0,1,0,2,1,0,1,3,2,1,2,1] 表示的高度图，在这种情况下，可以接 6 个单位的雨水（蓝色部分表示雨水）。 感谢
 * Marcos 贡献此图。
 * 
 * 示例:
 * 
 * 输入: [0,1,0,2,1,0,1,3,2,1,2,1]
 * 输出: 6
 * 
 */

// @lc code=start
class Solution {
    func trap(_ height: [Int]) -> Int {
        /// 思路一： 暴力循环 O(n^2) and O(1)
        // return func1(height)

        /// 思路二：双指针 O(n) and O(1)
        return func2(height)
    }

    func func1(_ height: [Int]) -> Int {
        var res = 0
        for i in 0..<height.count {
            var leftMax = height[i], rightMax = height[i]
            for j in 0...i {
                leftMax = max(leftMax, height[j])
            }
            for j in i..<height.count {
                rightMax = max(rightMax, height[j])
            }
            res +=  min(leftMax, rightMax) - height[i]
        }
        return res
    }

    func func2(_ height: [Int]) -> Int {
        var left = 0, right = height.count - 1
        var leftMax = 0, rightMax = 0
        var res = 0
        while left <= right{
            if leftMax <= rightMax {
                leftMax = max(leftMax, height[left])
                res += leftMax - height[left]
                left += 1
            }else {
                rightMax = max(rightMax, height[right])
                res += rightMax - height[right]
                right -= 1
            }
        }
        return res
    }
}
// @lc code=end

