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
    func testNilIn_NERT_Array() {
        let a: [_NERT] = [_NERT(), _NERT(), _NERT()]
        
        let nilInA: Bool = nil <> a
        XCTAssertFalse(nilInA)
        
        let nilNotInA: Bool = nil >< a
        XCTAssertTrue(nilNotInA)
    }
    
    func testNilNotIn_NERT_Array() {
        let a: [_NERT] = [_NERT(), _NERT(), _NERT()]
        
        let nilNotInA: Bool = nil >< a
        XCTAssertTrue(nilNotInA)
        
        let nilInA: Bool = nil <> a
        XCTAssertFalse(nilInA)
    }
    
    func testNilIn_ENRT_Array() {
        let a: [_ENRT] = [1, 2, 3]
        
        let nilInA: Bool = nil <> a
        XCTAssertFalse(nilInA)
        
        let nilNotInA: Bool = nil >< a
        XCTAssertTrue(nilNotInA)
    }
    
    func testNilNotIn_ENRT_Array() {
        let a: [_ENRT] = [1, 2, 3]
        
        let nilNotInA: Bool = nil >< a
        XCTAssertTrue(nilNotInA)
        
        let nilInA: Bool = nil <> a
        XCTAssertFalse(nilInA)
    }
    
    func testNilIn_ERT_Array() {
        let a: [_ERT] = [_ERT(1), _ERT(2), _ERT(3)]
        
        let nilInA: Bool = nil <> a
        XCTAssertFalse(nilInA)
        
        let nilNotInA: Bool = nil >< a
        XCTAssertTrue(nilNotInA)
    }
    
    func testNilNotIn_ERT_Array() {
        let a: [_ERT] = [_ERT(1), _ERT(2), _ERT(3)]
        
        let nilNotInA: Bool = nil >< a
        XCTAssertTrue(nilNotInA)
        
        let nilInA: Bool = nil <> a
        XCTAssertFalse(nilInA)
    }
}


class NERT_InOrNotInArrayTests: XCTestCase {
    func test_NERT_InArray() {
        let a: _NERT = _NERT()
        let b: _NERT = a
        let c: [_NERT] = [a, _NERT(), _NERT()]
        
        let aInC: Bool = a <> c
        XCTAssertTrue(aInC)
        
        let bInC: Bool = b <> c
        XCTAssertTrue(bInC)
        
        let aNotInC: Bool = a >< c
        XCTAssertFalse(aNotInC)
        
        let bNotInC: Bool = b >< c
        XCTAssertFalse(bNotInC)
    }
    
    func test_NERT_NotInArray() {
        let a: _NERT = _NERT()
        let b: _NERT = a
        let c: [_NERT] = [_NERT(), _NERT(), _NERT()]
        
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


class ENRT_InOrNotInArrayTests: XCTestCase {
    func test_ENRT_InArray() {
        let a: _ENRT = 1
        let b: _ENRT = 1
        let c: [_ENRT] = [a, 2, 3]
        
        let aInC: Bool = a <> c
        XCTAssertTrue(aInC)
        
        let bInC: Bool = b <> c
        XCTAssertTrue(bInC)
        
        let aNotInC: Bool = a >< c
        XCTAssertFalse(aNotInC)
        
        let bNotInC: Bool = b >< c
        XCTAssertFalse(bNotInC)
    }
    
    func test_ENRT_NotInArray() {
        let a: _ENRT = 1
        let b: _ENRT = 1
        let c: [_ENRT] = [2, 3, 4]
        
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


class ERT_InOrNotInArrayTests: XCTestCase {
    func test_ERT_InArray() {
        let a: _ERT = _ERT(1)
        let b: _ERT = _ERT(1)
        let c: [_ERT] = [a, _ERT(2), _ERT(3)]
        
        let aInC: Bool = a <> c
        XCTAssertTrue(aInC)
        
        let bInC: Bool = b <> c
        XCTAssertTrue(bInC)
        
        let aNotInC: Bool = a >< c
        XCTAssertFalse(aNotInC)
        
        let bNotInC: Bool = b >< c
        XCTAssertFalse(bNotInC)
    }
    
    func test_ERT_NotInArray() {
        let a: _ERT = _ERT(1)
        let b: _ERT = _ERT(1)
        let c: [_ERT] = [_ERT(2), _ERT(3), _ERT(4)]
        
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


class NilInOrNotInSetTests: XCTestCase {
    func testNilInSet() {
        let a: Set<Int> = Set([1, 2, 3])
        
        let nilInA: Bool = nil <> a
        XCTAssertFalse(nilInA)
        
        let nilNotInA: Bool = nil >< a
        XCTAssertTrue(nilNotInA)
    }
    
    func testNilNotIn_HNRT_Set() {
        let a: Set<Int> = Set([1, 2, 3])
        
        let nilNotInA: Bool = nil >< a
        XCTAssertTrue(nilNotInA)
        
        let nilInA: Bool = nil <> a
        XCTAssertFalse(nilInA)
    }
}


class Int_InOrNotInSetTests: XCTestCase {
    func testIntInSet() {
        let a: Int = 1
        let b: Int = a
        
        let c: Set<Int> = Set([a, 2, 3])
        
        let aInC: Bool = a <> c
        XCTAssertTrue(aInC)
        
        let bInC: Bool = b <> c
        XCTAssertTrue(bInC)
        
        let aNotInC: Bool = a >< c
        XCTAssertFalse(aNotInC)
        
        let bNotInC: Bool = b >< c
        XCTAssertFalse(bNotInC)
    }
    
    func testIntNotInSet() {
        let a: Int = 1
        let b: Int = a
        
        let c: Set<Int> = Set([2, 3, 4])
        
        let aInC: Bool = a <> c
        XCTAssertFalse(aInC)
        
        let bInC: Bool = b <> c
        XCTAssertFalse(bInC)
        
        let aNotInC: Bool = a >< c
        XCTAssertTrue(aNotInC)
        
        let bNotInC: Bool = b >< c
        XCTAssertTrue(bNotInC)
    }
}


// MARK: // Private
// MARK: Helper Types
private typealias _ENRT = Int /*Equatable Non-Reference Type*/
private class _NERT /*Non Equatable Reference Type*/ {}
private class _ERT: Equatable /*Equatable Reference Type*/ {
    init(_ value: Int) { self.value = value }
    private(set) var value: Int = 0
    static func ==(_ lhs: _ERT, _ rhs: _ERT) -> Bool {
        return lhs.value == rhs.value
    }
}
