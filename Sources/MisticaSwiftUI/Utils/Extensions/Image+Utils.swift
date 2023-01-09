//
//  Image+Utils.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import SwiftUI

public extension Image {
    init(color: Color) {
        self.init(uiImage: UIImage(color: color.uiColor))
    }
}
