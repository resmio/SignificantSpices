//
//  Element in-not_in Collection.swift
//  SignificantSpices
//
//  Created by Jan Nash on 8/8/17.
//  Copyright © 2017 resmio. All rights reserved.
//


// MARK: // Public
// MARK: Operator Declarations
// MARK: Element "in" Collection
infix operator <> : ComparisonPrecedence

// MARK: Element "not in" Collection
infix operator >< : ComparisonPrecedence


// MARK: Extension Declarations
// MARK: where Self.Element: AnyObject
public extension Collection where Self.Element: AnyObject {
    static func <> (element: Self.Element?, collection: Self) -> Bool {
        guard let element: Self.Element = element else { return false }
        return collection.contains(where: { $0 === element })
    }
    
    static func >< (element: Self.Element?, collection: Self) -> Bool {
        guard let element: Self.Element = element else { return true }
        return !(collection.contains(where: { $0 === element }))
    }
}


// MARK: where Self.Element: Equatable
public extension Collection where Self.Element: Equatable {
    static func <> (element: Self.Element?, collection: Self) -> Bool {
        guard let element: Self.Element = element else { return false }
        return collection.contains(element)
    }
    
    static func >< (element: Self.Element?, collection: Self) -> Bool {
        guard let element: Self.Element = element else { return true }
        return !(collection.contains(element))
    }
}


// MARK: where Self.Element: AnyObject & Equatable
public extension Collection where Self.Element: AnyObject & Equatable {
    static func <> (element: Self.Element?, collection: Self) -> Bool {
        guard let element: Self.Element = element else { return false }
        return collection.contains(element)
    }
    
    static func >< (element: Self.Element?, collection: Self) -> Bool {
        guard let element: Self.Element = element else { return true }
        return !(collection.contains(element))
    }
}
