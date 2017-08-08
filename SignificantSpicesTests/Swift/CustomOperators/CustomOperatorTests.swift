//
//  CustomOperatorTests.swift
//  SignificantSpices
//
//  Created by Jan Nash on 8/8/17.
//  Copyright © 2017 resmio. All rights reserved.
//

import XCTest
import SignificantSpices.Swift


class BoolInPlaceAndAssignment: XCTestCase {
    func testBoolInplaceAndAssignment1() {
        var a: Bool = true
        a &&= false
        XCTAssertFalse(a)
    }
    
    func testBoolInplaceAndAssignment2() {
        var a: Bool = true
        a &&= true
        XCTAssertTrue(a)
    }
    
    func testBoolInplaceAndAssignment3() {
        var a: Bool = false
        a &&= false
        XCTAssertFalse(a)
    }
    
    func testBoolInplaceAndAssignment4() {
        var a: Bool = false
        a &&= true
        XCTAssertFalse(a)
    }
}


class BoolInPlaceOrAssignment: XCTestCase {
    func testBoolInplaceOrAssignment1() {
        var a: Bool = true
        a ||= false
        XCTAssertTrue(a)
    }
    
    func testBoolInplaceOrAssignment2() {
        var a: Bool = true
        a ||= true
        XCTAssertTrue(a)
    }
    
    func testBoolInplaceOrAssignment3() {
        var a: Bool = false
        a ||= false
        XCTAssertFalse(a)
    }
    
    func testBoolInplaceOrAssignment4() {
        var a: Bool = false
        a ||= true
        XCTAssertTrue(a)
    }
}
