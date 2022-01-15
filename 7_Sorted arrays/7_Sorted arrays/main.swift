//
//  main.swift
//  7_Sorted arrays
//
//  Created by Ryan J. W. Kim on 2022/01/15.
//

import Foundation

struct SortedArray<Element>: CustomStringConvertible, RandomAccessCollection {
    private var items = [Element]()
    var sortBefore: (Element, Element) -> Bool
    
    init(comparator: @escaping (Element, Element) -> Bool) {
        sortBefore = comparator
    }
    
    var count: Int { items.count }
    var description: String { items.description }
    
    var startIndex: Int { items.startIndex }
    var endIndex: Int { items.endIndex }
    
    subscript(index: Int) -> Element {
        items[index]
    }
    
    mutating func insert(_ element: Element) {
        for (i, item) in items.enumerated() {
            if sortBefore(element, item) {
                items.insert(element, at: i)
                return
            }
        }
        
        items.append(element)
    }
    
    mutating func remove(at index: Int) {
        items.remove(at: index)
    }
    
    @warn_unqualified_access func min() -> Element? {
        items.first
    }
    @warn_unqualified_access func max() -> Element? {
        items.last
    }
    
    func minAndMax() -> (min: Element?, max: Element?) {
        (self.min(), self.max())
    }
}

extension SortedArray where Element: Comparable {
    init() {
        self.init(comparator: <)
    }
}


var items = SortedArray<Int>()
items.insert(5)
items.insert(3)
items.insert(8)
items.insert(5)
print(items)

var items2 = SortedArray<Int>(comparator: >)
items2.insert(5)
items2.insert(3)
items2.insert(8)
items2.insert(5)
print(items2)

print(items.min() ?? 0)

print(items.minAndMax())
