学习笔记
## 18、动态规划 （Dynamic Programming）

- 定义：
    
    * "Simplifying a complicated problem by breaking it down into simpler sub-problems" (in a recursive manner)
    
    * Divide & Conquer（分治） + Optimal substructure（最优子结构）

- 关键点：
    * 动态规划和 递归或分治 没有根本上的区别（关键看有无最优子结构）
    * **共性：找到重复子问题**
    * 差异性：DP有最优子结构，中途可以**淘汰**次优解

- 理解：
    * 和分治有内在的联系，是无法完全割裂的两个算法
    * 和分治的区别：
        * DP存在最优子结构 -> 在中间的每一步不需要把所有的状态都保留下来，只需要保存最优的状态
        * 前提：能证明每一步最优的值能推导出全局最优的值
    * 缓存：状态的存储数组
    * 淘汰次优解：在每一步都会把次优状态淘汰，只保留在这一步中最优或较优的状态，来推导出最后的全局最优

- 程序关键点
    * 1、最优子结构：
        ```
        opt[n] = best_of(opt[n-1], opt[n-2], ...)
        ```

    * 2、存储中间状态：
        ```
        opt[i]
        ```
    * 3、递推公式（状态转移方程式或DP方程）：
        ```
        Fib: opt[n] = opt[n-1] + opt[n-2]
        二维路径：opt[i, j] = opt[i+1, j] + opt[i, j+1](且判断 a[i, j] 是否是空地)
        ```