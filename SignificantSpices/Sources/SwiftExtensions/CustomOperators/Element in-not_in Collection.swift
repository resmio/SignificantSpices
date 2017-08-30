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
// MARK: where Iterator.Element: AnyObject
public extension Collection where Iterator.Element: AnyObject {
    public static func <> (element: Iterator.Element?, collection: Self) -> Bool{
        guard let element: Iterator.Element = element else { return false }
        return collection.contains(where: { $0 === element })
    }
    
    public static func >< (element: Iterator.Element?, collection: Self) -> Bool {
        guard let element: Iterator.Element = element else { return true }
        return !(collection.contains(where: { $0 === element }))
    }
}


// MARK: where Iterator.Element: Equatable
public extension Collection where Iterator.Element: Equatable {
    public static func <> (element: Iterator.Element?, collection: Self) -> Bool {
        guard let element: Iterator.Element = element else { return false }
        return collection.contains(element)
    }
    
    public static func >< (element: Iterator.Element?, collection: Self) -> Bool {
        guard let element: Iterator.Element = element else { return true }
        return !(collection.contains(element))
    }
}


// MARK: where Iterator.Element: AnyObject & Equatable
public extension Collection where Iterator.Element: AnyObject & Equatable {
    public static func <> (element: Iterator.Element?, collection: Self) -> Bool {
        guard let element: Iterator.Element = element else { return false }
        return collection.contains(element)
    }
    
    public static func >< (element: Iterator.Element?, collection: Self) -> Bool {
        guard let element: Iterator.Element = element else { return true }
        return !(collection.contains(element))
    }
}
