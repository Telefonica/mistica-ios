import Foundation
import SwiftUI

// MARK: Font

@available(iOS 13.0, *)
public extension Font {
    static func textPreset1(weight: FontStyle.TextPreset1Weight, constrainedToPreferredSize: UIContentSizeCategory? = nil) -> Font {
        return FontStyle.textPreset1.preferredFont(weight: weight.systemWeight, constrainedToPreferredSize: constrainedToPreferredSize)
    }

    static func textPreset2(weight: FontStyle.TextPreset2Weight, constrainedToPreferredSize: UIContentSizeCategory? = nil) -> Font {
        FontStyle.textPreset2.preferredFont(weight: weight.systemWeight, constrainedToPreferredSize: constrainedToPreferredSize)
    }

    static func textPreset3(weight: FontStyle.TextPreset3Weight, constrainedToPreferredSize: UIContentSizeCategory? = nil) -> Font {
        FontStyle.textPreset3.preferredFont(weight: weight.systemWeight, constrainedToPreferredSize: constrainedToPreferredSize)
    }

    static func textPreset4(weight: FontStyle.TextPreset4Weight, constrainedToPreferredSize: UIContentSizeCategory? = nil) -> Font {
        FontStyle.textPreset4.preferredFont(weight: weight.systemWeight, constrainedToPreferredSize: constrainedToPreferredSize)
    }

    static func textPreset5(weight: FontStyle.TextPreset5Weight, constrainedToPreferredSize: UIContentSizeCategory? = nil) -> Font {
        FontStyle.textPreset5.preferredFont(weight: weight.systemWeight, constrainedToPreferredSize: constrainedToPreferredSize)
    }

    static func textPreset6(weight: FontStyle.TextPreset6Weight, constrainedToPreferredSize: UIContentSizeCategory? = nil) -> Font {
        FontStyle.textPreset6.preferredFont(weight: weight.systemWeight, constrainedToPreferredSize: constrainedToPreferredSize)
    }

    static func textPreset7(weight: FontStyle.TextPreset7Weight, constrainedToPreferredSize: UIContentSizeCategory? = nil) -> Font {
        FontStyle.textPreset7.preferredFont(weight: weight.systemWeight, constrainedToPreferredSize: constrainedToPreferredSize)
    }

    static func textPreset8(weight: FontStyle.TextPreset8Weight, constrainedToPreferredSize: UIContentSizeCategory? = nil) -> Font {
        FontStyle.textPreset8.preferredFont(weight: weight.systemWeight, constrainedToPreferredSize: constrainedToPreferredSize)
    }

    static func textPreset9(weight: FontStyle.TextPreset9Weight, constrainedToPreferredSize: UIContentSizeCategory? = nil) -> Font {
        FontStyle.textPreset8.preferredFont(weight: weight.systemWeight, constrainedToPreferredSize: constrainedToPreferredSize)
    }

    static func textPreset10(weight: FontStyle.TextPreset10Weight, constrainedToPreferredSize: UIContentSizeCategory? = nil) -> Font {
        FontStyle.textPreset8.preferredFont(weight: weight.systemWeight, constrainedToPreferredSize: constrainedToPreferredSize)
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
