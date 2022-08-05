//
//  ComponentsView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Mistica
import MisticaCommon
import MisticaSwiftUI
import SwiftUI

struct ComponentsView: View {
    @Binding var selectedBrandIndex: Int
    let brands: [BrandStyle]

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Tabs(brands.map { TabItem(text: $0.name) }, selection: $selectedBrandIndex)
                .background(Color.background)

            CatalogList(
                rows: CatalogRow.allCases
            )
        }
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                if let misticaVersion = misticaVersion {
                    Text(misticaVersion)
                        .font(.textPreset2(weight: .regular))
                        .foregroundColor(.textSecondary)
                }
            }
        }
    }
}

private extension ComponentsView {
    var misticaVersion: String? {
        guard let infoPlist = Bundle.main.infoDictionary,
              let version = infoPlist["CFBundleShortVersionString"] as? String else { return nil }
        return "v\(version)"
    }
}
