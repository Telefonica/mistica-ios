//
//  Image+Utils.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import SwiftUI
import MisticaCommon

@available(iOS 13.0, *)
public extension Image {
    init(color: Color) {
        self.init(uiImage: UIImage(color: color.uiColor))
    }
}
