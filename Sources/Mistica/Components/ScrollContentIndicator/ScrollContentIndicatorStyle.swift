//
//  ScrollContentIndicatorStyle.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import MisticaCommon
import UIKit

public extension ScrollContentIndicator.Style {
    static var primaryClear: Button.Style {
        let textColor: UIColor = .textButtonPrimary
        let backgroundColor: UIColor = .clear

        return Button.Style(
            allowsBleedingAlignment: false,
            stateStyleByState: [
                .normal: Button.StateStyle(textColor: textColor, backgroundColor: backgroundColor, borderColor: backgroundColor),
                .selected: Button.StateStyle(textColor: textColor, backgroundColor: backgroundColor, borderColor: backgroundColor),
                .disabled: Button.StateStyle(textColor: textColor, backgroundColor: backgroundColor, borderColor: backgroundColor),
                .loading: Button.StateStyle(textColor: textColor, backgroundColor: backgroundColor, borderColor: backgroundColor)
            ]
        )
    }
}
