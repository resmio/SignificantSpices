//
//  CustomOperators.swift
//  SignificantSpices
//
//  Created by Jan Nash on 8/8/17.
//  Copyright © 2017 resmio. All rights reserved.
//


// MARK: - - Bool In-Place Assignment Operators
// MARK: in-place &&
infix operator &&= : AssignmentPrecedence
public func &&= (lhs: inout Bool, rhs: Bool) {
    lhs = lhs && rhs
}

// MARK: in-place ||
infix operator ||= : AssignmentPrecedence
public func ||= (lhs: inout Bool, rhs: Bool) {
    lhs = lhs || rhs
}

