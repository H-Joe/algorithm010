/*
 * @lc app=leetcode.cn id=144 lang=swift
 *
 * [144] 二叉树的前序遍历
 *
 * https://leetcode-cn.com/problems/binary-tree-preorder-traversal/description/
 *
 * algorithms
 * Medium (65.77%)
 * Likes:    280
 * Dislikes: 0
 * Total Accepted:    115.9K
 * Total Submissions: 176.1K
 * Testcase Example:  '[1,null,2,3]'
 *
 * 给定一个二叉树，返回它的 前序 遍历。
 * 
 * 示例:
 * 
 * 输入: [1,null,2,3]  
 * ⁠  1
 * ⁠   \
 * ⁠    2
 * ⁠   /
 * ⁠  3 
 * 
 * 输出: [1,2,3]
 * 
 * 
 * 进阶: 递归算法很简单，你可以通过迭代算法完成吗？
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
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        /// 思路一： 递归
        return func1(root)

        /// 思路二： 迭代，手动维护一个栈
        // return func2(root)
    }

    func func1(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        return [root.val] + func1(root.left) + func1(root.right)
    }

    func func2(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
             return []
        }
        var stack = [TreeNode]()
        var res = [Int]()
        stack.append(root)
        while let node = stack.popLast() {
            res.append(node.val)
            if let right = node.right {
                stack.append(right)
            }
            if let left = node.left {
                stack.append(left)
            }
        }
        return res
    }
}
// @lc code=end

