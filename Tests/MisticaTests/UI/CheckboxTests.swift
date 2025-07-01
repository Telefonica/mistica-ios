//
//  CheckboxTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

@testable import Mistica
import SnapshotTesting
import XCTest

@MainActor
final class CheckboxTests: XCTestCase {
    override func invokeTest() {
        withSnapshotTesting(record: .never) {
            super.invokeTest()
        }
    }

    // MARK: - Styles

    func testCheckboxDefaultState() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image,
            viewBuilder: makeTemplateWithCheckboxState(isChecked: false)
        )
    }

    func testCheckboxActiveCheckedState() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image,
            viewBuilder: makeTemplateWithCheckboxState(isChecked: true)
        )
    }

    // MARK: Behaviour

    func testCheckboxIsChecked() {
        MisticaConfig.brandStyle = .o2New

        let checkbox = Checkbox()
        checkbox.isChecked = false

        assertSnapshot(
            of: checkbox,
            as: .image(size: checkbox.intrinsicContentSize),
            named: "assertInitialState"
        )

        checkbox.isChecked = true

        assertSnapshot(
            of: checkbox,
            as: .image(size: checkbox.intrinsicContentSize),
            named: "finalState"
        )
    }

    // MARK: XIB integration

    func testXIBIntegration() {
        MisticaConfig.brandStyle = .vivo

        let view = CheckboxXIBIntegration.viewFromNib()

        assertSnapshot(
            of: view,
            as: .image
        )
    }
}

// MARK: - Helpers

private extension CheckboxTests {
    func makeTemplateWithCheckboxState(isChecked: Bool) -> UIView {
        let checkbox = Checkbox(frame: CGRect(origin: .zero, size: CGSize(width: 18, height: 18)))
        checkbox.isChecked = isChecked

        let containerView = UIView(frame: CGRect(origin: .zero, size: checkbox.intrinsicContentSize))
        containerView.backgroundColor = .white
        containerView.addSubview(checkbox)

        return containerView
    }
}
