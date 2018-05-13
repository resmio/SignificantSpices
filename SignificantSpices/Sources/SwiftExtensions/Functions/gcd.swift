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
    return _Imp.gcd(abs(m), n)
}


// MARK: UnsignedInteger Version
public func gcd<T: UnsignedInteger>(_ m: T, _ n: T) -> T {
    return _Imp.gcd(m, n)
}


// MARK: // Private
// MARK: - _Imp
private struct _Imp {
    static func gcd<T: BinaryInteger>(_ m: T, _ n: T) -> T {
        return self._zeroCheckedGCD(m, n)
    }
    
    // Zero-Checked
    private static func _zeroCheckedGCD<T: BinaryInteger>(_ m: T, _ n: T) -> T {
        guard m != 0, n != 0 else {
            return m + n
        }
        
        return self.__gcd(m, n)
    }

    // Recursive Implementation
    private static func __gcd<T: BinaryInteger>(_ m: T, _ n: T) -> T {
        let mod: T = m % n
        return mod == 0 ? n : self.__gcd(n, mod)
    }
}
