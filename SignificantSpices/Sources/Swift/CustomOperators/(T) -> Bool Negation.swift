//
//  (T) -> Bool Negation.swift
//  SignificantSpices
//
//  Created by Jan Nash on 8/14/17.
//  Copyright © 2017 resmio. All rights reserved.
//


// MARK: // Public
prefix operator !
prefix public func ! <T>(_ closure: @escaping ((T) -> Bool)) -> ((T) -> Bool) {
    return { !closure($0) }
}
