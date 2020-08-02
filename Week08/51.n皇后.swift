/*
 * @lc app=leetcode.cn id=51 lang=swift
 *
 * [51] N皇后
 *
 * https://leetcode-cn.com/problems/n-queens/description/
 *
 * algorithms
 * Hard (69.89%)
 * Likes:    439
 * Dislikes: 0
 * Total Accepted:    46.5K
 * Total Submissions: 66.3K
 * Testcase Example:  '4'
 *
 * n 皇后问题研究的是如何将 n 个皇后放置在 n×n 的棋盘上，并且使皇后彼此之间不能相互攻击。
 * 
 * 
 * 
 * 上图为 8 皇后问题的一种解法。
 * 
 * 给定一个整数 n，返回所有不同的 n 皇后问题的解决方案。
 * 
 * 每一种解法包含一个明确的 n 皇后问题的棋子放置方案，该方案中 'Q' 和 '.' 分别代表了皇后和空位。
 * 
 * 示例:
 * 
 * 输入: 4
 * 输出: [
 * ⁠[".Q..",  // 解法 1
 * ⁠ "...Q",
 * ⁠ "Q...",
 * ⁠ "..Q."],
 * 
 * ⁠["..Q.",  // 解法 2
 * ⁠ "Q...",
 * ⁠ "...Q",
 * ⁠ ".Q.."]
 * ]
 * 解释: 4 皇后问题存在两个不同的解法。
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 
 * 皇后，是国际象棋中的棋子，意味着国王的妻子。皇后只做一件事，那就是“吃子”。当她遇见可以吃的棋子时，就迅速冲上去吃掉棋子。当然，她横、竖、斜都可走一到七步，可进可退。（引用自
 * 百度百科 - 皇后 ）
 * 
 * 
 */

// @lc code=start
class Solution {
    func solveNQueens(_ n: Int) -> [[String]] {
      /// 思路一： 回溯
      // return func1(n)
      /// 思路二：
      // return func2(n) 
      /// 思路三：
      // return func3(n)

      /// 思路四： 位运算
      return func4(n)
    }
    func func1(_ n: Int) -> [[String]] {
        guard n > 0 else { return [[]] }
        var res = [[String]](), paris = [String]()
        var colSta = Array(repeating: false, count: n)
        var mainDiaSta = Array(repeating: false, count: 2 * n - 1)
        var demainDiaSta = Array(repeating: false, count: 2 * n - 1)
        var line = String(repeating: ".", count: n)

        func backTrack(_ n: Int, _ row: Int, _ line: inout String, _ paris: inout [String], _ colSta: inout [Bool], _ mainDiaSta: inout [Bool], _ demainDiaSta: inout [Bool]) {
          guard paris.count < n /* row < n*/else {
            res.append(paris)
            return 
          }
          for i in 0..<n where !colSta[i] && !mainDiaSta[row - i + n - 1] && !demainDiaSta[row + i]{
            line.replaceSubrange(line.index(line.startIndex, offsetBy: i)...line.index(line.startIndex, offsetBy: i), with: "Q")
            paris.append(line)
            line.replaceSubrange(line.index(line.startIndex, offsetBy: i)...line.index(line.startIndex, offsetBy: i), with: ".")
            colSta[i] = true; mainDiaSta[row - i + n - 1] = true; demainDiaSta[row + i] = true
            backTrack(n, row + 1, &line, &paris, &colSta, &mainDiaSta, &demainDiaSta)
            colSta[i] = false; mainDiaSta[row - i + n - 1] = false; demainDiaSta[row + i] = false
            paris.removeLast()
          }
        }

        backTrack(n, 0, &line, &paris, &colSta, &mainDiaSta, &demainDiaSta)
        return res
    }

     func func2(_ n: Int) -> [[String]] {
        var res = [[Int]]()
        var cols = Set<Int>(), pie = Set<Int>(), na = Set<Int>()
    
        func DFS(_ n: Int, _ row: Int, _ curState: [Int]) {
            if row >= n { res.append(curState); return }
            for col in 0..<n {
                if cols.contains(col) || pie.contains(row + col) || na.contains(row - col) { continue }
                cols.insert(col); pie.insert(row + col); na.insert(row - col)
                DFS(n, row + 1, curState + [col])
                cols.remove(col); pie.remove(row + col); na.remove(row - col)
            }
        }
        DFS(n, 0, [Int]())

        var res1 = [[String]]()
        for i in res {
            var temp = [String]()
            for j in i {
                var str = String(repeating: ".", count: j) + "Q" + String(repeating: ".", count: n-j-1)
                temp.append(str)
            }
            res1.append(temp)
        }
        return res1
     }

    func func3(_ n: Int) -> [[String]] {
        var res = [[Int]]()
        func DFS(_ queues: [Int], _ xy_dif: [Int], _ xy_sum: [Int]) {
            let p = queues.count
            if p == n { res.append(queues); return }
            for q in 0..<n {
                if !queues.contains(q), !xy_dif.contains(p-q), !xy_sum.contains(p+q) {
                    DFS(queues + [q], xy_dif + [p-q], xy_sum + [p+q])
                }
            }
        }
        DFS([], [], [])
        var res1 = [[String]]()
        
        for i in res {
            var temp = [String]()
            for j in i {
                var str = String(repeating: ".", count: j) + "Q" + String(repeating: ".", count: n-j-1)
                temp.append(str)
            }
            res1.append(temp)
        }
        return res1
    }

    func func4(_ n: Int) -> [[String]] {
      var res = [[Int]]()
      func DFS(_ row: Int, _ cols: Int, _ pie: Int, _ na: Int, _ curState: [Int]) {
        if row == n { res.append(curState); return }
        var bits = (~(cols | pie | na)) & ((1 << n) - 1)
        while bits != 0 {
          let p = bits & (-bits)
          bits &= bits - 1
          DFS(row + 1, cols | p, (pie | p) << 1, (na | p) >> 1, curState + [Int(log2(Double(p)))])
        }
      }
      DFS(0, 0, 0, 0, [])
      var res1 = [[String]]()
      for i in res {
        var temp = [String]()
        for j in i {
          let str = String(repeating: ".", count: j) + "Q" + String(repeating: ".", count: n - j - 1)
          temp.append(str)
        }
        res1.append(temp)
      }
      return res1
    }
}
// @lc code=end

