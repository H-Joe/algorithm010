/*
 * @lc app=leetcode.cn id=130 lang=swift
 *
 * [130] 被围绕的区域
 *
 * https://leetcode-cn.com/problems/surrounded-regions/description/
 *
 * algorithms
 * Medium (40.10%)
 * Likes:    264
 * Dislikes: 0
 * Total Accepted:    43.2K
 * Total Submissions: 106.9K
 * Testcase Example:  '[["X","X","X","X"],["X","O","O","X"],["X","X","O","X"],["X","O","X","X"]]'
 *
 * 给定一个二维的矩阵，包含 'X' 和 'O'（字母 O）。
 * 
 * 找到所有被 'X' 围绕的区域，并将这些区域里所有的 'O' 用 'X' 填充。
 * 
 * 示例:
 * 
 * X X X X
 * X O O X
 * X X O X
 * X O X X
 * 
 * 
 * 运行你的函数后，矩阵变为：
 * 
 * X X X X
 * X X X X
 * X X X X
 * X O X X
 * 
 * 
 * 解释:
 * 
 * 被围绕的区间不会存在于边界上，换句话说，任何边界上的 'O' 都不会被填充为 'X'。 任何不在边界上，或不与边界上的 'O' 相连的 'O'
 * 最终都会被填充为 'X'。如果两个元素在水平或垂直方向相邻，则称它们是“相连”的。
 * 
 */

// @lc code=start
class Solution {
    func solve(_ board: inout [[Character]]) {
        /// 思路一： DFS BFS O(mn) O(mn)
        // func1(&board)
        /// 思路二： 并查集 O(mn) O(mn)
        func2(&board)
    }
    func func1(_ board: inout [[Character]]) { 
        guard board.count > 0, board[0].count > 0 else { return }
        let m = board.count, n = board[0].count 
        let dxy = [(1, 0), (0, 1), (-1, 0), (0, -1)]

        func _dfs(_ board: inout [[Character]], _ i: Int, _ j: Int) {
            board[i][j] = "#"
            for (dx, dy) in dxy {
                let x = i + dx, y = j + dy
                if x >= 0, x < m, y >= 0, y < n , board[x][y] == "O" {
                    _dfs(&board, x, y)
                }
            }
        }

        func _bfs(_ board: inout [[Character]], _ i: Int, _ j: Int) {
            var queue = [(Int, Int)]()
            queue.append((i, j))
            /// 实现一
            // board[i][j] = "#"
            // while !queue.isEmpty {
            //     let (i, j) = queue.removeFirst()
            //     for (dx, dy) in dxy {
            //         let x = i + dx, y = j + dy
            //         if x >= 0, x < m, y >= 0, y < n , board[x][y] == "O" {
            //             queue.append((x, y))
            //             board[x][y] = "#"
            //         }
            //     }
            // }
            /// 实现二
            while !queue.isEmpty {
                let (i, j) = queue.removeFirst()
                if i >= 0, i < m, j >= 0, j < n , board[i][j] == "O" {
                     board[i][j] = "#"
                    for (dx, dy) in dxy {
                        let x = i + dx, y = j + dy
                        queue.append((x, y))
                    }
                }
            }
        }
        for i in 0..<m {
            for j in 0..<n {
                if i == 0 || i == m - 1 || j == 0 || j == n - 1 , board[i][j] == "O" {
                    // _dfs(&board, i, j)
                    _bfs(&board, i, j)
                }
            }
        }
        for i in 0..<m {
            for j in 0..<n {
                if board[i][j] == "O" { board[i][j] = "X" }
                if board[i][j] == "#" { board[i][j] = "O"}
            }
        }
    }

    func func2(_ board: inout [[Character]]) { 
        guard board.count > 0, board[0].count > 0 else { return }
        let m = board.count, n = board[0].count 
        let index = { (x: Int, y: Int) -> Int in return x * n + y }
        let dxy = [(1, 0), (0, 1), (-1, 0), (0, -1)]

        var p = [Int](repeating: 0, count: m * n + 1)
        for i in 0..<m * n + 1 { p[i] = i }
        func _find(_ i: Int) -> Int {
            var i = i
            while p[i] != i {
                p[i] = p[p[i]]
                i = p[i]
            }
            return i
        }
        func _union(_ i: Int, _ j: Int) {
            let p1 = _find(i), p2 = _find(j)
            if p1 == p2 { return }
            p[p1] = p2
        }

        for i in 0..<m {
            for j in 0..<n {
                if board[i][j] == "O" {
                    if i == 0 || i == m - 1 || j == 0 || j == n - 1 {
                        _union(index(i, j), m * n)
                    }else {
                        for (dx, dy) in [(1, 0), (0, 1), (-1, 0), (0, -1)] {
                            let x = i + dx, y = j + dy 
                            if x >= 0, y >= 0, x < m, y < n, board[x][y] == "O" {
                                _union(index(i, j), index(x, y))
                            }
                        }
                    }
                }
            }
        }
        for i in 0..<m {
            for j in 0..<n {
                if _find(index(i, j)) == _find(m * n) { board[i][j] = "O" }
                else { board[i][j] = "X" }
            }
        }
    }

}
// @lc code=end

