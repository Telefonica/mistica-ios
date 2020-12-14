//
//  CheckboxTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

import Mistica
import SnapshotTesting
import XCTest

final class CheckboxTests: XCTestCase {
    override class func setUp() {
        super.setUp()

        isRecording = false
    }

    // MARK: - Styles

    func testCheckboxDefaultState() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeTemplateWithCheckboxState(isChecked: false)
        )
    }

    func testCheckboxActiveCheckedState() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeTemplateWithCheckboxState(isChecked: true)
        )
    }

    // MARK: Behaviour

    func testCheckboxIsChecked() {
        MisticaConfig.brandStyle = .o2

        let checkbox = Checkbox()
        checkbox.isChecked = false

        assertSnapshot(
            matching: checkbox,
            as: .image(size: checkbox.intrinsicContentSize),
            named: "assertInitialState"
        )

        checkbox.isChecked = true

        assertSnapshot(
            matching: checkbox,
            as: .image(size: checkbox.intrinsicContentSize),
            named: "finalState"
        )
    }

    // MARK: XIB integration

    func testXIBIntegration() {
        MisticaConfig.brandStyle = .vivo

        let view = CheckboxXIBIntegration.viewFromNib()

        assertSnapshot(
            matching: view,
            as: .image
        )
    }
}

// MARK: - Helpers

private func makeTemplateWithCheckboxState(isChecked: Bool) -> UIView {
    let checkbox = Checkbox(frame: CGRect(origin: .zero, size: CGSize(width: 24, height: 24)))
    checkbox.isChecked = isChecked

    let containerView = UIView(frame: CGRect(origin: .zero, size: checkbox.intrinsicContentSize))
    containerView.backgroundColor = .white
    containerView.addSubview(checkbox)

    return containerView
}
