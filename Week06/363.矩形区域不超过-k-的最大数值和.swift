/*
 * @lc app=leetcode.cn id=363 lang=swift
 *
 * [363] 矩形区域不超过 K 的最大数值和
 *
 * https://leetcode-cn.com/problems/max-sum-of-rectangle-no-larger-than-k/description/
 *
 * algorithms
 * Hard (36.45%)
 * Likes:    101
 * Dislikes: 0
 * Total Accepted:    4K
 * Total Submissions: 10.5K
 * Testcase Example:  '[[1,0,1],[0,-2,3]]\n2'
 *
 * 给定一个非空二维矩阵 matrix 和一个整数 k，找到这个矩阵内部不大于 k 的最大矩形和。
 * 
 * 示例:
 * 
 * 输入: matrix = [[1,0,1],[0,-2,3]], k = 2
 * 输出: 2 
 * 解释: 矩形区域 [[0, 1], [-2, 3]] 的数值和是 2，且 2 是不超过 k 的最大数字（k = 2）。
 * 
 * 
 * 说明：
 * 
 * 
 * 矩阵内的矩形区域面积必须大于 0。
 * 如果行数远大于列数，你将如何解答呢？
 * 
 * 
 */

// @lc code=start
class Solution {
    func maxSumSubmatrix(_ matrix: [[Int]], _ k: Int) -> Int {
        /// 思路一： 前缀和 O(nnm)  O(m)
        return func1(matrix, k)
    }

    func func1(_ matrix: [[Int]], _ k: Int) -> Int {
        guard matrix.count > 0, matrix[0].count > 0 else { return 0 }
        var m = matrix.count , n = matrix[0].count , res = Int.min

        func maxSumLowerK(_ subArr: [Int], _ k: Int) -> Int {
            guard subArr.count > 0 else { return 0 }
            var res = subArr[0], scrollNum = 0
            for n in subArr {
                scrollNum = max(scrollNum + n, n)
                res = max(res, scrollNum)
            }
            if res <= k { return res  }
            res = Int.min 
            for i in 0..<subArr.count {
                var sum = 0
                for j in i..<subArr.count {
                    sum += subArr[j]
                    if sum == k { return sum }
                    if sum < k, sum > res { res = sum }
                }
            }
            return res 
        }
        for jl in 0..<n {
            var subArr = [Int](repeating: 0, count: m)
            for j in jl..<n {
                for i in 0..<m {
                    subArr[i] += matrix[i][j]
                }
                let curMax = maxSumLowerK(subArr, k)
                if curMax == k { return k }
                res = max(res, curMax)
            }
        }
        return res
    }
}
// @lc code=end

