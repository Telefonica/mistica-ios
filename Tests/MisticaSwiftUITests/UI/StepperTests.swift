//
//  StepperTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import MisticaSwiftUI
import SnapshotTesting
import SwiftUI
import XCTest

@MainActor
final class StepperTests: XCTestCase {
    override class func setUp() {
        super.setUp()
        Task { @MainActor in
            UIView.setAnimationsEnabled(false)
        }
    }
    
    override func invokeTest() {
        withSnapshotTesting(record: .never) {
            super.invokeTest()
        }
    }

    func testStepZeroOfFourSteps() {
        let input = makeTemplate(step: 0, steps: 4)

        assertSnapshot(
            of: input,
            as: .image
        )
    }

    func testStepOneOfFourSteps() {
        let input = makeTemplate(step: 1, steps: 4)

        assertSnapshot(
            of: input,
            as: .image
        )
    }

    func testStepFourOfFourSteps() {
        let input = makeTemplate(step: 4, steps: 4)

        assertSnapshot(
            of: input,
            as: .image
        )
    }
}

private extension StepperTests {
    func makeTemplate(
        step: Int,
        steps: Int
    ) -> some View {
        VStack {
            Stepper(
                step: .constant(step),
                steps: steps
            )
            .style(.undetermined)
            .animation(nil)
        }
        .frame(width: 300)
        .padding()
    }
}
