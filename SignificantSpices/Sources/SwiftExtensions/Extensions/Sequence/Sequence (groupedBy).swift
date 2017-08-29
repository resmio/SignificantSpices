//
//  Sequence (groupedBy).swift
//  SignificantSpices
//
//  Created by Jan Nash on 8/11/17.
//  Copyright © 2017 resmio. All rights reserved.
//


// MARK: // Public
extension Sequence {
    public func groupedBy<U: Hashable>(_ key: (Iterator.Element) -> U) -> [U : [Iterator.Element]] {
        return Dictionary(grouping: self, by: key)
    }
}
