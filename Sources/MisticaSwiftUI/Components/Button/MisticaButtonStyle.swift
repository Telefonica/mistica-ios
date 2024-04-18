//
//  MisticaButtonStyle.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

import SwiftUI

public struct MisticaButtonStyle: ButtonStyle {
    let style: MisticaButton.Style
    let small: Bool
    let rightImage: MisticaButtonRightImage?

    public func makeBody(configuration: Configuration) -> some View {
        MisticaButton(configuration: configuration, style: style, small: small, rightImage: rightImage)
    }
}

// MARK: Styles

private var _opacity = 0.5
private var _opacityWithBackground = 0.1

public extension ButtonStyle where Self == MisticaButtonStyle {
    static var opacity: CGFloat {
        get { _opacity }
        set { _opacity = newValue }
    }

    static var opacityWithBackground: CGFloat {
        get { _opacityWithBackground }
        set { _opacityWithBackground = newValue }
    }

    static func misticaPrimary(
        small: Bool = false,
        bleedingAlignment: ButtonBleedingAlignment = .none
    ) -> Self {
        Self(
            style: MisticaButton.Style(
                bleedingAlignment: bleedingAlignment,
                styleByState: [
                    .normal: MisticaButton.StateStyle(
                        textColor: .textButtonPrimary,
                        backgroundColor: .buttonPrimaryBackground,
                        borderColor: .buttonPrimaryBackground
                    ),
                    .selected: MisticaButton.StateStyle(
                        textColor: .textButtonPrimary,
                        backgroundColor: .buttonPrimaryBackgroundSelected,
                        borderColor: .buttonPrimaryBackgroundSelected
                    ),
                    .disabled: MisticaButton.StateStyle(
                        textColor: .textButtonPrimary,
                        backgroundColor: .buttonPrimaryBackground.opacity(opacity),
                        borderColor: .buttonPrimaryBackground.opacity(opacityWithBackground)
                    ),
                    .loading: MisticaButton.StateStyle(
                        textColor: .textButtonPrimary,
                        backgroundColor: .buttonPrimaryBackground,
                        borderColor: .buttonPrimaryBackground
                    )
                ]
            ),
            small: small,
            rightImage: nil
        )
    }

    static func misticaPrimaryInverse(
        small: Bool = false,
        bleedingAlignment: ButtonBleedingAlignment = .none
    ) -> Self {
        Self(
            style: MisticaButton.Style(
                bleedingAlignment: bleedingAlignment,
                styleByState: [
                    .normal: MisticaButton.StateStyle(
                        textColor: .textButtonPrimaryInverse,
                        backgroundColor: .buttonPrimaryBackgroundInverse,
                        borderColor: .buttonPrimaryBackgroundInverse
                    ),
                    .selected: MisticaButton.StateStyle(
                        textColor: .textButtonPrimaryInverseSelected,
                        backgroundColor: .buttonPrimaryBackgroundInverseSelected,
                        borderColor: .buttonPrimaryBackgroundInverseSelected
                    ),
                    .disabled: MisticaButton.StateStyle(
                        textColor: .textButtonPrimaryInverse,
                        backgroundColor: .buttonPrimaryBackgroundInverse.opacity(opacity),
                        borderColor: .buttonPrimaryBackgroundInverse.opacity(opacityWithBackground)
                    ),
                    .loading: MisticaButton.StateStyle(
                        textColor: .textButtonPrimaryInverse,
                        backgroundColor: .buttonPrimaryBackgroundInverse,
                        borderColor: .buttonPrimaryBackgroundInverse
                    )
                ]
            ),
            small: small,
            rightImage: nil
        )
    }

    static func misticaSecondary(
        small: Bool = false,
        bleedingAlignment: ButtonBleedingAlignment = .none
    ) -> Self {
        Self(
            style: MisticaButton.Style(
                bleedingAlignment: bleedingAlignment,
                styleByState: [
                    .normal: MisticaButton.StateStyle(
                        textColor: .textButtonSecondary,
                        backgroundColor: .clear,
                        borderColor: .buttonSecondaryBorder
                    ),
                    .selected: MisticaButton.StateStyle(
                        textColor: .textButtonSecondarySelected,
                        backgroundColor: .clear,
                        borderColor: .buttonSecondaryBackgroundSelected
                    ),
                    .disabled: MisticaButton.StateStyle(
                        textColor: .textButtonSecondary.opacity(opacity),
                        backgroundColor: .clear,
                        borderColor: .buttonSecondaryBorder.opacity(opacity)
                    ),
                    .loading: MisticaButton.StateStyle(
                        textColor: .textButtonSecondary,
                        backgroundColor: .clear,
                        borderColor: .buttonSecondaryBorder
                    )
                ]
            ),
            small: small,
            rightImage: nil
        )
    }

    static func misticaSecondaryInverse(
        small: Bool = false,
        bleedingAlignment: ButtonBleedingAlignment = .none
    ) -> Self {
        Self(
            style: MisticaButton.Style(
                bleedingAlignment: bleedingAlignment,
                styleByState: [
                    .normal: MisticaButton.StateStyle(
                        textColor: .textButtonSecondaryInverse,
                        backgroundColor: .clear,
                        borderColor: .buttonSecondaryBorderInverse
                    ),
                    .selected: MisticaButton.StateStyle(
                        textColor: .textButtonSecondaryInverseSelected,
                        backgroundColor: .clear,
                        borderColor: .buttonSecondaryBorderInverseSelected
                    ),
                    .disabled: MisticaButton.StateStyle(
                        textColor: .textButtonSecondaryInverse.opacity(opacity),
                        backgroundColor: .clear,
                        borderColor: .buttonSecondaryBorderInverse.opacity(opacity)
                    ),
                    .loading: MisticaButton.StateStyle(
                        textColor: .textButtonSecondaryInverse,
                        backgroundColor: .clear,
                        borderColor: .buttonSecondaryBorderInverse
                    )
                ]
            ),
            small: small,
            rightImage: nil
        )
    }

    static func misticaDanger(
        small: Bool = false,
        bleedingAlignment: ButtonBleedingAlignment = .none
    ) -> Self {
        Self(
            style: MisticaButton.Style(
                bleedingAlignment: bleedingAlignment,
                styleByState: [
                    .normal: MisticaButton.StateStyle(
                        textColor: .textButtonPrimary,
                        backgroundColor: .buttonDangerBackground,
                        borderColor: .buttonDangerBackground
                    ),
                    .selected: MisticaButton.StateStyle(
                        textColor: .textButtonPrimary,
                        backgroundColor: .buttonDangerBackgroundSelected,
                        borderColor: .buttonDangerBackgroundSelected
                    ),
                    .disabled: MisticaButton.StateStyle(
                        textColor: .textButtonPrimary,
                        backgroundColor: .buttonDangerBackground.opacity(opacity),
                        borderColor: .buttonDangerBackground.opacity(opacityWithBackground)
                    ),
                    .loading: MisticaButton.StateStyle(
                        textColor: .textButtonPrimary,
                        backgroundColor: .buttonDangerBackground,
                        borderColor: .buttonDangerBackground
                    )
                ]
            ),
            small: small,
            rightImage: nil
        )
    }

    static func misticaLink(
        small: Bool = false,
        bleedingAlignment: ButtonBleedingAlignment = .none,
        withChevron: Bool = false
    ) -> Self {
        Self(
            style: MisticaButton.Style(
                bleedingAlignment: bleedingAlignment,
                hasMinWidth: false,
                styleByState: [
                    .normal: MisticaButton.StateStyle(
                        textColor: .textLink,
                        backgroundColor: .clear,
                        borderColor: .clear
                    ),
                    .selected: MisticaButton.StateStyle(
                        textColor: .textLink,
                        backgroundColor: .buttonLinkBackgroundSelected,
                        borderColor: .clear
                    ),
                    .disabled: MisticaButton.StateStyle(
                        textColor: .textLink.opacity(opacity),
                        backgroundColor: .clear,
                        borderColor: .clear
                    ),
                    .loading: MisticaButton.StateStyle(
                        textColor: .textLink,
                        backgroundColor: .clear,
                        borderColor: .clear
                    )
                ]
            ),
            small: small,
            rightImage: withChevron ? .chevron : nil
        )
    }

    static func misticaLinkInverse(
        small: Bool = false,
        bleedingAlignment: ButtonBleedingAlignment = .none,
        withChevron: Bool = false
    ) -> Self {
        Self(
            style: MisticaButton.Style(
                bleedingAlignment: bleedingAlignment,
                hasMinWidth: false,
                styleByState: [
                    .normal: MisticaButton.StateStyle(
                        textColor: .textLinkInverse,
                        backgroundColor: .clear,
                        borderColor: .clear
                    ),
                    .selected: MisticaButton.StateStyle(
                        textColor: .textLinkInverse,
                        backgroundColor: .buttonLinkBackgroundInverseSelected,
                        borderColor: .clear
                    ),
                    .disabled: MisticaButton.StateStyle(
                        textColor: .textLinkInverse.opacity(opacity),
                        backgroundColor: .clear,
                        borderColor: .clear
                    ),
                    .loading: MisticaButton.StateStyle(
                        textColor: .textLinkInverse,
                        backgroundColor: .clear,
                        borderColor: .clear
                    )
                ]
            ),
            small: small,
            rightImage: withChevron ? .chevron : nil
        )
    }

    static func misticaSnackbar(
        small: Bool = false,
        bleedingAlignment: ButtonBleedingAlignment = .none
    ) -> Self {
        Self(
            style: MisticaButton.Style(
                bleedingAlignment: bleedingAlignment,
                hasMinWidth: false,
                styleByState: [
                    .normal: MisticaButton.StateStyle(
                        textColor: .textLinkSnackbar,
                        backgroundColor: .clear,
                        borderColor: .clear
                    ),
                    .selected: MisticaButton.StateStyle(
                        textColor: .textLinkSnackbar,
                        backgroundColor: .buttonLinkBackgroundSelected,
                        borderColor: .clear
                    ),
                    .disabled: MisticaButton.StateStyle(
                        textColor: .textLinkSnackbar.opacity(opacity),
                        backgroundColor: .clear,
                        borderColor: .clear
                    ),
                    .loading: MisticaButton.StateStyle(
                        textColor: .textLinkSnackbar,
                        backgroundColor: .clear,
                        borderColor: .clear
                    )
                ]
            ),
            small: small,
            rightImage: nil
        )
    }
}
