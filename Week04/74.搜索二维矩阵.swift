/*
 * @lc app=leetcode.cn id=74 lang=swift
 *
 * [74] 搜索二维矩阵
 *
 * https://leetcode-cn.com/problems/search-a-2d-matrix/description/
 *
 * algorithms
 * Medium (38.03%)
 * Likes:    199
 * Dislikes: 0
 * Total Accepted:    49.3K
 * Total Submissions: 129K
 * Testcase Example:  '[[1,3,5,7],[10,11,16,20],[23,30,34,50]]\n3'
 *
 * 编写一个高效的算法来判断 m x n 矩阵中，是否存在一个目标值。该矩阵具有如下特性：
 * 
 * 
 * 每行中的整数从左到右按升序排列。
 * 每行的第一个整数大于前一行的最后一个整数。
 * 
 * 
 * 示例 1:
 * 
 * 输入:
 * matrix = [
 * ⁠ [1,   3,  5,  7],
 * ⁠ [10, 11, 16, 20],
 * ⁠ [23, 30, 34, 50]
 * ]
 * target = 3
 * 输出: true
 * 
 * 
 * 示例 2:
 * 
 * 输入:
 * matrix = [
 * ⁠ [1,   3,  5,  7],
 * ⁠ [10, 11, 16, 20],
 * ⁠ [23, 30, 34, 50]
 * ]
 * target = 13
 * 输出: false
 * 
 */

// @lc code=start
class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        /// 思路一： 二分 降维到一维数组
        // return func1(matrix, target)

        /// 思路二： 二分 先定位到所在行，再定位所在列
        return func2(matrix, target)
    }

    func func1(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard matrix.count > 0 ,matrix[0].count > 0 else { return false }
        if matrix.count == 1, matrix[0].count == 1, matrix[0][0] == target { return true }
        var l = 0, r = matrix.count * matrix[0].count - 1 
        while l <= r {
            let mid = l + (r - l) / 2
            let idx = mid / matrix[0].count, idy = mid % matrix[0].count
            if matrix[idx][idy] == target { return true }
            else if matrix[idx][idy] < target { l = mid + 1 }
            else { r = mid - 1 }
        }
        return false 
    }

    func func2(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard !matrix.isEmpty else { return false }
        if matrix.count == 1, matrix[0].count == 1, matrix[0][0] == target { return true }
        var n = matrix.count , m = matrix[0].count 
        var t = 0, b = n - 1
        var l = 0, r = m - 1
        while t < b {
            let mid = t + (b - t) / 2
            if matrix[mid][m - 1] == target { return true }
            if matrix[mid][m - 1] < target { t = mid + 1 }
            else { b = mid }
        }

        while l <= r {
            let mid = l + (r - l) / 2
            if matrix[t][mid] == target { return true }
            else if matrix[t][mid] < target { l = mid + 1 }
            else { r = mid - 1 }
        }
        return false 
        
    }
}
// @lc code=end

