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
    func associate<T: AnyObject>(_ object: T?, _ associationType: AssociationType, by key: inout AssociationKey)
    func associatedObject<T: AnyObject>(for key: inout AssociationKey) -> T?
}


// MARK: Default Implementations
public extension AssociationOwner {
    public func associate<T: AnyObject>(_ object: T?, _ associationType: AssociationType, by key: inout AssociationKey) {
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
private extension AssociationOwner {
    func _associate<T: AnyObject>(_ object: T?, _ associationType: AssociationType, by key: inout AssociationKey) {
        switch associationType {
        case .strongly:
            self._stronglyAssociate(object, by: &key)
        case .weakly:
            self._weaklyAssociate(object, by: &key)
        }
    }
    
    func _associatedObject<T: AnyObject>(for key: inout AssociationKey) -> T? {
        // First, we retrieve the associated object.
        let object: AnyObject? = objc_getAssociatedObject(self, &key) as AnyObject
        
        // Next, we check if it's a weak association
        // by conditionally casting it to a _WeakBox.
        guard let box: _WeakBox = object as? _WeakBox else {
            // If it wasn't a weak association (i.e. it wasn't a _WeakBox),
            // we just return the object (conditionally cast to T)
            return object as? T
        }
        
        // If there is a _WeakBox associated but it's empty,
        // we nil the association and return nil.
        guard let boxedObject: T = box.object as? T else {
            self._setAssociationToNil(for: &key)
            return nil
        }
        
        // Else, we return the object that was in the box.
        return boxedObject
    }
    
    // Private Helpers
    private func _weaklyAssociate<T: AnyObject>(_ object: T?, by key: inout AssociationKey) {
        // If the new value is nil, we just nil the association.
        guard let object: T = object else {
            self._setAssociationToNil(for: &key)
            return
        }
        
        // Else, we associate a new _WeakBox containing the object.
        self._stronglyAssociate(_WeakBox(object), by: &key)
    }
    
    private func _stronglyAssociate<T: AnyObject>(_ object: T?, by key: inout AssociationKey) {
        objc_setAssociatedObject(self, &key._key, object, .OBJC_ASSOCIATION_RETAIN)
    }
    
    private func _setAssociationToNil(for key: inout AssociationKey) {
        objc_setAssociatedObject(self, &key._key, nil, .OBJC_ASSOCIATION_RETAIN)
    }
}
