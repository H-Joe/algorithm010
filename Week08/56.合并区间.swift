/*
 * @lc app=leetcode.cn id=56 lang=swift
 *
 * [56] 合并区间
 *
 * https://leetcode-cn.com/problems/merge-intervals/description/
 *
 * algorithms
 * Medium (42.65%)
 * Likes:    525
 * Dislikes: 0
 * Total Accepted:    122.2K
 * Total Submissions: 286K
 * Testcase Example:  '[[1,3],[2,6],[8,10],[15,18]]'
 *
 * 给出一个区间的集合，请合并所有重叠的区间。
 * 
 * 示例 1:
 * 
 * 输入: [[1,3],[2,6],[8,10],[15,18]]
 * 输出: [[1,6],[8,10],[15,18]]
 * 解释: 区间 [1,3] 和 [2,6] 重叠, 将它们合并为 [1,6].
 * 
 * 
 * 示例 2:
 * 
 * 输入: [[1,4],[4,5]]
 * 输出: [[1,5]]
 * 解释: 区间 [1,4] 和 [4,5] 可被视为重叠区间。
 * 
 */

// @lc code=start
class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        /// 思路一： 快速排序 O(nlogn) O(n)
        return func1(intervals)

    } 
    func func1(_ intervals: [[Int]]) -> [[Int]] {
        guard intervals.count > 1 else { return intervals }
        // var intervals = intervals.sorted() { $0[0] < $1[0] }
        var intervals = intervals
        quickSort(&intervals, 0, intervals.count - 1)
        var res = [[Int]]()
        for row in intervals {
            if res.count == 0 || res.last![1] < row[0] {
                res += [row]
            }else {
                res[res.count - 1] = [res.last![0], max(res.last![1], row[1])]
            }
        }
        return res
    }
    func quickSort(_ nums: inout [[Int]], _ left: Int, _ right: Int) {
        if left >= right { return }
        var i = left, j = right, pivot = nums[left]
        while i < j {
            while i < j, nums[j][0] >= pivot[0] { j -= 1 }
            while i < j, nums[i][0] <= pivot[0] { i += 1 }
            if i < j { (nums[i], nums[j]) = (nums[j], nums[i]) }
        }
        (nums[left], nums[i]) = (nums[i], pivot)
        quickSort(&nums, left, i - 1)
        quickSort(&nums, i + 1, right)
    }
}
// @lc code=end

