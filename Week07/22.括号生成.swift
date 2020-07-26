/*
 * @lc app=leetcode.cn id=22 lang=swift
 *
 * [22] 括号生成
 *
 * https://leetcode-cn.com/problems/generate-parentheses/description/
 *
 * algorithms
 * Medium (75.49%)
 * Likes:    1114
 * Dislikes: 0
 * Total Accepted:    139.7K
 * Total Submissions: 184.8K
 * Testcase Example:  '3'
 *
 * 数字 n 代表生成括号的对数，请你设计一个函数，用于能够生成所有可能的并且 有效的 括号组合。
 * 
 * 
 * 
 * 示例：
 * 
 * 输入：n = 3
 * 输出：[
 * ⁠      "((()))",
 * ⁠      "(()())",
 * ⁠      "(())()",
 * ⁠      "()(())",
 * ⁠      "()()()"
 * ⁠    ]
 * 
 * 
 */

// @lc code=start
class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        /// 思路一： DFS 递归 O(n) and O(n)
        // return func1(n)

        /// 思路二： BFS 递归 O(n) and O(n)
        // return func2(n)

        /// 思路三： 动态规划 O(n) and O(n)
        return func3(n)
        
    }
    func func1(_ n: Int) -> [String] {
        if n == 0 {
            return  []
        }
        var res = [String]()
        /// 写法一
        drillDown(0, 0, n, "", &res)
        /// 写法二： 国际 尾随闭包
        // drillDown1(0, 0, n, "") { res.append($0) }
        return res
    }

    func drillDown(_ left: Int, _ right: Int, _ maxN: Int, _ curS: String, _ res: inout [String]) {
        if left == maxN && right == maxN {
            res.append(curS)
            return 
        }
        print("l:\(left),r:\(right),c:\(curS)")
        
        if left < maxN {
            drillDown(left + 1, right, maxN, curS + "(", &res)
        }
        if right < left {
            drillDown(left, right + 1, maxN, curS + ")", &res)
        }
    }

    func drillDown1(_ left: Int, _ right: Int, _ maxN: Int, _ curS: String, _ res: (String)->Void) {
        if curS.count == 2 * maxN {
            res(curS)
            return
        }
        if left < maxN {
            drillDown1(left + 1, right, maxN, curS + "(", res)
        }
        if right < left {
            drillDown1(left, right + 1, maxN, curS + ")", res)
        }
    }

    func func2(_ n: Int) -> [String] {
        guard n > 0 else { return [] }
        struct Node {
            var cur: String, left: Int, right: Int
        }
        var res = [String]()
        var queue = [Node]()
        queue.append(Node(cur: "", left: n, right: n))
        while !queue.isEmpty {
            let first = queue.removeFirst()
            if first.left == 0 && first.right == 0 { res.append(first.cur) }
            if first.left > 0 { 
                queue.append(Node(cur: first.cur + "(", left: first.left - 1, right: first.right))
            }
            if first.right > 0, first.left < first.right {
                queue.append(Node(cur: first.cur + ")", left: first.left, right: first.right - 1))
            }
        }
        return res
    }

    /*
    dp[i] = "(" + dp[可能的括号对数] + ")" + dp[剩下的括号对数]
    dp[i] = "(" + dp[j] + ")" + dp[i- j - 1] , j = 0, 1, ..., i - 1
    */
    func func3(_ n: Int) -> [String] {
        guard n > 0 else { return [] }
        if n == 1 { return ["()"] }
        var dp = [[String]](repeating: [String](), count: n + 1)
        dp[0] = [""]
        dp[1] = ["()"]
        for i in 2...n {
            for j in 0..<i {
                for p in dp[j] {
                    for q in dp[i - j - 1] {
                        let str = "(" + p + ")" + q
                        dp[i].append(str)
                    }
                }
            }
        }
        return dp[n]
    }


}
// @lc code=end

