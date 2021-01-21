//
//  IndeterminateStepperTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

import Mistica
import SnapshotTesting
import XCTest

final class IndeterminateStepperTests: XCTestCase {
    override class func setUp() {
        super.setUp()

        isRecording = false
    }

    // MARK: - Styles

    func testIndeterminateStepperDefaultState() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeTemplateWithStepperState(value: 50)
        )
    }

    // MARK: Behaviour

    func testIndeterminateStepperCurrentStepChanges() {
        MisticaConfig.brandStyle = .movistar

        let stepper = makeTemplateWithStepperState(value: 0)

        assertSnapshot(
            matching: stepper,
            as: .image,
            named: "assertInitialState"
        )

        stepper.value = 1

        assertSnapshot(
            matching: stepper,
            as: .image,
            named: "finalState"
        )
    }

    func testIndeterminateStepperNumberOfStepsChanges() {
        MisticaConfig.brandStyle = .movistar

        let stepper = makeTemplateWithStepperState()

        assertSnapshot(
            matching: stepper,
            as: .image,
            named: "assertInitialState"
        )

        stepper.value = 50

        assertSnapshot(
            matching: stepper,
            as: .image,
            named: "finalState"
        )
    }

    // MARK: XIB integration

    func testIndeterminateStepperXIBIntegration() {
        MisticaConfig.brandStyle = .vivo

        let view = IndeterminateStepperXIBIntegration.viewFromNib()

        assertSnapshot(
            matching: view,
            as: .image
        )
    }
}

// MARK: - Helpers

private func makeTemplateWithStepperState(value: Int = 0) -> IndeterminateStepperView {
    let stepperView = IndeterminateStepperView(frame: CGRect(origin: .zero, size: CGSize(width: 600, height: 24)))
    stepperView.value = value
    return stepperView
}
