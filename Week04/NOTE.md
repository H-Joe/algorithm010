学习笔记
## 15、搜索（Search）

- 搜索（遍历）：
    * 每个节点都要访问
    * 每个节点只访问一次
    * 对节点的访问顺序不限
        * 深度优先（DFS）：depth first search
        * 广度优先（BFS）：breadth first search
        * 优先级优先：启发式搜索

- 深度优先搜索（DFS）
    * 代码模版
        * 递归写法
            *  ```swift
                var visited = Set()
                func DFS(node, visited) {
                    /// 1、terminator
                    if visited.contains(node) {
                        /// already visited
                        return 
                    }
                    visited.add(node)
                    
                    /// 2、process current node here
                    
                    /// 3、drill down
                    /// N叉树
                    for nextNode in node.children() {
                        if !visited.contains(nextNode) {
                            DFS(nextNode, visited)
                        }
                    }
                    
                    ///二叉树
                    DFS(node.left, visited)
                    DFS(node.right, visited)
                }
               
                 ```
            
        * 非递归写法
            *   ```swift
                func DFS(tree) {
                    if !tree.root {
                        return []
                    }
                    
                    var stack = [TreeNode]()
                    stack.append(tree.root)
                    var visited = []()
                    
                    while !stack.isEmpty {
                        let node = stack.popLast()
                        visited.append(node)
                        
                        process(node)
                        
                        let nodes = generate_related_nodes(node)
                        stack.append(nodes)
                    }
                    
                    /// other process work
                }
                
                  ```

- 广度优先搜索（BFS）
    * 代码模版
        * ```swift
            func BFS(graph, start, end) {
                var visited = Set()
                var queue = []()
                queue.append(start)
                
                while !queue.isEmpty {
                    let node = queue.removeFirst()
                    visited.append(node)
                    
                    process(node)
                    
                    var nodes = generate_related_nodes(node)
                    queue.append(nodes)
                }
                
                /// other process work
            
            }
            ```
            
## 16、贪心算法（Greedy）

- 定义：
    * 贪心算法是一种在每一步选择中都采取当前状态下最好或最优（即最有利）的选择， 从而希望导致结果是全局最好或最优的算法
    
    > 贪心算法和动态规划的不同之处：
    > 1、贪心算法对每个字问题的解决方案都作出选择，不能回退 --> **当下最做局部最优判断**
    > 2、动态规划会保存以前的计算结果，并根据以前的结果对当前进行选择，有回退功能 --> **最优判断 + 回退**
    
- 是用场景：
    * 最优子结构
        * 问题分解成子问题来解决，子问题的最优解能够递推到最终问题的最优解

## 17、二分查找 （Binary Search）

- 二分查找前提：
    * 1、**目标函数单调性（单调递增或单调递减）**
    * 2、存在上下界（bounded）
    * 3、能够通过索引访问（index accessible）

- 代码模版
    
     ```swift
        var left = 0, right = array.count - 1, mid = 
        while left <= right {
            mid = (left + right) / 2
            if array[mid] ==  target {
                /// find the target 
                return result
            }else if array[mid] > target {
                right = mid - 1
            }else {
                left = mid + 1
            }
        }
     ```
