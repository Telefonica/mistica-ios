//
//  NovumBarButtonItem.swift
//  Mistica
//
//  Created by Jose Miguel Brocal on 13/02/2020.
//  Copyright © 2020 Tuenti Technologies S.L. All rights reserved.
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
        NSAttributedString.Key.font: UIFont.caption2,
        NSAttributedString.Key.foregroundColor: UIColor.textPrimaryInverse
    ]

    item.setBadgeTextAttributes(badgeTextAttributes, for: .normal)

    return item
}
