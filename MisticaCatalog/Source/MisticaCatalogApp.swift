//
//  MisticaCatalogApp.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Mistica
import MisticaCommon
import SwiftUI

@main
struct MisticaCatalogApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @State var id = UUID()
    @State var selectedBrandIndex = 0
    @State var selection = 0
    let brands = BrandStyle.allCases

    var body: some Scene {
        WindowGroup {
            TabView(selection: $selection) {
                tab(selectedFramework: .uiKit)
                    .tag(0)

                tab(selectedFramework: .swiftUI)
                    .tag(1)
            }
            .misticaTabViewStyle()
            .id(id)
            .onChange(of: selectedBrandIndex, perform: { selectedBrandIndex in
                let newBrandStyle = brands[selectedBrandIndex]

                MisticaConfig.brandStyle = newBrandStyle
                MisticaConfig.styleControls(MisticaControlStyle.allCases)

                // Force navigation view updates
                UITabBarAppearance.applyMisticaStyle()
                UINavigationBarAppearance.applyMisticaStyle()

                // Force a reloads
                withAnimation { id = UUID() }
            })
            .animation(Animation.default, value: id)
        }
    }

    func tab(
        selectedFramework: Framework
    ) -> some View {
        NavigationView {
            ContentView(
                selectedBrandIndex: $selectedBrandIndex,
                brands: brands,
                selectedFramework: selectedFramework
            )
            .misticaNavigationBarStyle()
            .navigationTitle("Mistica \(selectedFramework.name)")
        }
        .tabItem {
            Label(
                selectedFramework.name,
                systemImage: selectedFramework.tabImageName
            )
        }
    }
}

extension Framework {
    var tabImageName: String {
        switch self {
        case .swiftUI:
            return "swift"
        case .uiKit:
            return "applelogo"
        }
    }
}
