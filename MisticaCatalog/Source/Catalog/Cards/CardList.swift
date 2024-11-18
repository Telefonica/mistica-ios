//
//  CardList.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import MisticaSwiftUI
import SwiftUI

struct CardList: View {
    @State var selectedFrameworkIndex = 0
    let rows: [CardRow]

    var body: some View {
        List {
            ForEach(rows) { row in
                Cell(
                    style: .fullwidth,
                    title: row.title,
                    subtitle: nil,
                    description: nil,
                    assetType: .smallIcon(
                        Image(uiImage: row.icon),
                        foregroundColor: nil
                    ),
                    presetView: { CellNavigationPreset() },
                    headlineView: {},
                    destinationView: {
                        componentView(for: row)
                            .navigationTitle(row.title)
                            .navigationBarTitleDisplayMode(.inline)
                    }
                )
                .shouldShowDivider(row != rows.last)
            }
        }
        .misticaListStyle()
    }

    @ViewBuilder
    func componentView(for row: CardRow) -> some View {
        VStack(spacing: 0) {
            Tabs(
                Framework.allCases.map { TabItem(text: $0.name) },
                selection: $selectedFrameworkIndex
            )

            switch Framework.allCases[selectedFrameworkIndex] {
            case .swiftUI:
                row.swiftUIComponent.expandVertically()
            case .uiKit:
                row.uiKitComponent.expandVertically()
            }
        }
    }
}

private extension CardRow {
    @ViewBuilder
    var swiftUIComponent: some View {
        switch self {
        case .dataCard:
            DataCardCatalogView()
        case .posterCard:
            PosterCardCatalogView()
        case .snapCard:
            notImplementedView
        }
    }

    @ViewBuilder
    var uiKitComponent: some View {
        switch self {
        case .dataCard:
            ComponentViewController(UICatalogCardsViewController())
        case .posterCard,
                .snapCard:
            notImplementedView
        }
    }

    @ViewBuilder
    var notImplementedView: some View {
        Text("Not implemented yet")
            .font(.textPreset5())
            .foregroundColor(.textPrimary)
    }
}

#Preview {
    NavigationView {
        CardList(rows: CardRow.allCases)
    }
    .misticaNavigationViewStyle()
}
