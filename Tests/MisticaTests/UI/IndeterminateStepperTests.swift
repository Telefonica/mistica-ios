//
//  IndeterminateStepperTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

@testable import Mistica
import SnapshotTesting
import XCTest

@MainActor
final class IndeterminateStepperTests: XCTestCase {
    override func invokeTest() {
        withSnapshotTesting(record: .never) {
            super.invokeTest()
        }
    }

    // MARK: - Styles

    func testIndeterminateStepperDefaultState() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image,
            viewBuilder: makeTemplateWithStepperState(value: 50)
        )
    }

    // MARK: Behaviour

    func testIndeterminateStepperCurrentStepChanges() {
        MisticaConfig.brandStyle = .movistar

        let stepper = makeTemplateWithStepperState(value: 0)

        assertSnapshot(
            of: stepper,
            as: .image,
            named: "assertInitialState"
        )

        stepper.value = 50

        assertSnapshot(
            of: stepper,
            as: .image,
            named: "finalState"
        )
    }

    // MARK: XIB integration

    func testIndeterminateStepperXIBIntegration() {
        MisticaConfig.brandStyle = .vivo

        let view = IndeterminateStepperXIBIntegration.viewFromNib()

        assertSnapshot(
            of: view,
            as: .image
        )
    }
}

// MARK: - Helpers

private extension IndeterminateStepperTests {
    func makeTemplateWithStepperState(value: Int = 0) -> IndeterminateStepperView {
        let stepperView = IndeterminateStepperView(frame: CGRect(origin: .zero, size: CGSize(width: 600, height: 24)))
        stepperView.value = value
        return stepperView
    }
}
