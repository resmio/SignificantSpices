//
//  gcd.swift
//  SignificantSpices
//
//  Created by Jan Nash on 8/15/17.
//  Copyright © 2017 resmio. All rights reserved.
//

import XCTest
import SignificantSpices


class GcdTests: XCTestCase {
    func test0and0() {
        XCTAssertEqual(gcd(0, 0), 0)
    }
    
    func test0AndN() {
        let n: Int = 2061517
        XCTAssertEqual(gcd(n, 0), n)
    }
    
    func testCommutativity() {
        let a: Int = 2061517
        let b: Int = 624129
        XCTAssertEqual(gcd(a, b), gcd(b, a))
    }
    
    func testEqualMAndN() {
        let a: Int = 624129
        XCTAssertEqual(gcd(a, a), a)
    }
    
    func testOneIsMultipleOfOther() {
        let a: Int = 20
        let b: Int = 100
        XCTAssertEqual(gcd(a, b), a)
    }
    
    func testOneIsPrime() {
        let a: Int = 37
        let b: Int = 600
        XCTAssertEqual(gcd(a, b), 1)
    }
    
    func testNormalCase() {
        let a: Int = 2061517
        let b: Int = 624129
        let c: Int = 18913
        XCTAssertEqual(gcd(a, b), c)
    }
    
    func testNormalCaseOneNegative() {
        let a: Int = -2061517
        let b: Int = 624129
        let c: Int = 18913
        XCTAssertEqual(gcd(a, b), c)
    }
    
    func testNormalCaseTheOtherNegative() {
        let a: Int = 2061517
        let b: Int = -624129
        let c: Int = 18913
        XCTAssertEqual(gcd(a, b), c)
    }
    
    func testNormalCaseTheBothNegative() {
        let a: Int = -2061517
        let b: Int = -624129
        let c: Int = 18913
        XCTAssertEqual(gcd(a, b), c)
    }
}
