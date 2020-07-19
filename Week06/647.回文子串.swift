/*
 * @lc app=leetcode.cn id=647 lang=swift
 *
 * [647] 回文子串
 *
 * https://leetcode-cn.com/problems/palindromic-substrings/description/
 *
 * algorithms
 * Medium (61.67%)
 * Likes:    282
 * Dislikes: 0
 * Total Accepted:    32.2K
 * Total Submissions: 51.9K
 * Testcase Example:  '"abc"'
 *
 * 给定一个字符串，你的任务是计算这个字符串中有多少个回文子串。
 * 
 * 具有不同开始位置或结束位置的子串，即使是由相同的字符组成，也会被计为是不同的子串。
 * 
 * 示例 1:
 * 
 * 
 * 输入: "abc"
 * 输出: 3
 * 解释: 三个回文子串: "a", "b", "c".
 * 
 * 
 * 示例 2:
 * 
 * 
 * 输入: "aaa"
 * 输出: 6
 * 说明: 6个回文子串: "a", "a", "a", "aa", "aa", "aaa".
 * 
 * 
 * 注意:
 * 
 * 
 * 输入的字符串长度不会超过1000。
 * 
 * 
 */

// @lc code=start
class Solution {
    func countSubstrings(_ s: String) -> Int {
        /// 思路一： 动态规划 O(n^2) O(n^2)
        // return func1(s)

        /// 思路一： 动态规划 O(n^2) O(1)
        return func2(s)
    }

    /*
        1. 动态规划法
        首先这一题可以使用动态规划来进行解决：
        状态：dp[i][j] 表示字符串s在[i,j]区间的子串是否是一个回文串。
        状态转移方程：当 s[i] == s[j] && (j - i < 2 || dp[i + 1][j - 1]) 时，dp[i][j]=true，否则为false
        这个状态转移方程是什么意思呢？
        当只有一个字符时，比如a自然是一个回文串。
        当有两个字符时，如果是相等的，比如aa，也是一个回文串。
        当有三个及以上字符时，比如ababa这个字符记作串1，把两边的a去掉，也就是bab记作串2，可以看出只要串2是一个回文串，那么左右各多了一个a的串1必定也是回文串。所以当s[i]==s[j]时，自然要看dp[i+1][j-1]是不是一个回文串。

        链接：https://leetcode-cn.com/problems/palindromic-substrings/solution/liang-dao-hui-wen-zi-chuan-de-jie-fa-xiang-jie-zho/
    */
    func func1(_ s: String) -> Int {
        guard s.count > 0 else { return 0 }
        var sa = Array(s), res = 0
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: sa.count), count: sa.count)
        for j in 0..<sa.count {
            for i in 0...j {
                if sa[i] == sa[j], (j - i < 2 || dp[i + 1][j - 1]) {
                    res += 1
                    dp[i][j] = true
                }
            }
        }
        return res
    }

    /*
        中心扩展法
        这是一个比较巧妙的方法，实质的思路和动态规划的思路类似。

        比如对一个字符串ababa，选择最中间的a作为中心点，往两边扩散，第一次扩散发现left指向的是b，right指向的也是b，所以是回文串，继续扩散，同理ababa也是回文串。
        这个是确定了一个中心点后的寻找的路径，然后我们只要寻找到所有的中心点，问题就解决了。
        中心点一共有多少个呢？看起来像是和字符串长度相等，但你会发现，如果是这样，上面的例子永远也搜不到abab，想象一下单个字符的哪个中心点扩展可以得到这个子串？似乎不可能。所以中心点不能只有单个字符构成，还要包括两个字符，比如上面这个子串abab，就可以有中心点ba扩展一次得到，所以最终的中心点由2 * len - 1个，分别是len个单字符和len - 1个双字符。
        如果上面看不太懂的话，还可以看看下面几个问题：
        为什么有 2 * len - 1 个中心点？
        aba 有5个中心点，分别是 a、b、c、ab、ba
        abba 有7个中心点，分别是 a、b、b、a、ab、bb、ba
        什么是中心点？
        中心点即left指针和right指针初始化指向的地方，可能是一个也可能是两个
        为什么不可能是三个或者更多？
        因为3个可以由1个扩展一次得到，4个可以由两个扩展一次得到

        链接：https://leetcode-cn.com/problems/palindromic-substrings/solution/liang-dao-hui-wen-zi-chuan-de-jie-fa-xiang-jie-zho/
    */
    func func2(_ s: String) -> Int {
        guard s.count > 0 else { return 0 }
        var sa = Array(s), res = 0
        for j in 0..<2 * sa.count - 1 {
           var l = j / 2, r = l + j % 2
           while l >= 0, r < sa.count , sa[l] == sa[r] {
               res += 1; l -= 1; r += 1
           }
        }
        return res
    }
}
// @lc code=end

