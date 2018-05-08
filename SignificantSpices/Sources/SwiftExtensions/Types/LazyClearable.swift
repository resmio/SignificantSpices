//
//  LazyClearable.swift
//  SignificantSpices
//
//  Created by Jan Nash (resmio) on 08.05.18.
//  Copyright © 2018 resmio. All rights reserved.
//


// MARK: // Public
// MARK: Interface
public extension LazyClearable {
    mutating func clear() {
        self._value = nil
    }
    
    mutating func get() -> T {
        return self._get()
    }
}


// MARK: Struct Declaration
public struct LazyClearable<T> {
    public init(_ createValue: @escaping () -> T) {
        self._createValue = createValue
    }
    
    private var _createValue: () -> T
    private var _value: T?
}


// MARK: // Private
// MARK: Get Implementation
private extension LazyClearable {
    mutating func _get() -> T {
        guard let value: T = self._value else {
            let value: T = self._createValue()
            self._value = value
            return value
        }
        return value
    }
}
