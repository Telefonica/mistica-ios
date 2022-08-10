//
//  MisticaCatalogApp.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import MisticaSwiftUI
import SwiftUI

@main
struct MisticaCatalogApp: App {
    enum Tabs: Hashable {
        case fonts
        case components
        case colors
    }
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @State var reloadId = UUID()
    @State var selectedBrandIndex = 0
    @State var selectedTab = Tabs.components
    let brands = BrandStyle.allCases

    var body: some Scene {
        WindowGroup {
            TabView(selection: $selectedTab) {
                tab(name: "Components", image: selectedTab == .components ? "ComponentsFilled" : "Components") {
                    ComponentsView(
                        selectedBrandIndex: $selectedBrandIndex,
                        brands: brands
                    )
                }
                .tag(Tabs.components)

                tab(name: "Colors", image: selectedTab == .colors ? "ColorsFilled" : "Colors") {
                    ColorsView()
                }
                .tag(Tabs.colors)

                tab(name: "Fonts", image: selectedTab == .fonts ? "FontsFilled" : "Fonts") {
                    FontView()
                }
                .tag(Tabs.fonts)

            }
            .misticaTabViewStyle()
            .onAppear {
                setUpAppearance()
            }
            .onChange(of: selectedBrandIndex, perform: { selectedBrandIndex in
                MisticaConfig.brandStyle = brands[selectedBrandIndex]
                withAnimation { reloadId = UUID() }
            })
            .id(reloadId)
        }
    }

    @ViewBuilder
    func tab<Content: View>(
        name: String,
        image: String,
        @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationView {
            content()
                .navigationTitle(name)
        }
        .tabItem {
            Image(image).renderingMode(.original)
        }
    }

    func setUpAppearance() {
        let buttonAppearance = UIBarButtonItemAppearance(style: .plain)
        buttonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.buttonAppearance = buttonAppearance
        appearance.shadowColor = nil
        appearance.shadowImage = nil
        appearance.largeTitleTextAttributes[.font] = UIFont.systemFont(ofSize: 28, weight: .light)
        appearance.titleTextAttributes[.font] = UIFont.systemFont(ofSize: 18, weight: .regular)
        appearance.backgroundColor = .background

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().tintColor = .misticaCatalogTint | .white
    }
}

extension UIColor {
    static var misticaCatalogTint = UIColor(hex: "#0066FF")!
}
