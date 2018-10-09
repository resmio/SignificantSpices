//
//  Sequence (noneSatisfy).swift
//  SignificantSpices
//
//  Created by Jan Nash on 8/14/17.
//  Copyright © 2017 resmio. All rights reserved.
//

import XCTest
import SignificantSpices


class SequenceNoneTests: XCTestCase {
    func testSequenceNone0() {
        let s: [Int] = []
        let lt6: (Int) -> Bool = { $0 < 6 }
        
        XCTAssertTrue(s.noneSatisfy(lt6))
    }
    
    func testSequenceNone1() {
        let s: [Int] = [1, 2, 3, 4, 5]
        let lt1: (Int) -> Bool = { $0 < 1 }
        
        XCTAssertTrue(s.noneSatisfy(lt1))
    }
    
    func testSequenceNone2() {
        let s: [Int] = [1, 2, 3, 4, 5]
        let lt6: (Int) -> Bool = { $0 < 6 }
        
        XCTAssertFalse(s.noneSatisfy(lt6))
    }
}
