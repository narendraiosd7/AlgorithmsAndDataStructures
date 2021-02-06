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

public extension CFTimeInterval {
    var formattedTime: String {
        return self >= 1000 ? String(Int(self)) + "s"
        : self >= 1 ? String(format: "%.3gs", self)
        : self >= 1e-3 ? String(format: "%.3gms", self * 1e3)
        : self >= 1e-6 ? String(format: "%.3gus", self * 1e6)
        : self < 1e-9 ? "0s"
        : String(format: "%.3gns", self * 1e9)
    }
}

func multTable(size: Int) -> [Int] {
    var table = [Int]()
    let array = [Int](1...size)
    
    for i in 0..<size {
        for j in 0..<size {
            let val = array[i] * array[j]
            table.append(val)
        }
    }
    return table
}

let mult10 = multTable(size: 10)

let sizes = [10000, 20000, 30000]

for i in 0..<sizes.count {
    let size = sizes[i]
    let execTime = BenchTimer.measureBlock {
        _ = multTable(size: size)
    }
    print("Avg exec time for \(size) elements: \(execTime.formattedTime)")
}





