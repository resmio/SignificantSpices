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
    /// Returns a Boolean value indicating whether the sequence contains any
    /// element that does not fulfill the given condition.
    ///
    /// The behaviour of this method is defined the same way as in python's 
    /// `all()`, which means that calling the method on an empty Sequence 
    /// will always return `true`.
    ///
    /// See also: [Vacuous Truth (Wikipedia)](https://en.wikipedia.org/wiki/Vacuous_truth).
    ///
    /// - Parameter condition: 
    ///     A closure that takes an element of the sequence as its argument 
    ///     and returns a Boolean value that indicates whether the passed 
    ///     element represents a match.
    /// - Returns: 
    ///     `false` if the Sequence contains ANY element that does NOT fulfill 
    ///     the condition; otherwise `true`.
    ///
    public func all(fulfill condition: ((Iterator.Element) -> Bool)) -> Bool {
        return !self.contains(where: { !condition($0) })
    }
}
