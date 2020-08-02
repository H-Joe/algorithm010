## 23、位运算（Bit Operation）
- **I. 位运算符**
    * 左移：**<<** 
        * 示例：0011 -> 0110
    * 右移：**>>**  
        * 示例：0110 -> 0011
    * 按位或：**|** 
        * 示例：0011 | 1011 -> 1011
    * 按位与：**&**
        * 示例：0011 & 1011 -> 0011
    * 按位取反：**～** 
        * 示例：0011 -> 1100
    * 按位异或：**^**  （**相同为零不同为一**）
        * 示例：0011 ^ 1011 -> 1000 
        * 异或操作特点：
            * 1、**x ^ 0 = x**
            * 2、**x ^ 1s = ~x** // 1s = ~0，即1s是表示全为1
            * 3、**x ^ (~x) = 1s**
            * 4、**x ^ x = 0**
            * 5、**c = a ^ b, b = a ^ c, a = b ^ c** // 交换两个数
            * 6、**a ^ b ^ c = a ^ (b ^ c) = (a ^ b) ^ c** // 满足结合法

- **II. 指定位置的位运算**
    * **1、将x最右边的n位清零：x & (~0 << n)**
    * **2、获取x的第n位值（0或者1）：(x >> n) & 1**
    * **3、获取x的第n位幂值：x & (1 << n)**
    * **4、仅将第n位置为1：x | (1 << n)**
    * **5、仅将第n位置为0：x & (~(1 << n))**
    * **6、将x的最高位至第n位（含）清零：x & ((1 << n) - 1)**

- **III. 实战位运算要点**
    * **1、判断奇偶**
        * **x & 1 == 1 -> 奇数 <==> x % 2 == 1**
        * **x & 1 == 0 -> 偶数 <==> x % 2 == 0**
    * **2、除2**
        * **x >> 1 <==> x / 2**
    * **3、清零最低位的1**
        * **x = x & (x - 1)**
    * **4、x & (-x) ==> 最低位的1所表示的整数**
        * 保留最后一位1，而其他位都会清零
        * x为奇数时，结果一定是1
    * **5、x & (~x) ==> 0**

## 24、布隆过滤器（Bloom Filter）
- **I. 原理**
    * 一个很长的二进制向量和一系列随机映射函数
    * 添加元素：
        * 将要添加的元素给k个哈希函数
        * 得到对应于位数组上的k个位置
        * 将这k个位置设为1
    * 查询元素：
        * 将要查询的元素给k个哈希函数
        * 得到对应于位数组上的k个位置
        * 如果k个位置有一个为0，则肯定不在集合中
        * 如果k个位置全部为1，则可能在集合中

- **II. 特点**
    * 用于检索一个元素是否在一个集合中（**模糊查询**）
    * 优点：空间效率和查询时间都远远超过一般算法
    * 缺点：有一定的误识别率和删除困难

- **III. 代码实现**
    ```swift
    class BloomFilter {
        var size: Int
        var array: [Bool]
        var hash_num: Int
        init(_ size: Int = 1024, _ hash_num: Int) {
            self.size = size
            self.hash_num = hash_num
            array = [Bool](repeating: false, count: size)
        }
        
        func add(_ s: String) {
            for h in 0..<hash_num {
                let index = abs(hashFunc(s, h) % array.count)
                array[index] = true
            }
        }
        /// 返回false一定不存在，返回true可能存在
        func lookup(_ s: String) -> Bool {
            for h in 0..<hash_num {
                let index = abs(hashFunc(s, h) % array.count)
                if !array[index] { return false }
            }
            return true
        }
        func hashFunc(_ x: String, _ n: Int) -> Int {
            var hash = n
            for char in x {
                hash = char.hashValue &+ (hash << 6) &+ (hash << 16) &- hash
            }
            return Int(hash)
        }
        /* Two hash functions, adapted from http://www.cse.yorku.ca/~oz/hash.html */
    
        func djb2(x: String) -> Int {
          var hash = 5381
          for char in x {
            hash = ((hash << 5) &+ hash) &+ char.hashValue
          }
          return Int(hash)
        }
    
        func sdbm(x: String) -> Int {
          var hash = 0
          for char in x {
            hash = char.hashValue &+ (hash << 6) &+ (hash << 16) &- hash
          }
          return Int(hash)
        }
    }
    ```
    
## 25、LRU Cache
- **I. 基本特性**
    * 1、缓存大小
    * 2、替换策略
        * LRU：Least recently used 最近最少使用
        * LFU：least frequently used 最近最常使用
- **II. 实现示例**
    * 哈希表Hash Table + 双向链表Double LinkedList
    * 查询时间复杂度： O(1) -> 哈希表
    * 修改更新时间复杂度：O(1) -> 双向链表 

## 26、排序算法（Sort）
- **I. 算法分类**
    * 1、比较类排序
        * 通过比较决定元素之间的相对次序，由于其时间复杂度不能超过O(nlogn)，因此其也称为非线形时间比较类排序
    * 2、非比较类排序
        * 不能通过比较来决定元素间的相对次序，它可以突破基于比较排序的时间下界，以线形时间运行，因此也称为线形时间费比较类排序

- **II. 复杂度分析**
    > 稳定：如果a原本在b前面，而a=b，排序之后a仍然在b的前面.
    > 不稳定：如果a原本在b的前面，而a=b，排序之后 a 可能会出现在 b 的后面.
    
- **III. 初级排序** - O(n^2)
    * 选择排序（Selection Sort）
        * 每次找最小值，然后放在待排序数组的起始位置
    * 插入排序（Insertion Sort）
        * 从前到后逐步构建有序序列
        * 对于未排序数据，在已排序序列中，从后向前扫描，找到相应位置并插入
    * 冒泡排序（Bubble Sort）
        * 嵌套循环，每次查看相邻元素，如果逆序，则交换
    * 希尔排序（Shell Sort） - O(n^1.3)
        * 是简单插入排序的改进版
        * 它与插入排序的不同之处在于，它会优先比较距离较远的元素。希尔排序又叫缩小增量排序。

- **IV. 高级排序** - O(nlogn)
    * 快速排序（Quick Sort）
        * 数组取标杆pivot，将小元素放在pivot左边，大元素放在pivot右边
        * 然后依次对左边和右边的子数组快速排序，以达到整个序列有序
    * 归并排序（Merge Sort） - 分治
        * 把长度为n的输入序列分成两个长度为2/n的子序列
        * 对这两个子序列分别进行归并排序
        * 将两个排序好的子序列合并成最终的一个排序序列
    * 堆排序（Heap Sort） - 插入：O(logn), 取最大值或最小值：O(1)
        * 数组元素依次建立小顶堆或大顶堆
        * 依次取堆顶元素，并删除

- **V 特殊排序** - O(n)
    * 计数排序（Counting Sort）
        * 要求输入的数据是有范围的整数
        * 将输入的数据值转化为键存储在额外开辟的数组空间中
        * 然后依次把计数大于1的值填回原数组中
    * 桶排序（Bucket Sort）
        * 假设输入数据服从均匀分布
        * 将数据分布到有限数量的桶里，每个桶再分别排序（使用其他排序算法或递归继续桶排序）
    * 基数排序（Radix Sort）
        * 低位先排序，然后收集
        * 高位再排序，然后收集
        * 依次类推，直到最高位
        * 有优先级顺序的，先按低优先级排序，再按高优先级排序 

- **VI. 代码示例**
    * 冒泡排序
        ```swift
        func bubbleSort(_ nums: [Int]) -> [Int] {
            var nums = nums
            for i in 0..<nums.count - 1 {
                for j in 0..<nums.count - i - 1 {
                    if nums[j] > nums[j + 1] {
                        (nums[j], nums[j + 1]) = (nums[j + 1], nums[j])
                    }
                }
            }
            return nums
        }
        ```
        
        ```swift
        func bubbleSort1(_ nums: [Int]) -> [Int] {
            var nums = nums
            for i in 0..<nums.count - 1 {
                for j in i + 1..<nums.count {
                    if nums[i] > nums[j] {
                        (nums[i], nums[j]) = (nums[j], nums[i])
                    }
                }
            }
            return nums
        }
        ```
    
    * 选择排序
        ```swift
        func selectionSort(_ nums: [Int]) -> [Int] {
            var nums = nums
            for i in 0..<nums.count - 1 {
                var min = i
                for j in i + 1..<nums.count {
                    if nums[min] > nums[j] {
                        min = j
                    }
                }
                (nums[i], nums[min]) = (nums[min], nums[i])
            }
            return nums
        }
        ```
    
    * 插入排序
        ```swift
        func insertionSort(_ nums: [Int]) -> [Int] {
            var nums = nums
            for i in 1..<nums.count {
                var j = i
                while j > 0, nums[j] < nums[j - 1] {
                    (nums[j], nums[j - 1]) = (nums[j - 1], nums[j])
                    j -= 1
                }
            }
            return nums
        }
        ```
        ```swift
        func insertionSort1(_ nums: [Int]) -> [Int] {
            var nums = nums
            for i in 1..<nums.count {
                var j = i, temp = nums[i]
                while j > 0, temp < nums[j - 1] {
                    nums[j] = nums[j - 1]
                    j -= 1
                }
                nums[j] = temp
            }
            return nums
        }
        ```
    
    * 希尔排序
        ```swift
        func shellSort(_ nums: [Int]) -> [Int] {
            var nums = nums, gap = nums.count >> 1
            while gap > 0 {
                for i in gap..<nums.count {
                    var j = i
                    while j - gap >= 0, nums[j] < nums[j - gap] {
                        (nums[j], nums[j - gap]) = (nums[j - gap], nums[j])
                        j -= gap
                    }
                }
                gap >>= 1
            }
            return nums
        }
        ```
        ```swift
        func shellSort1(_ nums: [Int]) -> [Int] {
            var nums = nums, gap = nums.count >> 1
            while gap > 0 {
                for i in gap..<nums.count {
                    var j = i, temp = nums[i]
                    while j - gap >= 0, temp < nums[j - gap] {
                        nums[j] = nums[j - gap]
                        j -= gap
                    }
                    nums[j] = temp
                }
                gap >>= 1
            }
            return nums
        }
        ```
        
    * 归并排序
        ```swift
        func mergeSort(_ nums: [Int]) -> [Int] {
            guard nums.count > 1 else { return nums }
            var nums = nums
            let mid = nums.count >> 1
            return merge(mergeSort(Array(nums[0..<mid])), mergeSort(Array(nums[mid...])))
        
        }
        func merge(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
            var res = [Int](), nums1 = nums1, nums2 = nums2
            while nums1.count > 0, nums2.count > 0 {
                if nums1[0] <= nums2[0] { res.append(nums1.removeFirst()) }
                else { res.append(nums2.removeFirst()) }
            }
            while nums1.count > 0 { res.append(nums1.removeFirst()) }
            while nums2.count > 0 { res.append(nums2.removeFirst()) }
            return res
        }
        ```
        ```swift
        func mergeSort1(_ nums: inout [Int], _ left: Int, _ right: Int) {
            if right <= left { return }
            let mid = (left + right) >> 1
            mergeSort1(&nums, left, mid)
            mergeSort1(&nums, mid + 1, right)
            merge1(&nums, left, right, mid)
        }
        func merge1(_ nums: inout [Int], _ left: Int, _ right: Int, _ mid: Int) {
            var res = [Int]() // right - left + 1
            var i = left, j = mid + 1
            while i <= mid, j <= right {
                if nums[i] < nums[j] { res += [nums[i]]; i += 1 }
                else { res += [nums[j]]; j += 1 }
            }
            while i <= mid { res += [nums[i]]; i += 1}
            while j <= right {res += [nums[j]]; j += 1 }
            for p in 0..<res.count { nums[left + p] = res[p] }
        }
        ```
    * 快速排序
        ```swift
        func quickSort(_ nums: inout [Int], _ left: Int, _ right: Int) {
            if left >= right { return }
            var i = left, j = right, pivot = nums[left]
            while i < j {
                while i < j, nums[j] >= pivot { j -= 1 }
                while i < j, nums[i] <= pivot { i += 1 }
                if i < j { (nums[i], nums[j]) = (nums[j], nums[i]) }
            }
            (nums[left], nums[i]) = (nums[i], pivot)
        
            quickSort(&nums, left, i - 1)
            quickSort(&nums, i + 1, right)
        }
        ```
        ```swift
        func quickSort1(_ nums: inout [Int], _ left: Int, _ right: Int) {
            if left >= right { return }
        //    var i = left, pivot = nums[right]
        //    for j in left..<right {
        //        if nums[j] < pivot {
        //            (nums[j], nums[i]) = (nums[i], nums[j])
        //            i += 1
        //        }
        //    }
        //    (nums[right], nums[i]) = (nums[i], pivot)
            var i = left, pivot = nums[left]
            for j in left+1...right {
                if nums[j] < pivot {
                    i += 1
                    (nums[j], nums[i]) = (nums[i], nums[j])
                }
            }
            (nums[left], nums[i]) = (nums[i], pivot)
            quickSort1(&nums, left, i - 1)
            quickSort1(&nums, i + 1, right)
        }
        ```
    * 堆排序
        ```swift
        func heapSort(_ nums: inout [Int]) {
            for i in (0..<nums.count >> 1).reversed() {
                heapif1(&nums, i, nums.count)
            }
        
            for i in (0..<nums.count).reversed() {
                nums.swapAt(0, i)
                heapif1(&nums, 0, i)
            }
        }
        
        func heapif(_ nums: inout [Int], _ i: Int, _ length: Int) {
            let left = 2 * i + 1, right = 2 * i + 2
            var lagest = i
            if left < length, nums[lagest] < nums[left] { lagest = left }
            if right < length, nums[lagest] < nums[right] { lagest = right }
            if lagest != i {
                (nums[lagest], nums[i]) = (nums[i], nums[lagest])
                heapif(&nums, lagest, length)
            }
        }
        func heapif1(_ nums: inout [Int], _ i: Int, _ length: Int) {
            var lagest = i, k = 2 * i + 1
            let temp = nums[i]
            while k < length {
                if k + 1 < length, nums[k] < nums[k + 1] { k += 1 }
                if nums[k] <= temp { break }
                else { nums[lagest] = nums[k]; lagest = k }
                k = 2 * k + 1
            }
            nums[lagest] = temp
    }
        ```
    * 计数排序
        ```swift
        func countingSort(_ nums: [Int]) -> [Int] {
            var res = [Int](), maxVal = nums.max()
            var counters = [Int](repeating: 0, count: maxVal! + 1)
            for i in 0..<nums.count {
                counters[nums[i]] += 1
            }
            for i in 0..<counters.count {
                while counters[i] > 0 {
                    res += [i]
                    counters[i] -= 1
                }
            }
            return res
        }
        ```
        ```swift
        func countingSort1(_ nums: [Int]) -> [Int] {
            var res = nums, maxVal = nums.max()
            var counters = [Int](repeating: 0, count: maxVal! + 1)
            for i in 0..<nums.count {
                counters[nums[i]] += 1
            }
            for i in 1..<counters.count {
                counters[i] += counters[i - 1]
            }
            for n in nums {
                counters[n] -= 1
                res[counters[n]] = n
            }
            return res
        }
        ```
    * 桶排序
        ```swift
        func bucketSort(_ nums: [Int], _ gap: Int) -> [Int] {
            var res = [Int]()
            let minVal = nums.min()!, maxVal = nums.max()!
            let gap = gap > 0 ? gap : 5
            let bucketCount = (maxVal - minVal) / gap + 1
            var buckets = [[Int]](repeating: [Int](), count: bucketCount)
            for i in 0..<nums.count {
                let idx = (nums[i] - minVal) / gap
                buckets[idx] += [nums[i]]
            }
            for i in 0..<bucketCount {
                res += buckets[i].sorted() // 可以使用其他排序方式
            }
            return res
        }
        ```
    * 基数排序
        ```swift
        func radixSort(_ nums: inout [Int]) {
            var mod = 10, dev = 1
            var done = false
            while !done {
                done = true
                var buckets = [[Int]](repeating: [Int](), count: mod)
                for i in 0..<nums.count {
                    let idx = nums[i] / dev
                    buckets[idx % mod].append(nums[i])
                    if done, idx > 0 { done = false }
                }
        
                var j = 0
                for i in 0..<mod {
                    for n in buckets[i] {
                        nums[j] = n
                        j += 1
                    }
                }
                dev *= 10
            }
        }
        ```