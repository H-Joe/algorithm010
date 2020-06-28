/*
 * @lc app=leetcode.cn id=236 lang=swift
 *
 * [236] 二叉树的最近公共祖先
 *
 * https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-tree/description/
 *
 * algorithms
 * Medium (63.89%)
 * Likes:    616
 * Dislikes: 0
 * Total Accepted:    91.9K
 * Total Submissions: 143.3K
 * Testcase Example:  '[3,5,1,6,2,0,8,null,null,7,4]\n5\n1'
 *
 * 给定一个二叉树, 找到该树中两个指定节点的最近公共祖先。
 * 
 * 百度百科中最近公共祖先的定义为：“对于有根树 T 的两个结点 p、q，最近公共祖先表示为一个结点 x，满足 x 是 p、q 的祖先且 x
 * 的深度尽可能大（一个节点也可以是它自己的祖先）。”
 * 
 * 例如，给定如下二叉树:  root = [3,5,1,6,2,0,8,null,null,7,4]
 * 
 * 
 * 
 * 
 * 
 * 示例 1:
 * 
 * 输入: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
 * 输出: 3
 * 解释: 节点 5 和节点 1 的最近公共祖先是节点 3。
 * 
 * 
 * 示例 2:
 * 
 * 输入: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4
 * 输出: 5
 * 解释: 节点 5 和节点 4 的最近公共祖先是节点 5。因为根据定义最近公共祖先节点可以为节点本身。
 * 
 * 
 * 
 * 
 * 说明:
 * 
 * 
 * 所有节点的值都是唯一的。
 * p、q 为不同节点且均存在于给定的二叉树中。
 * 
 * 
 */

// @lc code=start
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        /// 思路一： 后序DFS O(n) and O(n)
        // return func1(root, p, q)

        /// 思路二： BFS O(n) and O(n)
        return func2(root, p, q)
    }

    func func1(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if root == nil || root === p || root === q { return root }
        let left = func1(root?.left, p, q)
        let right = func1(root?.right, p, q)
        if left == nil { return right }
        if right == nil { return left }
        return root
    }

    func func2(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if root == nil || root === p || root === q { return root }
        var p = p, q = q
        var queue = [TreeNode]()
        var parentDic = [UnsafeRawPointer: TreeNode]()
        var visited = Set<UnsafeRawPointer>()
        queue.append(root!)
        
        while !parentDic.keys.contains(unsafeBitCast(p, to: UnsafeRawPointer.self)) || !parentDic.keys.contains(unsafeBitCast(q, to: UnsafeRawPointer.self)) {
            let first = queue.removeFirst()
            if let left = first.left {
                queue.append(left)
                parentDic.updateValue(first, forKey: unsafeBitCast(left, to: UnsafeRawPointer.self))
            }
            if let right = first.right {
                queue.append(right)
                parentDic.updateValue(first, forKey: unsafeBitCast(right, to: UnsafeRawPointer.self))
            }
        }
        while p != nil {
            visited.update(with: unsafeBitCast(p, to: UnsafeRawPointer.self))
            p = parentDic[unsafeBitCast(p, to: UnsafeRawPointer.self)]
        }
        while !visited.contains(unsafeBitCast(q, to: UnsafeRawPointer.self)) {
            q = parentDic[unsafeBitCast(q, to: UnsafeRawPointer.self)]
        }

        return q
    }
}
// @lc code=end

