//: [Previous](@previous)

import Foundation

typealias BigInt = _BigInt<UInt>

func factorial(n: BigInt) -> BigInt {
    return n < 2 ? 1: n * factorial(n: n-1)
}

print(factorial(n: 100))

//: [Next](@next)
