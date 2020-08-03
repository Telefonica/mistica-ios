//
//  Optional+Utils.swift
//  MisticaCatalog
//
//  Created by Jose Miguel Brocal on 03/08/2020.
//  Copyright © 2020 Telefonica. All rights reserved.
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
