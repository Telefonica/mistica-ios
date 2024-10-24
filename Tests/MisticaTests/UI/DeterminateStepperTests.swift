//
//  DeterminateStepperTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

@testable import Mistica
import SnapshotTesting
import XCTest

@MainActor
final class DeterminateStepperTests: XCTestCase {
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

    // MARK: - Styles

    func testDeterminateStepperDefaultState() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image,
            viewBuilder: makeTemplateWithStepperState(currentStep: 2, numberOfSteps: 3)
        )
    }

    // MARK: Behaviour

    func testDeterminateStepperCurrentStepChanges() {
        MisticaConfig.brandStyle = .movistar

        let stepper = makeTemplateWithStepperState(currentStep: 0)

        assertSnapshot(
            of: stepper,
            as: .image,
            named: "assertInitialState"
        )

        stepper.currentStep = 1

        assertSnapshot(
            of: stepper,
            as: .image,
            named: "finalState"
        )
    }

    func testDeterminateStepperNumberOfStepsChanges() {
        MisticaConfig.brandStyle = .movistar

        let stepper = makeTemplateWithStepperState(numberOfSteps: 3)

        assertSnapshot(
            of: stepper,
            as: .image,
            named: "assertInitialState"
        )

        stepper.numberOfSteps = 4

        assertSnapshot(
            of: stepper,
            as: .image,
            named: "finalState"
        )
    }

    // MARK: XIB integration

    func testDeterminateStepperXIBIntegration() {
        MisticaConfig.brandStyle = .vivo

        let view = DeterminateStepperXIBIntegration.viewFromNib()

        assertSnapshot(
            of: view,
            as: .image
        )
    }
}

// MARK: - Helpers
private extension DeterminateStepperTests {
    func makeTemplateWithStepperState(currentStep: Int = 0, numberOfSteps: Int = 3) -> DeterminateStepperView {
        let stepperView = DeterminateStepperView(frame: CGRect(origin: .zero, size: CGSize(width: 600, height: 24)))
        stepperView.numberOfSteps = numberOfSteps
        stepperView.currentStep = currentStep
        return stepperView
    }
}
