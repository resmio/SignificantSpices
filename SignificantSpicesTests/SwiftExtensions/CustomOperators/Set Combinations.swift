//
//  Set Combinations.swift
//  SignificantSpices
//
//  Created by Jan Nash on 8/8/17.
//  Copyright © 2017 resmio. All rights reserved.
//

import XCTest
import SignificantSpices


class SetCombinationTests: XCTestCase {
    let a: Set<Int> = [1, 2, 3]
    let b: Set<Int> = [2, 3, 4]
    
    func testIntersection() {
        XCTAssertEqual(a § b, [2, 3])
    }
    
    func testUnion() {
        XCTAssertEqual(a + b, [1, 2, 3, 4])
    }
    
    func testSubtraction() {
        XCTAssertEqual(a - b, [1])
    }
    
    func testSymmetricDifference() {
        XCTAssertEqual(a ^ b, [1, 4])
    }
}


class SetCompoundCombinationTests: XCTestCase {
    let a: Set<Int> = [1, 2, 3]
    let b: Set<Int> = [2, 3, 4]
    
    func testCompoundIntersection() {
        var a: Set<Int> = self.a
        a §= b
        XCTAssertEqual(a, [2, 3])
    }
    
    func testCompoundUnion() {
        var a: Set<Int> = self.a
        a += b
        XCTAssertEqual(a, [1, 2, 3, 4])
    }
    
    func testCompoundSubtraction() {
        var a: Set<Int> = self.a
        a -= b
        XCTAssertEqual(a, [1])
    }
    
    func testCompoundSymmetricDifference() {
        var a: Set<Int> = self.a
        a ^= b
        XCTAssertEqual(a, [1, 4])
    }
}
