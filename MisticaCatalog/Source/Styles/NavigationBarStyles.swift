//
//  NavigationBarStyles.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Mistica
import SwiftUI
import UIKit

private struct MisticaNavigationBarStyle: ViewModifier {
    init() {
        UINavigationBarAppearance.applyMisticaStyle()
    }

    func body(content: Content) -> some View {
        content
    }
}

extension View {
    func misticaNavigationBarStyle() -> some View {
        modifier(MisticaNavigationBarStyle())
    }
}

public extension UINavigationBarAppearance {
    static func applyMisticaStyle() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.shadowColor = .clear
        navBarAppearance.backgroundColor = .navigationBarBackground
        navBarAppearance.largeTitleTextAttributes = UINavigationBar.misticaLargeTitleTextAttributes
        navBarAppearance.titleTextAttributes = UINavigationBar.misticaTitleTextAttributes

        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().tintColor = .textNavigationBarPrimary
        UINavigationBar.appearance().barTintColor = .navigationBarBackground
    }
}
