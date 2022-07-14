//
//  BadgeCatalogView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import MisticaSwiftUI
import SwiftUI

struct BadgeCatalogView: View {
    var body: some View {
        List {
            section("Flag") {
                HStack {
                    ForEach(0 ..< 11) { _ in
                        Badge(style: .flag)
                    }
                }
            }

            section("Numeric") {
                HStack {
                    ForEach(0 ..< 11) {
                        Badge(style: .numeric($0))
                    }
                }
            }
        }
    }
}

#if DEBUG
    struct BadgeCatalogView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                BadgeCatalogView()
            }
            .misticaNavigationViewStyle()
        }
    }
#endif
