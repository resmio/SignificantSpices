//
//  AutomaticLazyOptional.swift
//  SignificantSpicesTests
//
//  Created by Jan Nash (resmio) on 08.05.18.
//  Copyright © 2018 resmio. All rights reserved.
//

import XCTest
import SignificantSpices.Swift


class AutomaticLazyOptionalTests: XCTestCase {
    func testGetterReturnsCorrectValue() {
        let testString: String = "Foo"
        var lzy: AutomaticLazyOptional<String> = AutomaticLazyOptional({ return testString })
        XCTAssertEqual(lzy¡, testString)
    }
    
    func testValueCreationIsEvaluatedLazily() {
        var mustNotBeEvaluatedYet: Bool = true
        var lzy: AutomaticLazyOptional<String> = AutomaticLazyOptional({
            if mustNotBeEvaluatedYet {
                XCTFail("The value creation closure should not have been evaluated yet")
            }
            return "Foo"
        })
        mustNotBeEvaluatedYet = false
        let _: String = lzy¡
    }
    
    func testValueCaching() {
        var evalTimes: Int = 0
        var lzy: AutomaticLazyOptional<String> = AutomaticLazyOptional({
            evalTimes += 1
            if evalTimes > 1 {
                XCTFail("The value creation closure should not have been evaluated more than once")
            }
            return "Foo"
        })
        
        for _ in 0..<10 {
            let _: String = lzy¡
        }
    }
    
    func testClear() {
        class Foo {}
        var lzy: AutomaticLazyOptional<Foo> = AutomaticLazyOptional({ Foo() })
        weak var foo: Foo? = lzy¡
        
        XCTAssertNotNil(foo)
        lzy.clear()
        XCTAssertNil(foo)
    }
}
