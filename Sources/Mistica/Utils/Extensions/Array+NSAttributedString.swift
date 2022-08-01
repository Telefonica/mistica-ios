//
//  Array+NSAttributedString.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

extension Array where Element: NSAttributedString {
    func joined() -> NSAttributedString {
        let result = NSMutableAttributedString()
        for element in self {
            result.append(element)
        }
        return result
    }

    func joined(separator: NSAttributedString) -> NSAttributedString {
        let result = NSMutableAttributedString()
        for (index, element) in enumerated() {
            result.append(element)
            if index < count - 1 {
                result.append(separator)
            }
        }
        return result
    }
}
