//
//  UINavigationBar+Mistica.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

public extension UINavigationBar {
    class var misticaLargeTitleTextAttributes: [NSAttributedString.Key: Any] {
        textAttributes(for: .textPreset7(constrainedToPreferredSize: .large), color: UIColor.textNavigationBarPrimary)
    }

    class var misticaTitleTextAttributes: [NSAttributedString.Key: Any] {
        textAttributes(for: .textPreset4(weight: .medium, constrainedToPreferredSize: .large), color: UIColor.textNavigationBarPrimary)
    }

    func applyMisticaStyle() {
        applyCommonOpaqueStyle()
        shadowImage = UIImage()
    }
}

private extension UINavigationBar {
    func applyCommonOpaqueStyle() {
        tintColor = .textNavigationBarPrimary
        barTintColor = .navigationBarBackground
        isTranslucent = false
        layoutMargins.left = 16
        layoutMargins.right = 16

        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.shadowColor = .clear
        navBarAppearance.backgroundColor = .navigationBarBackground
        navBarAppearance.largeTitleTextAttributes = UINavigationBar.misticaLargeTitleTextAttributes
        navBarAppearance.titleTextAttributes = UINavigationBar.misticaTitleTextAttributes
        standardAppearance = navBarAppearance
        compactAppearance = navBarAppearance
        scrollEdgeAppearance = navBarAppearance
    }

    class func textAttributes(for font: UIFont, color: UIColor) -> [NSAttributedString.Key: Any] {
        [
            .font: font,
            .foregroundColor: color,
            .shadow: NSShadow.clear()
        ]
    }
}

private extension NSShadow {
    class func clear() -> NSShadow {
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.clear
        shadow.shadowOffset = .zero
        return shadow
    }
}
