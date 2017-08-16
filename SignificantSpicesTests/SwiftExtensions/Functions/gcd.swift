//
//  gcd.swift
//  SignificantSpices
//
//  Created by Jan Nash on 8/15/17.
//  Copyright © 2017 resmio. All rights reserved.
//

import XCTest
import SignificantSpices


class GCDSignedIntegerTests: XCTestCase {
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


class GCDUnsignedIntegerTests: XCTestCase {
    func test0and0() {
        XCTAssertEqual(gcd(UInt(0), 0), 0)
    }
    
    func test0AndN() {
        let n: UInt = 2061517
        XCTAssertEqual(gcd(n, 0), n)
    }
    
    func testCommutativity() {
        let a: UInt = 2061517
        let b: UInt = 624129
        XCTAssertEqual(gcd(a, b), gcd(b, a))
    }
    
    func testEqualMAndN() {
        let a: UInt = 624129
        XCTAssertEqual(gcd(a, a), a)
    }
    
    func testOneIsMultipleOfOther() {
        let a: UInt = 20
        let b: UInt = 100
        XCTAssertEqual(gcd(a, b), a)
    }
    
    func testOneIsPrime() {
        let a: UInt = 37
        let b: UInt = 600
        XCTAssertEqual(gcd(a, b), 1)
    }
    
    func testNormalCase() {
        let a: UInt = 2061517
        let b: UInt = 624129
        let c: UInt = 18913
        XCTAssertEqual(gcd(a, b), c)
    }
}
