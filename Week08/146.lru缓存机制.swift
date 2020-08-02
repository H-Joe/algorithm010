/*
 * @lc app=leetcode.cn id=146 lang=swift
 *
 * [146] LRU缓存机制
 *
 * https://leetcode-cn.com/problems/lru-cache/description/
 *
 * algorithms
 * Medium (49.42%)
 * Likes:    785
 * Dislikes: 0
 * Total Accepted:    85.9K
 * Total Submissions: 171.5K
 * Testcase Example:  '["LRUCache","put","put","get","put","get","put","get","get","get"]\n[[2],[1,1],[2,2],[1],[3,3],[2],[4,4],[1],[3],[4]]'
 *
 * 运用你所掌握的数据结构，设计和实现一个  LRU (最近最少使用) 缓存机制。它应该支持以下操作： 获取数据 get 和 写入数据 put 。
 * 
 * 获取数据 get(key) - 如果关键字 (key) 存在于缓存中，则获取关键字的值（总是正数），否则返回 -1。
 * 写入数据 put(key, value) -
 * 如果关键字已经存在，则变更其数据值；如果关键字不存在，则插入该组「关键字/值」。当缓存容量达到上限时，它应该在写入新数据之前删除最久未使用的数据值，从而为新的数据值留出空间。
 * 
 * 
 * 
 * 进阶:
 * 
 * 你是否可以在 O(1) 时间复杂度内完成这两种操作？
 * 
 * 
 * 
 * 示例:
 * 
 * LRUCache cache = new LRUCache( 2 /* 缓存容量 */ );
 * 
 * cache.put(1, 1);
 * cache.put(2, 2);
 * cache.get(1);       // 返回  1
 * cache.put(3, 3);    // 该操作会使得关键字 2 作废
 * cache.get(2);       // 返回 -1 (未找到)
 * cache.put(4, 4);    // 该操作会使得关键字 1 作废
 * cache.get(1);       // 返回 -1 (未找到)
 * cache.get(3);       // 返回  3
 * cache.get(4);       // 返回  4
 * 
 * 
 */

// @lc code=start

class Node {
    var key: Int
    var val: Int
    var prev: Node?
    var next: Node?
    init(_ key: Int = 0, _ val: Int = 0, _ prev: Node? = nil, _ next: Node? = nil){
        self.key = key
        self.val = val
        self.prev = prev
        self.next = next
    }
}

class DLinked {
    private var head: Node
    private var tail: Node
    var size = 0
    init() {
        head = Node()
        tail = Node()
        head.next = tail
        tail.prev = head
    }

    func insertFirst(_ node: Node) {
        let cur = head.next
        head.next = node
        node.prev = head
        node.next = cur
        cur?.prev = node
        size += 1
    }
    func remove(_ node: Node) {
        node.next?.prev = node.prev
        node.prev?.next = node.next
        size -= 1
    }
    func remodeLast() -> Node? {
        guard let node = tail.prev, size > 0 else { return nil }
        remove(node)
        return node
    }
}
class LRUCache {

    var capacity: Int
    var container = [Int: Node]()
    var dLinked = DLinked()

    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        if let node = container[key] {
            dLinked.remove(node)
            dLinked.insertFirst(node)
            return node.val
        }
        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = container[key] {
            dLinked.remove(node)
        }
        let newNode = Node(key, value)
        dLinked.insertFirst(newNode)
        container[key] = newNode
        if dLinked.size > capacity, let node = dLinked.remodeLast() {
            container.removeValue(forKey: node.key)
        }
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */
// @lc code=end

