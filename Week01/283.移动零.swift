/*
 * @lc app=leetcode.cn id=283 lang=swift
 *
 * [283] 移动零
 *
 * https://leetcode-cn.com/problems/move-zeroes/description/
 *
 * algorithms
 * Easy (61.05%)
 * Likes:    603
 * Dislikes: 0
 * Total Accepted:    157K
 * Total Submissions: 257.2K
 * Testcase Example:  '[0,1,0,3,12]'
 *
 * 给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。
 * 
 * 示例:
 * 
 * 输入: [0,1,0,3,12]
 * 输出: [1,3,12,0,0]
 * 
 * 说明:
 * 
 * 
 * 必须在原数组上操作，不能拷贝额外的数组。
 * 尽量减少操作次数。
 * 
 * 
 */

// @lc code=start
class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        // 方法一
        /*
        思路：交换零和非零元素
        */
        /// 实现一
        /*
        let numsCount = nums.count
        guard numsCount > 1 else { return }
        var j = 0
        for i in 0..<numsCount {
            if nums[i] != 0 {
                if i != j {
    //                nums.swapAt(i, j)
                    nums[i] = nums[i] ^ nums[j]
                    nums[j] = nums[i] ^ nums[j]
                    nums[i] = nums[i] ^ nums[j]
                }
                j += 1
            }
        }
        nums.replaceSubrange(j..<numsCount, with: Array(repeating: 0, count: (numsCount - j)))
        */
        /// 实现二
        let numsCount = nums.count
        guard numsCount > 1 else { return }
        var j = 0
        for i in 0..<numsCount where nums[i] != 0  {
            if i != j {
               nums.swapAt(i, j)
            }
            j += 1
        }
        nums.replaceSubrange(j..<numsCount, with: Array(repeating: 0, count: (numsCount - j)))
        // 方法二 （不适用此题）
        /*
        思路：得到数组中元素不等于零的数组，判断两个数组的长度，补齐零的个数；
        */
        /*
        let newNums = nums.filter{ $0 != 0}
        if nums.count > newNums.count {
            nums = newNums + Array(repeating: 0, count: nums.count - newNums.count)
        }
        */

    }
}
// @lc code=end

