//
//  Set Combinations.swift
//  SignificantSpices
//
//  Created by Jan Nash on 8/8/17.
//  Copyright © 2017 resmio. All rights reserved.
//


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
