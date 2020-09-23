//
//  ScrollContentIndicatorStyle.swift
//  Mistica
//
//  Created by Jose Salavert on 24/03/2020.
//  Copyright © 2020 Tuenti Technologies S.L. All rights reserved.
//

import UIKit

public extension ScrollContentIndicator.Style {
    static var primaryClear: Button.Style {
        let textColor: UIColor = .textButtonPrimary
        let backgroundColor: UIColor = .clear

        return Button.Style(allowsBleedingAlignment: false,
                            stateStyleByState: [
                                .normal: Button.StateStyle(textColor: textColor, backgroundColor: backgroundColor, borderColor: backgroundColor),
                                .selected: Button.StateStyle(textColor: textColor, backgroundColor: backgroundColor, borderColor: backgroundColor),
                                .disabled: Button.StateStyle(textColor: textColor, backgroundColor: backgroundColor, borderColor: backgroundColor),
                                .loading: Button.StateStyle(textColor: textColor, backgroundColor: backgroundColor, borderColor: backgroundColor)
                            ])
    }
}
