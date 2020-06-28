/*
 * @lc app=leetcode.cn id=105 lang=swift
 *
 * [105] 从前序与中序遍历序列构造二叉树
 *
 * https://leetcode-cn.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/description/
 *
 * algorithms
 * Medium (67.13%)
 * Likes:    541
 * Dislikes: 0
 * Total Accepted:    89K
 * Total Submissions: 132.2K
 * Testcase Example:  '[3,9,20,15,7]\n[9,3,15,20,7]'
 *
 * 根据一棵树的前序遍历与中序遍历构造二叉树。
 * 
 * 注意:
 * 你可以假设树中没有重复的元素。
 * 
 * 例如，给出
 * 
 * 前序遍历 preorder = [3,9,20,15,7]
 * 中序遍历 inorder = [9,3,15,20,7]
 * 
 * 返回如下的二叉树：
 * 
 * ⁠   3
 * ⁠  / \
 * ⁠ 9  20
 * ⁠   /  \
 * ⁠  15   7
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
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        /// 思路一： 递归 O(n) and O(n)
        // return func1(preorder, inorder)

        /// 思路二： 迭代  题解来自于以下
        //https://leetcode-cn.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/solution/xiang-xi-tong-su-de-si-lu-fen-xi-duo-jie-fa-by--22/
        return func2(preorder, inorder)
    }

    func func1(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        // var hashDic = [Int: Int]()
        // for (index, value) in inorder.enumerated(){
        //     hashDic[value] = index
        // }
        var hashDic = Dictionary(uniqueKeysWithValues: zip(inorder, 0...))
        func _buildTree(_ preorder: [Int], _ inorder: [Int], _ pStart: Int, _ pEnd: Int, _ iStart: Int, _ iEnd: Int) -> TreeNode? {
            if pStart == pEnd { return nil }
            let rootVal = preorder[pStart]
            let root = TreeNode(rootVal)
            let rootIndexInInorder = hashDic[rootVal]!
            let leftSize = rootIndexInInorder - iStart
            root.left = _buildTree(preorder, inorder, pStart + 1, pStart + 1 + leftSize, iStart, rootIndexInInorder)
            root.right = _buildTree(preorder, inorder, pStart + 1 + leftSize, pEnd, rootIndexInInorder + 1, iEnd)
            return root
        }

        return _buildTree(preorder, inorder, 0, preorder.count, 0, inorder.count)
    }

    func func2(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        guard !preorder.isEmpty, !inorder.isEmpty else { return nil }
        var stack = [TreeNode]()
        var pre = 0, ino = 0
        var root = TreeNode(preorder[pre])
        var curRoot = root
        stack.append(curRoot)
        pre += 1
        while pre < preorder.count {
            let node = TreeNode(preorder[pre])
            if curRoot.val != inorder[ino] {
                curRoot.left = node
            }else {
                while !stack.isEmpty , stack.last!.val == inorder[ino] {
                    let last = stack.popLast()
                    curRoot = last!
                    ino += 1
                }
                curRoot.right = node
            }
            curRoot = node
            stack.append(curRoot)
            pre += 1
        }

        return root
    }
}
// @lc code=end

