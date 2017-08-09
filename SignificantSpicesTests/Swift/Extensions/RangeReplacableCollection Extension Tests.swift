//
//  RangeReplacableCollection Extension Tests.swift
//  SignificantSpices
//
//  Created by Jan Nash on 8/9/17.
//  Copyright © 2017 resmio. All rights reserved.
//

import XCTest
import SignificantSpices.Swift


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


class RangeReplaceableCollectionExtensionTests: XCTestCase {
    func testRemove_ENRT_fromArray() {
        var a: [_ENRT] = [1, 2, 3, 3, 3, 4, 5]
        
        a.remove(3)
        XCTAssertEqual(a, [1, 2, 3, 3, 4, 5])
        
        a.remove(3)
        XCTAssertEqual(a, [1, 2, 3, 4, 5])
        
        a.remove(3)
        XCTAssertEqual(a, [1, 2, 4, 5])
        
        a.remove(3)
        XCTAssertEqual(a, [1, 2, 4, 5])
    }
    
    func testRemove_NERT_fromArray() {
        let a: _NERT = _NERT()
        let b: _NERT = _NERT()
        let c: _NERT = _NERT()
        let d: _NERT = _NERT()
        let e: _NERT = _NERT()
        
        var f: [_NERT] = [a, b, c, c, c, d, e]
        
        f.remove(c)
        
        XCTAssertEqual(f.count, 6)
        for (l, r) in zip(f, [a, b, c, c, d, e]) {
            XCTAssert(l === r)
        }
        
        f.remove(c)

        XCTAssertEqual(f.count, 5)
        for (l, r) in zip(f, [a, b, c, d, e]) {
            XCTAssert(l === r)
        }
        
        f.remove(c)
        
        XCTAssertEqual(f.count, 4)
        for (l, r) in zip(f, [a, b, d, e]) {
            XCTAssert(l === r)
        }
        
        f.remove(c)
        
        XCTAssertEqual(f.count, 4)
        for (l, r) in zip(f, [a, b, d, e]) {
            XCTAssert(l === r)
        }
    }
    
    func testRemove_ERT_fromArray() {
        let a: _ERT = _ERT(3)
        let b: _ERT = _ERT(3)
        let c: _ERT = _ERT(3)
        
        var d: [_ERT] = [_ERT(1), _ERT(2), a, b, c, _ERT(4), _ERT(5)]
        
        d.remove(a)
        
        XCTAssertEqual(d, [_ERT(1), _ERT(2), b, c, _ERT(4), _ERT(5)])
        XCTAssert(d[2] === b)
        XCTAssert(d[3] === c)
        
        // Intentionally removing c here. .remove should always remove
        // the first element that fits the predicate, which, in case
        // of Equatable elements, is any object that is `equal` to
        // the member given to the function call.
        // In this specific case, since b == c and b is first in the
        // array, b should be removed.
        d.remove(c)
        
        XCTAssertEqual(d, [_ERT(1), _ERT(2), c, _ERT(4), _ERT(5)])
        XCTAssert(d[2] === c)
        
        d.remove(c)
        
        XCTAssertEqual(d, [_ERT(1), _ERT(2), _ERT(4), _ERT(5)])
        
        d.remove(a)
        
        XCTAssertEqual(d, [_ERT(1), _ERT(2), _ERT(4), _ERT(5)])
    }
}
