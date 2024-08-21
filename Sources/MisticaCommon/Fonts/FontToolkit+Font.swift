//
//  FontToolkit+Font.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import SwiftUI

// MARK: Font

public extension Font {
    static func textPreset1(weight: FontStyle.TextPreset1Weight, constrainedToPreferredSize: UIContentSizeCategory? = nil) -> Font {
        FontStyle.textPreset1.preferredFont(weight: weight.value.systemWeight, constrainedToPreferredSize: constrainedToPreferredSize)
    }

    static func textPreset2(weight: FontStyle.TextPreset2Weight, constrainedToPreferredSize: UIContentSizeCategory? = nil) -> Font {
        FontStyle.textPreset2.preferredFont(weight: weight.value.systemWeight, constrainedToPreferredSize: constrainedToPreferredSize)
    }

    static func textPreset3(weight: FontStyle.TextPreset3Weight, constrainedToPreferredSize: UIContentSizeCategory? = nil) -> Font {
        FontStyle.textPreset3.preferredFont(weight: weight.value.systemWeight, constrainedToPreferredSize: constrainedToPreferredSize)
    }

    static func textPreset4(weight: FontStyle.TextPreset4Weight, constrainedToPreferredSize: UIContentSizeCategory? = nil) -> Font {
        FontStyle.textPreset4.preferredFont(weight: weight.value.systemWeight, constrainedToPreferredSize: constrainedToPreferredSize)
    }

    static func textPreset5(constrainedToPreferredSize: UIContentSizeCategory? = nil) -> Font {
        FontStyle.textPreset5.preferredFont(weight: MisticaConfig.currentFontWeights.text5.systemWeight, constrainedToPreferredSize: constrainedToPreferredSize)
    }

    static func textPreset6(constrainedToPreferredSize: UIContentSizeCategory? = nil) -> Font {
        FontStyle.textPreset6.preferredFont(weight: MisticaConfig.currentFontWeights.text6.systemWeight, constrainedToPreferredSize: constrainedToPreferredSize)
    }

    static func textPreset7(constrainedToPreferredSize: UIContentSizeCategory? = nil) -> Font {
        FontStyle.textPreset7.preferredFont(weight: MisticaConfig.currentFontWeights.text7.systemWeight, constrainedToPreferredSize: constrainedToPreferredSize)
    }

    static func textPreset8(constrainedToPreferredSize: UIContentSizeCategory? = nil) -> Font {
        FontStyle.textPreset8.preferredFont(weight: MisticaConfig.currentFontWeights.text8.systemWeight, constrainedToPreferredSize: constrainedToPreferredSize)
    }

    static func textPreset9(constrainedToPreferredSize: UIContentSizeCategory? = nil) -> Font {
        FontStyle.textPreset9.preferredFont(weight: MisticaConfig.currentFontWeights.text9.systemWeight, constrainedToPreferredSize: constrainedToPreferredSize)
    }

    static func textPreset10(constrainedToPreferredSize: UIContentSizeCategory? = nil) -> Font {
        FontStyle.textPreset10.preferredFont(weight: MisticaConfig.currentFontWeights.text10.systemWeight, constrainedToPreferredSize: constrainedToPreferredSize)
    }

    static func textPresetTabsLabel(constrainedToPreferredSize: UIContentSizeCategory? = nil) -> Font {
        FontStyle.textPresetTabsLabel.preferredFont(
            weight: MisticaConfig.currentFontWeights.tabsLabel.systemWeight,
            constrainedToPreferredSize: constrainedToPreferredSize
        )
    }

    static func textTitle3(constrainedToPreferredSize: UIContentSizeCategory? = nil) -> Font {
        FontStyle.textTitle3.preferredFont(
            weight: MisticaConfig.currentFontWeights.title3.systemWeight,
            constrainedToPreferredSize: constrainedToPreferredSize
        )
    }

    static func preferredFont(for fontStyle: FontStyle, weight: Font.Weight, constrainedToPreferredSize constrainedPreferredSize: UIContentSizeCategory) -> Font {
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
