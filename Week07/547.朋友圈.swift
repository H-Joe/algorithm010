/*
 * @lc app=leetcode.cn id=547 lang=swift
 *
 * [547] 朋友圈
 *
 * https://leetcode-cn.com/problems/friend-circles/description/
 *
 * algorithms
 * Medium (56.99%)
 * Likes:    282
 * Dislikes: 0
 * Total Accepted:    53.3K
 * Total Submissions: 92.8K
 * Testcase Example:  '[[1,1,0],[1,1,0],[0,0,1]]'
 *
 * 班上有 N 名学生。其中有些人是朋友，有些则不是。他们的友谊具有是传递性。如果已知 A 是 B 的朋友，B 是 C 的朋友，那么我们可以认为 A 也是
 * C 的朋友。所谓的朋友圈，是指所有朋友的集合。
 * 
 * 给定一个 N * N 的矩阵 M，表示班级中学生之间的朋友关系。如果M[i][j] = 1，表示已知第 i 个和 j
 * 个学生互为朋友关系，否则为不知道。你必须输出所有学生中的已知的朋友圈总数。
 * 
 * 示例 1:
 * 
 * 
 * 输入: 
 * [[1,1,0],
 * ⁠[1,1,0],
 * ⁠[0,0,1]]
 * 输出: 2 
 * 说明：已知学生0和学生1互为朋友，他们在一个朋友圈。
 * 第2个学生自己在一个朋友圈。所以返回2。
 * 
 * 
 * 示例 2:
 * 
 * 
 * 输入: 
 * [[1,1,0],
 * ⁠[1,1,1],
 * ⁠[0,1,1]]
 * 输出: 1
 * 说明：已知学生0和学生1互为朋友，学生1和学生2互为朋友，所以学生0和学生2也是朋友，所以他们三个在一个朋友圈，返回1。
 * 
 * 
 * 注意：
 * 
 * 
 * N 在[1,200]的范围内。
 * 对于所有学生，有M[i][i] = 1。
 * 如果有M[i][j] = 1，则有M[j][i] = 1。
 * 
 * 
 */

// @lc code=start
class Solution {
    func findCircleNum(_ M: [[Int]]) -> Int {
        /// 思路一：DFS O(n^2) O(n)
        // return func1(M)

        /// 思路二：BFS O(n^2) O(n)
        // return func2(M)

        /// 思路三：并查集 O(n^3) or O(n)   O(n)
        return func3(M)
    }
    func func1(_ M: [[Int]]) -> Int {
        guard M.count > 0, M[0].count > 0 else { return 0 }
        let m = M.count, n = M[0].count 
        var visited = [Bool](repeating: false ,count: m)
        var count = 0

        func _dfs(_ M: [[Int]], _ i: Int, _ visited: inout [Bool]) {
            for j in 0..<n {
                if M[i][j] == 1, !visited[j] {
                    visited[j] = true
                    _dfs(M, j, &visited)
                }
            }
        }
        for i in 0..<m where !visited[i] {
            _dfs(M, i, &visited)
            count += 1
        }

        return count
    }

    func func2(_ M: [[Int]]) -> Int {
        guard M.count > 0, M[0].count > 0 else { return 0 }
        let m = M.count, n = M[0].count 
        var visited = [Bool](repeating: false ,count: m)
        var queue = [Int](repeating: 0, count: m)
        var count = 0

        func _bfs(_ M: [[Int]], _ i: Int, _ visited: inout [Bool]) {
            queue.append(i)
            while !queue.isEmpty {
                let f = queue.removeFirst()
                visited[f] = true
                for j in 0..<n {
                    if M[f][j] == 1, !visited[j] {
                        visited[j] = true
                        _bfs(M, j, &visited)
                    }
                }
            }
        }
        for i in 0..<m where !visited[i] {
            _bfs(M, i, &visited)
            count += 1
        }
        return count
    }
    func func3(_ M: [[Int]]) -> Int {
        guard M.count > 0, M[0].count > 0 else { return 0 }
        let m = M.count, n = M[0].count 
        let dis = UnionFind(m)
        for i in 0..<m {
            for j in 0..<i {
                if M[i][j] == 1 {
                    dis.union(i, j)
                }
            }
        }
        return dis.count
    }
}

class UnionFind {
    var count = 0
    var p: [Int], size: [Int]
    init(_ count: Int){
        self.count = count
        p = [Int](repeating: 0, count: count)
        size = [Int](repeating: 1, count: count)
        for i in 0..<count { p[i] = i } 
    }

    func find(_ i: Int) -> Int {
        var i = i 
        while p[i] != i {
            p[i] = p[p[i]]
            i = p[i]
        }
        return i
    }
    func find1(_ i: Int) -> Int {
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
        let pi = find(i), pj = find(j)
        if pi == pj { return }
        if size[pi] < size[pj] {
            p[pi] = pj
            size[pj] += size[pi]
        }else {
            p[pj] = pi
            size[pi] += size[pj]
        }
        count -= 1
    }
    
}
// @lc code=end

