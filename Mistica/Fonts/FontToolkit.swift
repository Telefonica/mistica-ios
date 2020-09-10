//
//  FontToolkit.swift
//  Mistica
//
//  Created by Víctor Pimentel on 13/12/2016.
//  Copyright © 2016 Tuenti Technologies S.L. All rights reserved.
//

import UIKit

private var _isDynamicTypeEnabled = true

public extension UIFont {
    
    @objc(textPreset1)
    static var textPreset1: (FontStyle.TextPreset1Weight) -> UIFont {
        { FontStyle.textPreset1.preferredFont(weight: $0.weight) }
    }
    
    @objc(textPreset2)
    static var textPreset2: (FontStyle.TextPreset2Weight) -> UIFont {
        { FontStyle.textPreset2.preferredFont(weight: $0.weight) }
    }
    
    @objc(textPreset3)
    static var textPreset3: (FontStyle.TextPreset3Weight) -> UIFont {
        { FontStyle.textPreset3.preferredFont(weight: $0.weight) }
    }
    
    @objc(textPreset4)
    static var textPreset4: (FontStyle.TextPreset4Weight) -> UIFont {
        { FontStyle.textPreset4.preferredFont(weight: $0.weight) }
    }
    
    @objc(textPreset5)
    static var textPreset5: (FontStyle.TextPreset5Weight) -> UIFont {
        { FontStyle.textPreset5.preferredFont(weight: $0.weight) }
    }
    
    @objc(textPreset6)
    static var textPreset6: (FontStyle.TextPreset6Weight) -> UIFont {
        { FontStyle.textPreset6.preferredFont(weight: $0.weight) }
    }
    
    @objc(textPreset7)
    static var textPreset7: (FontStyle.TextPreset7Weight) -> UIFont {
        { FontStyle.textPreset7.preferredFont(weight: $0.weight) }
    }
    
    @objc(textPreset8)
    static var textPreset8: (FontStyle.TextPreset8Weight) -> UIFont {
        { FontStyle.textPreset8.preferredFont(weight: $0.weight) }
    }
    
    @objc(textPreset9)
    static var textSystem: (FontStyle.TextSystemWeight) -> UIFont {
        { FontStyle.textSystem.preferredFont(weight: $0.weight) }
    }
    
    @objc(fixedFontForFontStyle:)
    static func fixedFont(for fontStyle: FontStyle) -> UIFont {
        switch fontStyle {
        case .textPreset1,
             .textPreset2,
             .textPreset3,
             .textPreset4,
             .textPreset5,
             .textPreset6:
            return fontStyle.preferredFont(weight: .light, constrainedToPreferredSize: .large)
        case .textPreset7,
             .textPreset8,
             .textSystem:
            return fontStyle.preferredFont(weight: .regular, constrainedToPreferredSize: .large)
        }
    }

    @objc(preferredFontForFontStyle:constrainedToSize:)
    static func preferredFont(for fontStyle: FontStyle, constrainedToPreferredSize constrainedPreferredSize: UIContentSizeCategory) -> UIFont {
        switch fontStyle {
        case .textPreset1,
             .textPreset2,
             .textPreset3,
             .textPreset4,
             .textPreset5,
             .textPreset6:
            return fontStyle.preferredFont(weight: .light, constrainedToPreferredSize: constrainedPreferredSize)
        case .textPreset7,
             .textPreset8,
             .textSystem:
            return fontStyle.preferredFont(weight: .regular, constrainedToPreferredSize: constrainedPreferredSize)
        }
    }

    @objc static var isDynamicTypeEnabled: Bool {
        get {
            _isDynamicTypeEnabled
        }
        set {
            _isDynamicTypeEnabled = newValue
        }
    }
}
