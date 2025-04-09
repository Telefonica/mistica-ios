//
//  FontStyle.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import SwiftUI
import UIKit

public class FontManager: @unchecked Sendable {
    public static let shared = FontManager()

    private let queue = DispatchQueue(label: "com.telefonica.fontManager", attributes: .concurrent)

    private var _fontNameForWeight: (@Sendable (Font.Weight) -> String)? = nil
    private var _uiFontNameForWeight: (@Sendable (UIFont.Weight) -> String)? = nil

    public var fontNameForWeight: (@Sendable (Font.Weight) -> String)? {
        get {
            queue.sync { _fontNameForWeight }
        }
        set {
            queue.async {
                self._fontNameForWeight = newValue
            }
        }
    }

    public var uiFontNameForWeight: (@Sendable (UIFont.Weight) -> String)? {
        get {
            queue.sync { _uiFontNameForWeight }
        }
        set {
            queue.async {
                self._uiFontNameForWeight = newValue
            }
        }
    }

    private init() {}
}

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
    case textPresetTabsLabel
    case textTitle3

    func preferredFont(
        weight: Font.Weight,
        constrainedToPreferredSize constrainedPreferredSize: UIContentSizeCategory? = nil
    ) -> Font {
        let pointSize = calculateFontSize(constrainedToPreferredSize: constrainedPreferredSize)

        if let fontName = FontManager.shared.fontNameForWeight?(weight) {
            return Font.custom(fontName, size: pointSize)
        } else {
            return Font.system(size: pointSize, weight: weight, design: .default)
        }
    }

    func preferredFont(
        weight: UIFont.Weight,
        constrainedToPreferredSize constrainedPreferredSize: UIContentSizeCategory? = nil
    ) -> UIFont {
        let pointSize = calculateFontSize(constrainedToPreferredSize: constrainedPreferredSize)

        if let fontName = FontManager.shared.uiFontNameForWeight?(weight),
           let customFont = UIFont(name: fontName, size: pointSize) {
            return customFont
        } else {
            return UIFont.systemFont(ofSize: pointSize, weight: weight)
        }
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
        case .textPreset9:
            return "TextPreset9"
        case .textPreset10:
            return "TextPreset10"
        case .textPresetTabsLabel:
            return "TextPresetTabsLabel"
        case .textTitle3:
            return "TextPresetTitle3"
        }
    }
}

private extension FontStyle {
    func calculateFontSize(constrainedToPreferredSize constrainedPreferredSize: UIContentSizeCategory?) -> CGFloat {
        let fontMetrics = UIFontMetrics(forTextStyle: uiFontPressetsCorrelations)
        var scaledBaseSize = round(fontMetrics.scaledValue(for: baseSize))

        if let constrainedPreferredSize = maximumFontSize(constrainedPreferredSize: constrainedPreferredSize) {
            scaledBaseSize = min(scaledBaseSize, constrainedPreferredSize)
        }

        return scaledBaseSize
    }

    func maximumFontSize(constrainedPreferredSize: UIContentSizeCategory?) -> CGFloat? {
        guard let constrainedPreferredSize else { return nil }

        let traitCollection = UITraitCollection(preferredContentSizeCategory: constrainedPreferredSize)
        let fontDescriptor = UIFontDescriptor.preferredFontDescriptor(
            withTextStyle: uiFontPressetsCorrelations,
            compatibleWith: traitCollection
        )

        return fontDescriptor.pointSize
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
            return 20
        case .textPreset6:
            return 24
        case .textPreset7:
            return 28
        case .textPreset8:
            return 32
        case .textPreset9:
            return 40
        case .textPreset10:
            return 48
        case .textPresetTabsLabel:
            return MisticaConfig.currentFontSizes.tabsLabel
        case .textTitle3:
            return MisticaConfig.currentFontSizes.title3
        }
    }

    var uiFontPressetsCorrelations: UIFont.TextStyle {
        switch self {
        case .textPreset1:
            return .caption1
        case .textPreset2:
            return .subheadline
        case .textPreset3,
             .textPresetTabsLabel:
            return .body
        case .textPreset4:
            return .headline
        case .textPreset5,
             .textTitle3:
            return .title3
        case .textPreset6:
            return .title2
        case .textPreset7:
            return .title1
        case .textPreset8,
             .textPreset9,
             .textPreset10:
            return .largeTitle
        }
    }

    var fontPressetsCorrelations: Font.TextStyle {
        switch self {
        case .textPreset1:
            return .caption
        case .textPreset2:
            return .subheadline
        case .textPreset3,
             .textPresetTabsLabel:
            return .body
        case .textPreset4:
            return .headline
        case .textPreset5,
             .textTitle3:
            return .title3
        case .textPreset6:
            return .title2
        case .textPreset7:
            return .title
        case .textPreset8,
             .textPreset9,
             .textPreset10:
            return .largeTitle
        }
    }
}
