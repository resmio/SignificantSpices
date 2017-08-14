//
//  Sequence (all).swift
//  SignificantSpices
//
//  Created by Jan Nash on 8/11/17.
//  Copyright © 2017 resmio. All rights reserved.
//


// MARK: // Public
// MARK: forAll (condition)
extension Sequence {
    public func all(fulfill condition: (Iterator.Element) -> Bool) -> Bool {
        return !self.contains(where: { !condition($0) })
    }
}
