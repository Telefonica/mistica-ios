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

    func testDeterminedStepperDefaultState() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeTemplateWithStepperState(isDetermined: true)
        )
    }
    
    func testIndeterminedStepperDefaultState() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeTemplateWithStepperState(isDetermined: false)
        )
    }

    // MARK: Behaviour

    func testDeterminedStepperCurrentStepChanges() {
        MisticaConfig.brandStyle = .movistar

        let stepper = makeTemplateWithStepperState(isDetermined: true, currentStep: 0)

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
    
    func testDeterminedStepperNumberOfStepsChanges() {
        MisticaConfig.brandStyle = .movistar

        let stepper = makeTemplateWithStepperState(isDetermined: true, numberOfSteps: 3)

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
    
    func testIndeterminedStepperCurrentStepChanges() {
        MisticaConfig.brandStyle = .movistar

        let stepper = makeTemplateWithStepperState(isDetermined: false, currentStep: 0)

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
    
    func testIndeterminedStepperNumberOfStepsChanges() {
        MisticaConfig.brandStyle = .movistar

        let stepper = makeTemplateWithStepperState(isDetermined: false, numberOfSteps: 3)

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

    func testDeterminedStepperXIBIntegration() {
        MisticaConfig.brandStyle = .vivo

        let view = StepperXIBIntegration.viewFromNib()
        view.stepper.isDetermined = true
        
        assertSnapshot(
            matching: view,
            as: .image
        )
    }
    
    func testIndeterminedStepperXIBIntegration() {
        MisticaConfig.brandStyle = .vivo

        let view = StepperXIBIntegration.viewFromNib()
        view.stepper.isDetermined = false
        
        assertSnapshot(
            matching: view,
            as: .image
        )
    }
}

// MARK: - Helpers

private func makeTemplateWithStepperState(isDetermined: Bool, currentStep: Int = 0, numberOfSteps: Int = 3) -> StepperView {
    let stepperView = StepperView(frame: CGRect(origin: .zero, size: CGSize(width: 600, height: 24)))
    stepperView.isDetermined = isDetermined
    stepperView.numberOfSteps = numberOfSteps
    stepperView.currentStep = currentStep
    return stepperView
}
