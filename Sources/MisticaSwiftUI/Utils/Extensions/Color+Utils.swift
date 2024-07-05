//
//  Color+Utils.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import SwiftUI

public extension Color {
    var uiColor: UIColor {
        UIColor(self)
    }

    init?(hex: String) {
        guard let uiColor = UIColor(hex: hex) else { return nil }
        self.init(uiColor)
    }
}

infix operator |: AdditionPrecedence

public extension Color {
    /// Easily define two colors for both light and dark mode.
    /// - Parameters:
    ///   - lightMode: The color to use in light mode.
    ///   - darkMode: The color to use in dark mode.
    /// - Returns: A dynamic color that uses both given colors respectively for the given user interface style.
    static func | (lightMode: Color, darkMode: Color) -> Color {
        Color(
            UIColor { (traitCollection) -> UIColor in
                traitCollection.userInterfaceStyle == .light ? lightMode.uiColor : darkMode.uiColor
            }
        )
    }
}

private extension Color {
    func components() -> (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        let scanner = Scanner(string: description.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
        var hexNumber: UInt64 = 0
        var r = CGFloat(0)
        var g = CGFloat(0)
        var b = CGFloat(0)
        var a = CGFloat(0)
        let result = scanner.scanHexInt64(&hexNumber)
        if result {
            r = CGFloat((hexNumber & 0xFF00_0000) >> 24) / 255.0
            g = CGFloat((hexNumber & 0x00FF_0000) >> 16) / 255.0
            b = CGFloat((hexNumber & 0x0000_FF00) >> 8) / 255.0
            a = CGFloat(hexNumber & 0x0000_00FF) / 255.0
        }
        return (r, g, b, a)
    }
}
