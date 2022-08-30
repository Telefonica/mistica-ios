//
//  TabsCatalogView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import MisticaSwiftUI
import SwiftUI

enum TabsStyle: CaseIterable, CustomStringConvertible {
    case twoItems
    case threeItems
    case fourItems
    case sixItems
    var description: String {
        switch self {
        case .twoItems:
            return "Two elements"
        case .threeItems:
            return "Three elements"
        case .fourItems:
            return "Four elements"
        case .sixItems:
            return "Six elements"
        }
    }

    func tabs(withImage hasImage: Bool, hasLargeText: Bool) -> [TabItem] {
        func image(_ named: String) -> Image? {
            hasImage ? Image(systemName: named) : nil
        }

        func text(_ named: String) -> String {
            hasLargeText ? "Large \(named) text" : named
        }

        switch self {
        case .twoItems:
            return [
                TabItem(text: text("Person"), image: image("person")),
                TabItem(text: text("TV"), image: image("tv"))
            ]
        case .threeItems:
            return [
                TabItem(text: text("Person"), image: image("person")),
                TabItem(text: text("TV"), image: image("tv")),
                TabItem(text: text("Cloud"), image: image("cloud"))
            ]
        case .fourItems:
            return [
                TabItem(text: text("Person"), image: image("person")),
                TabItem(text: text("TV"), image: image("tv")),
                TabItem(text: text("Cloud"), image: image("cloud")),
                TabItem(text: text("Gaming"), image: image("gamecontroller"))
            ]

        case .sixItems:
            return [
                TabItem(text: text("Person"), image: image("person")),
                TabItem(text: text("TV"), image: image("tv")),
                TabItem(text: text("Cloud"), image: image("cloud")),
                TabItem(text: text("Gaming"), image: image("gamecontroller")),
                TabItem(text: text("Network"), image: image("network")),
                TabItem(text: text("Nature"), image: image("leaf"))
            ]
        }
    }
}

struct TabsCatalogView: View {
    @State var typeSelection = 0
    @State var tabsSelection = 0
    @State var hasImage = false
    @State var hasLargeText = false

    var body: some View {
        VStack(spacing: 0) {
            Tabs(
                TabsStyle.allCases[typeSelection].tabs(withImage: hasImage, hasLargeText: hasLargeText),
                selection: $tabsSelection
            )

            List {
                section("Type") { picker($typeSelection, options: TabsStyle.allCases) }
                section("Image") { Toggle("Has Image", isOn: $hasImage) }
                section("Text") { Toggle("Has Large Text", isOn: $hasLargeText) }
            }
        }
    }
}

#if DEBUG
    struct TabsCatalogView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                TabsCatalogView()
            }
            .misticaNavigationViewStyle()
        }
    }
#endif
