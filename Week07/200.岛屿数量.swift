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
        // return func2(grid)

        /// 思路二： 并查集
        return func3(grid)
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

    func func3(_ grid: [[Character]]) -> Int {
       guard grid.count > 0, grid[0].count > 0 else { return 0 }
       let m = grid.count, n = grid[0].count 
       let uf = UnionFind(m * n + 1)
       let directions = [(1, 0), (0, 1)]
       let index = {(x: Int, y: Int) -> Int in return x * n + y}
       for i in 0..<m {
           for j in 0..<n {
               if grid[i][j] == "0" {
                   uf.union(index(i, j), m * n)
               }else {
                   for (dx, dy) in directions {
                       let x = i + dx, y = j + dy
                       if x < m, y < n , grid[x][y] == "1" {
                           uf.union(index(i, j), index(x, y))
                       }
                   }
               }
           }
       }
       return uf.count - 1
    }
}

class UnionFind {
    var count = 0
    var p: [Int]
    var size: [Int]
    init(_ count: Int) {
        self.count = count
        p = [Int](repeating: 0, count: count)
        size = [Int](repeating: 1, count: count)
        for i in 0..<count { p[i] = i }
    }
    func find(_ i: Int) -> Int {
        var root = i, i = i
        while p[root] != root { root = p[root] }
        while p[i] != i {
            let x = i
            i = p[i]
            p[x] = root
        }
        return root
    }
    func union(_ i: Int, _ j: Int) {
        let p1 = find(i), p2 = find(j)
        if p1 == p2 { return }
        if size[p1] < size[p2] {
            p[p1] = p2
            size[p2] += size[p1]
        }else {
            p[p2] = p1
            size[p1] += size[p2]
        }
        count -= 1
    }
}
// @lc code=end

