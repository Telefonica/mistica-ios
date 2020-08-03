//
//  NavigationBar+Toolkit.swift
//  MisticaCatalog
//
//  Created by Jose Miguel Brocal on 03/08/2020.
//  Copyright © 2020 Telefonica. All rights reserved.
//

import Mistica
import UIKit

extension UINavigationBar {
    func applyOpaqueStyleWithoutShadow() {
        applyCommonOpaqueStyle()
        shadowImage = UIImage()
    }

    static func textAttributes(for fontStyle: FontStyle, color: UIColor) -> [NSAttributedString.Key: Any] {
        [
            .font: UIFont.fixedFont(for: fontStyle),
            .foregroundColor: color,
            .shadow: NSShadow.clear()
        ]
    }

    private func applyCommonOpaqueStyle() {
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
            navBarAppearance.largeTitleTextAttributes = UINavigationBar.textAttributes(for: .display3, color: UIColor.navigationBarPrimary)
            navBarAppearance.titleTextAttributes = UINavigationBar.textAttributes(for: .title, color: UIColor.navigationBarPrimary)
            standardAppearance = navBarAppearance
            compactAppearance = navBarAppearance
            scrollEdgeAppearance = navBarAppearance
        } else {
            largeTitleTextAttributes = UINavigationBar.textAttributes(for: .display3, color: UIColor.navigationBarPrimary)
            titleTextAttributes = UINavigationBar.textAttributes(for: .title, color: UIColor.navigationBarPrimary)
        }
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
