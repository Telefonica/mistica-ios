//
//  NovumBarButtonItem.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

/// Creates a UITabBarItem with the Badge style of Novum
/// - Parameters:
///   - badgeValue: The number to show in the badge or 0 for do not display it.
public func createNovumTabBarItem(badgeValue: UInt = 0) -> UITabBarItem {
    let item = UITabBarItem()
    item.badgeColor = .badgeColor

    if badgeValue > 0 && badgeValue < 10 {
        item.badgeValue = String(badgeValue)
    } else if badgeValue >= 10 {
        item.badgeValue = "+9"
    }

    let badgeTextAttributes = [
        NSAttributedString.Key.font: UIFont.textPreset8(weight: .medium),
        NSAttributedString.Key.foregroundColor: UIColor.textPrimaryInverse
    ]

    item.setBadgeTextAttributes(badgeTextAttributes, for: .normal)

    return item
}
