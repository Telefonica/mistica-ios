//
//  Bundle+Mistica.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

// A helper to access the framework bundle
extension Bundle {
    #if SWIFT_PACKAGE
        static let mistica = Bundle.module
    #else
        private final class Internal {}

        static let mistica = Bundle(for: Internal.self)
    #endif
}
