//Constant Time - O(1)

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

func startsWithZero(array: [Int]) -> Bool {
    guard array.count != 0 else {
        return false
    }
    return array.first == 0 ? true : false
}

var smallArray = [1,0,0]
var executionTime = BenchTimer.measureBlock {
    _ = startsWithZero(array: smallArray)
}

print("Average execution time for Small Array: \(executionTime)")

var mediumArray = Array<Int>(repeating: 0, count: 10000)
executionTime = BenchTimer.measureBlock {
    _ = startsWithZero(array: mediumArray)
}

print("Average execution time for Medium Array: \(executionTime)")

var hugeArray = Array<Int>(repeating: 0, count: 1000000)
executionTime = BenchTimer.measureBlock {
    _ = startsWithZero(array: hugeArray)
}

print("Average execution time for Huge Array: \(executionTime)")

func generateDict(size: Int) -> Dictionary<String, Int> {
    var results = Dictionary<String, Int>()
    guard size > 0 else {
        return results
    }
    
    for i in 0..<size {
        let key = String(i)
        results[key] = i
    }
    return results
}

let smallDictionary = ["one": 1, "two": 2, "three": 3]

executionTime = BenchTimer.measureBlock {
    _ = smallDictionary["two"]
}

print("Average execution time for small dictionary: \(executionTime)")

let mediumDictionary = generateDict(size: 500)

executionTime = BenchTimer.measureBlock {
    _ = mediumDictionary["325"]
}

print("Average execution time for medium dictionary: \(executionTime)")

let hugeDictionary = generateDict(size: 100000)

executionTime = BenchTimer.measureBlock {
    _ = hugeDictionary["55555"]
}

print("Average execution time for huge dictionary: \(executionTime)")





