//
//  main.swift
//  6_Ordered sets
//
//  Created by Ryan J. W. Kim on 2022/01/15.
//

import Foundation

struct OrderedSet<Element: Hashable>: Equatable {
    public private(set) var array = [Element]()
    private var set = Set<Element>()
    
    var count: Int { array.count }
    var isEmpty: Bool { array.isEmpty }
    
    init() { }
    
    init(_ array: [Element]) {
        for element in array {
            appen(element)
        }
    }
    
    func contains(_ member: Element) -> Bool {
        set.contains(member)
    }
    
    @discardableResult
    mutating func appen(_ newElement: Element) -> Bool {
        if set.insert(newElement).inserted {
            array.append(newElement)
            return true
        } else {
            return false
        }
    }
    
    static func ==(lhs: OrderedSet, rhs: OrderedSet) -> Bool {
        lhs.array == rhs.array
    }
}

extension OrderedSet: RandomAccessCollection {
    var startIndex: Int { array.startIndex }
    var endIndex: Int { array.endIndex }
    
    subscript(index: Int) -> Element {
        array[index]
    }
}

let set = OrderedSet([5, 10, 15, 20, 15, 10, 5])
print(set.array)

print(set.contains(5))

print(set.count)

for item in set {
    print(item)
}

print(set[3])

let strings = set.map { "Number \($0)" }
let doubles = set.compactMap { Double(exactly: $0) }
print(strings)
print(doubles)
