/*
 * @lc app=leetcode.cn id=70 lang=swift
 *
 * [70] 爬楼梯
 *
 * https://leetcode-cn.com/problems/climbing-stairs/description/
 *
 * algorithms
 * Easy (48.79%)
 * Likes:    1028
 * Dislikes: 0
 * Total Accepted:    202.2K
 * Total Submissions: 414.2K
 * Testcase Example:  '3'
 *
 * 假设你正在爬楼梯。需要 n 阶你才能到达楼顶。
 * 
 * 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？
 * 
 * 注意：给定 n 是一个正整数。
 * 
 * 示例 1：
 * 
 * 输入： 2
 * 输出： 2
 * 解释： 有两种方法可以爬到楼顶。
 * 1.  1 阶 + 1 阶
 * 2.  2 阶
 * 
 * 示例 2：
 * 
 * 输入： 3
 * 输出： 3
 * 解释： 有三种方法可以爬到楼顶。
 * 1.  1 阶 + 1 阶 + 1 阶
 * 2.  1 阶 + 2 阶
 * 3.  2 阶 + 1 阶
 * 
 * 
 */

// @lc code=start
class Solution {
    func climbStairs(_ n: Int) -> Int {
        // if n < 3 { return n }
        // return climbStairs(n - 1) + climbStairs(n - 2)
        // 思路一：暴力 O(n^2) and O(n)
    //    return climbStair(0, n)

       // 思路二： 动态规划 O(n) add O(n)
        return func2(n)

        // 思路三： 斐波那契数 O(n) add O(1)
        // return func3(n)
        
        // 思路四： 国际有意思的一种写法
        // return func4(n)
    }

    func climbStair(_ cur: Int, _ n: Int) -> Int {
        if cur > n { return 0 }
        if cur == n { return 1 }
        return climbStair(cur + 1, n) + climbStair(cur + 2, n)
    }

    func func2(_ n: Int) -> Int {
         guard n > 3 else {
            return n
        }
        var dp = Array(repeating: 0, count: n + 1)
        dp[1] = 1
        dp[2] = 2
        for i in 3...n {
            dp[i] = dp[i - 1] + dp[i - 2]
        }
        return dp[n]       
    }

    func func3(_ n: Int) -> Int {
        guard n > 3 else {
            return n
        }
        var f1 = 1, f2 = 2, f3 = 3
        for _ in 3...n {
            f3 = f1 + f2
            f1 = f2
            f2 = f3
        }
        return f3
    }

    func func4(_ n: Int) -> Int {
        guard n > 3 else {
            return n
        }
        var result = [1, 2]
        for _ in 3...n {
            let ref = result.removeFirst()
            result.append(ref + result.first!)
        }
        return result.last!
    }
}
// @lc code=end

