//
//  Bool Compound Assignment.swift
//  SignificantSpices
//
//  Created by Jan Nash on 8/8/17.
//  Copyright © 2017 resmio. All rights reserved.
//


// MARK: in-place &&
infix operator &&= : AssignmentPrecedence
public func &&= (l: inout Bool, r: Bool) {
    l = l && r
}


// MARK: in-place ||
infix operator ||= : AssignmentPrecedence
public func ||= (l: inout Bool, r: Bool) {
    l = l || r
}
