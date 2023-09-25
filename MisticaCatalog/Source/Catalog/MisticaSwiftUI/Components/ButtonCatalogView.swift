//
//  ButtonCatalogView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import MisticaSwiftUI
import SwiftUI

struct ButtonsCatalogView: View {
    private enum Constants {
        static var styles: [Style] {
            [
                Style(buttonStyle: .misticaPrimary(), title: "Primary", inverse: false),
                Style(buttonStyle: .misticaSecondary(), title: "Secondary", inverse: false),
                Style(buttonStyle: .misticaDanger(), title: "Danger", inverse: false),
                Style(buttonStyle: .misticaLink(), title: "Link", inverse: false),
                Style(buttonStyle: .misticaPrimaryInverse(), title: "Primary Inverse", inverse: true),
                Style(buttonStyle: .misticaSecondaryInverse(), title: "Secondary Inverse", inverse: true),
                Style(buttonStyle: .misticaLinkInverse(), title: "Link Inverse", inverse: true),

                Style(buttonStyle: .misticaPrimary(small: true), title: "Primary Small", inverse: false),
                Style(buttonStyle: .misticaSecondary(small: true), title: "Secondary Small", inverse: false),
                Style(buttonStyle: .misticaDanger(small: true), title: "Danger", inverse: false),
                Style(buttonStyle: .misticaPrimaryInverse(small: true), title: "Primary Inverse Small", inverse: true),
                Style(buttonStyle: .misticaSecondaryInverse(small: true), title: "Secondary Inverse Small", inverse: true),
                Style(buttonStyle: .misticaLink(small: true), title: "Link Small", inverse: false),
                Style(buttonStyle: .misticaLinkInverse(small: true), title: "Link Inverse Small", inverse: true),
                Style(buttonStyle: .misticaLink(withChevron: true), title: "Link Chevron", inverse: false),
                Style(buttonStyle: .misticaLinkInverse(withChevron: true), title: "Link Chevron Inverse", inverse: true)
            ]
        }
    }

    private struct Style {
        let buttonStyle: MisticaButtonStyle
        let title: String
        let inverse: Bool
    }

    var body: some View {
        List {
            ForEach(Constants.styles, id: \.title) { style in

                Section {
                    HStack {
                        Spacer()

                        VStack(alignment: .center) {
                            Button("Normal") {}
                                .padding()
                                .buttonStyle(style.buttonStyle)

                            Button("Disabled") {}
                                .disabled(true)
                                .padding()
                                .buttonStyle(style.buttonStyle)

                            Button("Loading") {}
                                .loading(true, title: "Loading title")
                                .padding()
                                .buttonStyle(style.buttonStyle)
                        }

                        Spacer()
                    }
                    .listRowBackground(style.inverse ? Color.backgroundBrand : Color.background)
                } header: {
                    Text(style.title)
                }
            }
        }
    }
}

#if DEBUG
    struct ButtonsCatalogView_Previews: PreviewProvider {
        static var previews: some View {
            ButtonsCatalogView()
        }
    }
#endif
