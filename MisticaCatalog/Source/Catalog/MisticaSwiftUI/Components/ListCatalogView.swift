//
//  ListCatalogView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import MisticaSwiftUI
import SwiftUI

struct ListCatalogView: View {
    enum PresetType: String {
        case none
        case toggle
        case navigation
    }

    private struct Style {
        let rowStyle: CellStyle
        let title: String
        let subtitle: String
        let description: String
    }

    @State var title: String = "Title"
    @State var subtitle: String = "Subtitle"
    @State var description: String = "Description"

    @State var selectedStyleIndex = 0
    @State var styles: [CellStyle] = [
        .boxed,
        .fullwidth
    ]

    @State var selectedAssetTypeIndex = 0
    @State var assetTypes: [CellAssetType] = [
        .none,
        .roundImage(.photo),
        .squaredImage(.netflixLogo, size: CGSize(width: 40, height: 40)),
        .largeIcon(.photo, foregroundColor: .white, backgroundColor: .brand),
        .smallIcon(.photo, foregroundColor: .border)
    ]

    @State var selectedPresetTypeIndex = 0
    @State var presetTypes: [PresetType] = [
        .none,
        .toggle,
        .navigation
    ]

    @State var hasHeadlineView = false
    @State var presetToggle = false

    var body: some View {
        List {
            section("Title") { TextField("Title", text: $title) }
            section("Subtitle") { TextField("Subtitle", text: $subtitle) }
            section("Description") { TextField("Description", text: $description) }
            section("Style") { stylePicker }
            section("Asset Type") { assetTypePicker }
            section("Preset") { presetTypePicker }
            section("Headline") { Toggle("Headline View", isOn: $hasHeadlineView) }

            NavigationLink("Show List") {
                List {
                    let range = 0 ..< 20
                    ForEach(range, id: \.self) { count in
                        Cell(
                            style: styles[selectedStyleIndex],
                            title: title,
                            subtitle: subtitle.isEmpty ? nil : subtitle,
                            description: description.isEmpty ? nil : description,
                            assetType: assetTypes[selectedAssetTypeIndex],
                            presetView: { presetView },
                            headlineView: { headlineView },
                            destinationView: { Text("Detail view \(count)") }
                        )
                        .shouldShowDivider(count != range.last)
                    }
                }
                .misticaListStyle()
                .navigationBarTitle("List", displayMode: .inline)
            }
        }
    }

    @ViewBuilder
    var stylePicker: some View {
        picker($selectedStyleIndex, options: styles)
            .pickerStyle(SegmentedPickerStyle())
    }

    @ViewBuilder
    var assetTypePicker: some View {
        picker($selectedAssetTypeIndex, options: assetTypes)
            .pickerStyle(SegmentedPickerStyle())
    }

    @ViewBuilder
    var presetTypePicker: some View {
        picker($selectedPresetTypeIndex, options: presetTypes)
            .pickerStyle(SegmentedPickerStyle())
    }

    @ViewBuilder
    var presetView: some View {
        switch presetTypes[selectedPresetTypeIndex] {
        case .none:
            EmptyView()
        case .navigation:
            CellNavigationPreset(badgeStyle: .flag)
        case .toggle:
            Toggle("", isOn: $presetToggle)
        }
    }

    @ViewBuilder
    var headlineView: some View {
        if hasHeadlineView {
            Tag(style: .promo, text: "HEADLINE")
        } else {
            EmptyView()
        }
    }
}

extension Image {
    static let photo = Image(systemName: "photo")
    static let netflixLogo = Image("netflix-logo")
}

extension CellAssetType: Swift.CustomStringConvertible {
    public var description: String {
        switch self {
        case .none:
            return "None"
        case .roundImage:
            return "Round Image"
        case .squaredImage:
            return "Squared Image"
        case .smallIcon:
            return "Small Icon"
        case .largeIcon:
            return "Large Icon"
        }
    }
}

extension CellStyle: Swift.CustomStringConvertible {
    public var description: String {
        switch self {
        case .fullwidth:
            return "Fullwidth"
        case .boxed:
            return "Boxed"
        }
    }
}

extension ListCatalogView.PresetType: CustomStringConvertible {
    var description: String {
        rawValue.capitalized
    }
}

#if DEBUG
    struct ListsCatalogView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                ListCatalogView()
            }
            .misticaNavigationViewStyle()
        }
    }
#endif
