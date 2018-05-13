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
    private typealias T = Int
    private let zero: T = 0
    private let one: T = 1
    
    func test0and0() {
        XCTAssertEqual(gcd(self.zero, self.zero), self.zero)
    }
    
    func testMAnd0() {
        let m: T = 2061517
        XCTAssertEqual(gcd(m, self.zero), m)
    }
    
    func test0AndN() {
        let n: T = 2061517
        XCTAssertEqual(gcd(self.zero, n), n)
    }
    
    func testCommutativity() {
        let a: T = 2061517
        let b: T = 624129
        XCTAssertEqual(gcd(a, b), gcd(b, a))
    }
    
    func testEqualMAndN() {
        let a: T = 624129
        XCTAssertEqual(gcd(a, a), a)
    }
    
    func testMIsMultipleOfN() {
        let a: T = 100
        let b: T = 20
        XCTAssertEqual(gcd(a, b), a)
    }
    
    func testNIsMultipleOfM() {
        let a: T = 20
        let b: T = 100
        XCTAssertEqual(gcd(a, b), a)
    }
    
    func testMIsPrime() {
        let a: T = 37
        let b: T = 600
        XCTAssertEqual(gcd(a, b), self.one)
    }
    
    func testNIsPrime() {
        let a: T = 600
        let b: T = 37
        XCTAssertEqual(gcd(a, b), self.one)
    }
    
    func testNonEdgeCase() {
        let a: T = 2061517
        let b: T = 624129
        let c: T = 18913
        XCTAssertEqual(gcd(a, b), c)
    }
    
    func testMIsNegative() {
        let a: T = -2061517
        let b: T = 624129
        let c: T = 18913
        XCTAssertEqual(gcd(a, b), c)
    }
    
    func testNIsNegative() {
        let a: T = 2061517
        let b: T = -624129
        let c: T = 18913
        XCTAssertEqual(gcd(a, b), c)
    }
    
    func testBothNegative() {
        let a: T = -2061517
        let b: T = -624129
        let c: T = 18913
        XCTAssertEqual(gcd(a, b), c)
    }
}


class GCDUnsignedIntegerTests: XCTestCase {
    private typealias T = UInt
    private let zero: T = 0
    private let one: T = 1
    
    func test0and0() {
        XCTAssertEqual(gcd(self.zero, self.zero), self.zero)
    }
    
    func testMAnd0() {
        let m: T = 2061517
        XCTAssertEqual(gcd(m, self.zero), m)
    }
    
    func test0AndN() {
        let n: T = 2061517
        XCTAssertEqual(gcd(self.zero, n), n)
    }
    
    func testCommutativity() {
        let a: T = 2061517
        let b: T = 624129
        XCTAssertEqual(gcd(a, b), gcd(b, a))
    }
    
    func testEqualMAndN() {
        let a: T = 624129
        XCTAssertEqual(gcd(a, a), a)
    }
    
    func testMIsMultipleOfN() {
        let a: T = 100
        let b: T = 20
        XCTAssertEqual(gcd(a, b), a)
    }
    
    func testNIsMultipleOfM() {
        let a: T = 20
        let b: T = 100
        XCTAssertEqual(gcd(a, b), a)
    }
    
    func testMIsPrime() {
        let a: T = 37
        let b: T = 600
        XCTAssertEqual(gcd(a, b), self.one)
    }
    
    func testNIsPrime() {
        let a: T = 600
        let b: T = 37
        XCTAssertEqual(gcd(a, b), self.one)
    }
    
    func testNonEdgeCase() {
        let a: T = 2061517
        let b: T = 624129
        let c: T = 18913
        XCTAssertEqual(gcd(a, b), c)
    }
}
