//
//  Optional (IsNilOrEmpty).swift
//  SignificantSpices
//
//  Created by Jan Nash on 8/9/17.
//  Copyright © 2017 resmio. All rights reserved.
//


// MARK: // Public
// MARK: Optional<String>
extension Optional where Wrapped == String {
    public var isNilOrEmpty: Bool {
        return self?.isEmpty ?? true
    }
}


// MARK: Optional<Collection>
extension Optional where Wrapped: Collection {
    public var isNilOrEmpty: Bool {
        return self?.isEmpty ?? true
    }
}
