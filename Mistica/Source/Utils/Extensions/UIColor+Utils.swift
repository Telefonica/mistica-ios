//
//  UIColor+Utils.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
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
    
    public convenience init?(hex: String) {
        var hexColor = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if hexColor.hasPrefix("#") {
            hexColor.remove(at: hexColor.startIndex)
        }

        if hexColor.count != 6 {
            return nil
        }

        var rgbValue: UInt64 = 0
        Scanner(string: hexColor).scanHexInt64(&rgbValue)

        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
