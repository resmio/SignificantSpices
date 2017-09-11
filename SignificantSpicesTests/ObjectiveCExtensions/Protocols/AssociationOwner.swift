//
//  AssociationOwner.swift
//  SignificantSpicesTests
//
//  Created by Jan Nash on 9/11/17.
//  Copyright © 2017 resmio. All rights reserved.
//

import XCTest
@testable import SignificantSpices


private extension AssociationKey {
    static var _fooKey: AssociationKey = AssociationKey()
}


class AssociationOwnerTests: XCTestCase {
    class Foo: AssociationOwner {}
    
    func testWeakAssociation() {
        let object: Foo = Foo()
        let objectToAssociate: NSObject = NSObject()
        
        object.associate(objectToAssociate, .weakly, by: &._fooKey)
        
        let associatedObject: NSObject? = object.associatedValue(for: &._fooKey)
        
        XCTAssertNil(associatedObject)
    }
}
