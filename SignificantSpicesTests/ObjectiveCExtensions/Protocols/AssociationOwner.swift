//
//  AssociationOwner.swift
//  SignificantSpicesTests
//
//  Created by Jan Nash on 9/11/17.
//  Copyright © 2017 resmio. All rights reserved.
//

import XCTest
@testable import SignificantSpices


private extension ObjectAssociationKey {
    static var _objectKey: ObjectAssociationKey = ObjectAssociationKey()
}


private extension ValueAssociationKey {
    static var _valueKey: ValueAssociationKey = ValueAssociationKey()
}


class AssociationOwnerTests: XCTestCase {
    class RootObject: AssociationOwner {}
    class Foo {}
    class Bar {}
    
    func testWeakAssociation() {
        let rootObject: RootObject = RootObject()
        rootObject.associate(NSObject(), .weakly, by: &._objectKey)
        let associatedObject: NSObject? = rootObject.associatedObject(for: &._objectKey)
        XCTAssertNil(associatedObject)
    }
    
    func testWeakAssociationDoesNotNilAssociationIfDifferentType() {
        let rootObject: RootObject = RootObject()
        let objectToAssociate: Foo = Foo()
        rootObject.associate(objectToAssociate, .weakly, by: &._objectKey)
        
        let associatedObjectWrongType: Bar? = rootObject.associatedObject(for: &._objectKey)
        XCTAssertNil(associatedObjectWrongType)
        
        guard let associatedObjectRightType: Foo = rootObject.associatedObject(for: &._objectKey) else {
            XCTFail("Association should not be nil")
            return
        }
        
        XCTAssert(associatedObjectRightType === objectToAssociate)
    }
    
    func testNilOutWeakAssociation() {
        let rootObject: RootObject = RootObject()
        let objectToAssociate: Foo = Foo()
        
        rootObject.associate(objectToAssociate, .weakly, by: &._objectKey)
        rootObject.associate(nil, .weakly, by: &._objectKey)
        
        let associatedObject: AnyObject? = rootObject.associatedObject(for: &._objectKey)
        XCTAssertNil(associatedObject)
    }
    
    func testStrongAssociation() {
        let rootObject: RootObject = RootObject()
        rootObject.associate(NSObject(), .strongly, by: &._objectKey)
        let associatedObject: NSObject? = rootObject.associatedObject(for: &._objectKey)
        XCTAssertNotNil(associatedObject)
    }
    
    func testNilOutStrongAssociation() {
        let rootObject: RootObject = RootObject()
        rootObject.associate(NSObject(), .strongly, by: &._objectKey)
        rootObject.associate(nil, .strongly, by: &._objectKey)
        let associatedObject: NSObject? = rootObject.associatedObject(for: &._objectKey)
        XCTAssertNil(associatedObject)
    }
    
    func testValueTypeAssociation() {
        let rootObject: RootObject = RootObject()
        rootObject.associate(5, by: &._valueKey)
        let associatedValue: Int? = rootObject.associatedValue(for: &._valueKey)
        XCTAssertEqual(5, associatedValue)
    }
    
    func testNilOutValueTypeAssociation() {
        let rootObject: RootObject = RootObject()
        rootObject.associate(5, by: &._valueKey)
        rootObject.associate(nil, by: &._valueKey)
        let associatedValue: Int? = rootObject.associatedValue(for: &._valueKey)
        XCTAssertNil(associatedValue)
    }
}
