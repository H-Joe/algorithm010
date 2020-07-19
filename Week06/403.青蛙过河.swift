/*
 * @lc app=leetcode.cn id=403 lang=swift
 *
 * [403] 青蛙过河
 *
 * https://leetcode-cn.com/problems/frog-jump/description/
 *
 * algorithms
 * Hard (35.28%)
 * Likes:    82
 * Dislikes: 0
 * Total Accepted:    7.3K
 * Total Submissions: 20.2K
 * Testcase Example:  '[0,1,3,4,5,7,9,10,12]'
 *
 * 一只青蛙想要过河。 假定河流被等分为 x 个单元格，并且在每一个单元格内都有可能放有一石子（也有可能没有）。 青蛙可以跳上石头，但是不可以跳入水中。
 * 
 * 给定石子的位置列表（用单元格序号升序表示）， 请判定青蛙能否成功过河（即能否在最后一步跳至最后一个石子上）。 开始时，
 * 青蛙默认已站在第一个石子上，并可以假定它第一步只能跳跃一个单位（即只能从单元格1跳至单元格2）。
 * 
 * 如果青蛙上一步跳跃了 k 个单位，那么它接下来的跳跃距离只能选择为 k - 1、k 或 k + 1个单位。
 * 另请注意，青蛙只能向前方（终点的方向）跳跃。
 * 
 * 请注意：
 * 
 * 
 * 石子的数量 ≥ 2 且 < 1100；
 * 每一个石子的位置序号都是一个非负整数，且其 < 2^31；
 * 第一个石子的位置永远是0。
 * 
 * 
 * 示例 1:
 * 
 * 
 * [0,1,3,5,6,8,12,17]
 * 
 * 总共有8个石子。
 * 第一个石子处于序号为0的单元格的位置, 第二个石子处于序号为1的单元格的位置,
 * 第三个石子在序号为3的单元格的位置， 以此定义整个数组...
 * 最后一个石子处于序号为17的单元格的位置。
 * 
 * 返回 true。即青蛙可以成功过河，按照如下方案跳跃： 
 * 跳1个单位到第2块石子, 然后跳2个单位到第3块石子, 接着 
 * 跳2个单位到第4块石子, 然后跳3个单位到第6块石子, 
 * 跳4个单位到第7块石子, 最后，跳5个单位到第8个石子（即最后一块石子）。
 * 
 * 
 * 示例 2:
 * 
 * 
 * [0,1,2,3,4,8,9,11]
 * 
 * 返回 false。青蛙没有办法过河。 
 * 这是因为第5和第6个石子之间的间距太大，没有可选的方案供青蛙跳跃过去。
 * 
 * 
 */

// @lc code=start
class Solution {
    func canCross(_ stones: [Int]) -> Bool {
        /// 思路一： 官解三 动态规划 O(nn) O(nn)
        // return func1(stones)

        /// 思路二： 动态规划 O(nn) O(nn)
        return func2(stones)
    }
    func func1(_ stones: [Int]) -> Bool {
        guard stones.count > 0 else { return false }
        var dp = stones.reduce(into: [:]) { $0[$1] = Set<Int>() }
        dp[stones[0]]?.insert(0)
        for s in stones {
            let curSteps = dp[s]!
            for k in curSteps {
                for n in k - 1...k + 1 {
                    if n > 0, dp.keys.contains(s + n) {
                        dp[s + n]?.insert(n)
                    }
                }
            }
        }
        return !dp[stones.last!]!.isEmpty
    }

    /*
    思路①、使用二维数组的动态规划
         动态规划
         dp[i][k] 表示能否由前面的某一个石头 j 通过跳 k 步到达当前这个石头 i ，这个 j 的范围是 [1, i - 1]
         当然，这个 k 步是 i 石头 和 j 石头之间的距离
         那么对于 j 石头来说，跳到 j 石头的上一个石头的步数就必须是这个 k - 1 || k || k + 1
         由此可得状态转移方程：dp[i][k] = dp[j][k - 1] || dp[j][k] || dp[j][k + 1]
    */
    func func2(_ stones: [Int]) -> Bool {
        guard stones.count > 0 else { return false }
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: stones.count + 1), count: stones.count)
        dp[0][0] = true
        for i in 1..<stones.count {
            for j in 0..<i {
                let k = stones[i] - stones[j]
                if k <= i {
                    dp[i][k] = dp[j][k - 1] || dp[j][k] || dp[j][k + 1]
                    if i == stones.count - 1, dp[i][k] { return true }
                }
            }
        }
        return false 
    }

}
// @lc code=end

