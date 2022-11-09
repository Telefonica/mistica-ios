//
//  FontStyle.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import SwiftUI
import UIKit

@frozen
@objc public enum FontStyle: Int, CaseIterable, CustomStringConvertible {
    case textPreset1
    case textPreset2
    case textPreset3
    case textPreset4
    case textPreset5
    case textPreset6
    case textPreset7
    case textPreset8
    case textPreset9
    case textPreset10

    @available(iOS 13.0, *)
    func preferredFont(weight: Font.Weight, constrainedToPreferredSize constrainedPreferredSize: UIContentSizeCategory? = nil) -> Font {
        let horizontalSizeClass = UIScreen.main.traitCollection.horizontalSizeClass
        var preferredSize = preferredSize

        if let constrainedSize = constrainedPreferredSize, preferredSize > constrainedSize {
            preferredSize = constrainedSize
        }

        let sizePoints = points(preferredContentSize: preferredSize, horizontalSizeClass: horizontalSizeClass)

        if let fontName = Self.fontNameForWeight?(weight) {
            return Font.custom(fontName, size: sizePoints)
        } else {
            return Font.system(size: sizePoints, weight: weight, design: .default)
        }
    }

    @available(iOS 13.0, *)
    public static var fontNameForWeight: ((Font.Weight) -> String)? = nil

    func preferredFont(weight: UIFont.Weight, constrainedToPreferredSize constrainedPreferredSize: UIContentSizeCategory? = nil) -> UIFont {
        let horizontalSizeClass = UIScreen.main.traitCollection.horizontalSizeClass
        var preferredSize = preferredSize

        if let constrainedSize = constrainedPreferredSize, preferredSize > constrainedSize {
            preferredSize = constrainedSize
        }

        let sizePoints = points(preferredContentSize: preferredSize, horizontalSizeClass: horizontalSizeClass)

        if let fontName = Self.uiFontNameForWeight?(weight),
           let customFont = UIFont(name: fontName, size: sizePoints) {
            return customFont
        } else {
            return UIFont.systemFont(ofSize: sizePoints, weight: weight)
        }
    }

    public static var uiFontNameForWeight: ((UIFont.Weight) -> String)? = nil

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
        case .textPreset9:
            return "TextPreset9"
        case .textPreset10:
            return "TextPreset10"
        }
    }
}

private extension FontStyle {
    var preferredSize: UIContentSizeCategory {
        UIScreen.main.traitCollection.preferredContentSizeCategory
    }

    var baseSize: CGFloat {
        switch self {
        case .textPreset1:
            return 12
        case .textPreset2:
            return 14
        case .textPreset3:
            return 16
        case .textPreset4:
            return 18
        case .textPreset5:
            return 22
        case .textPreset6:
            return 24
        case .textPreset7:
            return 28
        case .textPreset8:
            return 32
        case .textPreset9:
            return 32
        case .textPreset10:
            return 32
        }
    }

    func points(preferredContentSize: UIContentSizeCategory, horizontalSizeClass: UIUserInterfaceSizeClass?) -> CGFloat {
        var size = baseSize

        let preferredContentSizeDelta = deltaPoints(preferredSize: preferredContentSize)
        let sizeClassDelta = deltaPoints(horizontalSizeClass: horizontalSizeClass)

        size += preferredContentSizeDelta
        size += sizeClassDelta

        return size
    }

    /// Returns the additional points to adjust a FontSize taking into account the `preferredContentSize`
    /// The result can be negative as the default preferred content size is .large and there are smaller sizes
    func deltaPoints(preferredSize: UIContentSizeCategory) -> CGFloat {
        if !UIFont.isDynamicTypeEnabled {
            return 0
        }

        switch preferredSize {
        case .extraSmall:
            return -3
        case .small:
            return -2
        case .medium:
            return -1
        case .large: // Default
            return 0
        case .extraLarge:
            return 2
        case .extraExtraLarge:
            return 4
        case .extraExtraExtraLarge:
            return 6
        case .accessibilityMedium:
            return 10
        case .accessibilityLarge:
            return 14
        case .accessibilityExtraLarge:
            return 18
        case .accessibilityExtraExtraLarge:
            return 22
        case .accessibilityExtraExtraExtraLarge:
            return 26
        default:
            assertionFailure("Unhandled UIContentSizeCategory: \(preferredSize.rawValue)")
            return 0
        }
    }

    /// Returns the additional points taking into account the `horizontalSizeClass`
    /// This currently makes the font size a bit larger for some sizes on regular horizontal size classes
    func deltaPoints(horizontalSizeClass: UIUserInterfaceSizeClass?) -> CGFloat {
        let horizontalSizeClass = horizontalSizeClass ?? .compact
        guard horizontalSizeClass == .regular else { return 0 }

        switch self {
        case .textPreset1,
             .textPreset2,
             .textPreset3,
             .textPreset4:
            return 2
        case .textPreset5,
             .textPreset6,
             .textPreset7,
             .textPreset8,
             .textPreset9,
             .textPreset10:
            return 0
        }
    }
}
