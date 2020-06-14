/*
 * @lc app=leetcode.cn id=1 lang=swift
 *
 * [1] 两数之和
 */

// @lc code=start
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        /// 思路一： 暴力，O(n^2) and O(1)
        // return func1(nums, target)

        ///思路二：用哈希表存一次 O(n) and O(n)
        // return func2(nums, target)
        /// 有意思的写法
        return func22(nums, target)

        /// 思路三：左右夹逼 O(n) and O(n)
        /// 注意：由于排序用新数组接收的，最后找坐标位置需要返回原数组的坐标位置
        // return func3(nums, target)
    }
    func func1(_ nums: [Int], _ target: Int) -> [Int] {
        guard nums.count > 1 else {
            return []
        }
        for i in 0..<nums.count - 1 {
            for j in i + 1..<nums.count {
                if nums[i] + nums[j] == target {
                    return [i, j]
                }
            }
        }
        return []
    }

    func func2(_ nums: [Int], _ target: Int) -> [Int] {
        guard nums.count > 1 else { return [] }
        var container = Set<Int>()
        for (index, value) in nums.enumerated() {
            let needValue = target - value
            if container.contains(needValue) {
                return [nums.firstIndex(of: needValue)!, index]
            }
            container.update(with: value)
        }
        return []
    }

    func func22(_ nums: [Int], _ target: Int) -> [Int] {
        var dic = [Int: Int]()
        for i in 0..<nums.count {
            guard let j = dic[target - nums[i]] else {
                dic[nums[i]] = i
                continue
            }
            return [j, i]
        }
        
        return []
    }

    func func3(_ nums: [Int], _ target: Int) -> [Int] {
        guard nums.count > 1 else { return [] }
        let numbers = nums.sorted()
        var i = 0 , j = numbers.count - 1
        
        while i < j {
            if numbers[i] + numbers[j] < target {
                i += 1
            }else if numbers[i] + numbers[j] > target {
                j -= 1
            }else {
                return [nums.firstIndex(of: numbers[i])! , nums.lastIndex(of: numbers[j])!]
            }
        }

        return []        
    }
}
// @lc code=end

