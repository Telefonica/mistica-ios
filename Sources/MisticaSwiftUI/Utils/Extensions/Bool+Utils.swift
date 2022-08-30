//
//  Bool+Utils.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

extension Bool {
    static var iOS14: Bool {
        guard #available(iOS 14, *) else {
            return false
        }
        return true
    }

    static var iOS15: Bool {
        guard #available(iOS 15.0, *) else {
            return false
        }
        return true
    }
}
