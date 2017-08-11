//
//  Collection (SafeSubscript).swift
//  SignificantSpices
//
//  Created by Jan Nash on 8/9/17.
//  Copyright © 2017 resmio. All rights reserved.
//


// MARK: // Public
extension Collection where Indices.Iterator.Element == Index {
    public subscript (safe index: Index) -> Generator.Element? {
        return self.indices.contains(index) ? self[index] : nil
    }
}
