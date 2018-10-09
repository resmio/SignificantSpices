//
//  Sequence (firstNfulfilling).swift
//  SignificantSpices
//
//  Created by Jan Nash on 8/14/17.
//  Copyright © 2017 resmio. All rights reserved.
//

import XCTest
import SignificantSpices


class SequenceFirstNfulfillingTests: XCTestCase {
    func testSequenceFirstNfulfilling0() {
        let s: [Int] = []
        let gt4: (Int) -> Bool = { $0 > 4 }
        let c: [Int] = s.first(3, fulfilling: gt4)
        
        XCTAssertTrue(c.isEmpty)
    }
    
    func testSequenceFirstNfulfilling1() {
        let s: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        let gt4: (Int) -> Bool = { $0 > 4 }
        let c: [Int] = s.first(3, fulfilling: gt4)
        
        XCTAssertEqual(c, [5, 6, 7])
    }
}
