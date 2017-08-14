//
//  Sequence (none).swift
//  SignificantSpices
//
//  Created by Jan Nash on 8/14/17.
//  Copyright © 2017 resmio. All rights reserved.
//


// MARK: // Public
extension Sequence {
    /// Returns a Boolean value indicating whether the sequence contains any
    /// element that does fulfill the given condition.
    ///
    /// Calling the method on an empty Sequence will always return `true`.
    /// See also: [Vacuous Truth (Wikipedia)](https://en.wikipedia.org/wiki/Vacuous_truth).
    ///
    /// - Parameter condition:
    ///     A closure that takes an element of the sequence as its argument
    ///     and returns a Boolean value that indicates whether the passed
    ///     element represents a match.
    /// - Returns:
    ///     `false` if the Sequence contains ANY element that DOES fulfill
    ///     the condition; otherwise `true`.
    ///
    public func none(fulfills condition: (Iterator.Element) -> Bool) -> Bool {
        return !self.contains(where: condition)
    }
}
