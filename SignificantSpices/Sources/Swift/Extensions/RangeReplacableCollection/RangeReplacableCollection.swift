//
//  RangeReplacableCollection.swift
//  SignificantSpices
//
//  Created by Jan Nash on 8/9/17.
//  Copyright © 2017 resmio. All rights reserved.
//


extension RangeReplaceableCollection where Iterator.Element : AnyObject {
    public mutating func remove(_ object : Iterator.Element?) {
        guard let _object: Iterator.Element = object else { return }
        guard let index: Index = self.index(where: { $0 === _object }) else { return }
        self.remove(at: index)
    }
}


extension RangeReplaceableCollection where Iterator.Element : Equatable {
    public mutating func remove(_ object : Iterator.Element?) {
        guard let _object: Iterator.Element = object else { return }
        guard let index: Index = self.index(of: _object) else { return }
        self.remove(at: index)
    }
}


extension RangeReplaceableCollection where Iterator.Element : AnyObject, Iterator.Element : Equatable {
    public mutating func remove(_ object : Iterator.Element?) {
        guard let _object: Iterator.Element = object else { return }
        guard let index: Index = self.index(of: _object) else { return }
        self.remove(at: index)
    }
}
