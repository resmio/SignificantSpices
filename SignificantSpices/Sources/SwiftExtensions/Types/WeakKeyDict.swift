//
//  WeakKeyDict.swift
//  SignificantSpices
//
//  Created by Jan Nash (resmio) on 08.08.19.
//  Copyright © 2019 resmio. All rights reserved.
//

import Foundation


// MARK: // Public
// MARK: Interface
public extension WeakKeyDict {
    func forEach(_ body: (Key, Value) -> Void) {
        self._forEach(body)
    }
    
    subscript(key: Key) -> Value? {
        get { return self._dict[WeakDictKeyWrapper(key: key, delegate: self)] }
        set { self._dict[WeakDictKeyWrapper(key: key, delegate: self)] = newValue }
    }
}


// MARK: Class Declaration
public class WeakKeyDict<Key: Hashable & AnyObject, Value>: ExpressibleByDictionaryLiteral {
    // ExpressibleByDictionaryLiteral Init
    public required init(dictionaryLiteral elements: (Key, Value)...) {
        self._dict = elements.mapToDict({ (WeakDictKeyWrapper(key: $0.0, delegate: self), $0.1) })
    }
    
    // Init
    public init() {}
    
    // Private Variables
    private var _dict: [WeakDictKeyWrapper<Key>: Value] = [:]
}


// MARK: Protocol Conformances
// MARK: WeakDictKeyWrapperDelegate
extension WeakKeyDict: WeakDictKeyWrapperDelegate {
    public func disconnected<K>(wrapper: WeakDictKeyWrapper<K>) where K : AnyObject, K : Hashable {
        self._dict[wrapper as! WeakDictKeyWrapper<Key>] = nil
    }
}


// MARK: // Private
// MARK: Interface Implementations
private extension WeakKeyDict {
    func _forEach(_ body: (Key, Value) -> Void) {
        for (wrapper, value) in self._dict {
            guard let key: Key = wrapper.key else { continue }
            body(key, value)
        }
    }
}
