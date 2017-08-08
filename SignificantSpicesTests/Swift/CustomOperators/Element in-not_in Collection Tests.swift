//
//  Element in-not_in Collection Tests.swift
//  SignificantSpices
//
//  Created by Jan Nash on 8/8/17.
//  Copyright © 2017 resmio. All rights reserved.
//

import XCTest
import SignificantSpices.Swift


class NilInOrNotInArrayTests: XCTestCase {
    func testNilInNonEquatableNSObjArray() {
        let a: [_NSObjFoo] = [_NSObjFoo(), _NSObjFoo(), _NSObjFoo()]
        let nilInA: Bool = nil <> a
        XCTAssertFalse(nilInA)
    }
    
    func testNilNotInNonEquatableNSObjArray() {
        let a: [_NSObjFoo] = [_NSObjFoo(), _NSObjFoo(), _NSObjFoo()]
        let nilNotInA: Bool = nil >< a
        XCTAssertTrue(nilNotInA)
    }
    
    func testNilInEquatableNonNSObjArray() {
        let a: [Int] = [1, 2, 3]
        let nilInA: Bool = nil <> a
        XCTAssertFalse(nilInA)
    }
    
    func testNilNotInEquatableNonNSObjArray() {
        let a: [Int] = [1, 2, 3]
        let nilNotInA: Bool = nil >< a
        XCTAssertTrue(nilNotInA)
    }
    
    func testNilInEquatableNSObjArray() {
        let a: [_EqNSObjFoo] = [_EqNSObjFoo(1), _EqNSObjFoo(2), _EqNSObjFoo(3)]
        let nilInA: Bool = nil <> a
        XCTAssertFalse(nilInA)
    }
    
    func testNilNotInEquatableNSObjArray() {
        let a: [_EqNSObjFoo] = [_EqNSObjFoo(1), _EqNSObjFoo(2), _EqNSObjFoo(3)]
        let nilNotInA: Bool = nil >< a
        XCTAssertTrue(nilNotInA)
    }
}

class NonEquatableInOrNotInArrayTests: XCTestCase {
    func testNonEquatableInArray() {
        let a: _Foo = _Foo()
        let b: _Foo = a
        let c: [_Foo] = [a, _Foo(), _Foo()]
        
        let aInC: Bool = a <> c
        XCTAssertTrue(aInC)
        
        let bInC: Bool = b <> c
        XCTAssertTrue(bInC)
        
        let aNotInC: Bool = a >< c
        XCTAssertFalse(aNotInC)
        
        let bNotInC: Bool = b >< c
        XCTAssertFalse(bNotInC)
    }
    
    func testNonEquatableNotInArray() {
        let a: _Foo = _Foo()
        let b: _Foo = a
        let c: [_Foo] = [_Foo(), _Foo(), _Foo()]
        
        let aNotInC: Bool = a >< c
        XCTAssertTrue(aNotInC)
        
        let bNotInC: Bool = b >< c
        XCTAssertTrue(bNotInC)
        
        let aInC: Bool = a <> c
        XCTAssertFalse(aInC)
        
        let bInC: Bool = b <> c
        XCTAssertFalse(bInC)
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


// MARK: // Private
// MARK: Private Helper Classes
private class _Foo {}
private class _NSObjFoo: NSObject {}
private class _EqNSObjFoo: NSObject {
    init(_ value: Int) {
        self.value = value
    }
    
    private(set) var value: Int = 0
    
    static func ==(_ lhs: _EqNSObjFoo, _ rhs: _EqNSObjFoo) -> Bool {
        return lhs.value == rhs.value
    }
}
