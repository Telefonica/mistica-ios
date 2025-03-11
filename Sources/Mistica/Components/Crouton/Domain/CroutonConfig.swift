//
//  CroutonConfig.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

@frozen
@objc public enum CroutonStyle: Int, CaseIterable {
    case info
    case critical
}

public struct CroutonConfig {
    let backgroundColor: UIColor
    let textColor: UIColor
    let actionStyle: Button.Style
    let closePressedBackgroundColor: UIColor
    let overrideDismissInterval: SnackbarDismissInterval

    public init(style: CroutonStyle, croutonDismissInterval: SnackbarDismissInterval) {
        switch style {
        case .info:
            backgroundColor = .feedbackInfoBackground
            textColor = .textPrimaryInverse
            actionStyle = .croutonInfoLink
            closePressedBackgroundColor = .buttonLinkBackgroundInversePressed
        case .critical:
            backgroundColor = .feedbackErrorBackground
            textColor = .textPrimaryInverse
            actionStyle = .croutonCriticalLink
            closePressedBackgroundColor = .backgroundContainerBrandPressed
        }
        overrideDismissInterval = croutonDismissInterval
    }
}

// MARK: - Button.Style + Crouton

private extension Button.Style {
    private enum Constants {
        static let insets: UIEdgeInsets = .init(top: 5, left: 8, bottom: 5, right: 8)
        static let minimumWidth: CGFloat = 44
    }

    static var croutonInfoLink: Button.Style {
        let backgroundColor: UIColor = .clear

        var style = Button.Style(
            allowsBleedingAlignment: true,
            stateStyleByState: [
                .normal: Button.StateStyle(textColor: .textLinkSnackbar, backgroundColor: backgroundColor, borderColor: backgroundColor),
                .selected: Button.StateStyle(textColor: .textLinkSnackbar, backgroundColor: .buttonLinkBackgroundInversePressed, borderColor: backgroundColor),
                .disabled: Button.StateStyle(textColor: .textLinkSnackbar, backgroundColor: backgroundColor, borderColor: backgroundColor),
                .loading: Button.StateStyle(textColor: .textLinkSnackbar, backgroundColor: backgroundColor, borderColor: backgroundColor)
            ]
        )

        style.overriddenSizes = croutonOverriddenSizes

        return style
    }

    static var croutonCriticalLink: Button.Style {
        let backgroundColor: UIColor = .clear

        var style = Button.Style(
            allowsBleedingAlignment: true,
            stateStyleByState: [
                .normal: Button.StateStyle(textColor: .textPrimaryInverse, backgroundColor: backgroundColor, borderColor: backgroundColor),
                .selected: Button.StateStyle(textColor: .textPrimaryInverse, backgroundColor: .backgroundContainerBrandPressed, borderColor: backgroundColor),
                .disabled: Button.StateStyle(textColor: .textPrimaryInverse, backgroundColor: backgroundColor, borderColor: backgroundColor),
                .loading: Button.StateStyle(textColor: .textPrimaryInverse, backgroundColor: backgroundColor, borderColor: backgroundColor)
            ]
        )

        style.overriddenSizes = croutonOverriddenSizes

        return style
    }

    static var croutonOverriddenSizes: OverriddenSizes {
        OverriddenSizes(
            insets: Constants.insets,
            minimumWidth: Constants.minimumWidth,
            font: .textPreset3(weight: .link)
        )
    }
}
