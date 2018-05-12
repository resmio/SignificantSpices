//
//  LazyClearable.swift
//  SignificantSpicesTests
//
//  Created by Jan Nash (resmio) on 08.05.18.
//  Copyright © 2018 resmio. All rights reserved.
//

import XCTest
import SignificantSpices.Swift


class LazyClearableTests: XCTestCase {
    func testGetterReturnsCorrectValue() {
        let testString: String = "Foo"
        var lzy: LazyClearable<String> = LazyClearable({ return testString })
        XCTAssertEqual(lzy.get(), testString)
    }
    
    func testValueCreationIsEvaluatedLazily() {
        var mustNotBeEvaluatedYet: Bool = true
        var lzy: LazyClearable<String> = LazyClearable({
            if mustNotBeEvaluatedYet {
                XCTFail("The value creation closure should not have been evaluated yet")
            }
            return "Foo"
        })
        mustNotBeEvaluatedYet = false
        let _: String = lzy.get()
    }
    
    func testValueCaching() {
        var evalTimes: Int = 0
        var lzy: LazyClearable<String> = LazyClearable({
            evalTimes += 1
            if evalTimes > 1 {
                XCTFail("The value creation closure should not have been evaluated more than once")
            }
            return "Foo"
        })
        
        for _ in 0..<10 {
            let _: String = lzy.get()
        }
    }
    
    func testClear() {
        class Foo {}
        var lzy: LazyClearable<Foo> = LazyClearable({ Foo() })
        weak var foo: Foo? = lzy.get()
        
        XCTAssertNotNil(foo)
        lzy.clear()
        XCTAssertNil(foo)
    }
}
