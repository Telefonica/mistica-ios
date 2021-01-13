//
//  StepperTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

import Mistica
import SnapshotTesting
import XCTest

final class StepperTests: XCTestCase {
    override class func setUp() {
        super.setUp()

        isRecording = false
    }

    // MARK: - Styles

    func testDeterminateStepperDefaultState() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeTemplateWithStepperState(isDeterminate: true)
        )
    }

    func testIndeterminateStepperDefaultState() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeTemplateWithStepperState(isDeterminate: false)
        )
    }

    // MARK: Behaviour

    func testDeterminateStepperCurrentStepChanges() {
        MisticaConfig.brandStyle = .movistar

        let stepper = makeTemplateWithStepperState(isDeterminate: true, currentStep: 0)

        assertSnapshot(
            matching: stepper,
            as: .image,
            named: "assertInitialState"
        )

        stepper.currentStep = 1

        assertSnapshot(
            matching: stepper,
            as: .image,
            named: "finalState"
        )
    }

    func testDeterminateStepperNumberOfStepsChanges() {
        MisticaConfig.brandStyle = .movistar

        let stepper = makeTemplateWithStepperState(isDeterminate: true, numberOfSteps: 3)

        assertSnapshot(
            matching: stepper,
            as: .image,
            named: "assertInitialState"
        )

        stepper.numberOfSteps = 4

        assertSnapshot(
            matching: stepper,
            as: .image,
            named: "finalState"
        )
    }

    func testIndeterminateStepperCurrentStepChanges() {
        MisticaConfig.brandStyle = .movistar

        let stepper = makeTemplateWithStepperState(isDeterminate: false, currentStep: 0)

        assertSnapshot(
            matching: stepper,
            as: .image,
            named: "assertInitialState"
        )

        stepper.currentStep = 1

        assertSnapshot(
            matching: stepper,
            as: .image,
            named: "finalState"
        )
    }

    func testIndeterminateStepperNumberOfStepsChanges() {
        MisticaConfig.brandStyle = .movistar

        let stepper = makeTemplateWithStepperState(isDeterminate: false, numberOfSteps: 3)

        assertSnapshot(
            matching: stepper,
            as: .image,
            named: "assertInitialState"
        )

        stepper.numberOfSteps = 4

        assertSnapshot(
            matching: stepper,
            as: .image,
            named: "finalState"
        )
    }

    // MARK: XIB integration

    func testDeterminateStepperXIBIntegration() {
        MisticaConfig.brandStyle = .vivo

        let view = StepperXIBIntegration.viewFromNib()
        view.stepper.isDeterminate = true

        assertSnapshot(
            matching: view,
            as: .image
        )
    }

    func testIndeterminateStepperXIBIntegration() {
        MisticaConfig.brandStyle = .vivo

        let view = StepperXIBIntegration.viewFromNib()
        view.stepper.isDeterminate = false

        assertSnapshot(
            matching: view,
            as: .image
        )
    }
}

// MARK: - Helpers

private func makeTemplateWithStepperState(isDeterminate: Bool, currentStep: Int = 0, numberOfSteps: Int = 3) -> StepperView {
    let stepperView = StepperView(frame: CGRect(origin: .zero, size: CGSize(width: 600, height: 24)))
    stepperView.isDeterminate = isDeterminate
    stepperView.numberOfSteps = numberOfSteps
    stepperView.currentStep = currentStep
    return stepperView
}
