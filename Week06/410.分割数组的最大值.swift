/*
 * @lc app=leetcode.cn id=410 lang=swift
 *
 * [410] 分割数组的最大值
 *
 * https://leetcode-cn.com/problems/split-array-largest-sum/description/
 *
 * algorithms
 * Hard (43.13%)
 * Likes:    183
 * Dislikes: 0
 * Total Accepted:    7.9K
 * Total Submissions: 17.9K
 * Testcase Example:  '[7,2,5,10,8]\n2'
 *
 * 给定一个非负整数数组和一个整数 m，你需要将这个数组分成 m 个非空的连续子数组。设计一个算法使得这 m 个子数组各自和的最大值最小。
 * 
 * 注意:
 * 数组长度 n 满足以下条件:
 * 
 * 
 * 1 ≤ n ≤ 1000
 * 1 ≤ m ≤ min(50, n)
 * 
 * 
 * 示例: 
 * 
 * 
 * 输入:
 * nums = [7,2,5,10,8]
 * m = 2
 * 
 * 输出:
 * 18
 * 
 * 解释:
 * 一共有四种方法将nums分割为2个子数组。
 * 其中最好的方式是将其分为[7,2,5] 和 [10,8]，
 * 因为此时这两个子数组各自的和的最大值为18，在所有情况中最小。
 * 
 * 
 */

// @lc code=start
class Solution {
    func splitArray(_ nums: [Int], _ m: Int) -> Int {
        /// 思路一： 动态规划 O(nnm) O(nm)
        // return func1(nums, m)

        /// 思路二： 二分 O(nlog(sum(n))) O(1)
        return func2(nums, m)
    }

    /*
    首先我们把 f[i][j] 定义为将 nums[0..i] 分成 j 份时能得到的最小的分割子数组最大值。
    对于第 j 个子数组，它为数组中下标 k + 1 到 i 的这一段。因此，f[i][j] 可以从 max(f[k][j - 1], nums[k + 1] + ... + nums[i]) 这个公式中得到。遍历所有可能的 k，会得到 f[i][j] 的最小值。
    整个算法那的最终答案为 f[n][m]，其中 n 为数组大小。
    */
    func func1(_ nums: [Int], _ m: Int) -> Int {
       guard nums.count > 0 else { return 0 }
       let n = nums.count
       var dp = [[Int]](repeating: [Int](repeating: Int.max, count: m + 1), count: n + 1)
       var sub = [Int](repeating: 0, count: n + 1)
       for i in 0..<nums.count { sub[i + 1] = sub[i] + nums[i] }
       dp[0][0] = 0
       for i in 1...n {
           for j in 1...m {
               for k in 0..<i {
                   dp[i][j] = min(dp[i][j], max(dp[k][j - 1], sub[i] - sub[k]))
               }
           }
       }
       return dp[n][m]
    }

    /*
    由题意可知：子数组的最大值是有范围的，即在区间 [max(nums),sum(nums)][max(nums),sum(nums)] 之中。
    令 l=max(nums)，h=sum(nums)l=max(nums)，h=sum(nums)，mid=(l+h)/2mid=(l+h)/2，计算数组和最大值不大于mid对应的子数组个数 cnt(这个是关键！)
    如果 cnt>m，说明划分的子数组多了，即我们找到的 mid 偏小，故 l=mid+1l=mid+1；
    否则，说明划分的子数组少了，即 mid 偏大(或者正好就是目标值)，故 h=midh=mid。
    链接：https://leetcode-cn.com/problems/split-array-largest-sum/solution/er-fen-cha-zhao-by-coder233-2/
    */
    func func2(_ nums: [Int], _ m: Int) -> Int {
        guard nums.count > 0 else { return 0 }
        var l = 0, r = 0
        for n in nums {
            l = max(l, n)
            r += n
        }
        while l < r {
            let mid = l + (r - l) / 2

            var splitCount = 1, subArraySum = 0
            for n in nums {
                if subArraySum + n > mid { subArraySum = 0; splitCount += 1 }
                subArraySum += n
            }

            if splitCount > m { l = mid + 1 }
            else { r = mid }
        }
        return l
    }
}
// @lc code=end

