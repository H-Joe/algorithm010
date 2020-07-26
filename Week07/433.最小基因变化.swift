/*
 * @lc app=leetcode.cn id=433 lang=swift
 *
 * [433] 最小基因变化
 *
 * https://leetcode-cn.com/problems/minimum-genetic-mutation/description/
 *
 * algorithms
 * Medium (50.62%)
 * Likes:    39
 * Dislikes: 0
 * Total Accepted:    5.4K
 * Total Submissions: 10.6K
 * Testcase Example:  '"AACCGGTT"\n"AACCGGTA"\n["AACCGGTA"]'
 *
 * 一条基因序列由一个带有8个字符的字符串表示，其中每个字符都属于 "A", "C", "G", "T"中的任意一个。
 * 
 * 假设我们要调查一个基因序列的变化。一次基因变化意味着这个基因序列中的一个字符发生了变化。
 * 
 * 例如，基因序列由"AACCGGTT" 变化至 "AACCGGTA" 即发生了一次基因变化。
 * 
 * 与此同时，每一次基因变化的结果，都需要是一个合法的基因串，即该结果属于一个基因库。
 * 
 * 现在给定3个参数 — start, end,
 * bank，分别代表起始基因序列，目标基因序列及基因库，请找出能够使起始基因序列变化为目标基因序列所需的最少变化次数。如果无法实现目标变化，请返回
 * -1。
 * 
 * 注意:
 * 
 * 
 * 起始基因序列默认是合法的，但是它并不一定会出现在基因库中。
 * 所有的目标基因序列必须是合法的。
 * 假定起始基因序列与目标基因序列是不一样的。
 * 
 * 
 * 示例 1:
 * 
 * 
 * start: "AACCGGTT"
 * end:   "AACCGGTA"
 * bank: ["AACCGGTA"]
 * 
 * 返回值: 1
 * 
 * 
 * 示例 2:
 * 
 * 
 * start: "AACCGGTT"
 * end:   "AAACGGTA"
 * bank: ["AACCGGTA", "AACCGCTA", "AAACGGTA"]
 * 
 * 返回值: 2
 * 
 * 
 * 示例 3:
 * 
 * 
 * start: "AAAAACCC"
 * end:   "AACCCCCC"
 * bank: ["AAAACCCC", "AAACCCCC", "AACCCCCC"]
 * 
 * 返回值: 3
 * 
 * 
 */

// @lc code=start
class Solution {
    func minMutation(_ start: String, _ end: String, _ bank: [String]) -> Int {
        /// 思路一： BFS
        // return func1(start, end, bank)

        /// 思路二：DFS
        // return func2(start, end, bank)

         /// 思路三：双向BFS
        return func3(start, end, bank)
    }

    func func1(_ start: String, _ end: String, _ bank: [String]) -> Int {
        guard !bank.isEmpty , bank.contains(end) else { return -1 }
        guard start != end else { return 0 }

        let dnaCells = ["A", "C", "G", "T"]
        var bank = bank

        var queue = [(String, Int)]()
        queue.append((start, 0))
        while !queue.isEmpty {
            let first = queue.removeFirst()
            if first.0 == end { return first.1 }
            for i in 0..<start.count {
                for cell in dnaCells {
                    let dna = String(first.0[..<start.index(start.startIndex, offsetBy: i)]) + cell + String(first.0[start.index(start.startIndex, offsetBy: i + 1)...])
                    if bank.contains(dna) {
                        queue.append((dna, first.1 + 1))
                        bank = bank.filter{ $0 != dna }
                    }
                }
            }
        }
        return -1
    }

    func func2(_ start: String, _ end: String, _ bank: [String]) -> Int {
        guard !bank.isEmpty, bank.contains(end) else { return -1 }
        var res: Int = 0, visited = Array(repeating: false, count: bank.count)

        func backTrack(_ start: String, _ end: String, _ bank: [String], _ count: Int, _ visited: inout [Bool]) {
            if start == end { 
                res = count
                return 
            }
            /// 不同的字符只有一个时，才能下探到下一层
            func match(_ str1: String, _ str2: String) -> Bool {
                if str1.count != str2.count { return false }
                var count = 0
                for (i, v) in str1.enumerated() {
                    if v != str2[str2.index(str2.startIndex, offsetBy: i)] { count += 1 }
                    if count > 1 { return false }
                }
                return count == 1
            }
            for i in 0..<bank.count where !visited[i] && match(bank[i], start) {
                visited[i] = true
                backTrack(bank[i], end, bank, count + 1, &visited)
                visited[i] = false
            }
        }
        backTrack(start, end, bank, 0, &visited)
        return res > 0 ? res : -1
    }

    func func3(_ start: String, _ end: String, _ bank: [String]) -> Int {
        guard start.count > 0, end.count > 0, bank.contains(end) else { return -1 }
        var bankSet = Set(bank)
        var beginSet = Set<String>(), endSet = Set<String>()
        var step = 0
        beginSet.update(with: start)
        endSet.update(with: end)
        while !beginSet.isEmpty, !endSet.isEmpty {
            if beginSet.count > endSet.count { (beginSet, endSet) = (endSet, beginSet) }
            var nextSet = Set<String>()
            for word in beginSet {
                var fa = Array(word)
                for i in 0..<fa.count {
                    let prec = fa[i]
                    for ce in "ACGT" where fa[i] != ce {
                        fa[i] = ce
                        let newWord = String(fa)
                        if endSet.contains(newWord) { return step + 1 }
                        if bankSet.contains(newWord) {
                            nextSet.update(with: newWord)
                            bankSet.remove(newWord)
                        }
                    }
                    fa[i] = prec
                }
            }
            beginSet = nextSet
            step += 1
        }
        return -1
    }
}
// @lc code=end

