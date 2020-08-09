/*
 * @lc app=leetcode.cn id=32 lang=swift
 *
 * [32] 最长有效括号
 *
 * https://leetcode-cn.com/problems/longest-valid-parentheses/description/
 *
 * algorithms
 * Hard (30.68%)
 * Likes:    849
 * Dislikes: 0
 * Total Accepted:    86.6K
 * Total Submissions: 260.9K
 * Testcase Example:  '"(()"'
 *
 * 给定一个只包含 '(' 和 ')' 的字符串，找出最长的包含有效括号的子串的长度。
 * 
 * 示例 1:
 * 
 * 输入: "(()"
 * 输出: 2
 * 解释: 最长有效括号子串为 "()"
 * 
 * 
 * 示例 2:
 * 
 * 输入: ")()())"
 * 输出: 4
 * 解释: 最长有效括号子串为 "()()"
 * 
 * 
 */

// @lc code=start
class Solution {
    func longestValidParentheses(_ s: String) -> Int {
        /// 参考题解： https://leetcode-cn.com/problems/longest-valid-parentheses/solution/dong-tai-gui-hua-si-lu-xiang-jie-c-by-zhanganan042/
        /// 思路一：动态规划 O(n) O(n)
        // return func1(s)

        /// 思路二：栈 O(n) O(n)
        // return func2(s)

        /// 思路三：双指针 O(n) O(1)
        return func3(s)
    }
    func func1(_ s: String) -> Int {
        guard s.count > 0 else { return 0 }
        var sa = Array(s), res = 0
        var dp = [Int](repeating: 0, count: s.count)
        for i in 1..<sa.count where sa[i] == ")" {
            if sa[i - 1] == "(" { // dp[i] = dp[i - 2] + 2
                dp[i] = 2 + (i - 2 >= 0 ? dp[i - 2] : 0)
            }else if i - dp[i - 1] - 1 >= 0 , sa[i - dp[i - 1] - 1] == "(" {
                // i - dp[i - 1] - 1 表示和i成对的位置
                // i - dp[i - 1] - 2 表示和i成对的位置的前一个位置
                dp[i] = dp[i - 1] + 2 + (i - dp[i - 1] - 2 >= 0 ? dp[i - dp[i - 1] - 2] : 0)
            }
            res = max(res, dp[i])
        }
        return res
    }

    func func2(_ s: String) -> Int {
        guard s.count > 0 else { return 0 }
        var sa = Array(s), res = 0
        var stack = [Int]()
        stack.append(-1)
        for i in 0..<sa.count  {
            if sa[i] == "(" { stack.append(i) }
            else {
                stack.popLast()
                if stack.isEmpty { stack.append(i)}
                else { res = max(res, i - stack.last!) }
            }
        }
        return res
    }
    func func3(_ s: String) -> Int {
        guard s.count > 0 else { return 0 }
        var res = 0, l = 0, r = 0
        for c in s  {
            if c == "(" { l += 1 }
            else { r += 1 }
            if l == r { res = max(res, 2 * l) }
            else if r > l { l = 0; r = 0 }
        }
        l = 0; r = 0
        for c in s.reversed() {
            if c == "(" { l += 1 }
            else { r += 1 }
            if l == r { res = max(res, 2 * l) }
            else if l > r  { l = 0; r = 0 }
        }
        return res
    }
}
// @lc code=end

