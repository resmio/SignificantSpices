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
    func associate(_ value: AnyObject?, _ associationType: AssociationType, by key: inout AssociationKey)
    func associatedValue<T: AnyObject>(for key: inout AssociationKey) -> T?
}


// MARK: Default Implementations
public extension AssociationOwner {
    public func associate(_ value: AnyObject?, _ associationType: AssociationType, by key: inout AssociationKey) {
        self._associate(value, associationType, by: &key)
    }
    
    public func associatedValue<T: AnyObject>(for key: inout AssociationKey) -> T? {
        return self._associatedValue(for: &key)
    }
}


// MARK: // Private
// MARK: - AssociationOwner
private extension AssociationOwner {
    func _associate(_ value: AnyObject?, _ associationType: AssociationType, by key: inout AssociationKey) {
        switch associationType {
        case .strongly:
            objc_setAssociatedObject(self, &key._key, value, .OBJC_ASSOCIATION_RETAIN);
        case .weakly:
            objc_setAssociatedObject(self, &key._key, value, .OBJC_ASSOCIATION_ASSIGN);
        }
    }
    
    func _associatedValue<T: AnyObject>(for key: inout AssociationKey) -> T? {
        return objc_getAssociatedObject(self, &key._key) as? T
    }
}
