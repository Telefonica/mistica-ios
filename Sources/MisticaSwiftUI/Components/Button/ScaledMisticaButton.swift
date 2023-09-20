//
//  ScaledMisticaButton.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import SwiftUI

@available(iOS 14.0, *)
struct ScaledMisticaButton<Content: View>: View {
    let content: () -> Content
    let height: CGFloat
    let minWidth: CGFloat

    @ScaledMetric var scale: CGFloat = 1

    init(
        height: CGFloat,
        minWidth: CGFloat,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.content = content
        self.height = height
        self.minWidth = minWidth
    }

    var body: some View {
        content()
            .frame(height: height * scale)
            .frame(minWidth: minWidth * scale)
    }
}
