//
//  SkeletonsCatalogView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import MisticaSwiftUI
import SwiftUI

struct SkeletonsCatalogView: View {
    @State var inverseStyle = false

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 40.0) {
                skeletonSection(title: "Line", skeleton: Skeleton(type: .line(width: 360)))

                skeletonSection(title: "Text", skeleton: Skeleton(type: .text()))

                skeletonSection(title: "Circle", skeleton: Skeleton(type: .circle(size: .init(width: 40, height: 40))))

                skeletonSection(title: "Row", skeleton: Skeleton(type: .row))

                skeletonSection(title: "Rectangle", skeleton: Skeleton(type: .rectangle(width: 360, height: 180, isRounded: true)))

                Spacer()
            }
            .padding()
            .background(inverseStyle ? Color.brand : Color.background)
        }
    }

    private func skeletonSection(title: String, skeleton: Skeleton) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title)
                .font(.system(size: 16, weight: .bold))
            skeleton
        }
    }
}

#if DEBUG
    struct SkeletonCatalogView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                SkeletonsCatalogView()
            }
            .misticaNavigationViewStyle()
        }
    }
#endif
