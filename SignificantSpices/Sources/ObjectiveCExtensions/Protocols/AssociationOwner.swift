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
    func associate(_ object: AnyObject?, _ associationType: AssociationType, by key: inout AssociationKey)
    func associatedObject<T: AnyObject>(for key: inout AssociationKey) -> T?
}


// MARK: Default Implementations
public extension AssociationOwner {
    public func associate(_ object: AnyObject?, _ associationType: AssociationType, by key: inout AssociationKey) {
        self._associate(object, associationType, by: &key._key)
    }
    
    public func associatedObject<T: AnyObject>(for key: inout AssociationKey) -> T? {
        return self._associatedObject(for: &key._key)
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
    func _associate(_ object: AnyObject?, _ associationType: AssociationType, by key: inout Void?) {
        switch associationType {
        case .strongly:
            objc_setAssociatedObject(self, &key, object, .OBJC_ASSOCIATION_RETAIN);
        case .weakly:
            self._weaklyAssociate(object, by: &key)
        }
    }
    
    func _associatedObject<T: AnyObject>(for key: inout Void?) -> T? {
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
            self._associate(nil, .strongly, by: &key)
            return nil
        }
        
        // Else, we return the object that was in the box.
        return boxedObject
    }
    
    // Private Helpers
    private func _weaklyAssociate<T: AnyObject>(_ object: T?, by key: inout Void?) {
        // If the new value is nil, we just nil the association.
        guard let object: T = object else {
            self._associate(nil, .strongly, by: &key)
            return
        }
        
        // Else, we associate a new _WeakBox containing the object.
        self._associate(_WeakBox(object), .strongly, by: &key)
    }
}
