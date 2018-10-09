//
//  (T) -> Bool Negation.swift
//  SignificantSpices
//
//  Created by Jan Nash on 8/14/17.
//  Copyright © 2017 resmio. All rights reserved.
//

import XCTest
import SignificantSpices


class BoolClosureNegationTests: XCTestCase {
    func testBoolClosureNegation() {
        let closure: (Int) -> Bool = { $0 == 5 }
        let negatedClosure: (Int) -> Bool = !closure
        XCTAssertFalse(negatedClosure(5))
    }
}
