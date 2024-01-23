//
//  UndeterminedStepper.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import SwiftUI

public struct UndeterminedStepper: View {
    @Binding var step: Int
    var steps: Int

    public init(
        step: Binding<Int>,
        steps: Int
    ) {
        _step = step
        self.steps = steps
    }

    public var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .leading) {
                Color.barTrack
                Color.controlActivated
                    .frame(width: proxy.size.width * interpolatedStep)
                    .animation(.misticaTimingCurve, value: interpolatedStep)
            }
        }
        .expandHorizontally()
        .frame(height: 4)
        .round(radiusStyle: .button)
    }

    // Returns a value between 0.0 and 1.0
    var interpolatedStep: Double {
        Double(step) / Double(steps)
    }
}
