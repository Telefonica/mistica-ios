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
    
    static var textPreset1: (FontStyle.TextPreset1Weight) -> UIFont {
        { FontStyle.textPreset1.preferredFont(weight: $0.weight) }
    }
    
    static var textPreset2: (FontStyle.TextPreset2Weight) -> UIFont {
        { FontStyle.textPreset2.preferredFont(weight: $0.weight) }
    }
    
    static var textPreset3: (FontStyle.TextPreset3Weight) -> UIFont {
        { FontStyle.textPreset3.preferredFont(weight: $0.weight) }
    }
    
    static var textPreset4: (FontStyle.TextPreset4Weight) -> UIFont {
        { FontStyle.textPreset4.preferredFont(weight: $0.weight) }
    }
    
    static var textPreset5: (FontStyle.TextPreset5Weight) -> UIFont {
        { FontStyle.textPreset5.preferredFont(weight: $0.weight) }
    }

    static var textPreset6: (FontStyle.TextPreset6Weight) -> UIFont {
        { FontStyle.textPreset6.preferredFont(weight: $0.weight) }
    }
    
    static var textPreset7: (FontStyle.TextPreset7Weight) -> UIFont {
        { FontStyle.textPreset7.preferredFont(weight: $0.weight) }
    }

    static var textPreset8: (FontStyle.TextPreset8Weight) -> UIFont {
        { FontStyle.textPreset8.preferredFont(weight: $0.weight) }
    }
    
    static var textSystem: (FontStyle.TextSystemWeight) -> UIFont {
        { FontStyle.textSystem.preferredFont(weight: $0.weight) }
    }
    
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

    static var isDynamicTypeEnabled: Bool {
        get {
            _isDynamicTypeEnabled
        }
        set {
            _isDynamicTypeEnabled = newValue
        }
    }
}
