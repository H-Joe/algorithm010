/*
 * @lc app=leetcode.cn id=52 lang=swift
 *
 * [52] N皇后 II
 *
 * https://leetcode-cn.com/problems/n-queens-ii/description/
 *
 * algorithms
 * Hard (78.56%)
 * Likes:    136
 * Dislikes: 0
 * Total Accepted:    28.1K
 * Total Submissions: 35.6K
 * Testcase Example:  '4'
 *
 * n 皇后问题研究的是如何将 n 个皇后放置在 n×n 的棋盘上，并且使皇后彼此之间不能相互攻击。
 * 
 * 
 * 
 * 上图为 8 皇后问题的一种解法。
 * 
 * 给定一个整数 n，返回 n 皇后不同的解决方案的数量。
 * 
 * 示例:
 * 
 * 输入: 4
 * 输出: 2
 * 解释: 4 皇后问题存在如下两个不同的解法。
 * [
 * [".Q..",  // 解法 1
 * "...Q",
 * "Q...",
 * "..Q."],
 * 
 * ["..Q.",  // 解法 2
 * "Q...",
 * "...Q",
 * ".Q.."]
 * ]
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 皇后，是国际象棋中的棋子，意味着国王的妻子。皇后只做一件事，那就是“吃子”。当她遇见可以吃的棋子时，就迅速冲上去吃掉棋子。当然，她横、竖、斜都可走一或
 * N-1 步，可进可退。（引用自 百度百科 - 皇后 ）
 * 
 * 
 */

// @lc code=start
class Solution {
    func totalNQueens(_ n: Int) -> Int {
        // 思路一：回溯
        // return func1(n)
        // return func2(n)

        // 思路二： 位运算
        return func3(n)
    }

    func func1(_ n: Int) -> Int {
        if n < 1 { return n }
        var cols = Set<Int>(), pie = Set<Int>(), na = Set<Int>()
        var count = 0

        func DFS(_ n: Int, _ row: Int) {
            if row >= n { count += 1; return }
            for col in 0..<n where !cols.contains(col) && !pie.contains(row + col) && !na.contains(row - col) {
                cols.insert(col); pie.insert(row + col); na.insert(row - col)
                DFS(n, row + 1)
                cols.remove(col); pie.remove(row + col); na.remove(row - col)
            }
        }

        DFS(n, 0)
        return count
    }

    func func2(_ n: Int) -> Int {
        if n < 1 { return n }
        var count = 0

        func DFS(_ queens: [Int], _ dif: [Int], _ sum: [Int]) {
            let q = queens.count 
            if q == n { count += 1; return }
            for p in 0..<n where !queens.contains(p) && !dif.contains(q - p) && !sum.contains(q + p){
                DFS(queens + [p], dif + [q - p], sum + [q + p])
            }
        }
        DFS([], [], [])
        return count
    }

    func func3(_ n: Int) -> Int {
        if n < 1 { return n }
        var count = 0

        func DFS(_ n: Int, _ row: Int, _ cols: Int, _ pie: Int, _ na: Int) {
            if row == n { count += 1; return }
            // 得到当前所有的空位置
            var bits = (~(cols | pie | na)) & ((1 << n) - 1)
            while bits != 0 {
                // 取得最低位的1
                let p = bits & (-bits)
                // 清零最低位的1 表示在p位置放置皇后
                bits &= (bits - 1)
                DFS(n, row + 1, cols | p, (pie | p) << 1, (na | p) >> 1)
            }
        }
        
        DFS(n, 0, 0, 0, 0)
        return count
    }
}
// @lc code=end

