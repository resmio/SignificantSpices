//
//  AssociationOwner.swift
//  SignificantSpices
//
//  Created by Jan Nash on 9/11/17.
//  Copyright © 2017 resmio. All rights reserved.
//

import ObjectiveC


// MARK: // Public
// MARK: - AssociationKey
public struct AssociationKey {
    fileprivate var _key: Void?
}


// MARK: - AssociationType
public enum AssociationType {
    case strongly
    case weakly
}


// MARK: - AssociationOwner
// MARK: Protocol Declaration
public protocol AssociationOwner {
    // Value Types
    func associate(_ value: Any?, by key: inout AssociationKey)
    func associatedValue<T: Any>(for key: inout AssociationKey) -> T?
    
    // Reference Types
    func associate(_ object: AnyObject?, _ associationType: AssociationType, by key: inout AssociationKey)
    func associatedObject<T: AnyObject>(for key: inout AssociationKey) -> T?
}


// MARK: Default Implementations
public extension AssociationOwner {
    func associate(_ value: Any?, by key: inout AssociationKey) {
        self._associate(value, by: &key)
    }
    
    func associatedValue<T: Any>(for key: inout AssociationKey) -> T? {
        return self._associatedValue(for: &key)
    }
    
    public func associate(_ object: AnyObject?, _ associationType: AssociationType, by key: inout AssociationKey) {
        self._associate(object, associationType, by: &key)
    }
    
    public func associatedObject<T: AnyObject>(for key: inout AssociationKey) -> T? {
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
    func _associate(_ value: Any?, by key: inout AssociationKey) {
        self._stronglyAssociate(value, by: &key)
    }

    func _associatedValue<T: Any>(for key: inout AssociationKey) -> T? {
        return objc_getAssociatedObject(self, &key) as? T
    }
}

// MARK: Reference Type Implementations
private extension AssociationOwner {
    func _associate(_ object: AnyObject?, _ associationType: AssociationType, by key: inout AssociationKey) {
        switch associationType {
        case .strongly:
            self._stronglyAssociate(object, by: &key)
        case .weakly:
            self._weaklyAssociate(object, by: &key)
        }
    }
    
    func _associatedObject<T: AnyObject>(for key: inout AssociationKey) -> T? {
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
            self._setAssociationToNil(for: &key)
            return nil
        }
        
        // Else, we return the object that was in the box.
        return boxedObject as? T
    }
    
    // Private Helpers
    private func _weaklyAssociate(_ object: AnyObject?, by key: inout AssociationKey) {
        // If the new value is nil, we just nil the association.
        guard let object: AnyObject = object else {
            self._setAssociationToNil(for: &key)
            return
        }
        
        // Else, we associate a new _WeakBox containing the object.
        self._stronglyAssociate(_WeakBox(object), by: &key)
    }
}


// MARK: Helpers
private extension AssociationOwner {
    func _stronglyAssociate(_ objectOrValue: Any?, by key: inout AssociationKey) {
        objc_setAssociatedObject(self, &key._key, objectOrValue, .OBJC_ASSOCIATION_RETAIN)
    }
    
    func _setAssociationToNil(for key: inout AssociationKey) {
        objc_setAssociatedObject(self, &key._key, nil, .OBJC_ASSOCIATION_RETAIN)
    }
}
