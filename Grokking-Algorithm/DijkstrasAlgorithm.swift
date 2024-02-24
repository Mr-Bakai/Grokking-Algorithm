//
//  DijkstrasAlgorithm.swift
//  Grokking-Algorithm
//
//  Created by Bakai Ismaiilov on 23/2/24.
//

import Foundation

class DijkstrasAlgorithm {
    
    let infinity = Double.infinity
    
    var graph: [String: [String: Double]] = [:]
    
    /// Next you need a hash table to store the costs for each node.
    var costs: [String: Double] = [:]
    
    /// You also need another hash table for the parents:
    var parents: [String: String] = [:]
    
    /// Finally, you need an array to keep track of all the nodes you’ve already processed,
    /// because you don’t need to process a node more than once:
    var proccessed: [String]

    init() {
        // MARK: Graph
        graph["start"] = ["a": 6, "b": 2]
        graph["a"] = ["fin": 1]
        graph["b"] = ["a": 3, "fin": 5]
        graph["fin"] = [:]
        
        // MARK: Costs
        costs["a"] = 6
        costs["b"] = 2
        costs["fin"] = infinity
        
        // MARK: Parents
        parents["a"] = "start"
        parents["b"] = "start"
        parents["fin"] = ""
        
        proccessed = []
    }
    
    func dijkstrasAlgorithmImpl() {
        var node = findTheLowestCostNode()
        
        while !node.isEmpty {
            let cost = costs[node]!
            let neighbors = graph[node]!
            let keys = Array(neighbors.keys)
            
            for neighbor in keys {
                let newCost = cost + neighbors[neighbor]!
                
                if costs[neighbor]! > newCost {
                    costs[neighbor] = newCost
                    parents[neighbor] = node
                }
            }
            proccessed.append(node)
            node = findTheLowestCostNode()
        }
        
        print(costs)
        print(parents)
    }

    private func findTheLowestCostNode() -> String {
        var lowestCost = infinity
        var lowestCostNode = ""
        
        for pair in costs {
            let node = pair.key
            let cost = pair.value
            
            if cost < lowestCost && !proccessed.contains(node) {
                lowestCost = cost
                lowestCostNode = node
            }
        }
        return lowestCostNode
    }
}
