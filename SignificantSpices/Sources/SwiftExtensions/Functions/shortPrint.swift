//
//  shortPrint.swift
//  SignificantSpices
//
//  Created by Jan Nash (resmio) on 08.08.19.
//  Copyright © 2019 resmio. All rights reserved.
//

import Foundation


// MARK: // Public
// MARK: Function Declarations
public func shortPrint(_ inst: Any?) {
    print(shortDescription(of: inst))
}


public func shortDescription(of v: Any?) -> String {
    guard let inst: Any = v else {
        return "nil"
    }
    
    let additionalDesc: String = {
        guard let add: String = (inst as? CustomShortStringConvertible)?.additionalShortDescription() else { return "" }
        return "(" + add + ")"
    }()
    
    let typ: Any.Type = type(of: inst)
    guard typ is AnyClass else {
        return "\(typ)\(inst)\(additionalDesc)"
    }
    
    let object: AnyObject = inst as AnyObject
    let identifierString: String = ObjectIdentifier(object).debugDescription
    let prefixRemoved: String = identifierString.replacingOccurrences(of: "ObjectIdentifier(0x", with: "")
    let identityString: String = prefixRemoved.replacingOccurrences(of: ")", with: "")
    let range: NSRange = NSMakeRange(0, identityString.count)
    let regex: NSRegularExpression = try! NSRegularExpression(pattern: "^0*", options: .caseInsensitive)
    let stringWithPurgedLeadingZeroes: String = regex.stringByReplacingMatches(in: identityString, range: range, withTemplate: "")
    return "<\(typ): \(stringWithPurgedLeadingZeroes)>\(additionalDesc)"
}
