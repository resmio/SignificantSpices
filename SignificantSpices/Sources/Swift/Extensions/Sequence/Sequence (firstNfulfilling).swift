//
//  Sequence (firstNfulfilling).swift
//  SignificantSpices
//
//  Created by Jan Nash on 8/14/17.
//  Copyright © 2017 resmio. All rights reserved.
//


// MARK: // Public
extension Sequence {
    func first(_ n: Int, fulfilling condition: (Iterator.Element) -> Bool) -> [Iterator.Element] {
        return self._first(n, fulfilling: condition)
    }
}


// MARK: // Private
private extension Sequence {
    func _first(_ n: Int, fulfilling condition: (Iterator.Element) -> Bool) -> [Iterator.Element] {
        var _n: Int = n
        var result: [Iterator.Element] = []
        result.reserveCapacity(n)
        for e in self {
            guard _n > 0 else { break }
            guard condition(e) else { continue }
            result.append(e)
            _n -= 1
        }
        return result
    }
}
