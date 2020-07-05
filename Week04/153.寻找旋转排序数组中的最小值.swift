/*
 * @lc app=leetcode.cn id=153 lang=swift
 *
 * [153] 寻找旋转排序数组中的最小值
 *
 * https://leetcode-cn.com/problems/find-minimum-in-rotated-sorted-array/description/
 *
 * algorithms
 * Medium (50.94%)
 * Likes:    201
 * Dislikes: 0
 * Total Accepted:    56.9K
 * Total Submissions: 111.4K
 * Testcase Example:  '[3,4,5,1,2]'
 *
 * 假设按照升序排序的数组在预先未知的某个点上进行了旋转。
 * 
 * ( 例如，数组 [0,1,2,4,5,6,7]  可能变为 [4,5,6,7,0,1,2] )。
 * 
 * 请找出其中最小的元素。
 * 
 * 你可以假设数组中不存在重复元素。
 * 
 * 示例 1:
 * 
 * 输入: [3,4,5,1,2]
 * 输出: 1
 * 
 * 示例 2:
 * 
 * 输入: [4,5,6,7,0,1,2]
 * 输出: 0
 * 
 */

// @lc code=start
class Solution {
    func findMin(_ nums: [Int]) -> Int {
        /// 思路一： 二分
        return func1(nums)
    }

    func func1(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return -1 }
        var l = 0, r = nums.count - 1
        while l < r {
            let mid = l + (r - l) / 2
            if nums[mid] > nums[r] { l = mid + 1 }
            else { r = mid }
        }
        return nums[l]
    }
    
}
// @lc code=end

