//
//  shortDescription.swift
//  SignificantSpices
//
//  Created by Jan Nash (resmio) on 08.08.19.
//  Copyright © 2019 resmio. All rights reserved.
//

import Foundation


// MARK: // Public
// MARK: -
// MARK: Protocol Declaration
public protocol CustomShortStringConvertible {
    func additionalShortDescription() -> String?
}
