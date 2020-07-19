/*
 * @lc app=leetcode.cn id=76 lang=swift
 *
 * [76] 最小覆盖子串
 *
 * https://leetcode-cn.com/problems/minimum-window-substring/description/
 *
 * algorithms
 * Hard (37.82%)
 * Likes:    648
 * Dislikes: 0
 * Total Accepted:    63.7K
 * Total Submissions: 166.6K
 * Testcase Example:  '"ADOBECODEBANC"\n"ABC"'
 *
 * 给你一个字符串 S、一个字符串 T，请在字符串 S 里面找出：包含 T 所有字符的最小子串。
 * 
 * 示例：
 * 
 * 输入: S = "ADOBECODEBANC", T = "ABC"
 * 输出: "BANC"
 * 
 * 说明：
 * 
 * 
 * 如果 S 中不存这样的子串，则返回空字符串 ""。
 * 如果 S 中存在这样的子串，我们保证它是唯一的答案。
 * 
 * 
 */

// @lc code=start
class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        // 学习不同的写法 func3 最快 
        /// 思路一： 滑动窗口 O(n + m) O(n) -> n: s.count, m: t.count
        // return func1(s, t)
        /// 思路一： 滑动窗口 
        // return func2(s, t)
        /// 思路一： 滑动窗口 
        return func3(s, t)

    }
    func func1(_ s: String, _ t: String) -> String {
        guard s.count > 0, t.count > 0, s.count >= t.count else { return "" }
        var sa = Array(s)
        var start = 0, end = s.count + 1
        var l = 0, r = 0, tTypeCount = 0
        var needs = [Character: Int](), window = [Character: Int]()
        needs = t.reduce(into: needs) { $0[$1, default: 0] += 1 }
        while r < sa.count {
            let rc = sa[r]
            if needs[rc] != nil {
                window[rc, default: 0] += 1
                if window[rc] == needs[rc] { tTypeCount += 1 }
            }
            r += 1
            while tTypeCount == needs.count {
                if r - l < end - start { start = l; end = r }
                let lc = sa[l]
                // if needs[lc] != nil {
                //     if window[lc] == needs[lc] { tTypeCount -= 1 }
                //     window[lc]! -= 1
                // }
                if window[lc] != nil {
                    window[lc]! -= 1
                    if let need = needs[lc], need > window[lc]! { tTypeCount -= 1 }
                }
                l += 1
            }
        }
        return end - start <= s.count ? String(sa[start..<end]) : ""
    }

    func func2(_ s: String, _ t: String) -> String {
        guard s.count > 0, t.count > 0, s.count >= t.count else { return "" }
        var sa = Array(s)
        var start = 0, end = s.count + 1
        var l = 0, r = 0, tTypeCount = 0
        var needs = [Character: Int]()
        needs = t.reduce(into: needs) { $0[$1, default: 0] += 1 }
        tTypeCount = needs.keys.count 

        while r < sa.count {
            let rc = sa[r]
            if needs[rc] != nil { needs[rc]! -= 1 }
            if let need = needs[rc], need == 0 { tTypeCount -= 1 }
            r += 1
            while tTypeCount == 0{
                if r - l < end - start { start = l; end = r }
                let lc = sa[l]
                if needs[lc] != nil { needs[lc]! += 1 }
                if let need = needs[lc], need > 0 { tTypeCount += 1 }
                l += 1
            }
        }
        return end - start <= s.count ? String(sa[start..<end]) : ""
    }

    func func3(_ s: String, _ t: String) -> String {
        guard s.count > 0, t.count > 0, s.count >= t.count else { return "" }
        var sa = Array(s.utf8).map { Int($0) }, ta = Array(t.utf8).map { Int($0) }
        var start = 0, end = s.count + 1
        var l = 0, r = 0, tTypeCount = ta.count
        var needs = Array(repeating: 0, count: 128)
        ta.map { needs[$0] += 1 }

        while r < sa.count {
            let rc = sa[r]
            if needs[rc] > 0 { tTypeCount -= 1 }
            needs[rc] -= 1
            r += 1
            while tTypeCount == 0 {
                if r - l < end - start { start = l; end = r }
                let lc = sa[l]
                if needs[lc] == 0 { tTypeCount += 1 }
                needs[lc] += 1
                l += 1
            }
        }
        return end - start <= s.count ? String(s[s.index(s.startIndex, offsetBy: start)..<s.index(s.startIndex, offsetBy: end)]) : ""
    }
}
// @lc code=end

