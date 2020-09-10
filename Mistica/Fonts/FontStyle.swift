//
//  FontStyle.swift
//  CommonKit
//
//  Created by Pablo Carcelén on 4/12/17.
//  Copyright © 2017 Tuenti Technologies S.L. All rights reserved.
//

import UIKit

@objc public enum FontStyle: Int, CaseIterable, CustomStringConvertible {
    case textPreset1
    case textPreset2
    case textPreset3
    case textPreset4
    case textPreset5
    case textPreset6
    case textPreset7
    case textPreset8
    case textSystem

    func preferredFont(weight: UIFont.Weight, constrainedToPreferredSize constrainedPreferredSize: UIContentSizeCategory? = nil) -> UIFont {
        let horizontalSizeClass = UIScreen.main.traitCollection.horizontalSizeClass
        var preferredSize = self.preferredSize

        if let constrainedSize = constrainedPreferredSize, preferredSize.isGreaterThan(constrainedSize) {
            preferredSize = constrainedSize
        }

        let points = fontSize.points(prerredContentSize: preferredSize, horizontalSizeClass: horizontalSizeClass)

        return UIFont.systemFont(ofSize: points, weight: weight)
    }

    public var description: String {
        switch self {
        case .textPreset1:
            return "TextPreset1"
        case .textPreset2:
            return "TextPreset2"
        case .textPreset3:
            return "TextPreset3"
        case .textPreset4:
            return "TextPreset4"
        case .textPreset5:
            return "TextPreset5"
        case .textPreset6:
            return "TextPreset6"
        case .textPreset7:
            return "TextPreset7"
        case .textPreset8:
            return "TextPreset8"
        case .textSystem:
            return "TextSystem"
        }
    }
}

private extension FontStyle {
    var preferredSize: UIContentSizeCategory {
        UIScreen.main.traitCollection.preferredContentSizeCategory
    }

    var fontSize: FontSize {
        switch self {
        case .textPreset1:
            return .veryHuge
        case .textPreset2:
            return .huge
        case .textPreset3:
            return .large
        case .textPreset4:
            return .veryBig
        case .textPreset5:
            return .big
        case .textPreset6:
            return .medium
        case .textPreset7:
            return .small
        case .textPreset8:
            return .verySmall
        case .textSystem:
            return .extraSmall
        }
    }
}

// This extension can go away when we drop support for iOS versions lower than 11
public extension UIContentSizeCategory {
    func isGreaterThan(_ other: UIContentSizeCategory) -> Bool {
        self > other
    }

    private var weight: Int {
        switch self {
        case .extraSmall:
            return -3
        case .small:
            return -2
        case .medium:
            return -1
        case .large: // Default
            return 0
        case .extraLarge:
            return 1
        case .extraExtraLarge:
            return 2
        case .extraExtraExtraLarge:
            return 3
        case .accessibilityMedium:
            return 4
        case .accessibilityLarge:
            return 5
        case .accessibilityExtraLarge:
            return 6
        case .accessibilityExtraExtraLarge:
            return 7
        case .accessibilityExtraExtraExtraLarge:
            return 8
        default:
            return 0
        }
    }
}
