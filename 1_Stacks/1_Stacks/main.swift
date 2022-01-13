//
//  main.swift
//  1_Stacks
//
//  Created by Ryan J. W. Kim on 2022/01/13.
//

import Foundation

struct Stack<Element> {
    private var array = [Element]()
    var count: Int { array.count }
    var isEmpty: Bool { array.isEmpty }
    
    init(_ items: [Element]) {
        self.array = items
    }
    
    init() {}
    
    mutating func push(_ element: Element) {
        array.append(element)
    }
    
    mutating func pop() -> Element? {
        array.popLast()
    }
    
    func peak() -> Element? {
        array.last
    }
}

extension Stack: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Element...) {
        self.array = elements
    }
}

extension Stack: CustomDebugStringConvertible {
    var debugDescription: String {
        var result = "["
        var first = true
        
        for item in array {
            if first {
                first = false
            } else {
                result += ", "
            }
            
            debugPrint(item, terminator: "", to: &result)
        }
        
        result += "]"
        return result
    }
}

extension Stack: Equatable where Element: Equatable { }
let stackA = Stack([1, 2, 3])
let stackB = Stack([1, 2, 3])
print(stackA == stackB)

extension Stack: Hashable where Element: Hashable { }


// Better write codable as seperated
//extension Stack: Codable where Element: Codable { }
extension Stack: Decodable where Element: Decodable { }
extension Stack: Encodable where Element: Encodable { }

//var numbers = Stack<Int>()
//var numberArray = [1, 2, 3, 4, 5]
//var numbers = Stack(numberArray)

var numbers: Stack = [1, 2, 3, 4, 5]
numbers.push(4)
numbers.push(8)
numbers.push(15)
numbers.push(16)
print(numbers)
print(numbers.pop())
print(numbers.pop())
print(numbers.pop())
print(numbers.pop())

var names = Stack<String>()
names.push("Ryan")
names.push("Rlsnf")
names.push("Name1")
