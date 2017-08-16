//
//  Collection (safe-subscript).swift
//  SignificantSpices
//
//  Created by Jan Nash on 8/9/17.
//  Copyright © 2017 resmio. All rights reserved.
//

import XCTest
import SignificantSpices.Swift


class CollectionSafeSubscriptTests: XCTestCase {
    func testSafeSubscriptReturnsNilOnIndexOutOfBounds() {
        XCTAssertNil([1, 2, 3, 4][safe: 4])
    }
    
    func testSafeSubscriptReturnsElementOnIndexInBounds() {
        XCTAssertEqual([1, 2, 3, 4][safe: 3], 4)
    }
}
