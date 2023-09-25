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
    let small: Bool
    let minWidth: CGFloat
    let verticalPadding: CGFloat
    let horizontalPadding: CGFloat
    let backgroundColor: Color
    let foregroundColor: Color
    let borderColor: Color
    let leadingInset: CGFloat
    let trailingInset: CGFloat

    @ScaledMetric var scale: CGFloat = 1

    init(
        height: CGFloat,
        small: Bool,
        minWidth: CGFloat,
        verticalPadding: CGFloat,
        horizontalPadding: CGFloat,
        backgroundColor: Color,
        foregroundColor: Color,
        borderColor: Color,
        leadingInset: CGFloat,
        trailingInset: CGFloat,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.height = height
        self.small = small
        self.minWidth = minWidth
        self.content = content
        self.verticalPadding = verticalPadding
        self.horizontalPadding = horizontalPadding
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.borderColor = borderColor
        self.leadingInset = leadingInset
        self.trailingInset = trailingInset
    }

    var body: some View {
        content()
            .frame(height: height * scale)
            .if(!small) { $0.expandHorizontally() }
            .frame(minWidth: minWidth * scale)
            .padding(.vertical, verticalPadding)
            .padding(.horizontal, horizontalPadding)
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .border(radiusStyle: .button, borderColor: borderColor)
            .padding(EdgeInsets(top: 0, leading: leadingInset, bottom: 0, trailing: trailingInset))
    }
}
