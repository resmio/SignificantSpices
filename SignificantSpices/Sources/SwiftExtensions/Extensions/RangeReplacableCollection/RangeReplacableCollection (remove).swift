//
//  RangeReplacableCollection.swift
//  SignificantSpices
//
//  Created by Jan Nash on 8/9/17.
//  Copyright © 2017 resmio. All rights reserved.
//


// MARK: // Public
// MARK: where Self.Element : AnyObject
extension RangeReplaceableCollection where Self.Element : AnyObject {
    public mutating func remove(_ object : Self.Element?) {
        guard let object: Self.Element = object else { return }
        guard let index: Index = self.firstIndex(where: { $0 === object }) else { return }
        self.remove(at: index)
    }
}


// MARK: where Self.Element : Equatable
extension RangeReplaceableCollection where Self.Element : Equatable {
    public mutating func remove(_ object : Self.Element?) {
        guard let object: Self.Element = object else { return }
        guard let index: Index = self.firstIndex(of: object) else { return }
        self.remove(at: index)
    }
}


// MARK: where Self.Element : AnyObject & Equatable
extension RangeReplaceableCollection where Self.Element : AnyObject & Equatable {
    public mutating func remove(_ object : Self.Element?) {
        guard let object: Self.Element = object else { return }
        guard let index: Index = self.firstIndex(of: object) else { return }
        self.remove(at: index)
    }
}
