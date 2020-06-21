/*
 * @lc app=leetcode.cn id=589 lang=swift
 *
 * [589] N叉树的前序遍历
 *
 * https://leetcode-cn.com/problems/n-ary-tree-preorder-traversal/description/
 *
 * algorithms
 * Easy (73.35%)
 * Likes:    81
 * Dislikes: 0
 * Total Accepted:    29.4K
 * Total Submissions: 40.2K
 * Testcase Example:  '[1,null,3,2,4,null,5,6]'
 *
 * 给定一个 N 叉树，返回其节点值的前序遍历。
 * 
 * 例如，给定一个 3叉树 :
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 返回其前序遍历: [1,3,5,6,2,4]。
 * 
 * 
 * 
 * 说明: 递归法很简单，你可以使用迭代法完成此题吗?
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
    func preorder(_ root: Node?) -> [Int] {
    	/// 思路一：递归
        return func1(root)

        /// 思路二： 迭代
        return func2(root)
    }

    func func1(_ root: Node?) -> [Int] {
        guard let root = root else {
            return []
        }
        var res = [Int]()
        res.append(root.val)
        root.children.forEach { child in 
            res += func1(child)
        }
        return res
    }

    func func2(_ root: Node?) -> [Int] {
        guard let root = root else {
            return []
        }
        var res = [Int]()
        var stack = [Node]()
        stack.append(root)
        while let node = stack.popLast() {
            res.append(node.val)
            node.children.reversed().map { stack.append($0) }
        }
        return res
    }
}
// @lc code=end

