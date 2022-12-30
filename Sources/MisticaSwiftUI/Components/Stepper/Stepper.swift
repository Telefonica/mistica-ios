//
//  Stepper.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

import SwiftUI

public struct Stepper: View {
    public enum Style {
        case determined
        case undetermined
    }

    @Binding var step: Int
    var steps: Int
    var style: Style = .undetermined

    public init(
        step: Binding<Int>,
        steps: Int
    ) {
        _step = step
        self.steps = steps
    }

    public var body: some View {
        switch style {
        case .determined:
            DeterminedStepper(
                step: $step,
                steps: steps
            )
        case .undetermined:
            UndeterminedStepper(
                step: $step,
                steps: steps
            )
        }
    }
}

// MARK: Modifiers

public extension Stepper {
    func style(_ style: Stepper.Style) -> Stepper {
        var stepper = self
        stepper.style = style
        return stepper
    }
}

// MARK: Previews

#if DEBUG
    struct StepperPreview: View {
        @State var step = 0

        var body: some View {
            VStack {
                UndeterminedStepper(step: $step, steps: 4)
                DeterminedStepper(step: $step, steps: 4)
                SwiftUI.Stepper("Stepper", value: $step)
            }
            .padding()
        }
    }

    struct Stepper_Previews: PreviewProvider {
        static var previews: some View {
            StepperPreview()
        }
    }
#endif
