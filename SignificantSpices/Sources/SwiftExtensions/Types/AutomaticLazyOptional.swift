//
//  AutomaticLazyOptional.swift
//  SignificantSpices
//
//  Created by Jan Nash (resmio) on 08.05.18.
//  Copyright © 2018 resmio. All rights reserved.
//


// MARK: // Public
// MARK: - Custom Operators
postfix operator ¡
postfix operator ¿


// MARK: - AutomaticLazyOptional
// MARK: Convenience Typealias
public typealias ALO = AutomaticLazyOptional


// MARK: Interface
public extension AutomaticLazyOptional {
    public mutating func clear() {
        self._value = nil
    }
    
    public static postfix func ¿ (_ alo: ALO<T>) -> T? {
        return alo._value
    }
    
    public static postfix func ¡ (_ alo: inout ALO<T>) -> T {
        return alo._get()
    }
}


// MARK: Struct Declaration
public struct AutomaticLazyOptional<T> {
    public init(_ createValue: @escaping () -> T) {
        self._createValue = createValue
    }
    
    private var _createValue: () -> T
    private var _value: T?
}


// MARK: // Private
// MARK: Get Implementation
private extension AutomaticLazyOptional {
    mutating func _get() -> T {
        guard let value: T = self._value else {
            let value: T = self._createValue()
            self._value = value
            return value
        }
        return value
    }
}
