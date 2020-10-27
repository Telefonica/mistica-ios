//
//  NavigationBarStyles.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

import SwiftUI

private struct MisticaNavigationBarStyle: ViewModifier {
    init() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.shadowColor = .clear
        navBarAppearance.backgroundColor = .navigationBarBackground
        navBarAppearance.largeTitleTextAttributes = UINavigationBar.textAttributes(for: .textPreset2(weight: .light), color: UIColor.navigationBarPrimary)
        navBarAppearance.titleTextAttributes = UINavigationBar.textAttributes(for: .textPreset5(weight: .medium), color: UIColor.navigationBarPrimary)

        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().tintColor = .navigationBarPrimary
        UINavigationBar.appearance().barTintColor = .navigationBarBackground
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
