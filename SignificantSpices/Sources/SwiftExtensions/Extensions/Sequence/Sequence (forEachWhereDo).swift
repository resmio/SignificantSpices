//
//  Sequence (forEachWhereDo).swift
//  SignificantSpices
//
//  Created by Jan Nash (resmio) on 09.10.18.
//  Copyright © 2018 resmio. All rights reserved.
//

import Foundation


// MARK: // Public
public extension Sequence {
    func forEach(where condition: (Element) -> Bool, `do` body: (Element) -> Void) {
        self.forEach({ if condition($0) { body($0) } })
    }
}
