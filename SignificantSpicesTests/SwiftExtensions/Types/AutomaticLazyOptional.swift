//
//  AutomaticLazyOptional.swift
//  SignificantSpicesTests
//
//  Created by Jan Nash (resmio) on 08.05.18.
//  Copyright © 2018 resmio. All rights reserved.
//

import XCTest
import SignificantSpices


class AutomaticLazyOptionalTests: XCTestCase {
    func testGetterReturnsCorrectValue() {
        let testString: String = "Foo"
        var lzy: ALO<String> = ALO({ return testString })
        XCTAssertEqual(lzy¡, testString)
    }
    
    func testValueCreationIsEvaluatedLazily() {
        var mustNotBeEvaluatedYet: Bool = true
        var lzy: ALO<String> = ALO({
            if mustNotBeEvaluatedYet {
                XCTFail("The value creation closure should not have been evaluated yet")
            }
            return "Foo"
        })
        mustNotBeEvaluatedYet = false
        let _: String = lzy¡
    }
    
    func testValueIsntCreatedWhenCallingOptional() {
        let lzy: ALO<String> = ALO({
            XCTFail("The value creation closure should not have been evaluated")
            return "Foo"
        })
        XCTAssertNil(lzy¿)
    }
    
    func testValueCaching() {
        var evalTimes: Int = 0
        var lzy: ALO<String> = ALO({
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
        var lzy: ALO<Foo> = ALO({ Foo() })
        weak var foo: Foo? = lzy¡
        
        XCTAssertNotNil(foo)
        lzy.clear()
        XCTAssertNil(foo)
    }
}
