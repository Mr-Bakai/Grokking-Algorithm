//
//  QuickSort.swift
//  Grokking-Algorithm
//
//  Created by Bakai Ismaiilov on 11/2/24.
//

import Foundation

/// First, pick an element from the array.
/// This element is called the `pivot`

/// Now find the elements `smaller` than the pivot and the elements `larger` than the pivot
/// This is called `partitioning`

/// • A sub-array of all the numbers less than the pivot
/// • The pivot
/// • A sub-array of all the numbers greater than the pivot

func quickSort(_ arr: [Int]) -> [Int] {
    if arr.count < 2 {  /// Base case: arr with 0 or 1 element are already `“sorted”`
        return arr
    } else {
        let pivot = arr[0]
        let less = arr.filter { $0 < pivot }
        let great = arr.filter { $0 > pivot }
        
        return quickSort(less) + [pivot] + quickSort(great)
    }
}


///  Quicksort is a tricky case.
///  In the worst case, quicksort takes `O(n2)` time
///  In the average case, quicksort takes `O(n log n)` time
