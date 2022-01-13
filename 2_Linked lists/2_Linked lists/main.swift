//
//  main.swift
//  2_Linked lists
//
//  Created by Ryan J. W. Kim on 2022/01/13.
//

import Foundation

//var start = CFAbsoluteTimeGetCurrent()
//var items = Array(1...200_000)
//
//while items.isEmpty == false {
//    items.remove(at: 0)
//}
//
//var end = CFAbsoluteTimeGetCurrent()
//print("Took \(end - start) seconds to get to 0")
//
//start = CFAbsoluteTimeGetCurrent()
//items = Array(1...200_000)
//
//while items.isEmpty == false {
//    items.removeLast()
//}
//end = CFAbsoluteTimeGetCurrent()
//print("Took \(end - start) seconds to get to 0")
//
//
//final class LinkedListNode<Element> {
//    var value: Element
//    var next: LinkedListNode?
//
//    init(value: Element, next: LinkedListNode? = nil) {
//        self.value = value
//        self.next = next
//    }
//}
//
//
////final class LinkedList<Element> {
////    var start: LinkedListNode<Element>?
////}
//
////let third = LinkedListNode(value: 5)
////let second = LinkedListNode(value: 3, next: third)
////let first = LinkedListNode(value: 1, next: second)
////let list = LinkedList<Int>()
////list.start = first
//
//final class LinkedList<Element>: ExpressibleByArrayLiteral, Sequence {
//    var start: LinkedListNode<Element>?
//
//    init(arrayLiteral elements: Element...) {
//        for element in elements.reversed() {
//            start = LinkedListNode(value: element, next: start)
//        }
//    }
//
//    init(array: [Element]) {
//        for element in array.reversed() {
//            start = LinkedListNode(value: element, next: start)
//        }
//    }
//
//    func makeIterator() -> LinkedListIterator<Element> {
//        LinkedListIterator(current: start)
//    }
//}
//
//struct LinkedListIterator<Element>: IteratorProtocol {
//    var current: LinkedListNode<Element>?
//
//    mutating func next() -> LinkedListNode<Element>? {
//        defer { current = current?.next }
//        return current
//    }
//}

//let list: LinkedList<Int> = [1, 3, 5]

//let numbers = [1, 3, 5]
//let list = LinkedList(array: numbers)
//
//var currentNode = list.start
//
//while let node = currentNode {
//    print(node.value, terminator: " ")
//    currentNode = node.next
//}

//
//for node in list {
//    print(node.value)
//}

//let list = LinkedList(array: Array(1...200_000))
//start = CFAbsoluteTimeGetCurrent()
//
//while let start = list.start {
//    list.start = start.next
//}
//end = CFAbsoluteTimeGetCurrent()
//print("Took \(end - start) seconds to get to 0")


struct LinkedList<Element> {
    var start: LinkedListNode<Element>
}

indirect enum LinkedListNode<Element> {
    case node(value: Element, next: LinkedListNode<Element>?)
}

var third = LinkedListNode.node(value: 5, next: nil)
var second = LinkedListNode.node(value: 3, next: third)
var first = LinkedListNode.node(value: 1, next: second)

var list = LinkedList(start: first)
var currentNode = list.start


