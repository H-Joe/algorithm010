学习笔记
## 3、哈希表（Hash Table）
- 哈希表定义
    
    * 是根据关键码值（Key Value）而直接进行访问的数据结构
    * 它通过把关键码值映射到表中一个位置来访问记录，以加快查找的速度
    * 这个映射函数称为散列函数（Hash Function），存放记录的数组称为哈希表，也叫散列表

- 哈希函数(Hash Functiong)
    
    * 散列函数计算得到的散列值是一个非负整数；(因为散列值要作为数组下标)
    
- 哈希冲突(Hash Collisions)
    
    * 含义：通过哈希函数计算出来的值是相同的导致哈希冲突
    * 解决方案
        * 链表法(Chaining) - 拉链式
            * 升维思想
            * 所有散列值相同的元素，放在此下标对应的链表中
            * 优点：存取简单
            * 缺点：遍历链表，做查询或删除的时间复杂度为O(k)，k为链表的长度

- 哈希表之Map
    * key-value 对， key不重复
    * 抽象接口，包含具体接口实现，例：HashMap、Hashtable、LinkedHashMap等

- 哈希表之Set
    * 单元素，不重复元素的集合
    * 抽象接口，包含好多具体接口实现，例：HashSet、EnumSet、ConcurrentSkipListSet等

## 4、树（Tree）

- 基本定义
    * 每个元素称为节点
    * 有根节点，左节点，右节点，兄弟节点
    * 左子树，右子树
    * 层
- 特殊关系
    * **链表（Linked List）是特殊化的树（Tree）**
    * **树（Tree）是特殊化的图（Graph）**

- 二叉树（Binary Tree）
    
    * 定义：子节点只有两个节点：左节点和右节点的树
    * 种类：
        * 满二叉树
            * 除最后一层无任何子节点外，每一层上的所有结点都有两个子结点
        * 完全二叉树
            * 除了最后一层外，其他层的节点个数都是满的
            * 最后一层的叶子节点都靠左排列
            * **满二叉树一定是完全二叉树**
    * 遍历
        * 前序（Pre-order）：根 - 左 - 右
            
            * 示例代码
            
            * ```swift
                func preOrder(_ root: TreeNode?) {
                    if root != nil {
                        print(root.val)
                        preorder(root.left)
                        preorder(root.right)
                    }
                }
                ```
                
        * 中序（In-order）：左 - 根 - 右
            
            * 示例代码
            
            * ```swift
                func inOrder(_ root: TreeNode?) {
                    if root != nil {
                        preorder(root.left)
                        print(root.val)
                        preorder(root.right)
                    }
                }
                ```    
                
        * 后序（Post-order）：左 - 右 - 根
           
            * 示例代码
            
            * ```swift
                func postOrder(_ root: TreeNode?) {
                    if root != nil {
                        preorder(root.left)
                        preorder(root.right)
                        print(root.val)
                    }
                }
                ```
          
        * 层序
            * 借助队列辅助
            * 根节点入队，然后从队列取出一个节点处理，将该节点的左右子节点依次入队，然后处理下一个节点，直到队列为空。  

- 二叉搜索树（Binary Search Tree）
    
    * 定义：一颗空树，具有下列性质的二叉树
        * 左子树上的**所有节点**的值均**小于**它的**根节点**的值
        * 右子树上的**所有节点**的值均**大于**它的**根节点**的值
        * 以此类推：左、右子树也分别是二叉查询树
    * 是**有序树**，所以中序遍历是一个升序排列
    * 常见操作： 时间复杂度都是O(logn)
        * 查询
        * 插入新节点（创建）
        * 删除

## 5、堆（Heap）

- 定义：
    * 可以迅速找到一堆数中的最大值或最小值的数据结构
- 分类
    * 大顶堆（大根堆）：根节点的值是最大的
    * 小顶堆（小根堆）：根节点的值是最小的
    * 常见的堆：二叉堆、斐波那契堆等
- 常见操作（API）- 以大顶堆为例
    * find-max： 时间复杂度 O(1)
    * delete-max：时间复杂度 O(logn)
    * insert(create)：时间复杂度 O(logn) or O(1)

- 二叉堆（Binary Heap）
    
    > 二叉堆是堆的一种常见且简单的实现，但并不是最优的实现
    
    * 实现方式：通过完全二叉树实现，不是二叉搜索树
    * 性质：以大顶堆为例
        * 1、是一颗完全树
        * 2、树中任意节点的值总是 >= 其子节点的值
    * 实现细节
        * 1、一般通过“数组”实现，那么堆顶元素（根节点）是数组第一个元素: a[0]
        * 2、假设“第一个元素”在数组中的索引为0的话，那父节点和子节点的关系如下：
            * 索引为 i 的左节点的索引为：2*i+1
            * 索引为 i 的右节点的索引为：2*i+2
            * 索引为 i 的父节点的索引为：floor((i-1)/2)
    * 常见操作（API）
        * insert
            * 1、新元素一律插入到堆的尾部
            * 2、依次向上调整整个堆的结构，一直到根节点
            * 函数称为：HeapifyUp
            * 
                ```java
                /**
                 * Inserts new element in to heap
                 * Complexity: O(log N)
                 * As worst case scenario, we need to traverse till the root
                 */
                public void insert(int x) {
                    if (isFull()) {
                        throw new NoSuchElementException("Heap is full, No space to insert new element");
                    }
                    heap[heapSize] = x;
                    heapSize ++;
                    heapifyUp(heapSize - 1);
                }
                
                /**
                  Maintains the heap property while inserting an element.
                 */
                private void heapifyUp(int i) {
                    int insertValue = heap[i];
                    while (i > 0 && insertValue > heap[parent(i)]) {
                        heap[i] = heap[parent(i)];
                        i = parent(i);
                    }
                    heap[i] = insertValue;
                }
                ```
        
        * delete Max
            * 1、将堆尾元素替换到顶部（堆顶被替代删除掉）
            * 2、依次从根部向下调整整个堆的结构，一直到堆尾即可
            * 函数称为：HeapifyDown
            * 
              
              ```java
                /**
                 * Deletes element at index x
                 * Complexity: O(log N)
                 */
                public int delete(int x) {
                    if (isEmpty()) {
                        throw new NoSuchElementException("Heap is empty, No element to delete");
                    }
                    int maxElement = heap[x];
                    heap[x] = heap[heapSize - 1];
                    heapSize--;
                    heapifyDown(x);
                    return maxElement;
                }
                /**
                 * Maintains the heap property while deleting an element.
                 */
                private void heapifyDown(int i) {
                    int child;
                    int temp = heap[i];
                    while (kthChild(i, 1) < heapSize) {
                        child = maxChild(i);
                        if (temp >= heap[child]) {
                            break;
                        }
                        heap[i] = heap[child];
                        i = child;
                    }
                    heap[i] = temp;
                }
                ```
              
## 6、图（Graph） 

- 定义：Graph(V, E) ，由一些顶点和边对象组成的数据结构
- 属性：
    * V - vertex：点 
        * 1、度：入度和出度
        * 2、点与点之间连通与否
    * E - edge： 边
        * 1、有向和无向（单行线）
        * 2、权重（边长）
- 分类
    * 无向无权图
    * 无向有权图
    * 有向无权图
    * 有向有权图
- 表示：
     * 邻接矩阵（Adjacency matrix）
     * 邻接表（Adjacency list）
     * 时间复杂度

- 基于图的常见算法
    * DFS：深度优先搜索
        * 递归代码模版
        * 
            ```C++
            visited = set() #和树中的dfs最大的区别
            def dfs(node, visited):
                if node in visited
                    # already visited
                    return
                visited add(node)
                
                # process current node here 
                process(node)
                ...
                
                for next_node in node.childred():
                    if not next_node in visited:
                        dfs(next_node, visited)
            ```
        
    * BFS：广度优先搜索
        * 递归代码模版
        * 
            ```C++
            def bfs(graph, start, end):
                queue = []
                queue.append([start])
                
                visited = set() # 和树中的bfs最大的区别
                
                while queue:
                    node = queue.pop()
                    visited.add(node)
                    
                    # process current node here
                    process(node)
                    
                    nodes = generate_related_nodes(node)
                    queue.push(nodes)
                
            ```