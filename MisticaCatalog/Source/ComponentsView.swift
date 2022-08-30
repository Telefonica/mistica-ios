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
    }
}
