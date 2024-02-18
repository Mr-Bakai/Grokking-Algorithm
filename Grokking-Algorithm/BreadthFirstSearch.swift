//
//  BreadthFirstSearch.swift
//  Grokking-Algorithm
//
//  Created by Bakai Ismaiilov on 18/2/24.
//

import Foundation

/// Implementing the graph
/// - Important: A graph consists of several nodes,
///   and each node is connected to neighboring nodes.
///   
/// How do you express a relationship like "you -> bob”?
/// Luckily, you know a data structure that lets you express relationships: a `hash table`

func graphImpl() -> [String: [String]] {
    
    var graph = ["": [""]]
    graph["you"] = ["alice", "bob", "claire"]
    graph["bob"] = ["anuj", "peggy"]
    graph["alice"] = ["peggy"]
    graph["claire"] = ["thom", "jonny"]
    graph["anuj"] = []
    graph["peggy"] = []
    graph["thom"] = []
    graph["jonny"] = []
    
    return graph
}

func breadthFirstSearch(
    name: String,
    graph: [String: [String]],
    forSuffix: Character
) -> Bool {
    
    var searchQueue = [String]()
    var searched = [String]()
    
    let neighbordsList = graph[name] ?? []
    searchQueue += neighbordsList
    
    while !searchQueue.isEmpty {
        let person = searchQueue.removeFirst()
        if !searched.contains(person) {
            if isPersonSeller(name: person, forSuffix) {
                return true
            } else {
                searchQueue += graph[person] ?? []
                searched.append(person)
            }
        }
    }
    return false
}

private func isPersonSeller(
    name: String,
    _ suffix: Character
) -> Bool {
    return name.last == suffix
}
