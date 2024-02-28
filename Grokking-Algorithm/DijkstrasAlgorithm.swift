//
//  DijkstrasAlgorithm.swift
//  Grokking-Algorithm
//
//  Created by Bakai Ismaiilov on 23/2/24.
//

import Foundation

func getGraphA() -> (
    graph: [String: [String: Double]],
    costs: [String: Double],
    parents: [String: String],
    proccessed: [String]
) {
    let infinity = Double.infinity

    var graph: [String: [String: Double]] = [:]

    /// Next you need a hash table to store the costs for each node.
    var costs: [String: Double] = [:]

    /// You also need another hash table for the parents:
    var parents: [String: String] = [:]

    /// Finally, you need an array to keep track of all the nodes you’ve already processed,
    /// because you don’t need to process a node more than once:
    var proccessed: [String]
    
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
    
    // MARK: Proccessed
    proccessed = []
    
    return (
        graph: graph,
        costs: costs,
        parents: parents,
        proccessed: proccessed
    )
}

func dijkstrasAlgorithmImpl(
    graph: [String: [String: Double]],
    costs: [String: Double],
    parents: [String: String],
    proccessed: [String]
) {
    var graphMutable = graph
    var costsMutable = costs
    var parentsMutable = parents
    var proccessedMutable = proccessed
    
    var node = findTheLowestCostNode(costsMutable, proccessed: proccessedMutable)
    
    while !node.isEmpty {
        let cost = costsMutable[node]!
        let neighbors = graphMutable[node]!
        let keys = Array(neighbors.keys)
        
        for neighbor in keys {
            let newCost = cost + neighbors[neighbor]!
            
            if costsMutable[neighbor]! > newCost {
                costsMutable[neighbor] = newCost
                parentsMutable[neighbor] = node
            }
        }
        proccessedMutable.append(node)
        node = findTheLowestCostNode(costsMutable, proccessed: proccessedMutable)
    }
    
    print(costsMutable)
    print(parentsMutable)
}

private func findTheLowestCostNode(
    _ costs: [String: Double],
    proccessed: [String]
) -> String {
    var lowestCost = Double.infinity
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
