import Foundation
import SwiftUI

@available(iOS 13.0, *)
public extension View {
    func misticaTabViewStyle() -> some View {
        modifier(MisticaTabViewStyle())
    }
}

@available(iOS 13.0, *)
private struct MisticaTabViewStyle: ViewModifier {
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.shadowImage = UIImage()
        appearance.shadowImage = UIImage(color: .divider)
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().backgroundColor = .appBarBackground
    }

    func body(content: Content) -> some View {
        content
            .accentColor(.textAppBarSelected)
    }
}
