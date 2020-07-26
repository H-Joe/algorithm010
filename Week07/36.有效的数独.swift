/*
 * @lc app=leetcode.cn id=36 lang=swift
 *
 * [36] 有效的数独
 *
 * https://leetcode-cn.com/problems/valid-sudoku/description/
 *
 * algorithms
 * Medium (59.69%)
 * Likes:    376
 * Dislikes: 0
 * Total Accepted:    83.7K
 * Total Submissions: 139.1K
 * Testcase Example:  '[["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]'
 *
 * 判断一个 9x9 的数独是否有效。只需要根据以下规则，验证已经填入的数字是否有效即可。
 * 
 * 
 * 数字 1-9 在每一行只能出现一次。
 * 数字 1-9 在每一列只能出现一次。
 * 数字 1-9 在每一个以粗实线分隔的 3x3 宫内只能出现一次。
 * 
 * 
 * 
 * 
 * 上图是一个部分填充的有效的数独。
 * 
 * 数独部分空格内已填入了数字，空白格用 '.' 表示。
 * 
 * 示例 1:
 * 
 * 输入:
 * [
 * ⁠ ["5","3",".",".","7",".",".",".","."],
 * ⁠ ["6",".",".","1","9","5",".",".","."],
 * ⁠ [".","9","8",".",".",".",".","6","."],
 * ⁠ ["8",".",".",".","6",".",".",".","3"],
 * ⁠ ["4",".",".","8",".","3",".",".","1"],
 * ⁠ ["7",".",".",".","2",".",".",".","6"],
 * ⁠ [".","6",".",".",".",".","2","8","."],
 * ⁠ [".",".",".","4","1","9",".",".","5"],
 * ⁠ [".",".",".",".","8",".",".","7","9"]
 * ]
 * 输出: true
 * 
 * 
 * 示例 2:
 * 
 * 输入:
 * [
 * ["8","3",".",".","7",".",".",".","."],
 * ["6",".",".","1","9","5",".",".","."],
 * [".","9","8",".",".",".",".","6","."],
 * ["8",".",".",".","6",".",".",".","3"],
 * ["4",".",".","8",".","3",".",".","1"],
 * ["7",".",".",".","2",".",".",".","6"],
 * [".","6",".",".",".",".","2","8","."],
 * [".",".",".","4","1","9",".",".","5"],
 * [".",".",".",".","8",".",".","7","9"]
 * ]
 * 输出: false
 * 解释: 除了第一行的第一个数字从 5 改为 8 以外，空格内其他数字均与 示例1 相同。
 * ⁠    但由于位于左上角的 3x3 宫内有两个 8 存在, 因此这个数独是无效的。
 * 
 * 说明:
 * 
 * 
 * 一个有效的数独（部分已被填充）不一定是可解的。
 * 只需要根据以上规则，验证已经填入的数字是否有效即可。
 * 给定数独序列只包含数字 1-9 和字符 '.' 。
 * 给定数独永远是 9x9 形式的。
 * 
 * 
 */

// @lc code=start
class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        /// 思路一： 迭代 O(9*9) O(3*9)
        // return func1(board)

        /// 思路二： 国际站
        // return func2(board)
        return func3(board)
    }
    func func1(_ board: [[Character]]) -> Bool {
        guard board.count > 0, board[0].count > 0 else { return false }
        var rows = [Int: [Character: Int]](), cols = [Int: [Character: Int]](), boxs = [Int: [Character: Int]]()
        for i in 0..<9 {
            for j in 0..<9 where board[i][j] != "." {
                let k = (i/3)*3 + j/3, n = board[i][j]
                rows[i, default: [Character: Int]()][n, default: 0] += 1
                cols[j, default: [Character: Int]()][n, default: 0] += 1
                boxs[k, default: [Character: Int]()][n, default: 0] += 1
                if rows[i]![n]! > 1 || cols[j]![n]! > 1 || boxs[k]![n]! > 1 { return false }
            }
        }
        return true
    }

    func func2(_ board: [[Character]]) -> Bool {
        var seen = Set<String>()
        for i in 0..<9 {
            for j in 0..<9 {
                let currVal = board[i][j]
                if currVal == "." {
                    continue
                }
                let row = "\(currVal) found in row \(i)"
                let col = "\(currVal) found in col \(j)"
                let box = "\(currVal) found in box \((i/3)) - \((j/3))"
                if seen.contains(row) {
                    return false
                } else {
                    seen.insert(row)
                }
                if seen.contains(col) {
                    return false
                } else {
                    seen.insert(col)
                }
                if seen.contains(box) {
                    return false
                } else {
                    seen.insert(box)
                }
            }
        }
        return true
    }

    func func3(_ board: [[Character]]) -> Bool {
        var set: Set<String> = Set()
        for x in 0..<9 {
            for y in 0..<9 where board[x][y] != "." {
                print(set)
                if !set.insert("\(x)(\(board[x][y]))").inserted ||
                    !set.insert("(\(board[x][y]))\(y)").inserted ||
                    !set.insert("\(x / 3)(\(board[x][y]))\(y / 3)").inserted {
                        return false
                    }
            }
        }
        return true
    }

}
// @lc code=end

