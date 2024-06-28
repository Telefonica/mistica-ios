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
                setUpFont(brandStyle: brands[selectedBrandIndex])
                setUpUIFont(brandStyle: brands[selectedBrandIndex])
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

    func setUpFont(brandStyle: BrandStyle) {
        switch brandStyle {
        case .vivoNew:
            FontStyle.fontNameForWeight = { weight in
                switch weight {
                case .light, .ultraLight, .thin:
                    return "VivoType-Light"
                case .medium, .bold, .semibold, .black, .heavy:
                    return "VivoType-Bold"
                default:
                    return "VivoType-Regular"
                }
            }
        case .o2, .o2New, .movistar:
            FontStyle.fontNameForWeight = { weight in
                switch weight {
                case .light, .ultraLight, .thin:
                    return "OnAir-Light"
                case .medium:
                    return "OnAir"
                case .bold, .semibold, .black, .heavy:
                    return "OnAir-Bold"
                default:
                    return "OnAir-Regular"
                }
            }
        case .vivo, .blau, .telefonica, .tu, .custom(_, _, _, _, _):
            FontStyle.fontNameForWeight = nil
        }
    }

    func setUpUIFont(brandStyle: BrandStyle) {
        switch brandStyle {
        case .vivoNew:
            FontStyle.uiFontNameForWeight = { weight in
                switch weight {
                case .light, .ultraLight, .thin:
                    return "VivoType-Light"
                case .medium, .bold, .semibold, .black, .heavy:
                    return "VivoType-Bold"
                default:
                    return "VivoType-Regular"
                }
            }
        case .o2, .o2New, .movistar:
            FontStyle.uiFontNameForWeight = { weight in
                switch weight {
                case .light, .ultraLight, .thin:
                    return "OnAir-Light"
                case .medium:
                    return "OnAir"
                case .bold, .semibold, .black, .heavy:
                    return "OnAir-Bold"
                default:
                    return "OnAir-Regular"
                }
            }
        case .vivo, .blau, .telefonica, .tu, .custom(_, _, _, _, _):
            FontStyle.uiFontNameForWeight = nil
        }
    }
}

extension UIColor {
    static var misticaCatalogTint = UIColor(hex: "#0066FF")!
}
