//
//  Optional String Interpolation.swift
//  SignificantSpices
//
//  Created by Jan Nash on 8/9/17.
//  Copyright © 2017 resmio. All rights reserved.
//


//  Thank you for ???, Ole Begemann
//  https://oleb.net/blog/2016/12/optionals-string-interpolation/
//

// MARK: Default String for Optional String-Interpolation
infix operator ??? : NilCoalescingPrecedence
public func ???<T>(optional: Optional<T>, defaultValue: @autoclosure () -> String) -> String {
    switch optional {
    case .some(let value):
        return "\(value)"
    case .none:
        return defaultValue()
    }
}


// MARK: Default Implementation for ???, uses "nil" as default
prefix operator ???
public prefix func ???<T>(optional: T?) -> String {
    return "\(optional ??? "nil")"
}
