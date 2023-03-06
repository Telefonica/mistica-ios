//
//  DeterminedStepper.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

import SwiftUI

public struct DeterminedStepper: View {
    private enum Constants {
        static let height: CGFloat = 24
        static let originalHeight: CGFloat = 64
        static let borderWidth: CGFloat = 1.5
        // The border width should be 1.5, however as we are scaling down the animation,
        // we need to adjust the border width. Otherwise, sizes do not match.
        static let scaleFactor: CGFloat = Constants.originalHeight / Constants.height
        static let scaledBorderWidth: CGFloat = Constants.borderWidth * Constants.scaleFactor
    }

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
        GeometryReader { _ in
            HStack {
                ForEach(0 ..< steps, id: \.self) { stepIndex in
                    step(for: stepIndex)
                        .frame(width: Constants.height, height: Constants.height)
                    undeterminedStepper(for: stepIndex)
                }
            }
        }
        .expandHorizontally()
        .frame(height: Constants.height)
    }
}

// MARK: Private

private extension DeterminedStepper {
    func stepBorderWidth(for step: Int) -> CGFloat {
        self.step == step ? 0 : Constants.borderWidth
    }

    func stepForegroundColor(for step: Int) -> Color {
        self.step == step ? .textPrimaryInverse : .textPrimary
    }

    func stepBackgroundColor(for step: Int) -> Color {
        self.step == step ? .controlActivated : .clear
    }

    @ViewBuilder
    func undeterminedStepper(for step: Int) -> some View {
        if step + 1 != steps {
            UndeterminedStepper(
                step: .constant(self.step > step ? 1 : 0),
                steps: 1
            )
        }
    }

    @ViewBuilder
    func step(for step: Int) -> some View {
        if self.step > step {
            LottieView(
                loopMode: .playOnce,
                asset: .successAnimation,
                color: .controlActivated,
                borderWidth: Constants.scaledBorderWidth,
                scaleToFit: true
            )
            .transition(.opacity.animation(.misticaTimingCurve))
        } else {
            ZStack {
                Circle()
                    .fill(stepBackgroundColor(for: step))

                Text("\(step + 1)")
                    .font(.textPreset1(weight: .regular))
                    .foregroundColor(stepForegroundColor(for: step))
            }
            .border(cornerRadius: Constants.height / 2, borderColor: .borderHigh, lineWidth: stepBorderWidth(for: step))
            .transition(.opacity.animation(.misticaTimingCurve))
        }
    }
}
