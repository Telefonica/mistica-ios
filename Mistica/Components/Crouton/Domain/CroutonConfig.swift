//
//  CroutonConfig.swift
//  Mistica
//
//  Created by dmarin on 25/10/2016.
//  Copyright © 2016 Tuenti Technologies S.L. All rights reserved.
//

import UIKit

@objc public enum CroutonStyle: Int, CaseIterable {
    case info
    case critical
}

public struct CroutonConfig {
    let backgroundColor: UIColor
    let textColor: UIColor
    let actionStyle: Button.Style

    public init(style: CroutonStyle) {
        switch style {
        case .info:
            backgroundColor = .feedbackInfoBackground
            textColor = .textPrimaryInverse
            actionStyle = .croutonInfoLink
        case .critical:
            backgroundColor = .feedbackErrorBackground
            textColor = .textPrimaryInverse
            actionStyle = .croutonCriticalLink
        }
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

        var style = Button.Style(allowsBleedingAlignment: true,
                                 stateStyleByState: [
                                     .normal: Button.StateStyle(textColor: .textLinkSnackbar, backgroundColor: backgroundColor, borderColor: backgroundColor),
                                     .selected: Button.StateStyle(textColor: .textLinkSnackbar, backgroundColor: .buttonLinkBackgroundSelectedInverse, borderColor: backgroundColor),
                                     .disabled: Button.StateStyle(textColor: .textLinkInverseDisabled, backgroundColor: backgroundColor, borderColor: backgroundColor),
                                     .loading: Button.StateStyle(textColor: .textLinkSnackbar, backgroundColor: backgroundColor, borderColor: backgroundColor)
                                 ])

        style.overriddenSizes = croutonOverriddenSizes

        return style
    }

    static var croutonCriticalLink: Button.Style {
        var style = Button.Style.linkInverse
        style.overriddenSizes = croutonOverriddenSizes
        return style
    }

    static var croutonOverriddenSizes: OverriddenSizes {
        OverriddenSizes(insets: Constants.insets,
                        minimumWidth: Constants.minimumWidth,
                        font: .textPreset6(.medium))
    }
}
