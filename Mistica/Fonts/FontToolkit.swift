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
    
    static func textPreset1(weight: FontStyle.TextPreset1Weight = .light) -> UIFont {
        FontStyle.textPreset1.preferredFont(weight: weight.systemWeight)
    }
    
    static func textPreset2(weight: FontStyle.TextPreset2Weight) -> UIFont {
        FontStyle.textPreset2.preferredFont(weight: weight.systemWeight)
    }
    
    static func textPreset3(weight: FontStyle.TextPreset3Weight) -> UIFont {
        FontStyle.textPreset3.preferredFont(weight: weight.systemWeight)
    }
    
    static func textPreset4(weight: FontStyle.TextPreset4Weight) -> UIFont {
        FontStyle.textPreset4.preferredFont(weight: weight.systemWeight)
    }
    
    static func textPreset5(weight: FontStyle.TextPreset5Weight) -> UIFont {
        FontStyle.textPreset5.preferredFont(weight: weight.systemWeight)
    }

    static func textPreset6(weight: FontStyle.TextPreset6Weight) -> UIFont {
        FontStyle.textPreset6.preferredFont(weight: weight.systemWeight)
    }
    
    static func textPreset7(weight: FontStyle.TextPreset7Weight) -> UIFont {
        FontStyle.textPreset7.preferredFont(weight: weight.systemWeight)
    }

    static func textPreset8(weight: FontStyle.TextPreset8Weight) -> UIFont {
        FontStyle.textPreset8.preferredFont(weight: weight.systemWeight)
    }
    
    static func textSystem(weight: FontStyle.TextSystemWeight) -> UIFont {
        FontStyle.textSystem.preferredFont(weight: weight.systemWeight)
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
