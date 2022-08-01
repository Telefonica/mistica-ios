//
//  AssetType.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

enum AssetType {
    // The asset is shared on all brands styles
    case common

    // The asset changes per brand style
    case branded

    // The asset changes per brand style and per theme variant
    case brandedAndThemed
}
