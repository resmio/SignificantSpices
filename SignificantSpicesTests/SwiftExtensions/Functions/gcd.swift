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
    
    func testMAnd0() {
        let m: Int = 2061517
        XCTAssertEqual(gcd(m, 0), m)
    }
    
    func test0AndN() {
        let n: Int = 2061517
        XCTAssertEqual(gcd(0, n), n)
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
    
    func testMIsMultipleOfN() {
        let a: Int = 100
        let b: Int = 20
        XCTAssertEqual(gcd(a, b), a)
    }
    
    func testNIsMultipleOfM() {
        let a: Int = 20
        let b: Int = 100
        XCTAssertEqual(gcd(a, b), a)
    }
    
    func testMIsPrime() {
        let a: Int = 37
        let b: Int = 600
        XCTAssertEqual(gcd(a, b), 1)
    }
    
    func testNIsPrime() {
        let a: Int = 600
        let b: Int = 37
        XCTAssertEqual(gcd(a, b), 1)
    }
    
    func testNonEdgeCase() {
        let a: Int = 2061517
        let b: Int = 624129
        let c: Int = 18913
        XCTAssertEqual(gcd(a, b), c)
    }
    
    func testMIsNegative() {
        let a: Int = -2061517
        let b: Int = 624129
        let c: Int = 18913
        XCTAssertEqual(gcd(a, b), c)
    }
    
    func testNIsNegative() {
        let a: Int = 2061517
        let b: Int = -624129
        let c: Int = 18913
        XCTAssertEqual(gcd(a, b), c)
    }
    
    func testBothNegative() {
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
    
    func testMAnd0() {
        let m: UInt = 2061517
        XCTAssertEqual(gcd(m, 0), m)
    }
    
    func test0AndN() {
        let n: UInt = 2061517
        XCTAssertEqual(gcd(0, n), n)
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
    
    func testMIsMultipleOfN() {
        let a: UInt = 100
        let b: UInt = 20
        XCTAssertEqual(gcd(a, b), a)
    }
    
    func testNIsMultipleOfM() {
        let a: UInt = 20
        let b: UInt = 100
        XCTAssertEqual(gcd(a, b), a)
    }
    
    func testMIsPrime() {
        let a: UInt = 37
        let b: UInt = 600
        XCTAssertEqual(gcd(a, b), 1)
    }
    
    func testNIsPrime() {
        let a: UInt = 600
        let b: UInt = 37
        XCTAssertEqual(gcd(a, b), 1)
    }
    
    func testNonEdgeCase() {
        let a: UInt = 2061517
        let b: UInt = 624129
        let c: UInt = 18913
        XCTAssertEqual(gcd(a, b), c)
    }
}
