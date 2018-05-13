//
//  gcd.swift
//  SignificantSpices
//
//  Created by Jan Nash on 8/15/17.
//  Copyright © 2017 resmio. All rights reserved.
//


// MARK: // Public
// MARK: SignedInteger Version
public func gcd<T: SignedInteger>(_ m: T, _ n: T) -> T {
    return _gcd(abs(m), n)
}


// MARK: UnsignedInteger Version
public func gcd<T: UnsignedInteger>(_ m: T, _ n: T) -> T {
    return _gcd(m, n)
}


// MARK: // Private
// The declaration of __gcd isn't nested inside the
// implementation of _gcd since that messes up code coverage...
// MARK: Sanity Checks
private func _gcd<T: BinaryInteger>(_ m: T, _ n: T) -> T {
    guard m != 0, n != 0 else {
        return m + n
    }
    
    return __gcd(m, n)
}


// MARK: Actual Implementation
private func __gcd<T: BinaryInteger>(_ m: T, _ n: T) -> T {
    let mod: T = m % n
    return mod == 0 ? n : __gcd(n, mod)
}
