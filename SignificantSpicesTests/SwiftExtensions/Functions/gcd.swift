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
        let m: T = 2061517
        let n: T = 624129
        XCTAssertEqual(gcd(m, n), gcd(n, m))
    }
    
    func testEqualMAndN() {
        let mn: T = 624129
        XCTAssertEqual(gcd(mn, mn), mn)
    }
    
    func testMIsMultipleOfN() {
        let m: T = 100
        let n: T = 20
        XCTAssertEqual(gcd(m, n), n)
    }
    
    func testNIsMultipleOfM() {
        let m: T = 20
        let n: T = 100
        XCTAssertEqual(gcd(m, n), m)
    }
    
    func testMIsPrime() {
        let m: T = 37
        let n: T = 600
        XCTAssertEqual(gcd(m, n), self.one)
    }
    
    func testNIsPrime() {
        let m: T = 600
        let n: T = 37
        XCTAssertEqual(gcd(m, n), self.one)
    }
    
    func testNonEdgeCase() {
        let m: T = 2061517
        let n: T = 624129
        let r: T = 18913
        XCTAssertEqual(gcd(m, n), r)
    }
    
    func testMIsNegative() {
        let m: T = -2061517
        let n: T = 624129
        let r: T = 18913
        XCTAssertEqual(gcd(m, n), r)
    }
    
    func testNIsNegative() {
        let m: T = 2061517
        let n: T = -624129
        let r: T = 18913
        XCTAssertEqual(gcd(m, n), r)
    }
    
    func testBothAreNegative() {
        let m: T = -2061517
        let n: T = -624129
        let r: T = 18913
        XCTAssertEqual(gcd(m, n), r)
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
        let m: T = 2061517
        let n: T = 624129
        XCTAssertEqual(gcd(m, n), gcd(n, m))
    }
    
    func testEqualMAndN() {
        let mn: T = 624129
        XCTAssertEqual(gcd(mn, mn), mn)
    }
    
    func testMIsMultipleOfN() {
        let m: T = 100
        let n: T = 20
        XCTAssertEqual(gcd(m, n), n)
    }
    
    func testNIsMultipleOfM() {
        let m: T = 20
        let n: T = 100
        XCTAssertEqual(gcd(m, n), m)
    }
    
    func testMIsPrime() {
        let m: T = 37
        let n: T = 600
        XCTAssertEqual(gcd(m, n), self.one)
    }
    
    func testNIsPrime() {
        let m: T = 600
        let n: T = 37
        XCTAssertEqual(gcd(m, n), self.one)
    }
    
    func testNonEdgeCase() {
        let m: T = 2061517
        let n: T = 624129
        let r: T = 18913
        XCTAssertEqual(gcd(m, n), r)
    }
}
