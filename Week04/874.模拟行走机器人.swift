/*
 * @lc app=leetcode.cn id=874 lang=swift
 *
 * [874] 模拟行走机器人
 *
 * https://leetcode-cn.com/problems/walking-robot-simulation/description/
 *
 * algorithms
 * Easy (35.14%)
 * Likes:    95
 * Dislikes: 0
 * Total Accepted:    8.9K
 * Total Submissions: 24.8K
 * Testcase Example:  '[4,-1,3]\n[]'
 *
 * 机器人在一个无限大小的网格上行走，从点 (0, 0) 处开始出发，面向北方。该机器人可以接收以下三种类型的命令：
 * 
 * 
 * -2：向左转 90 度
 * -1：向右转 90 度
 * 1 <= x <= 9：向前移动 x 个单位长度
 * 
 * 
 * 在网格上有一些格子被视为障碍物。
 * 
 * 第 i 个障碍物位于网格点  (obstacles[i][0], obstacles[i][1])
 * 
 * 机器人无法走到障碍物上，它将会停留在障碍物的前一个网格方块上，但仍然可以继续该路线的其余部分。
 * 
 * 返回从原点到机器人所有经过的路径点（坐标为整数）的最大欧式距离的平方。
 * 
 * 
 * 
 * 示例 1：
 * 
 * 输入: commands = [4,-1,3], obstacles = []
 * 输出: 25
 * 解释: 机器人将会到达 (3, 4)
 * 
 * 
 * 示例 2：
 * 
 * 输入: commands = [4,-1,4,-2,4], obstacles = [[2,4]]
 * 输出: 65
 * 解释: 机器人在左转走到 (1, 8) 之前将被困在 (1, 4) 处
 * 
 * 
 * 
 * 
 * 提示：
 * 
 * 
 * 0 <= commands.length <= 10000
 * 0 <= obstacles.length <= 10000
 * -30000 <= obstacle[i][0] <= 30000
 * -30000 <= obstacle[i][1] <= 30000
 * 答案保证小于 2 ^ 31
 * 
 * 
 */

// @lc code=start
class Solution {
    enum Direction {
    case north, south, east, west
    func turnLeft() -> Direction {
        switch self {
        case .north: return .west
        case .south: return .east
        case .east: return .north
        case .west: return .south
        }
    }
    func turnRight() -> Direction {
        switch self {
        case .north: return .east
        case .south: return .west
        case .east: return .south
        case .west: return .north
        }
    }
    func dx() -> Int {
        switch self {
        case .east: return 1
        case .west: return -1
        default: return 0
        }
    }
    func dy() -> Int {
        switch self {
        case .north: return 1
        case .south: return -1
        default: return 0
        }
    }
}
func transformP2I(_ y: Int, _ x: Int) -> Int {
    let multiplier: Int = 1000000
    return multiplier * (multiplier / 2 + y) + multiplier / 2 + x
}
    func robotSim(_ commands: [Int], _ obstacles: [[Int]]) -> Int {
        /// 思路一：模拟模拟
        // return func1(commands, obstacles)
        /// 很swift的实现方式
        return func2(commands, obstacles)
    }

    func func1(_ commands: [Int], _ obstacles: [[Int]]) -> Int {
        let directionDic = ["north": [0: (0, 1), -1: "east", -2: "west"],
                            "south": [0: (0, -1), -1: "west", -2: "east"],
                            "east": [0: (1, 0), -1: "south", -2: "north"],
                            "west": [0: (-1, 0), -1: "north", -2: "south"]
                            ]
        let obstaclesSet = Set(obstacles)
        var dir = "north"
        var curX = 0, curY = 0
        var res = 0
        for c in commands {
            if c > 0 {
                for _ in 1...c {
                    curX += (directionDic[dir]![0] as! (Int, Int)).0
                    curY += (directionDic[dir]![0] as! (Int, Int)).1
                    if obstaclesSet.contains([curX, curY]) { break }
                    res = max(res, curX * curX + curY * curY)
                }
            }else {
                dir = directionDic[dir]![c] as! String
            }
        }
        return res
    }

    func func2(_ commands: [Int], _ obstacles: [[Int]]) -> Int {
        var res = 0, curX = 0, curY = 0, dir = Direction.north
        var obstacleDic = [Int: Bool]()
        obstacles.map { obstacleDic[transformP2I($0[1], $0[0])] = true }
        
        for com in commands {
            switch com {
            case -1: dir = dir.turnRight()
            case -2: dir = dir.turnLeft()
            default:
                for _ in 1...com {
                    if obstacleDic[transformP2I(curY + dir.dy(), curX + dir.dx()), default: false] { break }
                    curX += dir.dx()
                    curY += dir.dy()
                    res = max(res, curX * curX + curY * curY)
                }
            }
        }
        return res   
    }
}
// @lc code=end

