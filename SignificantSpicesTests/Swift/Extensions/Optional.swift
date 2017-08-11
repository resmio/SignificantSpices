//
//  Optional.swift
//  SignificantSpices
//
//  Created by Jan Nash on 8/9/17.
//  Copyright © 2017 resmio. All rights reserved.
//

import XCTest
import SignificantSpices.Swift


class OptionalExtensionTests: XCTestCase {
    func testNilCollectionIsNilOrEmpty() {
        let a: [Int]? = nil
        XCTAssertTrue(a.isNilOrEmpty)
    }
    
    func testEmptyCollectionIsNilOrEmpty() {
        let a: [Int]? = []
        XCTAssertTrue(a.isNilOrEmpty)
    }
    
    func testNonEmptyCollectionIsNilOrEmpty() {
        let a: [Int]? = [1]
        XCTAssertFalse(a.isNilOrEmpty)
    }
    
    func testNilStringIsNilOrEmpty() {
        let a: String? = nil
        XCTAssertTrue(a.isNilOrEmpty)
    }
    
    func testEmptyStringIsNilOrEmpty() {
        let a: String? = ""
        XCTAssertTrue(a.isNilOrEmpty)
    }
    
    func testNonEmptyStringIsNilOrEmpty() {
        let a: String? = "42"
        XCTAssertFalse(a.isNilOrEmpty)
    }
}
