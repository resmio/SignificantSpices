//
//  Element in-not_in Collection.swift
//  SignificantSpices
//
//  Created by Jan Nash on 8/8/17.
//  Copyright © 2017 resmio. All rights reserved.
//

import XCTest
import SignificantSpices


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
private class _HERT: _ERT, Hashable /*Hashable Equatable Reference Type*/ {
    var hashValue: Int { return self.value.hashValue }
}


class NilInOrNotInArrayTests: XCTestCase {
    func testNilInOrNotIn_NERT_Array() {
        let a: [_NERT] = [_NERT(), _NERT(), _NERT()]
        
        XCTAssertFalse(nil <> a)
        XCTAssertTrue(nil >< a)
    }
    
    func testNilInOrNotIn_ENRT_Array() {
        let a: [_ENRT] = [1, 2, 3]
        
        XCTAssertFalse(nil <> a)
        XCTAssertTrue(nil >< a)
    }
    
    func testNilInOrNotIn_ERT_Array() {
        let a: [_ERT] = [_ERT(1), _ERT(2), _ERT(3)]
        
        XCTAssertFalse(nil <> a)
        XCTAssertTrue(nil >< a)
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
    func testNilInOrNotInSet() {
        let a: Set<Int> = [1, 2, 3]
        
        XCTAssertFalse(nil <> a)
        XCTAssertTrue(nil >< a)
    }
}


class ENRT_InOrNotInSetTests: XCTestCase {
    func test_ENRT_InSet() {
        let a: _ENRT = 1
        let b: _ENRT = 1
        
        let c: Set<_ENRT> = [a, 2, 3]
        
        XCTAssertTrue(a <> c)
        XCTAssertFalse(a >< c)
        
        XCTAssertTrue(b <> c)
        XCTAssertFalse(b >< c)
    }
    
    func test_ENRT_NotInSet() {
        let a: _ENRT = 1
        let b: Set<_ENRT> = [2, 3, 4]
        
        XCTAssertFalse(a <> b)
        XCTAssertTrue(a >< b)
    }
}


class HERT_InOrNotInSetTests: XCTestCase {
    func test_HERT_InSet() {
        let a: _HERT = _HERT(1)
        let b: _HERT = _HERT(1)
        
        let c: Set<_HERT> = [a, _HERT(2), _HERT(3)]
        
        XCTAssertTrue(a <> c)
        XCTAssertFalse(a >< c)
        
        XCTAssertTrue(b <> c)
        XCTAssertFalse(b >< c)
    }
    
    func test_HERT_NotInSet() {
        let a: _HERT = _HERT(1)
        let b: Set<_HERT> = [_HERT(2), _HERT(3), _HERT(4)]
        
        XCTAssertFalse(a <> b)
        XCTAssertTrue(a >< b)
    }
}
