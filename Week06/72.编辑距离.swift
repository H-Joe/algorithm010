/*
 * @lc app=leetcode.cn id=72 lang=swift
 *
 * [72] 编辑距离
 *
 * https://leetcode-cn.com/problems/edit-distance/description/
 *
 * algorithms
 * Hard (59.30%)
 * Likes:    977
 * Dislikes: 0
 * Total Accepted:    69.2K
 * Total Submissions: 116.3K
 * Testcase Example:  '"horse"\n"ros"'
 *
 * 给你两个单词 word1 和 word2，请你计算出将 word1 转换成 word2 所使用的最少操作数 。
 * 
 * 你可以对一个单词进行如下三种操作：
 * 
 * 
 * 插入一个字符
 * 删除一个字符
 * 替换一个字符
 * 
 * 
 * 
 * 
 * 示例 1：
 * 
 * 输入：word1 = "horse", word2 = "ros"
 * 输出：3
 * 解释：
 * horse -> rorse (将 'h' 替换为 'r')
 * rorse -> rose (删除 'r')
 * rose -> ros (删除 'e')
 * 
 * 
 * 示例 2：
 * 
 * 输入：word1 = "intention", word2 = "execution"
 * 输出：5
 * 解释：
 * intention -> inention (删除 't')
 * inention -> enention (将 'i' 替换为 'e')
 * enention -> exention (将 'n' 替换为 'x')
 * exention -> exection (将 'n' 替换为 'c')
 * exection -> execution (插入 'u')
 * 
 * 
 */

// @lc code=start
class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        /// 思路一： 动态规划 O(mn) O(mn)
        return func1(word1, word2)

        /// 思路一： 动态规划 优化空间复杂度 O(mn) O(n)
        return func1(word1, word2)
    }

    func func1(_ word1: String, _ word2: String) -> Int {
        guard word1.count > 0 else { return word2.count }
        guard word2.count > 0 else { return word1.count }
        var wa1 = Array(word1), wa2 = Array(word2)
        var m = word1.count , n = word2.count 
        var dp = [Int](repeating: 0, count: n + 1)
        for i in 0...n { dp[i] = i }
        for i in 1...m {
            var leftTop = dp[0]
            dp[0] = i
            for j in 1...n {
                let curLeftTop = dp[j]
                if wa1[i - 1] == wa2[j - 1] { dp[j] = leftTop }
                else { dp[j] = 1 + min(dp[j], dp[j - 1], leftTop) }
                leftTop = curLeftTop
            }
        }
        return dp[n]
    }
}
// @lc code=end

