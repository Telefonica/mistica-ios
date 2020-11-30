//
//  CheckBoxTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

import Mistica
import SnapshotTesting
import XCTest

final class CheckBoxTests: XCTestCase {
    override class func setUp() {
        super.setUp()

        isRecording = false
    }

    // MARK: - Styles

    func testCheckboxDefaultState() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeTemplateWithCheckBoxState(isChecked: false)
        )
    }

    func testCheckboxActiveCheckedState() {
        assertSnapshotForAllBrands(
            as: .image,
            viewBuilder: makeTemplateWithCheckBoxState(isChecked: true)
        )
    }

    // MARK: Behaviour

    func testCheckboxIsChecked() {
        MisticaConfig.brandStyle = .o2

        let checkBox = CheckBox()
        checkBox.isChecked = false

        assertSnapshot(
            matching: checkBox,
            as: .image(size: checkBox.intrinsicContentSize),
            named: "assertInitialState"
        )

        checkBox.isChecked = true

        assertSnapshot(
            matching: checkBox,
            as: .image(size: checkBox.intrinsicContentSize),
            named: "finalState"
        )
    }

    // MARK: XIB integration

    func testXIBIntegration() {
        MisticaConfig.brandStyle = .vivo

        let view = CheckBoxXIBIntegration.viewFromNib()

        assertSnapshot(
            matching: view,
            as: .image
        )
    }
}

// MARK: - Helpers

private func makeTemplateWithCheckBoxState(isChecked: Bool) -> UIView {
    let checkBox = CheckBox(frame: CGRect(origin: .zero, size: CGSize(width: 24, height: 24)))
    checkBox.isChecked = isChecked

    let containerView = UIView(frame: CGRect(origin: .zero, size: checkBox.intrinsicContentSize))
    containerView.backgroundColor = .white
    containerView.addSubview(checkBox)

    return containerView
}
