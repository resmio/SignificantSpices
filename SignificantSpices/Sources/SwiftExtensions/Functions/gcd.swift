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
    return _gcd(abs(m), abs(n))
}


// MARK: UnsignedInteger Version
public func gcd<T: UnsignedInteger>(_ m: T, _ n: T) -> T {
    return _gcd(m, n)
}


// MARK: // Private
private func _gcd<T: BinaryInteger>(_ m: T, _ n: T) -> T {
    guard m != 0 && n != 0 else {
        return m + n
    }
    
    func __gcd(_ m: T, _ n: T) -> T {
        return m % n == 0 ? n : __gcd(n, m % n)
    }
    
    return __gcd(m, n)
}
