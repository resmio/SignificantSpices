//
//  BoolInPlaceANDAssignmentTests.swift
//  SignificantSpices
//
//  Created by Jan Nash on 8/8/17.
//  Copyright © 2017 resmio. All rights reserved.
//

import XCTest
import SignificantSpices.Swift


class BoolInPlaceANDAssignment: XCTestCase {
    func testFalseFalse() {
        var a: Bool = false
        a &&= false
        XCTAssertFalse(a)
    }
    
    func testFalseTrue() {
        var a: Bool = false
        a &&= true
        XCTAssertFalse(a)
    }
    
    func testTrueFalse() {
        var a: Bool = true
        a &&= false
        XCTAssertFalse(a)
    }
    
    func testTrueTrue() {
        var a: Bool = true
        a &&= true
        XCTAssertTrue(a)
    }
}
