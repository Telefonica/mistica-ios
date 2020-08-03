//
//  MisticaAppearance.swift
//  Mistica
//
//  Created by Jose Miguel Brocal on 03/08/2020.
//  Copyright © 2020 Telefonica. All rights reserved.
//

import UIKit

class MisticaAppearance {
    static func configure() {
        setUpAppearanceOfUITabBar()
        setUpAppearanceOfUISegmentedControl()
        setUpAppearanceOfPageIndicator()
        setUpAppearanceOfSwitch()
    }
}

private extension MisticaAppearance {
    static func setUpAppearanceOfSegmentedControl(withAppearance segmentedControlAppearance: UISegmentedControl,
                                                  tintColor: UIColor,
                                                  textColor: UIColor,
                                                  selectedTextColor: UIColor) {
        if #available(iOS 13.0, *) {
            segmentedControlAppearance.selectedSegmentTintColor = tintColor
        } else {
            segmentedControlAppearance.tintColor = tintColor
        }

        let normalTextAttributes = [
            NSAttributedString.Key.foregroundColor: textColor,
            NSAttributedString.Key.font: UIFont.sub2
        ]
        let selectedTextAttributes = [
            NSAttributedString.Key.foregroundColor: selectedTextColor,
            NSAttributedString.Key.font: UIFont.sub2
        ]

        segmentedControlAppearance.setTitleTextAttributes(normalTextAttributes, for: .normal)
        segmentedControlAppearance.setTitleTextAttributes(selectedTextAttributes, for: .selected)
        segmentedControlAppearance.setTitleTextAttributes(selectedTextAttributes, for: .highlighted)
    }

    static func setUpAppearanceOfUITabBar() {
        let tabBarAppearance = UITabBar.appearance()

        tabBarAppearance.tintColor = .appBarTextSelected
        tabBarAppearance.barTintColor = .appBarBackground
        tabBarAppearance.unselectedItemTintColor = .appBarText
        tabBarAppearance.isTranslucent = false
        tabBarAppearance.backgroundImage = UIImage()
        tabBarAppearance.shadowImage = UIImage(color: .divider)
    }

    static func setUpAppearanceOfUISegmentedControl() {
        let segmentedControlAppearance = UISegmentedControl.appearance()
        setUpAppearanceOfSegmentedControl(withAppearance: segmentedControlAppearance,
                                          tintColor: .segmentedControlBackgroundSelected,
                                          textColor: .textSegmentedControl,
                                          selectedTextColor: .textSegmentedControlSelected)
    }

    static func setUpAppearanceOfPageIndicator() {
        let appearance = UIPageControl.appearance()
        appearance.pageIndicatorTintColor = .control
        appearance.currentPageIndicatorTintColor = .controlActivated
    }

    static func setUpAppearanceOfSwitch() {
        guard !Mistica.brandStyle.shouldUseLegacyTintForControls else { return }

        let appearance = UISwitch.appearance()
        appearance.onTintColor = .controlActivated
        appearance.tintColor = .control
    }
}
