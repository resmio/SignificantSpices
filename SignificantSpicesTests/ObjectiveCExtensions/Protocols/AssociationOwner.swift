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
    class RootObject: AssociationOwner {}
    class Foo {}
    class Bar {}
    
    func testWeakAssociation() {
        let rootObject: RootObject = RootObject()
        rootObject.associate(NSObject(), .weakly, by: &._fooKey)
        let associatedObject: NSObject? = rootObject.associatedObject(for: &._fooKey)
        XCTAssertNil(associatedObject)
    }
    
    func testWeakAssociationDoesNotNilAssociationIfDifferentType() {
        let rootObject: RootObject = RootObject()
        let objectToAssociate: Foo = Foo()
        rootObject.associate(objectToAssociate, .weakly, by: &._fooKey)
        
        let associatedObjectWrongType: Bar? = rootObject.associatedObject(for: &._fooKey)
        XCTAssertNil(associatedObjectWrongType)
        
        guard let associatedObjectRightType: Foo = rootObject.associatedObject(for: &._fooKey) else {
            XCTFail("Association should not be nil")
            return
        }
        
        XCTAssert(associatedObjectRightType === objectToAssociate)
    }
    
    func testNilOutWeakAssociation() {
        let rootObject: RootObject = RootObject()
        let objectToAssociate: Foo = Foo()
        
        rootObject.associate(objectToAssociate, .weakly, by: &._fooKey)
        rootObject.associate(nil, .weakly, by: &._fooKey)
        
        let associatedObject: AnyObject? = rootObject.associatedObject(for: &._fooKey)
        XCTAssertNil(associatedObject)
    }
}
