//
//  Optional String Interpolation Tests.swift
//  SignificantSpices
//
//  Created by Jan Nash on 8/9/17.
//  Copyright © 2017 resmio. All rights reserved.
//

import XCTest
import SignificantSpices.Swift


class OptionalStringInterpolationTests: XCTestCase {
    func testOptionalStringInterpolationOperatorForNone() {
        let optional: Int? = nil
        let _default: String = "This optional seems to be nil"
        XCTAssertEqual("\(optional ??? _default)", _default)
    }
    
    func testOptionalStringInterpolationOperatorForSome() {
        let optional: Int? = 42
        let _default: String = "This optional seems to be nil"
        XCTAssertEqual("\(optional ??? _default)", "42")
    }
    
    func testDefaultOptionalStringInterpolationOperatorForNone() {
        let optional: Int? = nil
        XCTAssertEqual("\(???optional)", "nil")
    }
    
    func testDefaultOptionalStringInterpolationOperatorForSome() {
        let optional: Int? = 42
        XCTAssertEqual("\(???optional)", "42")
    }
}
