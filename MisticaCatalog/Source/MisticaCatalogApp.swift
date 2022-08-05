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
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @State var reloadId = UUID()
    @State var selectedBrandIndex = 0
    @State var selectedTab = 0
    let brands = BrandStyle.allCases

    var body: some Scene {
        WindowGroup {
            TabView(selection: $selectedTab) {
                tab(name: "Components", image: selectedTab == 0 ? "ComponentsFilled" : "Components") {
                    ComponentsView(
                        selectedBrandIndex: $selectedBrandIndex,
                        brands: brands
                    )
                }
                .tag(0)
                
                tab(name: "Fonts", image: selectedTab == 1 ? "FontsFilled" : "Fonts") {
                    FontView()
                }
                .tag(1)
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
    func tab(
        name: String,
        image: String,
        @ViewBuilder content: () -> some View
    ) -> some View {
        NavigationView {
            content()
                .navigationTitle(name)
        }
        .tabItem {
            Image(image)
                .foregroundColor(.black)
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
    }
}
