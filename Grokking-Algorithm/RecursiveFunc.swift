//
//  RecursiveFunc.swift
//  Grokking-Algorithm
//
//  Created by Bakai Ismaiilov on 11/2/24.
//

// MARK: - Stack Call explanation

///  factorial(5) is written as `5!`
///  defined like this:  `5! = 5 * 4 * 3 * 2 * 1`

func factorial(_ x: Int) -> Int {
    if x == 1 {
        return 1
    } else {
        return x * factorial(x - 1)
    }
}

// MARK: D&C exercise
/// When you’re writing a recursive function involving an array,
/// the base case is often an `empty array or an array with one element`
/// If you’re stuck, try that first.
func sum(_ arr: [Int]) -> Int {
    var mutableArr = arr
    if mutableArr.isEmpty { /// This is a `Base Case`
        return 0
    } else {                /// This is a `Recursive case`
        let first = mutableArr.removeFirst()
        return first + sum(mutableArr)
    }
}
