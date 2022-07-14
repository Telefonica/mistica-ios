//
//  Color+Utils.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import SwiftUI

@available(iOS 13.0, *)
public extension Color {
    var uiColor: UIColor {
        if #available(iOS 14.0, *) {
            return UIColor(self)
        } else {
            let components = components()
            return UIColor(red: components.r, green: components.g, blue: components.b, alpha: components.a)
        }
    }
}

@available(iOS 13.0, *)
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
