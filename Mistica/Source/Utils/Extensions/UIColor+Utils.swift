//
//  UIColor+Utils.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 255) {
        self.init(
            red: r / 255,
            green: g / 255,
            blue: b / 255,
            alpha: a / 255
        )
    }
}
