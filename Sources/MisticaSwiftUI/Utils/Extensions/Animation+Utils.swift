import Foundation
import SwiftUI

@available(iOS 13.0, *)
public extension Animation {
    static var misticaTimingCurve: Animation {
        .timingCurve(0.77, 0, 0.175, 1)
    }
}
