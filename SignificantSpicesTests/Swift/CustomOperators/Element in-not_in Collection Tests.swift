//
//  Element in-not_in Collection Tests.swift
//  SignificantSpices
//
//  Created by Jan Nash on 8/8/17.
//  Copyright © 2017 resmio. All rights reserved.
//

import XCTest
import SignificantSpices.Swift

//// MARK: Element "in" Collection
//infix operator <> : ComparisonPrecedence
//
//public func <> <T: Equatable>(l: T?, r: [T]) -> Bool {
//    guard let l: T = l else { return false }
//    return r.contains(l)
//}
//
//public func <> <T: Hashable>(l: T?, r: Set<T>) -> Bool {
//    guard let l: T = l else { return false }
//    return r.contains(l)
//}
//
//
//// MARK: Element "not in" Collection
//infix operator >< : ComparisonPrecedence
//
//public func >< <T: Equatable>(l: T?, r: [T]) -> Bool {
//    guard let l: T = l else { return true }
//    return !(r.contains(l))
//}
//
//public func >< <T: Hashable>(l: T?, r: Set<T>) -> Bool {
//    guard let l: T = l else { return true }
//    return !(r.contains(l))
//}

class NilInOrNotInArrayTests: XCTestCase {
    func testNilInArray() {
        let a: [Int] = [1, 2, 3]
        let nilInA: Bool = nil <> a
        XCTAssertFalse(nilInA)
    }
    
    func testNilNotInArray() {
        let a: [Int] = [1, 2, 3]
        let nilNotInA: Bool = nil >< a
        XCTAssertTrue(nilNotInA)
    }
}

class NonEquatableElementInOrNotInArrayTests: XCTestCase {
    class Foo: NSObject {}
    
    func testNonEquatableNSObjectInArray() {
        let a: Foo = Foo()
        let b: Foo = a
        let c: [Foo] = [a, Foo(), Foo()]
        
        let aInC: Bool = a <> c
        XCTAssertTrue(aInC)
        
        let bInC: Bool = b <> c
        XCTAssertTrue(bInC)
    }
}

class EquatableElementInOrNotInArrayTests: XCTestCase {
    
}

class NilInOrNotInSetTests: XCTestCase {
    func testNilInSet() {
        let a: Set<Int> = Set([1, 2, 3])
        let b: Bool = nil <> a
        XCTAssertFalse(b)
    }
    
    func testNilNotInSet() {
        let a: Set<Int> = Set([1, 2, 3])
        let b: Bool = nil >< a
        XCTAssertTrue(b)
    }
}

class HashableElementInOrNotInSetTests: XCTestCase {
    
}
