//
//  ChipCatalogView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import MisticaSwiftUI
import SwiftUI

struct ChipCatalogView: View {
    @State var inverseStyle = false
    @State var withIcon = false
    @State var isDismissible = false
    @State var isChipSelected = false
    @State var isChipDismissed = false

    var body: some View {
        VStack {
            HStack {
                Chip(
                    text: "with icon",
                    isSelected: $withIcon
                )
                Chip(
                    text: "inverse style",
                    isSelected: $inverseStyle
                )
                Chip(
                    text: "dismiss button",
                    isSelected: $isDismissible
                )
            }
            Divider()
                .padding()
            if isDismissible {
                Chip(
                    style: inverseStyle ? .inverse : .normal,
                    text: isChipDismissed ? "Bye!" : "Dismissible chip",
                    icon: withIcon ? Image("bell-regular") : nil,
                    onDismiss: { isChipDismissed.toggle() }
                )
            } else {
                Chip(
                    style: inverseStyle ? .inverse : .normal,
                    text: isChipSelected ? "Selected!" : "Unselected",
                    icon: withIcon ? Image("bell-regular") : nil,
                    isSelected: $isChipSelected
                )
            }
            Spacer()
        }
        .padding()
        .background(inverseStyle ? Color.backgroundBrand : Color.background)
    }
}

#if DEBUG
    struct ChipCatalogView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                ChipCatalogView()
            }
            .misticaNavigationViewStyle()
        }
    }
#endif
