//
//  MisticaAppearance.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

@frozen
public enum MisticaControlStyle: CaseIterable {
    case `switch`
    case segmentedControl
    case tabBar
    case pageControl
}

@MainActor
enum MisticaAppearance {
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

        tabBarAppearance.tintColor = .textAppBarSelected
        tabBarAppearance.barTintColor = .appBarBackground
        tabBarAppearance.unselectedItemTintColor = .textAppBar
        tabBarAppearance.isTranslucent = false
        tabBarAppearance.backgroundImage = UIImage()
        tabBarAppearance.shadowImage = UIImage(color: .divider)
    }

    static func setUpAppearanceOfSegmentedControl() {
        let segmentedControlAppearance = UISegmentedControl.appearance()
        setUpAppearanceOfSegmentedControl(
            withAppearance: segmentedControlAppearance,
            tintColor: .controlActivated,
            textColor: .controlActivated,
            selectedTextColor: .textPrimaryInverse
        )
    }

    static func setUpAppearanceOfSegmentedControlInSearchBar() {
        let scopeButtonsAppearance = UISegmentedControl.appearance(whenContainedInInstancesOf: [UISearchBar.self])
        setUpAppearanceOfSegmentedControl(
            withAppearance: scopeButtonsAppearance,
            tintColor: .textPrimaryInverse,
            textColor: .textButtonPrimaryInverse,
            selectedTextColor: .textPrimaryInverse
        )
    }

    static func setUpAppearanceOfPageControl() {
        let appearance = UIPageControl.appearance()
        appearance.pageIndicatorTintColor = .control
        appearance.currentPageIndicatorTintColor = .controlActivated
    }

    static func setUpAppearanceOfSwitch() {
        let appearance = UISwitch.appearance()
        appearance.onTintColor = .controlActivated
        appearance.tintColor = .control
    }

    static func setUpAppearanceOfSegmentedControl(withAppearance segmentedControlAppearance: UISegmentedControl,
                                                  tintColor: UIColor,
                                                  textColor: UIColor,
                                                  selectedTextColor: UIColor) {
        segmentedControlAppearance.selectedSegmentTintColor = tintColor

        let normalTextAttributes = [
            NSAttributedString.Key.foregroundColor: textColor,
            NSAttributedString.Key.font: UIFont.textPreset2(weight: .tabsLabel)
        ]
        let selectedTextAttributes = [
            NSAttributedString.Key.foregroundColor: selectedTextColor,
            NSAttributedString.Key.font: UIFont.textPreset2(weight: .tabsLabel)
        ]

        segmentedControlAppearance.setTitleTextAttributes(normalTextAttributes, for: .normal)
        segmentedControlAppearance.setTitleTextAttributes(selectedTextAttributes, for: .selected)
        segmentedControlAppearance.setTitleTextAttributes(selectedTextAttributes, for: .highlighted)
    }
}
