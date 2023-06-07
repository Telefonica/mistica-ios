//
//  FontToolkit+UIFont.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

var _isDynamicTypeEnabled = true

public extension UIFont {
    static func textPreset1(weight: FontStyle.TextPreset1Weight, constrainedToPreferredSize: UIContentSizeCategory? = nil) -> UIFont {
        FontStyle.textPreset1.preferredFont(weight: weight.value.systemUIFontWeight, constrainedToPreferredSize: constrainedToPreferredSize)
    }

    static func textPreset2(weight: FontStyle.TextPreset2Weight, constrainedToPreferredSize: UIContentSizeCategory? = nil) -> UIFont {
        FontStyle.textPreset2.preferredFont(weight: weight.value.systemUIFontWeight, constrainedToPreferredSize: constrainedToPreferredSize)
    }

    static func textPreset3(weight: FontStyle.TextPreset3Weight, constrainedToPreferredSize: UIContentSizeCategory? = nil) -> UIFont {
        FontStyle.textPreset3.preferredFont(weight: weight.value.systemUIFontWeight, constrainedToPreferredSize: constrainedToPreferredSize)
    }

    static func textPreset4(weight: FontStyle.TextPreset4Weight, constrainedToPreferredSize: UIContentSizeCategory? = nil) -> UIFont {
        FontStyle.textPreset4.preferredFont(weight: weight.value.systemUIFontWeight, constrainedToPreferredSize: constrainedToPreferredSize)
    }

    static func textPreset5(constrainedToPreferredSize: UIContentSizeCategory? = nil) -> UIFont {
        FontStyle.textPreset5.preferredFont(weight: MisticaConfig.currentFontWeights.text5.systemUIFontWeight, constrainedToPreferredSize: constrainedToPreferredSize)
    }

    static func textPreset6(constrainedToPreferredSize: UIContentSizeCategory? = nil) -> UIFont {
        FontStyle.textPreset6.preferredFont(weight: MisticaConfig.currentFontWeights.text6.systemUIFontWeight, constrainedToPreferredSize: constrainedToPreferredSize)
    }

    static func textPreset7(constrainedToPreferredSize: UIContentSizeCategory? = nil) -> UIFont {
        FontStyle.textPreset7.preferredFont(weight: MisticaConfig.currentFontWeights.text7.systemUIFontWeight, constrainedToPreferredSize: constrainedToPreferredSize)
    }

    static func textPreset8(constrainedToPreferredSize: UIContentSizeCategory? = nil) -> UIFont {
        FontStyle.textPreset8.preferredFont(weight: MisticaConfig.currentFontWeights.text8.systemUIFontWeight, constrainedToPreferredSize: constrainedToPreferredSize)
    }

    static func textPreset9(constrainedToPreferredSize: UIContentSizeCategory? = nil) -> UIFont {
        FontStyle.textPreset9.preferredFont(weight: MisticaConfig.currentFontWeights.text9.systemUIFontWeight, constrainedToPreferredSize: constrainedToPreferredSize)
    }

    static func textPreset10(constrainedToPreferredSize: UIContentSizeCategory? = nil) -> UIFont {
        FontStyle.textPreset10.preferredFont(weight: MisticaConfig.currentFontWeights.text10.systemUIFontWeight, constrainedToPreferredSize: constrainedToPreferredSize)
    }

    static func preferredFont(for fontStyle: FontStyle, weight: UIFont.Weight, constrainedToPreferredSize constrainedPreferredSize: UIContentSizeCategory) -> UIFont {
        fontStyle.preferredFont(weight: weight, constrainedToPreferredSize: constrainedPreferredSize)
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
