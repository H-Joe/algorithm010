/*
 * @lc app=leetcode.cn id=493 lang=swift
 *
 * [493] 翻转对
 *
 * https://leetcode-cn.com/problems/reverse-pairs/description/
 *
 * algorithms
 * Hard (25.45%)
 * Likes:    115
 * Dislikes: 0
 * Total Accepted:    5.9K
 * Total Submissions: 21.6K
 * Testcase Example:  '[1,3,2,3,1]'
 *
 * 给定一个数组 nums ，如果 i < j 且 nums[i] > 2*nums[j] 我们就将 (i, j) 称作一个重要翻转对。
 * 
 * 你需要返回给定数组中的重要翻转对的数量。
 * 
 * 示例 1:
 * 
 * 
 * 输入: [1,3,2,3,1]
 * 输出: 2
 * 
 * 
 * 示例 2:
 * 
 * 
 * 输入: [2,4,3,5,1]
 * 输出: 3
 * 
 * 
 * 注意:
 * 
 * 
 * 给定数组的长度不会超过50000。
 * 输入数组中的所有数字都在32位整数的表示范围内。
 * 
 * 
 */

// @lc code=start
class Solution {
    func reversePairs(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        var nums = nums
        return mergerSort1(&nums, 0, nums.count - 1)
    }

    func mergerSort(_ nums: inout [Int], _ left: Int, _ right: Int) -> Int {
        if left >= right { return 0 }
        let mid = left + (right - left) >> 1
        var count = mergerSort(&nums, left, mid) + mergerSort(&nums, mid + 1, right)

        // counter
        /// 方式一：
        // var k = mid + 1
        // for i in left...mid {
        //     while k <= right, Double(nums[i]) / 2 > Double(nums[k]) { k += 1 }
        //     count += (k - mid - 1)
        // }
        /// 方式二：
        var k1 = left, k2 = mid + 1
        while k1 <= mid, k2 <= right {
            if nums[k1] <= 2*nums[k2] { k1 += 1 }
            else { k2 += 1; count += mid + 1 - k1 }
        }

        // merge 
        var res = [Int](), i = left, j = mid + 1
        while i <= mid, j <= right {
            if nums[i] < nums[j] { res.append(nums[i]); i += 1 }
            else { res.append(nums[j]); j += 1 }
        }
        while i <= mid { res.append(nums[i]); i += 1 }
        while j <= right { res.append(nums[j]); j += 1 }
        for p in 0..<res.count { nums[left + p] = res[p] }
        
        return count 
    }
    
    func mergerSort1(_ nums: inout [Int], _ left: Int, _ right: Int) -> Int {
        if left >= right { return 0 }
        let mid = (right + left) >> 1
        var count = mergerSort1(&nums, left, mid) + mergerSort1(&nums, mid + 1, right)

        // merge and counter
        var res = [Int](), i = left, j = mid + 1, c = left
        while j <= right {
            // counter
            while c <= mid, nums[c] <= 2*nums[j] { c += 1 }
            count += mid + 1 - c
            // merge
            while i <= mid, nums[i] < nums[j] { res.append(nums[i]); i += 1 }
            res.append(nums[j]); j += 1 
        }
        while i <= mid { res.append(nums[i]); i += 1 }
        for p in 0..<res.count { nums[left + p] = res[p] }

        return count
    }
}
// @lc code=end

