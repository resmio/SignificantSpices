//
//  DeinitDetector.swift
//  SignificantSpices
//
//  Created by Jan Nash (resmio) on 08.08.19.
//  Copyright © 2019 resmio. All rights reserved.
//

import Foundation


// MARK: // Public
// MARK: Class Declaration
public class DeinitDetector {
    // Init
    public init(_ deinitCallback: @escaping (() -> Void)) {
        self._deinitCallback = deinitCallback
    }
    
    // Deinit
    deinit { self._deinitCallback() }
    
    // Private Variables
    private var _deinitCallback: (() -> Void)
}
