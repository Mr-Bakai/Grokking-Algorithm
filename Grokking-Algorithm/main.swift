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
        var mid = (low + high) / 2
        var guess = list[mid]
        
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
print("SELCTION SORT: \(selectionSort([1,2,3,4,5]))")
print("FACTORIAL: \(factorial(5))")
print("SUM: \(sum([1,2,3,4,5]))")

