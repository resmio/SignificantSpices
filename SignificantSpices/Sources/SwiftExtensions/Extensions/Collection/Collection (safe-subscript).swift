//
//  Collection (safe-subscript).swift
//  SignificantSpices
//
//  Created by Jan Nash on 8/9/17.
//  Copyright © 2017 resmio. All rights reserved.
//


// MARK: // Public
extension Collection {
    public subscript (safe index: Index) -> Iterator.Element? {
        return self.indices.contains(index) ? self[index] : nil
    }
}
