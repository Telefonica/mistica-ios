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
                .clipShape(RoundedRectangle(cornerRadius: MisticaConfig.currentCornerRadius.button, style: .continuous))
                .overlay(RoundedRectangle(cornerRadius: MisticaConfig.currentCornerRadius.button, style: .continuous).stroke(borderColor, lineWidth: lineWidth))

        case .checkbox:
            content
                .clipShape(RoundedRectangle(cornerRadius: MisticaConfig.currentCornerRadius.checkbox, style: .continuous))
                .overlay(RoundedRectangle(cornerRadius: MisticaConfig.currentCornerRadius.checkbox, style: .continuous).stroke(borderColor, lineWidth: lineWidth))
        case .container:
            content
                .clipShape(RoundedRectangle(cornerRadius: MisticaConfig.currentCornerRadius.container, style: .continuous))
                .overlay(RoundedRectangle(cornerRadius: MisticaConfig.currentCornerRadius.container, style: .continuous).stroke(borderColor, lineWidth: lineWidth))
        case .input:
            content
                .clipShape(RoundedRectangle(cornerRadius: MisticaConfig.currentCornerRadius.input, style: .continuous))
                .overlay(RoundedRectangle(cornerRadius: MisticaConfig.currentCornerRadius.input, style: .continuous).stroke(borderColor, lineWidth: lineWidth))
        case .legacyDisplay:
            content
                .clipShape(RoundedRectangle(cornerRadius: MisticaConfig.currentCornerRadius.legacyDisplay, style: .continuous))
                .overlay(RoundedRectangle(cornerRadius: MisticaConfig.currentCornerRadius.legacyDisplay, style: .continuous).stroke(borderColor, lineWidth: lineWidth))
        case .popup:
            content
                .clipShape(RoundedRectangle(cornerRadius: MisticaConfig.currentCornerRadius.popup, style: .continuous))
                .overlay(RoundedRectangle(cornerRadius: MisticaConfig.currentCornerRadius.popup, style: .continuous).stroke(borderColor, lineWidth: lineWidth))
        case .sheet:
            content
                .clipShape(RoundedRectangle(cornerRadius: MisticaConfig.currentCornerRadius.sheet, style: .continuous))
                .overlay(RoundedRectangle(cornerRadius: MisticaConfig.currentCornerRadius.sheet, style: .continuous).stroke(borderColor, lineWidth: lineWidth))
        }
    }
}
