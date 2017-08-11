//
//  Sequence (groupedBy).swift
//  SignificantSpices
//
//  Created by Jan Nash on 8/11/17.
//  Copyright © 2017 resmio. All rights reserved.
//


// MARK: // Public
extension Sequence {
    // FIXME: Once we switch to Swift 4, we won't need this anymore 🤘
    public func groupedBy<U: Hashable>(_ key: (Iterator.Element) -> U) -> [U : [Iterator.Element]] {
        return self._groupedBy(key)
    }
}


// MARK: // Private
// MARK: Helper Class to workaround copy-on-write
private class _Box<A> {
    init(_ val: A) { self.value = val }
    var value: A
}


// MARK: Implementation
private extension Sequence {
    func _groupedBy<U: Hashable>(_ key: (Iterator.Element) -> U) -> [U : [Iterator.Element]] {
        var categories: [U : _Box<[Iterator.Element]>] = [:]
        
        for element in self {
            let key = key(element)
            if case nil = categories[key]?.value.append(element) {
                categories[key] = _Box([element])
            }
        }
        
        var result: [U : [Iterator.Element]] = Dictionary(minimumCapacity: categories.count)
        
        for (key, box) in categories {
            result[key] = box.value
        }
        
        return result
    }
}
