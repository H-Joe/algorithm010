学习笔记
## 7、递归（Recursion）

- 定义：通过函数体进行的循环
- 特点：
    * 向下进入不同层，向上回到原来的层
    * 达到循环终止条件，回到上一层
    * 每一层携带的变量
- 递归模版：
    *  ```swift
        func recursion(level: Int, param: Int) {
            
            /// 1、recursion terminator
            if level > MAX_LEVEL {
                /// process result
                return 
            }
                
            /// 2、 process current logic
            process(level, param)
                
            /// 3、drill down
            recursion(level: level + 1, newParam)
                
            /// 4、reverse current status if needed
        }
         ```
         
- 思维要点：
    * 1、不要人肉递归
    * 2、找到最近最简方法，将其拆分成可重复解决的问题（重复子问题）
    * 3、数学归纳法思维

## 8、分治（Divid & Conquer）
    
- 特点：分解问题，组合子问题的结果 （split and merge）
- 代码模版：

    * ```swift
        func divide_conquer(problem: Any, param1: Any, ...) {
            /// 1、recursion terminator
            if problem == nil {
                /// print result
                return 
            }         
        
            /// 2、prepare data （process）
            var data = prepare_data(problem)
            var subProblems = split_problem(problem, data)
            
            /// 3、conquer subproblems （drill down）
            var subResult1 = divide_conquer(subProblem[0], newParam1, ...)
            var subResult2 = divide_conquer(subProblem[1], newParam1, ...)
            
            /// 4、process and generated the final  result （merge）
            var result = process_result(subResult1, subResult2, ...)
            
            /// 5、reverse the current level states
            
        }
      ```
      
## 9、回溯 （Backtracking）

- 定义：
    * 尝试分布解决问题，当现有的分布答案不能得到有效的正确的答案时，将取消上一步，甚至上几步的计算，再通过其他的分布解答中，找到问题的答案

- 实现方法：通过递归方法实现
- 时间复杂度： 在最坏的情况下，是指数时间的复杂度