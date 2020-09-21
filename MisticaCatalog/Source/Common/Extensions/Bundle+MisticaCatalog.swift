//
//  Bundle+Mistica.swift
//  MisticaCatalog
//
//  Created by Pablo Bartolome on 08/07/2020.
//  Copyright © 2020 Telefonica. All rights reserved.
//

import Foundation

// A helper to access the framework bundle
extension Bundle {
    #if SWIFT_PACKAGE
        static let misticaCatalog = Bundle.module
    #else
        private final class Internal {}

        static let misticaCatalog = Bundle(for: Internal.self)
    #endif
}
