//
//  main.swift
//  4_Trees
//
//  Created by Ryan J. W. Kim on 2022/01/13.
//

import Foundation

final class Node<Value> {
    var value: Value
    private(set) var children: [Node]
    
    var count: Int {
        1 + children.reduce(0) { $0 + $1.count }
    }
    
    init(_ value: Value) {
        self.value = value
        self.children = []
    }
    
    init(_ value: Value, children: [Node]) {
        self.value = value
        self.children = children
    }
    
    init(_ value: Value, @NodeBuilder builder: () -> [Node]) {
        self.value = value
        self.children = builder()
    }
    
    func add(child: Node) {
        children.append(child)
    }
}

extension Node: Equatable where Value: Equatable {
    static func ==(lhs: Node, rhs: Node) -> Bool {
        lhs.value == rhs.value && lhs.children == rhs.children
    }
}
extension Node: Hashable where Value: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(value)
        hasher.combine(children)
    }
}
extension Node: Codable where Value: Codable { }

extension Node where Value: Equatable {
    func find(_ value: Value) -> Node? {
        if self.value == value {
            return self
        }
        for child in children {
            if let match = child.find(value) {
                return match
            }
        }
        return nil
    }
}

@resultBuilder
struct NodeBuilder {
    static func buildBlock<Value>(_ children: Node<Value>...) -> [Node<Value>] {
     children
    }
}

var ryan = Node("Ryan")
let john = Node("John")
ryan.add(child: john)

var paul = Node("Paul")
var sophie = Node("Sophie")
let charlotte = Node("Charlotte")
paul.add(child: sophie)
paul.add(child: charlotte)

let taylor = Node("Taylor")
sophie.add(child: taylor)

var root = Node("Kim")
root.add(child: ryan)
root.add(child: paul)

print(ryan)
print(paul)

print(paul == sophie)
print(paul != sophie)
print(paul == paul)

print(paul.count)
print(ryan.count)
print(root.count)


// with resultBuilder

if let paul = root.find("Paul") {
    print(paul.count)
}


let terry = Node("Terry") {
    Node("Paul") {
        Node("Sophie")
        Node("Lottie")
    }
    
    Node("Andrew") {
        Node("John")
    }
}

print(terry.count)
