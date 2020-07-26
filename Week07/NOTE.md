## 19、字典树（Trie）
- 数据结构
    * 是一种树形结构，即Trie树，又称单词查找树或键树
    * 典型应用于统计和排序大量的字符串（但又不限于字符串），经常被搜索引擎系统用于文本词频统计
    * 优点：最大限度的减少无谓的字符串比较，查询效率比哈希表高

- 核心思想
    * 核心思想是用空间换时间
    * 利用字符串的公共前缀来降低查询时间的开销以达到提高效率的目的
- 基本性质
    * 1、结点本身不存完整单词
    * 2、从根结点到某一结点，路径上经过的字符连接起来，为该结点对应的字符串
    * 3、每个结点的所有子结点路径代表的字符都不相同

- 与其他数据结构对比
    * 哈希表可以在 O(1) 时间内寻找键值，却无法高效的完成 1、找到具有同一前缀的全部键值 2、按词典序枚举字符串的数据集
    * 随着哈希表大小增加，会出现大量的冲突，时间复杂度可能增加到 O(n)，其中 n 是插入的键的数量
    * Trie 树在存储多个具有相同前缀的键时可以使用较少的空间。此时 Trie 树只需要 O(m) 的时间复杂度，其中 m 为键长
    * 平衡树中查找键值需要 O(mlogn) 时间复杂度
- 代码模版
    * Python实现
    
    ```python
    class Trie(object):
      
        	def __init__(self): 
        		self.root = {} 
        		self.end_of_word = "#" 
         
        	def insert(self, word): 
        		node = self.root 
        		for char in word: 
        			node = node.setdefault(char, {}) 
        		node[self.end_of_word] = self.end_of_word 
         
        	def search(self, word): 
        		node = self.root 
        		for char in word: 
        			if char not in node: 
        				return False 
        			node = node[char] 
        		return self.end_of_word in node 
         
        	def startsWith(self, prefix): 
        		node = self.root 
        		for char in prefix: 
        			if char not in node: 
        				return False 
        			node = node[char] 
        		return True
    ```
    
    * C++ 实现
    
    ```cpp
    class Trie {
        struct TrieNode {
            map<char, TrieNode*>child_table;
            int end;
            TrieNode(): end(0) {}
        };
            
        public:
        /** Initialize your data structure here. */
        Trie() {
            root = new TrieNode();
        }
        
        /** Inserts a word into the trie. */
        void insert(string word) {
            TrieNode *curr = root;
            for (int i = 0; i < word.size(); i++) {
                if (curr->child_table.count(word[i]) == 0)
                    curr->child_table[word[i]] = new TrieNode();
                    
                curr = curr->child_table[word[i]];                
            }
            curr->end = 1;
        }
        
        /** Returns if the word is in the trie. */
        bool search(string word) {
            return find(word, 1);
        }
        
        /** Returns if there is any word in the trie that starts with the given prefix. */
        bool startsWith(string prefix) {
            return find(prefix, 0);
        }
        private:
        TrieNode* root;
        bool find(string s, int exact_match) {
            TrieNode *curr = root;
            for (int i = 0; i < s.size(); i++) {
                if (curr->child_table.count(s[i]) == 0)
                    return false;
                else
                    curr = curr->child_table[s[i]];
            }
            
            if (exact_match)
                return (curr->end) ? true : false;
            else
                return true;
        }
    }
    ```
    
    * Java 实现
    
    ```java
    class Trie {
        private boolean isEnd;
        private Trie[] next;
        /** Initialize your data structure here. */
        public Trie() {
            isEnd = false;
            next = new Trie[26];
        }
        
        /** Inserts a word into the trie. */
        public void insert(String word) {
            if (word == null || word.length() == 0) return;
            Trie curr = this;
            char[] words = word.toCharArray();
            for (int i = 0;i < words.length;i++) {
                int n = words[i] - 'a';
                if (curr.next[n] == null) curr.next[n] = new Trie();
                curr = curr.next[n];
            }
            curr.isEnd = true;
        }
        
        /** Returns if the word is in the trie. */
        public boolean search(String word) {
            Trie node = searchPrefix(word);
            return node != null && node.isEnd;
        }
        
        /** Returns if there is any word in the trie that starts with the given prefix. */
        public boolean startsWith(String prefix) {
            Trie node = searchPrefix(prefix);
            return node != null;
        }
    
        private Trie searchPrefix(String word) {
            Trie node = this;
            char[] words = word.toCharArray();
            for (int i = 0;i < words.length;i++) {
                node = node.next[words[i] - 'a'];
                if (node == null) return null;
            }
            return node;
        }
    }
    ```

## 20、并查集 （Disjoint Set）
- 适用场景
    * 组团、配对问题

- 基本操作
    * makeSet(s): 建立一个新的并查集，其中包含s个单元素集合
    * unionSet(x, y): 把元素x和元素y所在的集合合并，要求x和y所在的集合不相交， 如果相交则不合并
    * find(x): 找到元素x所在的集合的代表，该操作也可以用于判断两个元素是否位于同一个集合，只要将他们各自的代表比较一下即可

- 原理
    * 1、初始化：每个元素初始化一个parent数组指向自己
    * 2、合并：找到各自集合的领头元素（parent==自己），然后将其中一个的集合的parent指向另一个集合的领头元素
    * 3、查询：找到集合的领头元素（parent==自己）
    
- 代码实现
    * Swift 实现

    ```swift
    class UnionFind {
        var count = 0
        var p: [Int]
        var size: [Int]
        init(_ count: Int){
            self.count = count
            p = [Int](repeating: 0, count: count)
            size = [Int](repeating: 1, count: count)
            for i in 0..<count { p[i] = i }
        }
    
        func find(_ i: Int) -> Int {
            var i = i 
            while i != p[i] {
                p[i] = p[p[i]]
                i = p[i]
            }
            return i
        }
        /// O(1)
        func find1(_ i: Int) -> Int {// 路径压缩
            var root = i ,i = i
            while p[root] != root { root = p[root] }
            while p[i] != i {
                let x = i
                i = p[i]
                p[x] = root
            }
            return root
        }
        /// O(n) or O(logn)
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
    ```
    * Java 实现
    
    ```java
    class UnionFind { 
    	private int count = 0; 
    	private int[] parent; 
    	public UnionFind(int n) { 
    		count = n; 
    		parent = new int[n]; 
    		for (int i = 0; i < n; i++) { 
    			parent[i] = i;
    		}
    	} 
    	public int find(int p) { 
    		while (p != parent[p]) { 
    			parent[p] = parent[parent[p]]; 
    			p = parent[p]; 
    		}
    		return p; 
    	}
    	public void union(int p, int q) { 
    		int rootP = find(p); 
    		int rootQ = find(q); 
    		if (rootP == rootQ) return; 
    		parent[rootP] = rootQ; 
    		count--;
    	}
    }
    ```
    
    * Python 实现

    ```python
    def init(p): 
    	# for i = 0 .. n: p[i] = i; 
    	p = [i for i in range(n)] 
     
    def union(self, p, i, j): 
    	p1 = self.parent(p, i) 
    	p2 = self.parent(p, j) 
    	p[p1] = p2 
     
    def parent(self, p, i): 
    	root = i 
    	while p[root] != root: 
    		root = p[root] 
    	while p[i] != i: # 路径压缩 ?
    		x = i; i = p[i]; p[x] = root 
    	return root
    ```
    

## 21、高级搜索（High-Level Search）
- **剪枝**
    * 优化掉重复的，或次优的分支
- **双向BFS（Two-Ended BFS）**
    * 特性
        * 左右相向扩散 
        * 循环条件是两个queue同时判断（两个set）
        * 每次从小的set扩散
    * 代码模版
        * Swift 实现
        
        ```swift
        var beginSet = Set<String>()
        var endSet = Set<String>()
        var visited = Set<String>()
        
        beginSet.update(with: begin)
        endSet.update(with: end)

        while !beginSet.isEmpty, !endSet.isEmpty {
            if beginSet.count > endSet.count  { 
                (beginSet, endSet) = (endSet, beginSet)
                //swap(&beginSet, &endSet)
            }
            
            var nextSet = Set<String>()
            
            process(beginSet, nextSet, visited)
            
            beginSet = nextSet
        }
        ```

- **启发式搜索（A*）（Heuristic Search）**
    * 估价函数(启发式函数) -> h(n)
        * 用来评价哪些结点是我们最有希望寻找的结点
        * 会返回一个非负实数
        * 也可以认为是从 结点n 到 目标结点 路径的估计成本
    * 特性
        * 是一种告知搜索方向的方法
        * 提供了一种明智的方法来猜测那个邻居结点会导向一个目标
    * 代码模版
        * Python 实现
        
        ```python
        def AstarSearch(graph, start, end):
        	pq = collections.priority_queue() # 优先级 —> 估价函数
        	pq.append([start]) 
        	visited.add(start)
        	while pq: 
        		node = pq.pop() # can we add more intelligence here ?
        		visited.add(node)
        		process(node) 
        		nodes = generate_related_nodes(node) 
           unvisited = [node for node in nodes if node not in visited]
        		pq.push(unvisited)
        ```
    
## 22、平衡二叉树 （Self-balancing Binary Search Tree）
- 前置场景
    * 1、保证二维维度 -> 左右子树结点平衡（recursively）
    * 2、balance
- 具体实现
    * 2-3 Tree
    * AVL Tree 
    * B- Tree （B树）
    * Red-black Tree （红黑树）
    * Splay Tree （伸展树）
    * Treap （树堆）

- **平衡二叉搜索树 之 AVL树**
    * 1、发明者 G.M.Adelson-Velsky 和 Evgenii Landis
    * 2、balance Factor （平衡因子）
        * 每个结点的平衡因子都是 {-1, 0, 1} 
        * 左子树的高度 减去 右子树的高度（有时相反）
        * 由来：查询的时间复杂度是树的深度

    * 3、通过旋转操作进行平衡
        * 1)、基础旋转
            * 左旋： 子树形态 -> 右右子树
    
            * 右旋： 子树形态 -> 左左子树
    
            * 左右旋：子树形态 -> 左右子树
    
            * 右左旋：子树形态 -> 右左子树

        * 2)、带有子树的旋转

    * 4、不足
        * 结点需要存储额外信息
        * 调整次数频繁

- **近似平衡二叉搜索树 之 红黑树**
    * 1、是一种近似平衡二叉搜索树
    * 2、它能确保任何一个结点的左右子树的**高度差小于两倍**
    * 3、特性 -> 满足如下特性的二叉搜索树
        * 1）、每个结点要么是红色，要么是黑色
        * 2）、根结点是黑色
        * 3）、每个叶结点（NIL结点，空结点）是黑色
        * 4）、不能有相邻接的两个红色结点
        * 5）、从任一结点到其每个叶子所有路径都包含相同数目的黑色结点
    * 4、时间复杂度： logn
    * 5、关键性质：**从根到叶子的最长的可能路径不多于最短的可能路径的两倍长**

- **AVL树和红黑树对比**
    * AVL trees provide **faster lookups** than Red Black Trees because they are **more strictly balanced**.(AVL 比 红黑树 查询快， 因为AVL是更加严格平衡的)
    * Red Black Trees provide **faster insertion and removal** operations than AVL trees as fewer rotations are done due to relatively relaxed balancing.(红黑树 比 AVL 插入和删除快， 因为红黑树旋转操作少一点，AVL旋转操作多一点)
    * AVL trees store balance **factors or heights** with each node, thus requires storage for an integer per node whereas Red Black Trees requires only 1 bit of information per node.（AVL 需要额外的内存存储factor和height， 红黑树只需要1个bit存储0或者1来表示红或者黑）
    * Red Black Trees are used in most of the **language libraries like map, multimap, multisetin C++** whereas AVL trees are used in **databases** where faster retrievals are required. （红黑树一般用在高级语言的库里面，AVL一般用在DB多,因为查询多）

