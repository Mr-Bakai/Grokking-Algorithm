//
//  DijkstrasAlgorithm.swift
//  Grokking-Algorithm
//
//  Created by Bakai Ismaiilov on 23/2/24.
//

/// - Important:
///     Dijkstra’s algorithm  only works with directed acyclic graphs, called DAGs for
func dijkstrasAlgorithmImpl(
    graph: [String: [String: Double]],
    costs: [String: Double],
    parents: [String: String],
    proccessed: [String]
) {
    let graphMutable = graph
    var costsMutable = costs
    var parentsMutable = parents
    var proccessedMutable = proccessed
    
      // MARK: Graph
//    graph["start"] = ["a": 2, "b": 5]
//    graph["a"] = ["c": 7, "b": 8]
//    graph["b"] = ["c": 2, "d": 4]
//    graph["c"] = ["fin": 1]
//    graph["d"] = ["c": 6, "fin": 3]
//    graph["fin"] = [:]
    
//    // MARK: Costs
//    costs["a"] = 2 // Pro
//    costs["b"] = 5 // Pro
//    costs["d"] = infinity // 9
//    costs["c"] = infinity // 9,7
//    costs["fin"] = infinity // 8
//
//    // MARK: Parents
//    parents["a"] = "start"
//    parents["b"] = "start"
//    parents["fin"] = ""
    
    var node = findTheLowestCostNode(costsMutable, proccessed: proccessedMutable)
    
    while !node.isEmpty { // a, next b, next c
        let cost = costsMutable[node]! // a:2, next b:5, next c:7
        let neighbors = graphMutable[node]! // a = ["c": 7, "b": 8], next b = ["c": 2, "d": 4], next c = ["fin": 1]
        let keys = Array(neighbors.keys)
        
        for neighbor in keys { // a = "c": 7, b = "8", next b = "c": 2, "d": 4, next c = "fin": 1
            let newCost = cost + neighbors[neighbor]! // c: 7 + 2 = 9, b: 8 + 2 = 10, next: 5 + 2 = 7, next 1 + 7 = 8
            
            if costsMutable[neighbor]! > newCost { // c: infinity > 9, b: 5 > 10 (R), next: 9 > 7 (T), next fin: inf > 8 (T)
                costsMutable[neighbor] = newCost // 9 // 7 // 8
                parentsMutable[neighbor] = node // c parent is ----> a, c parent is ----> b, fin parent is ----> c
            }
        }
        proccessedMutable.append(node) // a, b
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

// MARK: GraphOriginal
func getGraphOriginal() -> (
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

// MARK: - GraphA
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
    graph["start"] = ["a": 2, "b": 5]
    graph["a"] = ["c": 7, "b": 8]
    graph["b"] = ["c": 2, "d": 4]
    graph["c"] = ["fin": 1]
    graph["d"] = ["c": 6, "fin": 3]
    graph["fin"] = [:]
    
    // MARK: Costs
    costs["a"] = 2
    costs["b"] = 5
    costs["d"] = infinity
    costs["c"] = infinity
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

// MARK: - GraphB
func getGraphB() -> (
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
    graph["start"] = ["a": 10]
    graph["a"] = ["b": 20]
    graph["b"] = ["c": 1, "fin": 30]
    graph["c"] = ["a": 1]
    graph["fin"] = [:]
    
    // MARK: Costs
    costs["a"] = 10
    costs["b"] = infinity
    costs["c"] = infinity
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

// MARK: - GraphС
/// Graph C is not runable on `Dijkstra’s algorithm` coz it has negative weights

/// Recap
/// • Breadth-first search is used to calculate the shortest path for an unweighted graph.
/// • Dijkstra’s algorithm is used to calculate the shortest path for a weighted graph.
/// • Dijkstra’s algorithm works when all the weights are positive.
/// • If you have negative weights, use the Bellman-Ford algorithm.
