//
//  DataCardCatalogView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import MisticaSwiftUI
import SwiftUI

struct DataCardCatalogView: View {
    @State var headline: String = "Headline"
    @State var title: String = "Title"
    @State var subtitle: String = "Subtitle"
    @State var description: String = "Description"
    @State var hasDismissAction: Bool = false
    @State var hasButtons: Bool = true

    var body: some View {
        List {
            section("Headline") { TextField("Headline", text: $headline) }
            section("Title") { TextField("Title", text: $title) }
            section("Subtitle") { TextField("Subtitle", text: $subtitle) }
            section("Description") { TextField("Description", text: $description) }
            section("Dismiss") { Toggle("Has dismiss action", isOn: $hasDismissAction) }
            section("Buttons") { Toggle("Has buttons", isOn: $hasButtons) }

            NavigationLink("Show Card") {
                dataCard()
                    .padding(.horizontal, 16)
                    .navigationBarTitle("DataCard")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }

    @ViewBuilder
    func dataCard() -> some View {
        if hasButtons {
            DataCard(
                assetType: .image(image: .photo),
                headline: { Tag(style: .promo, text: headline).hidden(headline.isEmpty, remove: true) },
                title: title.isEmpty ? nil : title,
                subtitle: subtitle.isEmpty ? nil : subtitle,
                description: description.isEmpty ? nil : description,
                dismissAction: hasDismissAction ? {} : nil,
                primaryButton: { Button("Primary") {} },
                linkButton: { Button("Link") {} }
            )
            .titleAccessibilityLabel("Title")
            .subtitleAccessibilityIdentifier("Subtitle")
            .accessibilityIdentifier("Identifier")
        } else {
            DataCard(
                assetType: .image(image: .photo),
                headline: { Tag(style: .promo, text: headline).hidden(headline.isEmpty, remove: true) },
                title: title.isEmpty ? nil : title,
                subtitle: subtitle.isEmpty ? nil : subtitle,
                description: description.isEmpty ? nil : description,
                dismissAction: hasDismissAction ? {} : nil
            )
            .titleAccessibilityLabel("Title")
            .subtitleAccessibilityIdentifier("Subtitle")
            .accessibilityIdentifier("Identifier")
        }
    }
}

#if DEBUG
    struct DataCardCatalogView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                DataCardCatalogView()
            }
            .misticaNavigationViewStyle()
        }
    }
#endif
