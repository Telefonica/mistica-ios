//
//  FontStyle.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

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
    case textSystem

    func preferredFont(weight: CustomFontWeight, constrainedToPreferredSize constrainedPreferredSize: UIContentSizeCategory? = nil) -> UIFont {
        let horizontalSizeClass = UIScreen.main.traitCollection.horizontalSizeClass
        var preferredSize = self.preferredSize

        if let constrainedSize = constrainedPreferredSize, preferredSize.isGreaterThan(constrainedSize) {
            preferredSize = constrainedSize
        }
        
        UIFont.loadFonts()
        
        let sizePoints = points(prerredContentSize: preferredSize, horizontalSizeClass: horizontalSizeClass)
        
        return UIFont(name: "OnAir-\(weight.rawValue.capitalized)", size: sizePoints)!
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

    var baseSize: CGFloat {
        switch self {
        case .textPreset1:
            return 32
        case .textPreset2:
            return 28
        case .textPreset3:
            return 24
        case .textPreset4:
            return 22
        case .textPreset5:
            return 18
        case .textPreset6:
            return 16
        case .textPreset7:
            return 14
        case .textPreset8:
            return 12
        case .textSystem:
            return 10
        }
    }

    func points(prerredContentSize: UIContentSizeCategory, horizontalSizeClass: UIUserInterfaceSizeClass?) -> CGFloat {
        var size = baseSize

        let preferredContentSizeDelta = deltaPoints(preferredSize: prerredContentSize)
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
            return 0
        case .textPreset5,
             .textPreset6,
             .textPreset7,
             .textPreset8,
             .textSystem:
            return 2
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

extension UIFont {
    
    private static var loaded = false
    
    private static var fontBundle: Bundle { Bundle(for: Reference.self) }
    
    public static func loadFonts() {
        guard !loaded else { return }
        loaded = true
        registerFont(bundle: fontBundle, fontName: "OnAir-Light", fontExtension: "ttf")
        registerFont(bundle: fontBundle, fontName: "OnAir-Regular", fontExtension: "ttf")
        registerFont(bundle: fontBundle, fontName: "OnAir-Bold", fontExtension: "ttf")
    }
    
    @discardableResult
    static func registerFont(bundle: Bundle, fontName: String, fontExtension: String) -> Bool {
        
        guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension) else {
            fatalError("Couldn't find font \(fontName)")
        }

        guard let fontDataProvider = CGDataProvider(url: fontURL as CFURL) else {
            fatalError("Couldn't load data from the font \(fontName)")
        }

        guard let font = CGFont(fontDataProvider) else {
            fatalError("Couldn't create font from data")
        }

        var error: Unmanaged<CFError>?
        let success = CTFontManagerRegisterGraphicsFont(font, &error)
        guard success else {
            print("Error registering font: maybe it was already registered.")
            return false
        }

        return true
    }
    
    private class Reference {}
}
