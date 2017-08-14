//
//  Sequence (none).swift
//  SignificantSpices
//
//  Created by Jan Nash on 8/14/17.
//  Copyright © 2017 resmio. All rights reserved.
//


// MARK: // Public
extension Sequence {
    public func none(fulfills condition: (Iterator.Element) -> Bool) -> Bool {
        return !self.contains(where: condition)
    }
}
