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
    
    func preferredFont(
        weight: Font.Weight,
        constrainedToPreferredSize constrainedPreferredSize: UIContentSizeCategory? = nil
    ) -> Font {
        let fontMetrics = UIFontMetrics(forTextStyle: uiFontPressetsCorrelations)
        let scaledSize = round(fontMetrics.scaledValue(for: baseSize)) // scaledValue sometines returns decimal numbers, in this case we need to round up the number.
        
        if let fontName = Self.fontNameForWeight?(weight) {
            if #available(iOS 14.0, *) {
                return Font.custom(fontName, size: baseSize, relativeTo: fontPressetsCorrelations)
            } else {
                return Font.custom(fontName, size: scaledSize)
            }
        } else {
            return Font.system(size: scaledSize, weight: weight, design: .default)
        }
    }
    
    public static var fontNameForWeight: ((Font.Weight) -> String)? = nil
    
    func preferredFont(
        weight: UIFont.Weight,
        constrainedToPreferredSize constrainedPreferredSize: UIContentSizeCategory? = nil
    ) -> UIFont {
        let fontMetrics = UIFontMetrics(forTextStyle: uiFontPressetsCorrelations)
        let scaledSize = round(fontMetrics.scaledValue(for: baseSize)) // scaledValue sometines returns decimal numbers, in this case we need to round up the number.
        
        if let fontName = Self.uiFontNameForWeight?(weight),
           let customFont = UIFont(name: fontName, size: scaledSize) {
            return customFont
        } else {
            return UIFont.systemFont(ofSize: scaledSize, weight: weight)
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
    
    var uiFontPressetsCorrelations: UIFont.TextStyle {
        switch self {
        case .textPreset1:
            return .caption1
        case .textPreset2:
            return .subheadline
        case .textPreset3:
            return .body
        case .textPreset4:
            return .headline
        case .textPreset5:
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
        case .textPreset3:
            return .body
        case .textPreset4:
            return .headline
        case .textPreset5:
            if #available(iOS 14.0, *) {
                return .title3
            } else {
                return .title
            }
        case .textPreset6:
            if #available(iOS 14.0, *) {
                return .title2
            } else {
                return .title
            }
        case .textPreset7:
            return .title
        case .textPreset8,
                .textPreset9,
                .textPreset10:
            return .largeTitle
        }
    }
}

fileprivate extension Font.Weight {
    var uiFontWeight: UIFont.Weight {
        switch self {
        case .black:
            return .black
        case .bold:
            return .bold
        case .heavy:
            return .heavy
        case .light:
            return .light
        case .medium:
            return .medium
        case .regular:
            return .regular
        case .semibold:
            return .semibold
        case .thin:
            return .thin
        case .ultraLight:
            return .ultraLight
        default:
            fatalError("Unhandled Font.Height named: \(self)")
        }
    }
}
