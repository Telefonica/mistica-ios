//
//  SnapCardCatalogView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import MisticaSwiftUI
import SwiftUI

struct SnapCardCatalogView: View {
    @State var title: String = "AirPods 4"
    @State var subTitle: String = ""
    @State var description: String = "The next evolution of sound and comfort"
    @State var aspectRatio: AspectRatio = .ratio7to10
    @State var assetType: AssetType = .none
    @State var hasSlot: Bool = false
    @State var isInverse: Bool = false

    enum AspectRatio: String, CaseIterable, Identifiable {
        var id: Self { self }

        case ratio1to1 = "1:1"
        case ratio7to10 = "7:10"
        case ratio9to10 = "9:10"
        case ratio16to9 = "16:9"

        var toSnapCardAspectRatio: SnapCardAspectRatio {
            switch self {
            case .ratio1to1: .ratio1to1
            case .ratio7to10: .ratio7to10
            case .ratio9to10: .ratio9to10
            case .ratio16to9: .ratio16to9
            }
        }
    }

    enum AssetType: String, CaseIterable, Identifiable, Equatable {
        var id: Self { self }

        case none
        case icon = "Icon"
        case circledIcon = "Circled icon"
        case avatar = "Avatar"

        func toSnapCardAssetType() -> SnapCardAssetType {
            switch self {
            case .none:
                return .none
            case .icon:
                return .icon(image: Image(systemName: "apple.logo"), foregroundColor: nil, backgroundColor: nil)
            case .circledIcon:
                return .icon(image: Image(systemName: "apple.logo"), foregroundColor: .brand, backgroundColor: .brandLow)
            case .avatar:
                return .avatar(Image("netflix-logo"))
            }
        }
    }

    var body: some View {
        VStack {
            List {
                section("Title") { TextField("Title", text: $title) }
                section("Subtitle") { TextField("Subtitle", text: $subTitle) }
                section("Description") { TextField("Description", text: $description) }
                section("Aspect ratio") {
                    Picker("Aspect Ratio", selection: $aspectRatio) {
                        ForEach(AspectRatio.allCases) {
                            Text($0.rawValue.capitalized)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                section("Asset type") {
                    Picker("Asset type", selection: $assetType) {
                        ForEach(AssetType.allCases) {
                            Text($0.rawValue.capitalized)
                        }
                    }
                }
                section("Options") {
                    VStack {
                        Toggle("Has slot", isOn: $hasSlot)
                        Toggle("Inverse", isOn: $isInverse)
                    }
                }

                NavigationLink("Show Snap Card") {
                    snapCard()
                        .padding(.horizontal, 16)
                        .navigationBarTitle("SnapCard")
                        .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
    }

    @ViewBuilder
    func snapCard() -> some View {
        VStack {
            SnapCard(
                themeVariant: isInverse ? .inverse : .none,
                aspectRatio: aspectRatio.toSnapCardAspectRatio,
                assetType: assetType.toSnapCardAssetType(),
                title: title,
                subTitle: subTitle.isEmpty ? nil : subTitle,
                description: description.isEmpty ? nil : description,
                slot: {
                    if hasSlot {
                        HStack(alignment: .center) {
                            Spacer()
                            Text("This is a slot")
                            Spacer()
                        }
                        .padding()
                        .background(Color.green)
                    } else {
                        EmptyView()
                    }
                }
            )
        }
        .padding()
    }
}

#Preview {
    NavigationView {
        SnapCardCatalogView()
    }
    .misticaNavigationViewStyle()
}
