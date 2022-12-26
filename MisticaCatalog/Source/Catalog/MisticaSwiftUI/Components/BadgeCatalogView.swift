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
                    Badge(style: .flag)
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }

            section("Numeric") {
                HStack {
                    ForEach(1 ..< 11) {
                        Badge(style: .numeric($0))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
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
