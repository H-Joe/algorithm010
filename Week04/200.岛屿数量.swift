/*
 * @lc app=leetcode.cn id=200 lang=swift
 *
 * [200] 岛屿数量
 *
 * https://leetcode-cn.com/problems/number-of-islands/description/
 *
 * algorithms
 * Medium (49.55%)
 * Likes:    612
 * Dislikes: 0
 * Total Accepted:    118K
 * Total Submissions: 237.9K
 * Testcase Example:  '[["1","1","1","1","0"],["1","1","0","1","0"],["1","1","0","0","0"],["0","0","0","0","0"]]'
 *
 * 给你一个由 '1'（陆地）和 '0'（水）组成的的二维网格，请你计算网格中岛屿的数量。
 * 
 * 岛屿总是被水包围，并且每座岛屿只能由水平方向或竖直方向上相邻的陆地连接形成。
 * 
 * 此外，你可以假设该网格的四条边均被水包围。
 * 
 * 
 * 
 * 示例 1:
 * 
 * 输入:
 * 11110
 * 11010
 * 11000
 * 00000
 * 输出: 1
 * 
 * 
 * 示例 2:
 * 
 * 输入:
 * 11000
 * 11000
 * 00100
 * 00011
 * 输出: 3
 * 解释: 每座岛屿只能由水平和/或竖直方向上相邻的陆地连接而成。
 * 
 * 
 */

// @lc code=start
class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        /// 思路一：DFS 深度优先搜索
        // return func1(grid)
        /// 思路二： BFS 广度优先搜索
        return func2(grid)
    }

    func func1(_ grid: [[Character]]) -> Int {
        var grid = grid
        func dfs(_ grid: inout [[Character]], _ i: Int, _ j: Int) {
            if i < 0 || j < 0 || i >= grid.count || j >= grid.first!.count || grid[i][j] == "0" { return }
            grid[i][j] = "0"
            dfs(&grid, i + 1, j)
            dfs(&grid, i, j + 1)
            dfs(&grid, i - 1, j)
            dfs(&grid, i, j - 1)
        }
        var count = 0
        for i in 0..<grid.count {
            for j in 0..<grid.first!.count {
                if grid[i][j] == "1" {
                    dfs(&grid, i, j)
                    count += 1
                }
            }
        }
        return count
    }

    func func2(_ grid: [[Character]]) -> Int {
        var grid = grid 
        func bfs(_ grid: inout [[Character]], _ i: Int, _ j: Int) {
            var queue = [[Int]]()
            queue.append([i, j])
            while !queue.isEmpty {
                let first = queue.removeFirst()
                let i = first.first!
                let j = first.last!
                if i >= 0 && i < grid.count && j >= 0 && j < grid.first!.count && grid[i][j] == "1" {
                    grid[i][j] = "0"
                    queue.append([i + 1, j])
                    queue.append([i - 1, j])
                    queue.append([i, j + 1])
                    queue.append([i, j - 1])
                }
            }
        }
        var count = 0
        for i in 0..<grid.count {
            for j in 0..<grid.first!.count {
                if grid[i][j] == "1" {
                    bfs(&grid, i, j)
                    count += 1
                }
            }
        }
        return count
    }

}
// @lc code=end

