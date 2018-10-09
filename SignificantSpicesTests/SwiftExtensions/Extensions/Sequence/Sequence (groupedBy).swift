//
//  Sequence (groupedBy).swift
//  SignificantSpices
//
//  Created by Jan Nash on 8/11/17.
//  Copyright © 2017 resmio. All rights reserved.
//

import XCTest
import SignificantSpices


// MARK: Helper Types
private class Foo {
    init(_ bar: Int) { self.bar = bar }
    private(set) var bar: Int
}


class SequenceGroupedByTests: XCTestCase {
    func testSequenceGroupedBy() {
        let aBar: Int = 0
        let bBar: Int = 1
        let cBar: Int = 2
        let dBar: Int = 3
        let eBar: Int = 4
        
        let a: Foo = Foo(aBar)
        let b: Foo = Foo(bBar)
        let c: Foo = Foo(cBar)
        let d: Foo = Foo(dBar)
        let e: Foo = Foo(eBar)
        
        let seq: [Foo] = [e, d, a, b, a, d, c, c, e, c, a, b, a, d, c, e, b, b, e, d]
        
        let groupedSeq: [Int : [Foo]] = seq.groupedBy({ $0.bar })
        
        XCTAssertEqual(groupedSeq.count, 5)
        
        guard let allAs: [Foo] = groupedSeq[aBar] else {
            XCTFail("Grouped Sequence does not contain key \(aBar)")
            return
        }
        
        XCTAssertEqual(allAs.map({ $0.bar }), [aBar, aBar, aBar, aBar])
        
        guard let allBs: [Foo] = groupedSeq[bBar] else {
            XCTFail("Grouped Sequence does not contain key \(bBar)")
            return
        }
        
        XCTAssertEqual(allBs.map({ $0.bar }), [bBar, bBar, bBar, bBar])
        
        guard let allCs: [Foo] = groupedSeq[cBar] else {
            XCTFail("Grouped Sequence does not contain key \(cBar)")
            return
        }
        
        XCTAssertEqual(allCs.map({ $0.bar }), [cBar, cBar, cBar, cBar])
        
        guard let allDs: [Foo] = groupedSeq[dBar] else {
            XCTFail("Grouped Sequence does not contain key \(dBar)")
            return
        }
        
        XCTAssertEqual(allDs.map({ $0.bar }), [dBar, dBar, dBar, dBar])
        
        guard let allEs: [Foo] = groupedSeq[eBar] else {
            XCTFail("Grouped Sequence does not contain key \(eBar)")
            return
        }
        
        XCTAssertEqual(allEs.map({ $0.bar }), [eBar, eBar, eBar, eBar])
    }
}
