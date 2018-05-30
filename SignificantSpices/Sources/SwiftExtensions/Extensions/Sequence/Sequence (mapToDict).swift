//
//  Sequence (mapToDict).swift
//  SignificantSpices
//
//  Created by Jan Nash on 30.05.18.
//  Copyright © 2018 resmio. All rights reserved.
//


// MARK: // Public
extension Sequence {
    func mapToDict<K, V>(_ transform: (Element) throws -> (key: K, value: V)) rethrows -> [K: V] {
        return Dictionary(uniqueKeysWithValues: try self.map(transform))
    }
    
    func mapToDict<K, V, N>(_ transformValue: (V) throws -> N) rethrows -> [K: N] where Element == (K, V), K: Hashable {
        return Dictionary(uniqueKeysWithValues: try self.map({ ($0.0, try transformValue($0.1)) }))
    }
}
