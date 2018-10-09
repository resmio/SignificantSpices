//
//  Sequence (forEachWhereDo).swift
//  SignificantSpicesTests
//
//  Created by Jan Nash (resmio) on 09.10.18.
//  Copyright © 2018 resmio. All rights reserved.
//

import XCTest
import SignificantSpices


class SequenceForEachWhereDoTests: XCTestCase {
    func testSequenceForEachWhereDo() {
        let s: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        var out: [Int] = []
        let condition: (Int) -> Bool = { $0 < 5 }
        
        s.forEach(where: condition, do: { out.append($0) })
        
        XCTAssertEqual(out, s.filter(condition))
    }
}
