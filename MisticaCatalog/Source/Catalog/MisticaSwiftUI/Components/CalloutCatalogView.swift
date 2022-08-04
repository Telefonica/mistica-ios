//
//  CalloutCatalogView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import MisticaSwiftUI
import SwiftUI

struct CalloutCatalogView: View {
    @State var title = "Title"
    @State var description = "Description"
    @State var hasAsset = true
    @State var hasDismiss = true

    var body: some View {
        List {
            section("Title") { TextField("Title", text: $title) }
            section("Description") { TextField("Description", text: $description) }
            section("Asset") { Toggle("Has Asset", isOn: $hasAsset) }
            section("Dismiss") { Toggle("Has Dismiss", isOn: $hasDismiss) }

            NavigationLink("Show") {
                ScrollView {
                    VStack {
                        Callout(
                            assetType: assetType,
                            title: title,
                            description: description,
                            dismissAction: dismissAction,
                            primaryButton: { Button("Primary") {} }
                        )

                        Callout(
                            assetType: assetType,
                            title: title,
                            description: description,
                            dismissAction: dismissAction,
                            primaryButton: { Button("Primary") {} },
                            secondaryButton: { Button("Secondary") {} }
                        )

                        Callout(
                            assetType: assetType,
                            title: title,
                            description: description,
                            dismissAction: dismissAction,
                            primaryButton: { Button("Primary") {} },
                            linkButton: { Button("Link") {} }
                        )

                        Callout(
                            assetType: assetType,
                            title: title,
                            description: description,
                            dismissAction: dismissAction,
                            secondaryButton: { Button("Secondary") {} }
                        )

                        Callout(
                            assetType: assetType,
                            title: title,
                            description: description,
                            dismissAction: dismissAction,
                            secondaryButton: { Button("Secondary") {} },
                            linkButton: { Button("Link") {} }
                        )

                        Callout(
                            assetType: assetType,
                            title: title,
                            description: description,
                            dismissAction: dismissAction,
                            linkButton: { Button("Link") {} }
                        )
                    }
                    .padding()
                }
            }
        }
    }

    var assetType: CalloutAssetType {
        hasAsset ? .image(image: Image(systemName: "photo")) : .none
    }

    var dismissAction: (() -> Void)? {
        hasDismiss ? {} : nil
    }
}

#if DEBUG
    struct CalloutCatalogView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                CalloutCatalogView()
            }
            .misticaNavigationViewStyle()
        }
    }
#endif
