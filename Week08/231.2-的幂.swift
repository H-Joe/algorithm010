/*
 * @lc app=leetcode.cn id=231 lang=swift
 *
 * [231] 2的幂
 *
 * https://leetcode-cn.com/problems/power-of-two/description/
 *
 * algorithms
 * Easy (48.13%)
 * Likes:    224
 * Dislikes: 0
 * Total Accepted:    70.2K
 * Total Submissions: 145.2K
 * Testcase Example:  '1'
 *
 * 给定一个整数，编写一个函数来判断它是否是 2 的幂次方。
 * 
 * 示例 1:
 * 
 * 输入: 1
 * 输出: true
 * 解释: 2^0 = 1
 * 
 * 示例 2:
 * 
 * 输入: 16
 * 输出: true
 * 解释: 2^4 = 16
 * 
 * 示例 3:
 * 
 * 输入: 218
 * 输出: false
 * 
 */

// @lc code=start
class Solution {
    func isPowerOfTwo(_ n: Int) -> Bool {
        // return n > 0 && n & (n - 1) == 0
        return n > 0 && n & (-n) == n

    }
}
// @lc code=end

