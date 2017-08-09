//
//  Set Combination Tests.swift
//  SignificantSpices
//
//  Created by Jan Nash on 8/8/17.
//  Copyright © 2017 resmio. All rights reserved.
//

import XCTest
import SignificantSpices.Swift


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
