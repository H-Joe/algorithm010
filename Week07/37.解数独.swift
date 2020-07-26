/*
 * @lc app=leetcode.cn id=37 lang=swift
 *
 * [37] 解数独
 *
 * https://leetcode-cn.com/problems/sudoku-solver/description/
 *
 * algorithms
 * Hard (61.67%)
 * Likes:    479
 * Dislikes: 0
 * Total Accepted:    34.6K
 * Total Submissions: 55.5K
 * Testcase Example:  '[["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]'
 *
 * 编写一个程序，通过已填充的空格来解决数独问题。
 * 
 * 一个数独的解法需遵循如下规则：
 * 
 * 
 * 数字 1-9 在每一行只能出现一次。
 * 数字 1-9 在每一列只能出现一次。
 * 数字 1-9 在每一个以粗实线分隔的 3x3 宫内只能出现一次。
 * 
 * 
 * 空白格用 '.' 表示。
 * 
 * 
 * 
 * 一个数独。
 * 
 * 
 * 
 * 答案被标成红色。
 * 
 * Note:
 * 
 * 
 * 给定的数独序列只包含数字 1-9 和字符 '.' 。
 * 你可以假设给定的数独只有唯一解。
 * 给定数独永远是 9x9 形式的。
 * 
 * 
 */

// @lc code=start
class Solution {
    func solveSudoku(_ board: inout [[Character]]) {
       /// 思路一： 回溯
    //    return func1(&board) 

        /// 思路二： 回溯 + set
        return func2(&board)
    }

    func func1(_ board: inout [[Character]]) {
        guard board.count > 0, board[0].count > 0 else { return }

        func isValidSuoku(_ board: [[Character]], _ i: Int, _ j: Int, _ c: Character) -> Bool {
            for k in 0..<9 {
                if board[i][k] != ".", board[i][k] == c { return false }
                if board[k][j] != ".", board[k][j] == c { return false }
                if board[3*(i/3) + k/3][3*(j/3) + k%3] != ".", board[3*(i/3) + k/3][3*(j/3) + k%3] == c { return false }
            }
            return true 
        }
        func dfs(_ board: inout [[Character]]) -> Bool {
            for i in 0..<9 {
                for j in 0..<9 where board[i][j] == "." {
                    for c in 1...9 where isValidSuoku(board, i, j, Character("\(c)")) {
                        board[i][j] = Character("\(c)")
                        if dfs(&board) { return true }
                        board[i][j] = "."
                    }
                    return false 
                }
            }
            return true
        }
        func dfs1(_ board: inout [[Character]], _ d: Int) -> Bool {
            if d == 81 { return true }
            let i = d / 9, j = d % 9
            if board[i][j] != "." { return dfs1(&board, d + 1) }
            let k = (i/3)*3 + j/3
            for c in 1...9 where isValidSuoku(board, i, j, Character("\(c)")) {
                board[i][j] = Character("\(c)")
                if dfs1(&board, d + 1) { return true }
                board[i][j] = "."
            }
            return false 
        }

        // 调用函数
        // dfs(&board)
        dfs1(&board, 0)
    }

     func func2(_ board: inout [[Character]]) {
         guard board.count > 0, board[0].count > 0 else { return }
         var rows = [Set<Int>](repeating: Set(1...9), count: 9)
         var cols = [Set<Int>](repeating: Set(1...9), count: 9)
         var boxs = [Set<Int>](repeating: Set(1...9), count: 9)
         var empty = [(Int, Int)]()
         for i in 0..<9 {
             for j in 0..<9 {
                 if board[i][j] == "." { empty.append((i, j)) }
                 else {
                     let c = Int("\(board[i][j])")!
                     rows[i].remove(c); cols[j].remove(c); boxs[(i/3)*3 + j/3].remove(c)
                 }
             }
         }

         func backTrack(_ n: Int = 0) -> Bool {
             if n == empty.count { return true }
             let (i, j) = empty[n]
             let k = (i/3)*3 + j/3
             for c in rows[i].intersection(cols[j]).intersection(boxs[k]) {
                 rows[i].remove(c); cols[j].remove(c); boxs[k].remove(c)
                 board[i][j] = Character("\(c)")
                 if backTrack(n + 1) { return true }
                 // board[i][j] = "." // 这里无所谓，因为 i,j, k 是之前统计好的空位置
                rows[i].insert(c); cols[j].insert(c); boxs[k].insert(c)
             }
             return false 
         }
         backTrack()
     }
}
// @lc code=end

