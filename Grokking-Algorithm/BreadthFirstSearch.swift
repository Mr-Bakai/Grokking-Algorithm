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
/// How do you express a relationship like “you -> bob”?
/// Luckily, you know a data structure that lets you express relationships: a `hash table`

func graphImpl() {
    var graph = ["": [""]]
    graph["you"] = ["Alice", "Bob", "Claire"]
}
