//
//  CustomOperators.swift
//  SignificantSpices
//
//  Created by Jan Nash on 8/8/17.
//  Copyright © 2017 resmio. All rights reserved.
//


// MARK: - - Bool In-Place Assignment Operators
// MARK: in-place &&
infix operator &&= : AssignmentPrecedence
public func &&= (lhs: inout Bool, rhs: Bool) {
    lhs = lhs && rhs
}

// MARK: in-place ||
infix operator ||= : AssignmentPrecedence
public func ||= (lhs: inout Bool, rhs: Bool) {
    lhs = lhs || rhs
}


// MARK: - - Set Combination Operators
// MARK: Intersection
infix operator & : ComparisonPrecedence
public func & <T: Hashable>(l: Set<T>, r: Set<T>) -> Set<T> {
    return l.intersection(r)
}

// MARK: Union
infix operator | : ComparisonPrecedence
public func | <T: Hashable>(l: Set<T>, r: Set<T>) -> Set<T> {
    return l.union(r)
}

// MARK: Substraction
infix operator - : ComparisonPrecedence
public func - <T: Hashable>(l: Set<T>, r: Set<T>) -> Set<T> {
    return l.subtracting(r)
}

// MARK: Symmetric Difference
infix operator ^ : ComparisonPrecedence
public func ^ <T: Hashable>(l: Set<T>, r: Set<T>) -> Set<T> {
    return l.symmetricDifference(r)
}


// MARK: - - Collection 'in'/'not in' Operators
// MARK: Element "in" Collection
infix operator <> : ComparisonPrecedence

public func <> <T: Equatable>(l: T?, r: [T]) -> Bool {
    guard let l: T = l else { return false }
    return r.contains(l)
}

public func <> <T: Hashable>(l: T?, r: Set<T>) -> Bool {
    guard let l: T = l else { return false }
    return r.contains(l)
}

// MARK: Element "not in" Collection
infix operator >< : ComparisonPrecedence

public func >< <T: Equatable>(l: T?, r: [T]) -> Bool {
    guard let l: T = l else { return true }
    return !(r.contains(l))
}

public func >< <T: Hashable>(l: T?, r: Set<T>) -> Bool {
    guard let l: T = l else { return true }
    return !(r.contains(l))
}
