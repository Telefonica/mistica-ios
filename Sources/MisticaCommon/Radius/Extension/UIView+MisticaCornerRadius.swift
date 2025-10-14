//
//  UIView+MisticaCornerRadius.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

public extension UIView {
    func setMisticaRadius(_ style: CornerRadiusStyle) {
        switch style {
        case .avatar:
            setMisticaConfigValue(cornerRadiusValue: MisticaConfig.currentCornerRadius.avatar)
        case .bar:
            setMisticaConfigValue(cornerRadiusValue: MisticaConfig.currentCornerRadius.bar)
        case .button:
            setMisticaConfigValue(cornerRadiusValue: MisticaConfig.currentCornerRadius.button)
        case .checkbox:
            setMisticaConfigValue(cornerRadiusValue: MisticaConfig.currentCornerRadius.checkbox)
        case .container:
            setMisticaConfigValue(cornerRadiusValue: MisticaConfig.currentCornerRadius.container)
        case .indicator:
            setMisticaConfigValue(cornerRadiusValue: MisticaConfig.currentCornerRadius.indicator)
        case .input:
            setMisticaConfigValue(cornerRadiusValue: MisticaConfig.currentCornerRadius.input)
        case .legacyDisplay:
            setMisticaConfigValue(cornerRadiusValue: MisticaConfig.currentCornerRadius.legacyDisplay)
        case .popup:
            setMisticaConfigValue(cornerRadiusValue: MisticaConfig.currentCornerRadius.popup)
        case .sheet:
            setMisticaConfigValue(cornerRadiusValue: MisticaConfig.currentCornerRadius.sheet)
        case .tag:
            setMisticaConfigValue(cornerRadiusValue: MisticaConfig.currentCornerRadius.tag)
        case .chip:
            setMisticaConfigValue(cornerRadiusValue: MisticaConfig.currentCornerRadius.chip)
        }
    }

    private func setMisticaConfigValue(cornerRadiusValue: CGFloat) {
        if cornerRadiusValue >= MisticaRadiusConstants.roundedRadius {
            layer.cornerRadius = min(frame.size.width, frame.size.height) / 2
        } else {
            let normalizedCornerRadiusValue = min(minSide / 2, cornerRadiusValue)
            layer.cornerRadius = normalizedCornerRadiusValue
        }
    }

    private var minSide: CGFloat {
        min(frame.size.width, frame.size.height)
    }
}
