//
//  ContentView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Mistica
import SwiftUI
import Shared
import MisticaSwiftUI

struct ContentView: View {
    @Binding var selectedBrandIndex: Int
    let brands: [BrandStyle]
    let selectedFramework: Framework

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                Tabs(brands.map({ TabItem(text: $0.id) }), selection: $selectedBrandIndex)
                    .background(Color.white)

                CatalogList(
                    framework: selectedFramework,
                    rows: CatalogRow.allCases
                )
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    if let misticaVersion = misticaVersion {
                        Text(misticaVersion)
                            .font(.textPreset5())
                            .foregroundColor(.textNavigationBarPrimary)
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    Image("mistica-logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 32)
                }
            }
            .misticaNavigationBarStyle()
            .navigationTitle("Mistica \(selectedFramework.name)")
        }
        .navigationViewStyle(.stack)
    }
}

private extension ContentView {
    var misticaVersion: String? {
        guard let infoPlist = Bundle.main.infoDictionary,
              let version = infoPlist["CFBundleShortVersionString"] as? String else { return nil }
        return "v\(version)"
    }
}
