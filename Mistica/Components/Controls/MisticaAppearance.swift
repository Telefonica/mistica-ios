//
//  MisticaAppearance.swift
//  Mistica
//
//  Created by Jose Miguel Brocal on 03/08/2020.
//  Copyright © 2020 Telefonica. All rights reserved.
//

import UIKit

@frozen
public enum MisticaControlStyle: CaseIterable {
    case `switch`
    case segmentedControl
    case tabBar
    case pageControl
}

class MisticaAppearance {
    static func setUp(controls: [MisticaControlStyle]) {
        for control in controls {
            switch control {
            case .switch:
                setUpAppearanceOfSwitch()
            case .segmentedControl:
                setUpAppearanceOfSegmentedControl()
                setUpAppearanceOfSegmentedControlInSearchBar()
            case .tabBar:
                setUpAppearanceOfTabBar()
            case .pageControl:
                setUpAppearanceOfPageControl()
            }
        }
    }
}

private extension MisticaAppearance {
    static func setUpAppearanceOfTabBar() {
        let tabBarAppearance = UITabBar.appearance()

        tabBarAppearance.tintColor = .appBarTextSelected
        tabBarAppearance.barTintColor = .appBarBackground
        tabBarAppearance.unselectedItemTintColor = .appBarText
        tabBarAppearance.isTranslucent = false
        tabBarAppearance.backgroundImage = UIImage()
        tabBarAppearance.shadowImage = UIImage(color: .divider)
    }

    static func setUpAppearanceOfSegmentedControl() {
        let segmentedControlAppearance = UISegmentedControl.appearance()
        setUpAppearanceOfSegmentedControl(withAppearance: segmentedControlAppearance,
                                          tintColor: .segmentedControlBackgroundSelected,
                                          textColor: .textSegmentedControl,
                                          selectedTextColor: .textSegmentedControlSelected)
    }

    static func setUpAppearanceOfSegmentedControlInSearchBar() {
        let scopeButtonsAppearance = UISegmentedControl.appearance(whenContainedInInstancesOf: [UISearchBar.self])
        setUpAppearanceOfSegmentedControl(withAppearance: scopeButtonsAppearance,
                                          tintColor: .segmentedControlBackgroundInverseSelected,
                                          textColor: .textSegmentedControlInverse,
                                          selectedTextColor: .textSegmentedControlInverseSelected)
    }

    static func setUpAppearanceOfPageControl() {
        let appearance = UIPageControl.appearance()
        appearance.pageIndicatorTintColor = .control
        appearance.currentPageIndicatorTintColor = .controlActivated
    }

    static func setUpAppearanceOfSwitch() {
        guard !MisticaConfig.brandStyle.shouldUseLegacyTintForControls else { return }

        let appearance = UISwitch.appearance()
        appearance.onTintColor = .controlActivated
        appearance.tintColor = .control
    }

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
            NSAttributedString.Key.font: UIFont.textPreset7(weight: .medium)
        ]
        let selectedTextAttributes = [
            NSAttributedString.Key.foregroundColor: selectedTextColor,
            NSAttributedString.Key.font: UIFont.textPreset7(weight: .medium)
        ]

        segmentedControlAppearance.setTitleTextAttributes(normalTextAttributes, for: .normal)
        segmentedControlAppearance.setTitleTextAttributes(selectedTextAttributes, for: .selected)
        segmentedControlAppearance.setTitleTextAttributes(selectedTextAttributes, for: .highlighted)
    }
}
