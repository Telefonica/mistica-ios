//
//  TabView+Styleguide.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import SwiftUI

public extension View {
    func misticaTabViewStyle() -> some View {
        modifier(MisticaTabViewStyle())
    }
}

private struct MisticaTabViewStyle: ViewModifier {
    init() {
        UITabBarAppearance.applyMisticaStyle()
    }

    func body(content: Content) -> some View {
        content
            .accentColor(.textAppBarSelected)
    }
}

public extension UITabBarAppearance {
    static func applyMisticaStyle() {
        let appearance = UITabBarAppearance()
        if #available(iOS 26, *) {
            appearance.configureWithDefaultBackground()
        } else {
            appearance.configureWithTransparentBackground()
            appearance.shadowImage = UIImage(color: .divider)
            UITabBar.appearance().backgroundColor = .appBarBackground
        }
        
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().isTranslucent = true
    }
}
