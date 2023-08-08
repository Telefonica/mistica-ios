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
    let rightImage: MisticaButton.RightImage?

    public func makeBody(configuration: Configuration) -> some View {
        MisticaButton(configuration: configuration, style: style, small: small, rightImage: rightImage)
    }
}

// MARK: Styles

public extension ButtonStyle where Self == MisticaButtonStyle {
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
                        backgroundColor: .buttonPrimaryBackground,
                        borderColor: .buttonPrimaryBackground
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
                        backgroundColor: .buttonPrimaryBackgroundInverse,
                        borderColor: .buttonPrimaryBackgroundInverse
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
                        textColor: .textButtonSecondary,
                        backgroundColor: .clear,
                        borderColor: .buttonSecondaryBorder
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
                        textColor: .textButtonSecondaryInverse,
                        backgroundColor: .clear,
                        borderColor: .buttonSecondaryBorderInverse
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
                        backgroundColor: .buttonDangerBackground,
                        borderColor: .buttonDangerBackground
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
                        textColor: .textLink,
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
                        textColor: .textButtonSecondaryInverse,
                        backgroundColor: .clear,
                        borderColor: .clear
                    ),
                    .selected: MisticaButton.StateStyle(
                        textColor: .textButtonSecondaryInverseSelected,
                        backgroundColor: .buttonLinkBackgroundInverseSelected,
                        borderColor: .clear
                    ),
                    .disabled: MisticaButton.StateStyle(
                        textColor: .textButtonSecondaryInverse,
                        backgroundColor: .clear,
                        borderColor: .clear
                    ),
                    .loading: MisticaButton.StateStyle(
                        textColor: .textButtonSecondaryInverse,
                        backgroundColor: .clear,
                        borderColor: .clear
                    )
                ]
            ),
            small: small,
            rightImage: withChevron ? .chevron : nil
        )
    }
}
