//
//  GreedyAlgorithm.swift
//  Grokking-Algorithm
//
//  Created by Bakai Ismaiilov on 4/3/24.
//

import Foundation

private func foo() {
    
    var statesNeeded = Set(["mt", "wa", "or", "id", "nv", "ut", "ca", "az"])
    var stations = [String: Set<String>]()
    
    stations["kone"] = Set(["id", "nv", "ut"])
    stations["ktwo"] = Set(["wa", "id", "mt"])
    stations["kthree"] = Set(["or", "nv", "ca"])
    stations["kfour"] = Set(["nv", "ut"])
    stations["kfive"] = Set(["ca", "az"])
    
    var finalStations = Set([""])
    /// not completed
}
