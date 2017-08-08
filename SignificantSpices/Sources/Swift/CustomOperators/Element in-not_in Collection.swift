//
//  Element in-not_in Collection.swift
//  SignificantSpices
//
//  Created by Jan Nash on 8/8/17.
//  Copyright © 2017 resmio. All rights reserved.
//


// MARK: Element "in" Collection
infix operator <> : ComparisonPrecedence

public func <> <T>(l: T?, r: [T]) -> Bool where T: AnyObject {
    guard let l: T = l else { return false }
    return r.contains(where: { $0 === l })
}

public func <> <T>(l: T?, r: [T]) -> Bool where T: Equatable {
    guard let l: T = l else { return false }
    return r.contains(l)
}

public func <> <T>(l: T?, r: [T]) -> Bool where T: AnyObject, T: Equatable {
    guard let l: T = l else { return false }
    return r.contains(l)
}

public func <> <T: Hashable>(l: T?, r: Set<T>) -> Bool {
    guard let l: T = l else { return false }
    return r.contains(l)
}


// MARK: Element "not in" Collection
infix operator >< : ComparisonPrecedence

public func >< <T>(l: T?, r: [T]) -> Bool where T: AnyObject {
    guard let l: T = l else { return false }
    return r.contains(where: { $0 !== l })
}

public func >< <T>(l: T?, r: [T]) -> Bool where T: Equatable {
    guard let l: T = l else { return true }
    return !(r.contains(l))
}

public func >< <T>(l: T?, r: [T]) -> Bool where T: AnyObject, T: Equatable {
    guard let l: T = l else { return true }
    return !(r.contains(l))
}

public func >< <T: Hashable>(l: T?, r: Set<T>) -> Bool {
    guard let l: T = l else { return true }
    return !(r.contains(l))
}
