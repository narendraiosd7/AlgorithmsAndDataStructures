//: [Previous](@previous)

import Foundation

func badSum(n: Int) -> Int {
    if n <= 0 {
        return 0
    }
    return n + badSum(n: (n - 1))
}

let res = badSum(n: 3)
print(res)

//: [Next](@next)
