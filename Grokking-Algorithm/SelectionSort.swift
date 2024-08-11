//
//  SelectionSort.swift
//  Grokking-Algorithm
//
//  Created by Bakai Ismaiilov on 11/2/24.
//

// MARK: - Some kind of Selection Sort
/// sorts an array from smallest to biggest
func selectionSort(_ arr: [Int]) -> [Int] {
    var newArr: [Int] = []
    var mutableArray = arr
    
    for _ in 0..<arr.count {
        guard let smallestIndex = findSmallest(mutableArray) else { continue }
        newArr.append(mutableArray.remove(at: smallestIndex))
    }
    
    return newArr
}

private func findSmallest(_ arr: [Int]) -> Int? {
    guard !arr.isEmpty else { return nil }
    var smallest = 0
    var smallestIndex = 0
    
    for i in 0..<arr.count {
        if arr[i] < smallest {
            smallest = arr[i]
            smallestIndex = i
        }
    }
    return smallestIndex
}
