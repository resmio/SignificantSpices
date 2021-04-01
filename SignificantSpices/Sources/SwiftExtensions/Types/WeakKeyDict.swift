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
        get { return self._dict[WeakDictKeyWrapper(key: key, dict: self)] }
        set { self._dict[WeakDictKeyWrapper(key: key, dict: self)] = newValue }
    }
}


// MARK: Class Declaration
public class WeakKeyDict<Key: Hashable & AnyObject, Value>: ExpressibleByDictionaryLiteral {
    // ExpressibleByDictionaryLiteral Init
    public required init(dictionaryLiteral elements: (Key, Value)...) {
        self._dict = elements.mapToDict({ (WeakDictKeyWrapper(key: $0.0, dict: self), $0.1) })
    }
    
    // Init
    public init() {}
    
    // Private Variables
    fileprivate var _dict: [WeakDictKeyWrapper<Key>: Value] = [:]
}


// MARK: // Private
// MARK: Interface Implementations
private extension WeakKeyDict {
    func _forEach(_ body: (Key, Value) -> Void) {
        for (wrapper, value) in self._dict {
            guard let key: Key = wrapper._key else { continue }
            body(key, value)
        }
    }
}


// MARK: Class Declaration
private class WeakDictKeyWrapper<K: Hashable & AnyObject> {
    // Init
    init<V>(key: K, dict: WeakKeyDict<K, V>) {
        self._key = key
        self._hashValue = key.hashValue
        
        objc_setAssociatedObject(
            key,
            &self._deinitDetectorAssociationKey,
            DeinitDetector({ [weak dict, weak self] in
                guard let self = self else { return }
                dict?._dict[self] = nil
            }),
            .OBJC_ASSOCIATION_RETAIN_NONATOMIC
        )
    }
    
    // Private Weak Variables
    weak var _key: K?
    
    // Private Variables
    private var _deinitDetectorAssociationKey: Void?
    private let _hashValue: Int
}


// MARK: Protocol Conformances
// MARK: Hashable
extension WeakDictKeyWrapper: Hashable {
    func hash(into hasher: inout Hasher) {
        self._hashValue.hash(into: &hasher)
    }
}


// MARK: Equatable
extension WeakDictKeyWrapper: Equatable where K: Equatable {
    static func == (lhs: WeakDictKeyWrapper<K>, rhs: WeakDictKeyWrapper<K>) -> Bool {
        return lhs._key == rhs._key
    }
}


// MARK: CustomStringConvertible
extension WeakDictKeyWrapper: CustomStringConvertible {
    var description: String {
        return ???self._key
    }
}


// MARK: CustomDebugStringConvertible
extension WeakDictKeyWrapper: CustomDebugStringConvertible {
    var debugDescription: String {
        return shortDescription(of: self)
    }
}


// MARK: CustomShortStringConvertible
extension WeakDictKeyWrapper: CustomShortStringConvertible {
    func additionalShortDescription() -> String? {
        return "key: \(???self._key)"
    }
}
