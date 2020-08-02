/*
 * @lc app=leetcode.cn id=1122 lang=swift
 *
 * [1122] 数组的相对排序
 *
 * https://leetcode-cn.com/problems/relative-sort-array/description/
 *
 * algorithms
 * Easy (65.97%)
 * Likes:    69
 * Dislikes: 0
 * Total Accepted:    19.7K
 * Total Submissions: 29.7K
 * Testcase Example:  '[2,3,1,3,2,4,6,7,9,2,19]\n[2,1,4,3,9,6]'
 *
 * 给你两个数组，arr1 和 arr2，
 * 
 * 
 * arr2 中的元素各不相同
 * arr2 中的每个元素都出现在 arr1 中
 * 
 * 
 * 对 arr1 中的元素进行排序，使 arr1 中项的相对顺序和 arr2 中的相对顺序相同。未在 arr2 中出现过的元素需要按照升序放在 arr1
 * 的末尾。
 * 
 * 
 * 
 * 示例：
 * 
 * 输入：arr1 = [2,3,1,3,2,4,6,7,9,2,19], arr2 = [2,1,4,3,9,6]
 * 输出：[2,2,2,1,4,3,3,9,6,7,19]
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * arr1.length, arr2.length <= 1000
 * 0 <= arr1[i], arr2[i] <= 1000
 * arr2 中的元素 arr2[i] 各不相同
 * arr2 中的每个元素 arr2[i] 都出现在 arr1 中
 * 
 * 
 */

// @lc code=start
class Solution {
    func relativeSortArray(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
        /// 思路一： 计数排序 O(n + k)  O(n + k)
        // return func1(arr1, arr2)

         /// 思路二： 国际站解法
        return func2(arr1, arr2)
    }

    func func1(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
        var res = [Int]()
        var counters = [Int](repeating: 0, count: arr1.max()! + 1)
        for n in arr1 { counters[n] += 1 }
        for n in arr2 {
            while counters[n] > 0 {
                res += [n]
                counters[n] -= 1
            }
        }
        for i in 0..<counters.count {
            // while counters[i] > 0 {
            //     res += [i]
            //     counters[i] -= 1
            // }
            for _ in 0..<counters[i] {
                res += [i]
            }
        }
        return res 
    }

    func func2(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
        let order: [Int: Int] = arr2.enumerated().reduce(into: [:]){
            res, next in 
            let (i, v) = next
            res[v] = i
        }

        return arr1.sorted() {
            l, r in 
            switch (order[l], order[r]) {
            case (nil, nil): return l < r
            case (_, nil): return true
            case (nil, _): return false
            case (let left?, let right?): return left < right
            }
        }
    }
}
// @lc code=end

