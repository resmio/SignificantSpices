//
//  Set Combinations.swift
//  SignificantSpices
//
//  Created by Jan Nash on 8/8/17.
//  Copyright © 2017 resmio. All rights reserved.
//


// MARK: - - Normal Operators
// MARK: Intersection
infix operator §: AdditionPrecedence
public func § <T: Hashable>(l: Set<T>, r: Set<T>) -> Set<T> {
    return l.intersection(r)
}


// MARK: Union
infix operator +: AdditionPrecedence
public func + <T: Hashable>(l: Set<T>, r: Set<T>) -> Set<T> {
    return l.union(r)
}


// MARK: Substraction
infix operator -: AdditionPrecedence
public func - <T: Hashable>(l: Set<T>, r: Set<T>) -> Set<T> {
    return l.subtracting(r)
}


// MARK: Symmetric Difference
infix operator ^: AdditionPrecedence
public func ^ <T: Hashable>(l: Set<T>, r: Set<T>) -> Set<T> {
    return l.symmetricDifference(r)
}


// MARK: - - Compound Assignment
// MARK: Intersection Assignment
infix operator §=: AssignmentPrecedence
public func §= <T: Hashable>(l: inout Set<T>, r: Set<T>) {
    return l.formIntersection(r)
}


// MARK: Union Assignment
infix operator +=: AssignmentPrecedence
public func += <T: Hashable>(l: inout Set<T>, r: Set<T>) {
    return l.formUnion(r)
}


// MARK: Substraction Assignment
infix operator -=: AssignmentPrecedence
public func -= <T: Hashable>(l: inout Set<T>, r: Set<T>) {
    return l.subtract(r)
}


// MARK: Symmetric Difference Assignment
infix operator ^=: AssignmentPrecedence
public func ^= <T: Hashable>(l: inout Set<T>, r: Set<T>) {
    return l.formSymmetricDifference(r)
}
