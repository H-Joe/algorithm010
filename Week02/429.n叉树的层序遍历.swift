/*
 * @lc app=leetcode.cn id=429 lang=swift
 *
 * [429] N叉树的层序遍历
 *
 * https://leetcode-cn.com/problems/n-ary-tree-level-order-traversal/description/
 *
 * algorithms
 * Medium (65.64%)
 * Likes:    91
 * Dislikes: 0
 * Total Accepted:    22.1K
 * Total Submissions: 33.7K
 * Testcase Example:  '[1,null,3,2,4,null,5,6]'
 *
 * 给定一个 N 叉树，返回其节点值的层序遍历。 (即从左到右，逐层遍历)。
 * 
 * 例如，给定一个 3叉树 :
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 返回其层序遍历:
 * 
 * [
 * ⁠    [1],
 * ⁠    [3,2,4],
 * ⁠    [5,6]
 * ]
 * 
 * 
 * 
 * 
 * 说明:
 * 
 * 
 * 树的深度不会超过 1000。
 * 树的节点总数不会超过 5000。
 * 
 */

// @lc code=start
/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var children: [Node]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.children = []
 *     }
 * }
 */

class Solution {
    func levelOrder(_ root: Node?) -> [[Int]] {
        /// 思路一： 递归
        // return func1(root)

        /// 思路二： 迭代
        return func2(root)
    }

    func func1(_ root: Node?) -> [[Int]] {
        guard let root = root else {
            return []
        }
        var res = [[Int]]()
        levelDepth(root, 0, &res)
        return res
    }

    func levelDepth(_ root: Node?, _ level: Int, _ res: inout [[Int]]) {
        if res.count <= level {
            res.append([])
        }
        res[level].append(root!.val)
        root?.children.map { levelDepth($0, level + 1, &res)}
    }

    func func2(_ root: Node?) -> [[Int]] {
        guard let root = root else { return [] }
        var res = [[Int]]()
        var queue = [Node]()
        queue.append(root)
        while !queue.isEmpty {
            var temps = [Int]()
            let currentLevelCount = queue.count
            for _ in 0..<currentLevelCount {
              let first = queue.removeFirst()
              temps.append(first.val)
              first.children.map { queue.append($0) }  
            }
            res.append(temps)
        }
        return res
    }
}
// @lc code=end

