//
//  Optional+Utils.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

extension Optional where Wrapped: StringProtocol {
    var isEmpty: Bool {
        switch self {
        case .none:
            return true
        case .some(let value):
            guard value.isEmpty else { return false }
            guard let range = String(value).rangeOfCharacter(from: CharacterSet.whitespacesAndNewlines.inverted) else { return true }

            return range.isEmpty
        }
    }
}
