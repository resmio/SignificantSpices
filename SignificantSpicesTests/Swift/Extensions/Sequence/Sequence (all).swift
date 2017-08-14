//
//  Sequence (all).swift
//  SignificantSpices
//
//  Created by Jan Nash on 8/14/17.
//  Copyright © 2017 resmio. All rights reserved.
//

import XCTest
import SignificantSpices.Swift


class SequenceAllTests: XCTestCase {
    func testSequenceAll0() {
        let s: [Int] = []
        let lt6: (Int) -> Bool = { $0 < 6 }
        XCTAssertTrue(s.all(fulfill: lt6))
    }
    
    func testSequenceAll1() {
        let s: [Int] = [1, 2, 3, 4, 5]
        let lt6: (Int) -> Bool = { $0 < 6 }
        XCTAssertTrue(s.all(fulfill: lt6))
    }
    
    func testSequenceAll2() {
        let s: [Int] = [1, 2, 3, 4, 5]
        let gt1: (Int) -> Bool = { $0 > 1 }
        XCTAssertFalse(s.all(fulfill: gt1))
    }
}
