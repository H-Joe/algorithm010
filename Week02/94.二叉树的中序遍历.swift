/*
 * @lc app=leetcode.cn id=94 lang=swift
 *
 * [94] 二叉树的中序遍历
 *
 * https://leetcode-cn.com/problems/binary-tree-inorder-traversal/description/
 *
 * algorithms
 * Medium (71.69%)
 * Likes:    531
 * Dislikes: 0
 * Total Accepted:    172.3K
 * Total Submissions: 240.2K
 * Testcase Example:  '[1,null,2,3]'
 *
 * 给定一个二叉树，返回它的中序 遍历。
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
 * 输出: [1,3,2]
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
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        /// 思路一： 递归
        // return func1(root)

        /// 思路二： 迭代，手动维护栈
        return func2(root)
    }
    
    func func1(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        return func1(root.left) + [root.val] + func1(root.right)
    }

    func func2(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
             return []
        }
        var stack = [TreeNode]()
        var res = [Int]()
        var current = root

        ///先把root节点入栈
        stack.append(root)
        while !stack.isEmpty {
            /// 循环把left节点入栈
            while let left = current.left {
                stack.append(left)
                current = left
            }
            
            /// left节点全部入栈后，开始计算赋值
            let last = stack.popLast()
            res.append(last!.val)

            /// 如果正在计算的节点有right节点，则把这个right节点作为当前节点，入栈计算
            /// 总之，就是先把所有的left节点计算完
            if let right = last?.right  {
                current = right
                stack.append(current)
            }
        }
        return res
    }
}
// @lc code=end

