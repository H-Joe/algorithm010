/*
 * @lc app=leetcode.cn id=347 lang=swift
 *
 * [347] 前 K 个高频元素
 *
 * https://leetcode-cn.com/problems/top-k-frequent-elements/description/
 *
 * algorithms
 * Medium (60.62%)
 * Likes:    363
 * Dislikes: 0
 * Total Accepted:    59.6K
 * Total Submissions: 98.3K
 * Testcase Example:  '[1,1,1,2,2,3]\n2'
 *
 * 给定一个非空的整数数组，返回其中出现频率前 k 高的元素。
 * 
 * 
 * 
 * 示例 1:
 * 
 * 输入: nums = [1,1,1,2,2,3], k = 2
 * 输出: [1,2]
 * 
 * 
 * 示例 2:
 * 
 * 输入: nums = [1], k = 1
 * 输出: [1]
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 你可以假设给定的 k 总是合理的，且 1 ≤ k ≤ 数组中不相同的元素的个数。
 * 你的算法的时间复杂度必须优于 O(n log n) , n 是数组的大小。
 * 题目数据保证答案唯一，换句话说，数组中前 k 个高频元素的集合是唯一的。
 * 你可以按任意顺序返回答案。
 * 
 * 
 */

// @lc code=start
class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        /// 思路一： 统计元素出现的频次 -> 以频次排序 -> 取前k个元素
        /// O(nlogn) and O(n)
        // return func1(nums, k)

        return func2(nums, k)
    }

    func func1(_ nums: [Int], _ k: Int) -> [Int] {
        let hashMap = nums
                .reduce(into: [:]) { $0[$1, default: 0] += 1}
                .sorted(){ $0.value > $1.value }
                .map{ $0.key}
        
        return Array(hashMap[0..<k])
    }

    func func2(_ nums: [Int], _ k: Int) -> [Int] {
        var container: [[Int]] = Array(repeating: [Int](), count: nums.count + 1)
        var res = [Int]()

        let _ = nums
                    .reduce(into: [:]) { $0[$1, default: 0] += 1 }
                    .map{ container[$0.value].append($0.key)}

        for value in container.reversed() where value.count > 0 {
            guard res.count < k else {
                return res
            }
            res += value
        }

        return res
    }
}
// @lc code=end

