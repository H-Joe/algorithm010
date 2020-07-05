/*
 * @lc app=leetcode.cn id=33 lang=swift
 *
 * [33] 搜索旋转排序数组
 *
 * https://leetcode-cn.com/problems/search-in-rotated-sorted-array/description/
 *
 * algorithms
 * Medium (38.02%)
 * Likes:    801
 * Dislikes: 0
 * Total Accepted:    137.3K
 * Total Submissions: 359.7K
 * Testcase Example:  '[4,5,6,7,0,1,2]\n0'
 *
 * 假设按照升序排序的数组在预先未知的某个点上进行了旋转。
 * 
 * ( 例如，数组 [0,1,2,4,5,6,7] 可能变为 [4,5,6,7,0,1,2] )。
 * 
 * 搜索一个给定的目标值，如果数组中存在这个目标值，则返回它的索引，否则返回 -1 。
 * 
 * 你可以假设数组中不存在重复的元素。
 * 
 * 你的算法时间复杂度必须是 O(log n) 级别。
 * 
 * 示例 1:
 * 
 * 输入: nums = [4,5,6,7,0,1,2], target = 0
 * 输出: 4
 * 
 * 
 * 示例 2:
 * 
 * 输入: nums = [4,5,6,7,0,1,2], target = 3
 * 输出: -1
 * 
 */

// @lc code=start
class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        /// 思路一： 二分
        // return func1(nums, target)

        /// 思路二： 先找到将要变化的位置，再二分查找
        return func2(nums, target)
    }

    func func1(_ nums: [Int], _ target: Int) -> Int {
        guard !nums.isEmpty else { return -1 }
        if nums.count == 1, nums[0] != target { return -1 }
        var l = 0, r = nums.count - 1
        while l <= r {
            let mid = l + (r - l) / 2
            if nums[mid] == target { return mid }
            if nums[l] <= nums[mid] {
                if nums[l] <= target, target < nums[mid] { r = mid - 1 }
                else { l = mid + 1 }
            }else {
                if nums[mid] < target, target <= nums[r] { l = mid + 1 }
                else { r = mid - 1 }
            }
        }
        return -1
    }

    func func2(_ nums: [Int], _ target: Int) -> Int {
         guard !nums.isEmpty else { return -1 }
        if nums.count == 1, nums[0] != target { return -1 }
        var l = 0, r = nums.count - 1, rot = 0
        while l < r {
            let mid = l + (r - l) / 2
            if nums[mid] > nums[r] { l = mid + 1 } // smaller at right side
            else { r = mid } // smaller at left side
        }
        rot = l
        l = 0 ; r = nums.count - 1
        while l <= r {
            let mid = l + (r - l) / 2
            let idx = (mid + rot) % nums.count
            if nums[idx] == target { return idx }
            else if nums[idx] > target { r = mid - 1}
            else { l = mid + 1 }
        }
        return -1
    }
}
// @lc code=end

