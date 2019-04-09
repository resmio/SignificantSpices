//
//  AssociationOwner.swift
//  SignificantSpices
//
//  Created by Jan Nash on 9/11/17.
//  Copyright © 2017 resmio. All rights reserved.
//

import ObjectiveC


// MARK: // Public
// MARK: - ObjectAssociationKey
public struct ObjectAssociationKey {
    public init() {}
    fileprivate var _key: Void?
}


// MARK: - ValueAssociationKey
public struct ValueAssociationKey {
    public init() {}
    fileprivate var _key: Void?
}


// MARK: - AssociationType
public enum ObjectAssociationType {
    case strongly
    case weakly
}


// MARK: - AssociationOwner
// MARK: Protocol Declaration
public protocol AssociationOwner {
    // Value Types
    func associate(_ value: Any?, by key: inout ValueAssociationKey)
    func associatedValue<T: Any>(for key: inout ValueAssociationKey) -> T?
    
    // Reference Types
    func associate(_ object: AnyObject?, _ associationType: ObjectAssociationType, by key: inout ObjectAssociationKey)
    func associatedObject<T: AnyObject>(for key: inout ObjectAssociationKey) -> T?
}


// MARK: Default Implementations
public extension AssociationOwner {
    func associate(_ value: Any?, by key: inout ValueAssociationKey) {
        self._associate(value, by: &key)
    }
    
    func associatedValue<T: Any>(for key: inout ValueAssociationKey) -> T? {
        return self._associatedValue(for: &key)
    }
    
    func associate(_ object: AnyObject?, _ associationType: ObjectAssociationType, by key: inout ObjectAssociationKey) {
        self._associate(object, associationType, by: &key)
    }
    
    func associatedObject<T: AnyObject>(for key: inout ObjectAssociationKey) -> T? {
        return self._associatedObject(for: &key)
    }
}


// MARK: // Private
// MARK: - _WeakBox
private class _WeakBox {
    // Init
    init(_ object: AnyObject?) {
        self.object = object
    }
    
    // Weak Variables
    weak var object: AnyObject?
}


// MARK: - AssociationOwner
// MARK: Value Type Implementations
private extension AssociationOwner {
    func _associate(_ value: Any?, by key: inout ValueAssociationKey) {
        self._stronglyAssociate(value, by: &key._key)
    }

    func _associatedValue<T: Any>(for key: inout ValueAssociationKey) -> T? {
        return objc_getAssociatedObject(self, &key._key) as? T
    }
}

// MARK: Reference Type Implementations
private extension AssociationOwner {
    func _associate(_ object: AnyObject?, _ associationType: ObjectAssociationType, by key: inout ObjectAssociationKey) {
        switch associationType {
        case .strongly:
            self._stronglyAssociate(object, by: &key._key)
        case .weakly:
            self._weaklyAssociate(object, by: &key._key)
        }
    }
    
    func _associatedObject<T: AnyObject>(for key: inout ObjectAssociationKey) -> T? {
        // First, we retrieve the associated object.
        let object: AnyObject? = objc_getAssociatedObject(self, &key) as AnyObject?
        
        // Next, we check if it's a weak association
        // by conditionally casting it to a _WeakBox.
        guard let box: _WeakBox = object as? _WeakBox else {
            // If it wasn't a weak association (i.e. it wasn't a _WeakBox),
            // we just return the object (conditionally cast to T)
            return object as? T
        }
        
        // If there is a _WeakBox associated but it's empty,
        // we nil the association and return nil.
        let boxedObject: AnyObject? = box.object
        if boxedObject == nil {
            self._setAssociationToNil(for: &key._key)
            return nil
        }
        
        // Else, we return the object that was in the box.
        return boxedObject as? T
    }
}


// MARK: Helpers
private extension AssociationOwner {
    func _stronglyAssociate(_ objectOrValue: Any?, by key: inout Void?) {
        objc_setAssociatedObject(self, &key, objectOrValue, .OBJC_ASSOCIATION_RETAIN)
    }
    
    func _weaklyAssociate(_ object: AnyObject?, by key: inout Void?) {
        // If the new value is nil, we just nil the association.
        guard let object: AnyObject = object else {
            self._setAssociationToNil(for: &key)
            return
        }
        
        // Else, we associate a new _WeakBox containing the object.
        self._stronglyAssociate(_WeakBox(object), by: &key)
    }
    
    func _setAssociationToNil(for key: inout Void?) {
        objc_setAssociatedObject(self, &key, nil, .OBJC_ASSOCIATION_RETAIN)
    }
}
