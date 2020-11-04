//
//  UINavigationBar+Mistica.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

import UIKit

public extension UINavigationBar {
    class var misticaLargeTitleTextAttributes: [NSAttributedString.Key: Any] {
        textAttributes(for: .textPreset2(weight: .light, constrainedToPreferredSize: .large), color: UIColor.navigationBarPrimary)
    }

    class var misticaTitleTextAttributes: [NSAttributedString.Key: Any] {
        textAttributes(for: .textPreset5(weight: .medium, constrainedToPreferredSize: .large), color: UIColor.navigationBarPrimary)
    }

    func applyMisticaStyle() {
        applyCommonOpaqueStyle()
        shadowImage = UIImage()
    }
}

private extension UINavigationBar {
    func applyCommonOpaqueStyle() {
        tintColor = .navigationBarPrimary
        barTintColor = .navigationBarBackground
        isTranslucent = false
        layoutMargins.left = 16
        layoutMargins.right = 16

        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.shadowColor = .clear
            navBarAppearance.backgroundColor = .navigationBarBackground
            navBarAppearance.largeTitleTextAttributes = UINavigationBar.misticaLargeTitleTextAttributes
            navBarAppearance.titleTextAttributes = UINavigationBar.misticaTitleTextAttributes
            standardAppearance = navBarAppearance
            compactAppearance = navBarAppearance
            scrollEdgeAppearance = navBarAppearance
        } else {
            largeTitleTextAttributes = UINavigationBar.misticaLargeTitleTextAttributes
            titleTextAttributes = UINavigationBar.misticaTitleTextAttributes
        }
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
