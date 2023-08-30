//
//  View+MisticaCornerRadius.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import SwiftUI

public extension View {
    func round(radiusStyle: CornerRadiusStyle) -> some View {
        modifier(CornerRadiusModifier(cornerRadiusStyle: radiusStyle))
    }

    func border(radiusStyle: CornerRadiusStyle, borderColor: Color = .border, lineWidth: CGFloat = 1) -> some View {
        modifier(CornerRadiusModifier(cornerRadiusStyle: radiusStyle, borderColor: borderColor, lineWidth: lineWidth))
    }
}

private struct CornerRadiusModifier: ViewModifier {
    var cornerRadiusStyle: CornerRadiusStyle
    var borderColor: Color = .border
    var lineWidth: CGFloat = 0.0

    func body(content: Content) -> some View {
        switch cornerRadiusStyle {
        case .avatar:
            content
                .clipShape(Circle())
                .overlay(Circle().stroke(borderColor, lineWidth: lineWidth))
        case .bar, .indicator:
            content
                .clipShape(Capsule())
                .overlay(Capsule().stroke(borderColor, lineWidth: lineWidth))
        case .button:
            content
                .clipShape(RoundedRectangle(cornerRadius: MisticaConfig.currentCornerRadius.button))
                .overlay(RoundedRectangle(cornerRadius: MisticaConfig.currentCornerRadius.button).stroke(borderColor, lineWidth: lineWidth))

        case .checkbox:
            content
                .clipShape(RoundedRectangle(cornerRadius: MisticaConfig.currentCornerRadius.checkbox))
                .overlay(RoundedRectangle(cornerRadius: MisticaConfig.currentCornerRadius.checkbox).stroke(borderColor, lineWidth: lineWidth))
        case .container:
            content
                .clipShape(RoundedRectangle(cornerRadius: MisticaConfig.currentCornerRadius.container))
                .overlay(RoundedRectangle(cornerRadius: MisticaConfig.currentCornerRadius.container).stroke(borderColor, lineWidth: lineWidth))
        case .input:
            content
                .clipShape(RoundedRectangle(cornerRadius: MisticaConfig.currentCornerRadius.input))
                .overlay(RoundedRectangle(cornerRadius: MisticaConfig.currentCornerRadius.input).stroke(borderColor, lineWidth: lineWidth))
        case .legacyDisplay:
            content
                .clipShape(RoundedRectangle(cornerRadius: MisticaConfig.currentCornerRadius.legacyDisplay))
                .overlay(RoundedRectangle(cornerRadius: MisticaConfig.currentCornerRadius.legacyDisplay).stroke(borderColor, lineWidth: lineWidth))
        case .popup:
            content
                .clipShape(RoundedRectangle(cornerRadius: MisticaConfig.currentCornerRadius.popup))
                .overlay(RoundedRectangle(cornerRadius: MisticaConfig.currentCornerRadius.popup).stroke(borderColor, lineWidth: lineWidth))
        case .sheet:
            content
                .clipShape(RoundedRectangle(cornerRadius: MisticaConfig.currentCornerRadius.sheet))
                .overlay(RoundedRectangle(cornerRadius: MisticaConfig.currentCornerRadius.sheet).stroke(borderColor, lineWidth: lineWidth))
        }
    }
}
