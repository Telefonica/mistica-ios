//
//  URL+Utils.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

internal extension URL {
    /**
     Apple’s URL parsing implemented RFC1738/1808 standard and was changed to RFC3986 starting from iOS 17.

     Actually, it can produce problems with code written before, because now URL(urlString: "Invalid URL") is not nil. Apple updated the URL initializer for iOS 17 with a new Bool parameter     encodingInvalidCharacters that has a default value (true) — it is what makes the behavior unpredictable. This initializer can revert the old behavior and add false directly enconding invalid characters.
     */

    init?(urlString: String) {
        if #available(iOS 17.0, *) {
            self.init(string: urlString, encodingInvalidCharacters: false)
        } else {
            self.init(string: urlString)
        }
    }
}
