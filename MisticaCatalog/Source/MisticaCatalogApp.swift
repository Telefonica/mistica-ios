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
                configureFontStyle(for: brands[selectedBrandIndex])
            }
            .onChange(of: selectedBrandIndex, perform: { selectedBrandIndex in
                MisticaConfig.brandStyle = brands[selectedBrandIndex]
                configureFontStyle(for: brands[selectedBrandIndex])
                withAnimation { reloadId = UUID() }
            })
            .id(reloadId)
        }
    }

    var misticaVersion: String {
        guard let infoPlist = Bundle.main.infoDictionary,
              let version = infoPlist["CFBundleShortVersionString"] as? String else { return "" }
        return "v\(version)"
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
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Text(misticaVersion)
                            .font(.textPreset2(weight: .regular))
                            .foregroundColor(.textSecondary)
                    }
                }
        }
        .tabItem {
            Image(image).renderingMode(.original)
        }
    }

    func setUpAppearance() {
        let buttonAppearance = UIBarButtonItemAppearance(style: .plain)
        buttonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
        
        let appearance = UINavigationBarAppearance()
        if #available(iOS 26, *) {
            appearance.configureWithTransparentBackground()
        } else {
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .background
        }
        
        appearance.buttonAppearance = buttonAppearance
        appearance.shadowColor = nil
        appearance.shadowImage = nil
        appearance.largeTitleTextAttributes[.font] = UIFont.systemFont(ofSize: 28, weight: .light)
        appearance.titleTextAttributes[.font] = UIFont.systemFont(ofSize: 18, weight: .regular)
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().tintColor = .misticaCatalogTint | .white
    }

    func configureFontStyle(for brandStyle: BrandStyle) {
        if let mapping = brandStyle.fontMapping {
            FontManager.shared.fontNameForWeight = { weight in
                mapping.fontName(for: weight)
            }
            FontManager.shared.uiFontNameForWeight = { weight in
                mapping.UIfontName(for: weight)
            }
        } else {
            FontManager.shared.fontNameForWeight = nil
            FontManager.shared.uiFontNameForWeight = nil
        }
    }
}

extension UIColor {
    static let misticaCatalogTint = UIColor(hex: "#0066FF")!
}
