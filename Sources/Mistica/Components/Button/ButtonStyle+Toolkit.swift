//
//  ButtonStyle+Toolkit.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

public extension Button.Style {
    private static let regularInsets: UIEdgeInsets = .init(top: 12, left: 16, bottom: 12, right: 16)
    private static let smallInsets: UIEdgeInsets = .init(top: 5, left: 12, bottom: 5, right: 12)
    private static let linkInsets: UIEdgeInsets = .init(top: 5, left: 12, bottom: 5, right: 12)

    private static var regularFont: UIFont { .textPreset3(weight: .button) }
    private static var smallFont: UIFont { .textPreset2(weight: .button) }
    private static var linkFont: UIFont { .textPreset2(weight: .button) }

    private static var regularMinimumWidth: CGFloat = 156
    private static var smallMinimumWidth: CGFloat = 104
    private static var linkMinimumWidth: CGFloat = 0

    private enum ImageHeight {
        static let regular: CGFloat = 24
        static let small: CGFloat = 20
    }

    static var primary: Button.Style {
        Button.Style(
            allowsBleedingAlignment: false,
            stateStyleByState: [
                .normal: Button.StateStyle(textColor: .textButtonPrimary, backgroundColor: .buttonPrimaryBackground, borderColor: .buttonPrimaryBackground),
                .selected: Button.StateStyle(textColor: .textButtonPrimary, backgroundColor: .buttonPrimaryBackgroundSelected, borderColor: .buttonPrimaryBackgroundSelected),
                .disabled: Button.StateStyle(textColor: .textButtonPrimary, backgroundColor: .buttonPrimaryBackground, borderColor: .buttonPrimaryBackground),
                .loading: Button.StateStyle(textColor: .textButtonPrimary, backgroundColor: .buttonPrimaryBackground, borderColor: .buttonPrimaryBackground)
            ]
        )
    }

    static var secondary: Button.Style {
        let backgroundColor: UIColor = .clear

        return Button.Style(
            allowsBleedingAlignment: false,
            stateStyleByState: [
                .normal: Button.StateStyle(textColor: .textButtonSecondary, backgroundColor: backgroundColor, borderColor: .buttonSecondaryBorder),
                .selected: Button.StateStyle(textColor: .textButtonSecondarySelected, backgroundColor: backgroundColor, borderColor: .buttonSecondaryBackgroundSelected),
                .disabled: Button.StateStyle(textColor: .textButtonSecondary, backgroundColor: backgroundColor, borderColor: .buttonSecondaryBorder),
                .loading: Button.StateStyle(textColor: .textButtonSecondary, backgroundColor: backgroundColor, borderColor: .buttonSecondaryBorder)
            ]
        )
    }

    static var danger: Button.Style {
        let textColor: UIColor = .textButtonPrimary

        return Button.Style(
            allowsBleedingAlignment: false,
            stateStyleByState: [
                .normal: Button.StateStyle(textColor: textColor, backgroundColor: .buttonDangerBackground, borderColor: .buttonDangerBackground),
                .selected: Button.StateStyle(textColor: textColor, backgroundColor: .buttonDangerBackgroundSelected, borderColor: .buttonDangerBackgroundSelected),
                .disabled: Button.StateStyle(textColor: textColor, backgroundColor: .buttonDangerBackground, borderColor: .buttonDangerBackground),
                .loading: Button.StateStyle(textColor: textColor, backgroundColor: .buttonDangerBackground, borderColor: .buttonDangerBackground)
            ]
        )
    }

    static var link: Button.Style {
        let backgroundColor: UIColor = .clear

        var style = Button.Style(
            allowsBleedingAlignment: true,
            stateStyleByState: [
                .normal: Button.StateStyle(textColor: .textLink, backgroundColor: backgroundColor, borderColor: backgroundColor),
                .selected: Button.StateStyle(textColor: .textLink, backgroundColor: .buttonLinkBackgroundSelected, borderColor: backgroundColor),
                .disabled: Button.StateStyle(textColor: .textLink, backgroundColor: backgroundColor, borderColor: backgroundColor),
                .loading: Button.StateStyle(textColor: .textLink, backgroundColor: backgroundColor, borderColor: backgroundColor)
            ]
        )

        style.overriddenSizes = linkOverriddenSizes

        return style
    }

    static var primaryInverse: Button.Style {
        Button.Style(
            allowsBleedingAlignment: false,
            stateStyleByState: [
                .normal: Button.StateStyle(textColor: .textButtonPrimaryInverse, backgroundColor: .buttonPrimaryBackgroundInverse, borderColor: .buttonPrimaryBackgroundInverse),
                .selected: Button.StateStyle(textColor: .textButtonPrimaryInverseSelected, backgroundColor: .buttonPrimaryBackgroundInverseSelected, borderColor: .buttonPrimaryBackgroundInverseSelected),
                .disabled: Button.StateStyle(textColor: .textButtonPrimaryInverse, backgroundColor: .buttonPrimaryBackgroundInverse, borderColor: .buttonPrimaryBackgroundInverse),
                .loading: Button.StateStyle(textColor: .textButtonPrimaryInverse, backgroundColor: .buttonPrimaryBackgroundInverse, borderColor: .buttonPrimaryBackgroundInverse)
            ]
        )
    }

    static var secondaryInverse: Button.Style {
        Button.Style(
            allowsBleedingAlignment: false,
            stateStyleByState: [
                .normal: Button.StateStyle(textColor: .textButtonSecondaryInverse, backgroundColor: .clear, borderColor: .buttonSecondaryBorderInverse),
                .selected: Button.StateStyle(textColor: .textButtonSecondaryInverseSelected, backgroundColor: .clear, borderColor: .buttonSecondaryBorderInverseSelected),
                .disabled: Button.StateStyle(textColor: .textButtonSecondaryInverse, backgroundColor: .clear, borderColor: .buttonSecondaryBorderInverse),
                .loading: Button.StateStyle(textColor: .textButtonSecondaryInverse, backgroundColor: .clear, borderColor: .buttonSecondaryBorderInverse)
            ]
        )
    }

    static var linkInverse: Button.Style {
        let backgroundColor: UIColor = .clear
        var style = Button.Style(
            allowsBleedingAlignment: true,
            stateStyleByState: [
                .normal: Button.StateStyle(textColor: .textLinkInverse, backgroundColor: backgroundColor, borderColor: backgroundColor),
                .selected: Button.StateStyle(textColor: .textLinkInverse, backgroundColor: .buttonLinkBackgroundInverseSelected, borderColor: backgroundColor),
                .disabled: Button.StateStyle(textColor: .textLinkInverse, backgroundColor: backgroundColor, borderColor: backgroundColor),
                .loading: Button.StateStyle(textColor: .textLinkInverse, backgroundColor: backgroundColor, borderColor: backgroundColor)
            ]
        )

        style.overriddenSizes = linkOverriddenSizes

        return style
    }

    func insets(isSmall: Bool) -> UIEdgeInsets {
        if let overriddenSizes = overriddenSizes {
            return overriddenSizes.insets
        }

        return isSmall ? Button.Style.smallInsets : Button.Style.regularInsets
    }

    func font(isSmall: Bool) -> UIFont {
        if let overriddenSizes = overriddenSizes {
            return overriddenSizes.font
        }

        return isSmall ? Button.Style.smallFont : Button.Style.regularFont
    }

    func minimumWidth(isSmall: Bool) -> CGFloat {
        if let overriddenSizes = overriddenSizes {
            return overriddenSizes.minimumWidth
        }

        return isSmall ? Button.Style.smallMinimumWidth : Button.Style.regularMinimumWidth
    }

    func rightImageHeight(isSmall: Bool) -> CGFloat {
        if let rightImageHeight = overriddenSizes?.rightImageHeight {
            return rightImageHeight
        }

        return isSmall ? Button.Style.ImageHeight.small : Button.Style.ImageHeight.regular
    }
}

private extension Button.Style {
    static var linkOverriddenSizes: OverriddenSizes {
        OverriddenSizes(
            insets: linkInsets,
            minimumWidth: linkMinimumWidth,
            font: linkFont,
            rightImageHeight: Button.Style.ImageHeight.small
        )
    }
}
