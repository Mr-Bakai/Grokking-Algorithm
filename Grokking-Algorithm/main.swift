//
//  main.swift
//  Grokking-Algorithm
//
//  Created by Bakai Ismaiilov on 11/2/24.
//

import Foundation

// MARK: - Binary Search
/*
 Binary search only works when your list is in sorted order.
*/

private func binarySearch(_ list: [Int], item: Int) -> Int? {
    var low = 0
    var high = (list.count - 1)     /// `low` and `high` keep track of which part of the list you’ll search in.
    
    while low <= high {             /// While you haven’t narrowed it down to one element ...
        let mid = (low + high) / 2
        let guess = list[mid]
        
        if guess == item {          /// Found the item.
            return mid
        } else if (guess > item){   /// The guess was too high.
            high = mid - 1
        } else {
            low = mid + 1           /// The guess was too low.
        }
    }
    
    return nil                      /// The item doesn’t exist.
}

print("BINARY SEARCH: \(binarySearch([1,2,3,4,5], item: 4))")
print("SELECTION SORT: \(selectionSort([1,2,3,4,5]))")
print("FACTORIAL: \(factorial(5))")
print("SUM: \(sum([1,2,3,4,5]))")
print("QUICK SORT: \(quickSort([10, 5, 2, 3]))")
print("\n")
print("BREADTH FIRST SEARCH FOR m: \(breadthFirstSearch(name: "you", graph: graphImpl(), forSuffix: "m"))")
print("BREADTH FIRST SEARCH FOR e: \(breadthFirstSearch(name: "you", graph: graphImpl(), forSuffix: "e"))")
print("BREADTH FIRST SEARCH FOR d: \(breadthFirstSearch(name: "you", graph: graphImpl(), forSuffix: "d"))")

print("\n")
print("DIJKSTRAS ALGORITHM ORIGINAL")
dijkstrasAlgorithmImpl(
    graph: getGraphOriginal().graph,
    costs: getGraphOriginal().costs,
    parents: getGraphOriginal().parents,
    proccessed: getGraphOriginal().proccessed
)

print("\n")
print("DIJKSTRAS ALGORITHM A")
dijkstrasAlgorithmImpl(
    graph: getGraphA().graph,
    costs: getGraphA().costs,
    parents: getGraphA().parents,
    proccessed: getGraphA().proccessed
)

print("\n")
print("DIJKSTRAS ALGORITHM B")
dijkstrasAlgorithmImpl(
    graph: getGraphB().graph,
    costs: getGraphB().costs,
    parents: getGraphB().parents,
    proccessed: getGraphB().proccessed
)
