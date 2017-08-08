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
        
        XCTAssertFalse(nil <> a)
        XCTAssertTrue(nil >< a)
    }
    
    func testNilNotIn_NERT_Array() {
        let a: [_NERT] = [_NERT(), _NERT(), _NERT()]
        
        XCTAssertTrue(nil >< a)
        XCTAssertFalse(nil <> a)
    }
    
    func testNilIn_ENRT_Array() {
        let a: [_ENRT] = [1, 2, 3]
        
        XCTAssertFalse(nil <> a)
        XCTAssertTrue(nil >< a)
    }
    
    func testNilNotIn_ENRT_Array() {
        let a: [_ENRT] = [1, 2, 3]
        
        XCTAssertTrue(nil >< a)
        XCTAssertFalse(nil <> a)
    }
    
    func testNilIn_ERT_Array() {
        let a: [_ERT] = [_ERT(1), _ERT(2), _ERT(3)]
        
        XCTAssertFalse(nil <> a)
        XCTAssertTrue(nil >< a)
    }
    
    func testNilNotIn_ERT_Array() {
        let a: [_ERT] = [_ERT(1), _ERT(2), _ERT(3)]
        
        XCTAssertTrue(nil >< a)
        XCTAssertFalse(nil <> a)
    }
}


class NERT_InOrNotInArrayTests: XCTestCase {
    func test_NERT_InArray() {
        let a: _NERT = _NERT()
        let b: [_NERT] = [a, _NERT(), _NERT()]
        
        XCTAssertTrue(a <> b)
        XCTAssertFalse(a >< b)
    }
    
    func test_NERT_NotInArray() {
        let a: _NERT = _NERT()
        let b: [_NERT] = [_NERT(), _NERT(), _NERT()]
        
        XCTAssertTrue(a >< b)
        XCTAssertFalse(a <> b)
    }
}


class ENRT_InOrNotInArrayTests: XCTestCase {
    func test_ENRT_InArray() {
        let a: _ENRT = 1
        let b: _ENRT = 1
        let c: [_ENRT] = [a, 2, 3]
        
        XCTAssertTrue(a <> c)
        XCTAssertFalse(a >< c)
        
        XCTAssertTrue(b <> c)
        XCTAssertFalse(b >< c)
    }
    
    func test_ENRT_NotInArray() {
        let a: [_ENRT] = [2, 3, 4]
        
        XCTAssertTrue(1 >< a)
        XCTAssertFalse(1 <> a)
    }
}


class ERT_InOrNotInArrayTests: XCTestCase {
    func test_ERT_InArray() {
        let a: _ERT = _ERT(1)
        let b: _ERT = _ERT(1)
        let c: [_ERT] = [a, _ERT(2), _ERT(3)]
        
        XCTAssertTrue(a <> c)
        XCTAssertFalse(a >< c)
        
        XCTAssertTrue(b <> c)
        XCTAssertFalse(b >< c)
    }
    
    func test_ERT_NotInArray() {
        let a: _ERT = _ERT(1)
        let b: [_ERT] = [_ERT(2), _ERT(3), _ERT(4)]
        
        XCTAssertTrue(a >< b)
        XCTAssertFalse(a <> b)
    }
}


class NilInOrNotInSetTests: XCTestCase {
    func testNilInSet() {
        let a: Set<Int> = Set([1, 2, 3])
        
        XCTAssertFalse(nil <> a)
        XCTAssertTrue(nil >< a)
    }
    
    func testNilNotIn_HNRT_Set() {
        let a: Set<Int> = Set([1, 2, 3])
        
        XCTAssertTrue(nil >< a)
        XCTAssertFalse(nil <> a)
    }
}


class Int_InOrNotInSetTests: XCTestCase {
    func testIntInSet() {
        let a: Int = 1
        let b: Int = 1
        
        let c: Set<Int> = Set([a, 2, 3])
        
        XCTAssertTrue(a <> c)
        XCTAssertFalse(a >< c)
        
        XCTAssertTrue(b <> c)
        XCTAssertFalse(b >< c)
    }
    
    func testIntNotInSet() {
        let a: Int = 1
        let b: Set<Int> = Set([2, 3, 4])
        
        XCTAssertFalse(a <> b)
        XCTAssertTrue(a >< b)
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