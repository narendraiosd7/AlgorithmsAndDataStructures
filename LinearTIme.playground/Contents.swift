import Foundation

import QuartzCore

public class BenchTimer {
    public static func measureBlock(closer: () -> Void) -> CFTimeInterval {
        let runCount = 10
        var executionTimes = Array<Double>(repeating: 0.0, count: runCount)
        for i in 0..<runCount {
            let startTime = CACurrentMediaTime()
            closer()
            let endTime = CACurrentMediaTime()
            let execTime = endTime - startTime
            executionTimes[i] = execTime
        }
        return (executionTimes.reduce(0, +) / Double(runCount))
    }
}

func generateRandomArray(size: Int, maxValue: UInt32) -> [Int] {
    guard size > 0 else {
        return [Int]()
    }
    
    var results = [Int](repeating: 0, count: size)
    
    for i in 0..<size {
        results[i] = Int(arc4random_uniform(maxValue))
    }
    
    return results
}

func sum(array: [Int]) -> Int {
    var result = 0
    for i in 0..<array.count {
        result += array[i]
    }
    return result
}

let array100 = generateRandomArray(size: 100, maxValue: UInt32.max)
var execTime = BenchTimer.measureBlock {
    _ = sum(array: array100)
}

print("Avg exec time: \(execTime)")

let array1000 = generateRandomArray(size: 1000, maxValue: UInt32.max)
execTime = BenchTimer.measureBlock {
    _ = sum(array: array1000)
}

print("Avg exec time: \(execTime)")

let array10000 = generateRandomArray(size: 1000, maxValue: UInt32.max)
execTime = BenchTimer.measureBlock {
    _ = sum(array: array10000)
}

print("Avg exec time: \(execTime)")

func countOddEven(array: [Int]) -> (even: UInt, odd: UInt) {
    var even: UInt = 0
    var odd: UInt = 0
    
    for elem in array {
        if elem % 2 == 0 {
            even += 1
        } else {
            odd += 1
        }
    }
    return (even, odd)
}

execTime = BenchTimer.measureBlock {
    _ = sum(array: array100)
}

print("Avg exec array100 time: \(execTime)")

execTime = BenchTimer.measureBlock {
    _ = sum(array: array1000)
}

print("Avg exec array1000 time: \(execTime)")

execTime = BenchTimer.measureBlock {
    _ = sum(array: array10000)
}

print("Avg exec array10000 time: \(execTime)")

