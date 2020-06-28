/*
 * @lc app=leetcode.cn id=77 lang=swift
 *
 * [77] 组合
 *
 * https://leetcode-cn.com/problems/combinations/description/
 *
 * algorithms
 * Medium (73.77%)
 * Likes:    292
 * Dislikes: 0
 * Total Accepted:    56.8K
 * Total Submissions: 76.9K
 * Testcase Example:  '4\n2'
 *
 * 给定两个整数 n 和 k，返回 1 ... n 中所有可能的 k 个数的组合。
 * 
 * 示例:
 * 
 * 输入: n = 4, k = 2
 * 输出:
 * [
 * ⁠ [2,4],
 * ⁠ [3,4],
 * ⁠ [2,3],
 * ⁠ [1,2],
 * ⁠ [1,3],
 * ⁠ [1,4],
 * ]
 * 
 */

// @lc code=start
class Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        guard n >= k else { return [[]] }
        var res = [[Int]]()
        var paris = [Int]()
        func backTrack(_ n: Int, _ k: Int, _ start: Int, _ paris: inout [Int]) {
            guard paris.count < k else {
                res.append(paris)
                return 
            }
            for i in start...n - (k - paris.count) + 1 {
                paris.append(i)
                backTrack(n, k, i + 1, &paris)
                paris.popLast()
            }
        }
        backTrack(n, k, 1, &paris)
        return res
    }
}
// @lc code=end

