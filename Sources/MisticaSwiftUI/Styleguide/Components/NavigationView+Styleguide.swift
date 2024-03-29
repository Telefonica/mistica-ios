//
//  NavigationView+Styleguide.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import SwiftUI
import UIKit

public extension View {
    func misticaNavigationViewStyle() -> some View {
        modifier(MisticaNavigationViewStyle())
    }
}

private struct MisticaNavigationViewStyle: ViewModifier {
    init() {
        let backButtonAppearance = UIBarButtonItemAppearance()
        backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
        let backButtonImage = UIImage(systemName: "chevron.backward")?.withTintColor(
            Color.textNavigationBarPrimary.uiColor,
            renderingMode: .alwaysOriginal
        )

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .navigationBarBackground
        appearance.largeTitleTextAttributes = misticaLargeTitleTextAttributes
        appearance.titleTextAttributes = misticaTitleTextAttributes
        appearance.shadowColor = .clear
        appearance.backButtonAppearance = backButtonAppearance
        appearance.setBackIndicatorImage(backButtonImage, transitionMaskImage: backButtonImage)

        let scrollEdgeAppearance = UINavigationBarAppearance()
        scrollEdgeAppearance.configureWithTransparentBackground()
        scrollEdgeAppearance.backgroundColor = .navigationBarBackground
        scrollEdgeAppearance.largeTitleTextAttributes = misticaLargeTitleTextAttributes
        scrollEdgeAppearance.titleTextAttributes = misticaTitleTextAttributes
        scrollEdgeAppearance.backButtonAppearance = backButtonAppearance
        scrollEdgeAppearance.setBackIndicatorImage(backButtonImage, transitionMaskImage: backButtonImage)

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = scrollEdgeAppearance
        UINavigationBar.appearance().tintColor = .textNavigationBarPrimary
        UINavigationBar.appearance().barTintColor = .navigationBarBackground

        let textFieldSearchBarAppearance = UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self])
        textFieldSearchBarAppearance.defaultTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }

    func body(content: Content) -> some View {
        content
    }
}

// MARK: Helpers

private var misticaLargeTitleTextAttributes: [NSAttributedString.Key: Any] {
    textAttributes(
        for: .textPreset7(constrainedToPreferredSize: .large),
        color: .textNavigationBarPrimary
    )
}

private var hiddenTitleTextAttributes: [NSAttributedString.Key: Any] {
    textAttributes(
        for: .textPreset7(constrainedToPreferredSize: .large),
        color: .clear
    )
}

private var misticaTitleTextAttributes: [NSAttributedString.Key: Any] {
    textAttributes(
        for: .textPreset4(weight: .navigationBar, constrainedToPreferredSize: .large),
        color: .textNavigationBarPrimary
    )
}

private func textAttributes(for font: UIFont, color: UIColor) -> [NSAttributedString.Key: Any] {
    [
        .font: font,
        .foregroundColor: color,
        .shadow: NSShadow.clear()
    ]
}

private extension NSShadow {
    class func clear() -> NSShadow {
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.clear
        shadow.shadowOffset = .zero
        return shadow
    }
}
