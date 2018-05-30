//
//  Sequence (mapToDict).swift
//  SignificantSpicesTests
//
//  Created by Jan Nash (resmio) on 30.05.18.
//  Copyright © 2018 resmio. All rights reserved.
//

import XCTest
import SignificantSpices


class SequenceMapToDictTests: XCTestCase {
    func testSequenceMapToDictTransformingElement() {
        let s: [Double] = [1, 2, 3, 4, 5]
        let d: [Double: Double] = s.mapToDict({ ($0, pow($0, 2)) })
        XCTAssertEqual(d, [1: 1, 2: 4, 3: 9, 4: 16, 5: 25])
    }
    
    func testSequenceMapToDictTransformingValue() {
        let s: [(Double, Double)] = [(1, 1), (2, 2), (3, 3), (4, 4), (5, 5)]
        let d: [Double: Double] = s.mapToDict({ pow($0, 2) })
        XCTAssertEqual(d, [1: 1, 2: 4, 3: 9, 4: 16, 5: 25])
    }
}
