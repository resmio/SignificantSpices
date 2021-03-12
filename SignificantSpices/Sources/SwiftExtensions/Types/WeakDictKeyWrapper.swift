//
//  WeakDictKeyWrapper.swift
//  SignificantSpices
//
//  Created by Jan Nash (resmio) on 08.08.19.
//  Copyright © 2019 resmio. All rights reserved.
//

import Foundation


// MARK: // Public
// MARK: -
public protocol WeakDictKeyWrapperDelegate: class {
    func disconnected<Key: Hashable & AnyObject>(wrapper: WeakDictKeyWrapper<Key>)
}


// MARK: -
// MARK: Interface
public extension WeakDictKeyWrapper {
    // Readonly
    var key: K? {
        return self._key
    }
    
    // ReadWrite
    var delegate: WeakDictKeyWrapperDelegate? {
        get { return self._delegate }
        set { self._delegate = newValue }
    }
}


// MARK: Class Declaration
public class WeakDictKeyWrapper<K: Hashable & AnyObject> {
    // Init
    public init(key: K, delegate: WeakDictKeyWrapperDelegate?) {
        let k: K = key
        
        self._delegate = delegate
        self._key = k
        self._hashValue = k.hashValue
        
        objc_setAssociatedObject(
            k,
            &self._deinitDetectorAssociationKey,
            DeinitDetector({ [unowned self] in self.delegate?.disconnected(wrapper: self) }),
            .OBJC_ASSOCIATION_RETAIN_NONATOMIC
        )
    }
    
    // Private Weak Variables
    private weak var _delegate: WeakDictKeyWrapperDelegate?
    private weak var _key: K?
    
    // Private Variables
    private var _deinitDetectorAssociationKey: Void?
    private var _hashValue: Int
}


// MARK: Protocol Conformances
// MARK: Hashable
extension WeakDictKeyWrapper: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self._hashValue)
    }
}


// MARK: Equatable
extension WeakDictKeyWrapper: Equatable where K: Equatable {
    public static func == (lhs: WeakDictKeyWrapper<K>, rhs: WeakDictKeyWrapper<K>) -> Bool {
        return lhs.key == rhs.key
    }
}


// MARK: CustomStringConvertible
extension WeakDictKeyWrapper: CustomStringConvertible {
    public var description: String {
        return ???self._key
    }
}


// MARK: CustomDebugStringConvertible
extension WeakDictKeyWrapper: CustomDebugStringConvertible {
    public var debugDescription: String {
        return shortDescription(of: self)
    }
}


// MARK: CustomShortStringConvertible
extension WeakDictKeyWrapper: CustomShortStringConvertible {
    public func additionalShortDescription() -> String? {
        return "key: \(???self._key), delegate: \(shortDescription(of: self._delegate))"
    }
}
