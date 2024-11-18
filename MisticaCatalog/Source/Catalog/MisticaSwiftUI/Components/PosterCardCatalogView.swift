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

    @State var mediaType: MediaType = .image
    @State var aspectRatio: AspectRatio = .ratio7to10
    @State var topAction: TopAction = .none
    @State var hasSlot: Bool = false

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
                    //Bundle.main.url(forResource: "airpods", withExtension: "mp4")!,
                    URL(string: "https://www.apple.com/105/media/us/ipad/2024/45762adb-901a-4726-8b0c-1f3ee092b09a/anim/welcome-hero/xlarge.mp4")!,
                    //URL(string: "https://github.com/mediaelement/mediaelement-files/raw/refs/heads/master/big_buck_bunny.mp4")!,
                    //URL(string: "https://file-examples.com/storage/fef4e75e176737761a179bf/2017/04/file_example_MP4_1920_18MG.mp4")!,
                    parameters: .init(
                        muted: true,
                        autoplay: true,
                        posterImage: .airpods
                    )
                )
            case .customColor:
                return .customColor(.brand, topActions: topActions)
            case .skinColor:
                return .skinColor(.brand, topActions: topActions)
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
                    .dismiss({})
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
                    
                section("Options") {
                    VStack {
                        Picker("Top Actions", selection: $topAction) {
                            ForEach(TopAction.allCases) {
                                Text($0.rawValue.capitalized)
                            }
                        }
                        .disabled(mediaType == .video)
                        
                        Toggle("Has slot", isOn: $hasSlot)
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
        ScrollView(showsIndicators: false) {
            PosterCard(
                mediaType: mediaType.toPosterCardMediaType(topActions: topAction.toPosterCardTopAction),
                aspectRatio: aspectRatio.toPosterCardAspectRatio,
                tagTitle: tagTitle,
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
