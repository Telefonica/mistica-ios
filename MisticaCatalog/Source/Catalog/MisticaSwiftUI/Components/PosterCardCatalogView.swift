//
//  PosterCardCatalogView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import MisticaSwiftUI
import SwiftUI

struct PosterCardCatalogView: View {
    @State var tagTitle: String = "New"
    @State var preTitle: String = "From 149$"
    @State var title: String = "AirPods 4"
    @State var subTitle: String = "With Active Noise Cancellation"
    @State var description: String = "The next evolution of sound and comfort"

    @State var assetType: AssetType = .none
    @State var mediaType: MediaType = .image
    @State var aspectRatio: AspectRatio = .ratio7to10
    @State var topAction: TopAction = .none
    @State var hasSlot: Bool = false
    @State var isInverse: Bool = true

    enum AssetType: String, CaseIterable, Identifiable, Equatable {
        var id: Self { self }
        
        case none
        case icon
        case circledIcon
        case image
        
        func toPosterCardAssetType() -> PosterCardAssetType {
            switch self {
            case .none:
                return .none
            case .icon:
                return .icon(image: Image(systemName: "apple.logo"), foregroundColor: nil, backgroundColor: nil)
            case .circledIcon:
                return .icon(image: Image(systemName: "apple.logo"), foregroundColor: .neutralHigh, backgroundColor: .backgroundContainer)
            case .image:
                return .image(Image("tabItem"))
            }
        }
    }
    
    enum MediaType: String, CaseIterable, Identifiable, Equatable {
        var id: Self { self }

        case image
        case video
        case customColor = "custom"
        case skinColor = "skin"

        func toPosterCardMediaType(topActions: PosterCardTopActions) -> PosterCardMediaType {
            switch self {
            case .image:
                return .image(.airpods, topActions: topActions)
            case .video:
                return .video(
                    Bundle.main.url(forResource: "airpods", withExtension: "mp4")!,
                    parameters: .init(
                        muted: true,
                        autoplay: true,
                        posterImage: .airpods
                    )
                )
            case .customColor:
                return .customColor(.brand, topActions: topActions)
            case .skinColor:
                return .skinColor(.none, topActions: topActions)
            }
        }
    }

    enum AspectRatio: String, CaseIterable, Identifiable {
        var id: Self { self }

        case ratio1to1 = "1:1"
        case ratio7to10 = "7:10"
        case ratio9to10 = "9:10"
        case ratio16to9 = "16:9"

        var toPosterCardAspectRatio: PosterCardAspectRatio {
            switch self {
            case .ratio1to1: .ratio1to1
            case .ratio7to10: .ratio7to10
            case .ratio9to10: .ratio9to10
            case .ratio16to9: .ratio16to9
            }
        }
    }

    enum TopAction: String, CaseIterable, Identifiable {
        var id: Self { self }

        case none
        case dismiss
        case dismissAndAction = "dismiss + 1 action"
        case one = "1 action"
        case two = "2 actions"

        var toPosterCardTopAction: PosterCardTopActions {
            switch self {
            case .none:
                .none
            case .dismiss:
                .dismiss {}
            case .dismissAndAction:
                .dismissAndAction(
                    {},
                    .init(icon: Image(systemName: "heart"), callback: {})
                )
            case .one:
                .oneAction(.init(icon: Image(systemName: "heart"), callback: {}))
            case .two:
                .twoActions(
                    .init(icon: Image(systemName: "heart"), callback: {}),
                    .init(icon: Image(systemName: "heart"), callback: {})
                )
            }
        }
    }

    var body: some View {
        VStack {
            List {
                section("Tag Title") { TextField("Tag Title", text: $tagTitle) }
                section("Pre Title") { TextField("Pre Title", text: $preTitle) }
                section("Title") { TextField("Title", text: $title) }
                section("Subtitle") { TextField("Subtitle", text: $subTitle) }
                section("Description") { TextField("Description", text: $description) }
                section("Media type and aspect ratio") {
                    VStack {
                        Picker("Media Type", selection: $mediaType) {
                            ForEach(MediaType.allCases) {
                                Text($0.rawValue.capitalized)
                            }
                        }
                        .pickerStyle(.segmented)

                        Picker("Aspect Ratio", selection: $aspectRatio) {
                            ForEach(AspectRatio.allCases) {
                                Text($0.rawValue.capitalized)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                }

                section("Asset type") {
                    Picker("Asset type", selection: $assetType) {
                        ForEach(AssetType.allCases) {
                            Text($0.rawValue.capitalized)
                        }
                    }
                    .disabled(mediaType == .video)
                }
                
                section("Top Actions") {
                    Picker("Top Actions", selection: $topAction) {
                        ForEach(TopAction.allCases) {
                            Text($0.rawValue.capitalized)
                        }
                    }
                    .disabled(mediaType == .video)
                }
                
                section("Options") {
                    VStack {
                        Toggle("Has slot", isOn: $hasSlot)
                        Toggle("Inverse", isOn: $isInverse)
                    }
                }

                NavigationLink("Show Poster Card") {
                    posterCard()
                        .padding(.horizontal, 16)
                        .navigationBarTitle("DataCard")
                        .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
    }

    @ViewBuilder
    func posterCard() -> some View {
        VStack {
            PosterCard(
                mediaType: mediaType.toPosterCardMediaType(topActions: topAction.toPosterCardTopAction),
                themeVariant: isInverse ? .inverse : .none,
                aspectRatio: aspectRatio.toPosterCardAspectRatio,
                assetType: assetType.toPosterCardAssetType(),
                tag: Tag(style: .promo, text: tagTitle),
                preTitle: preTitle,
                title: title,
                subTitle: subTitle,
                description: description,
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
        PosterCardCatalogView()
    }
    .misticaNavigationViewStyle()
}
