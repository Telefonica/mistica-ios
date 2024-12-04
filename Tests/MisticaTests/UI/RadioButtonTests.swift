//
//  RadioButtonTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Mistica
import SnapshotTesting
import XCTest

@MainActor
final class RadioButtonTests: XCTestCase {
    private let buttonSize = CGSize(width: 30.0, height: 30.0)

    override func invokeTest() {
        withSnapshotTesting(record: .never) {
            super.invokeTest()
        }
    }

    func testRadioButtonEnabled() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(size: buttonSize),
            viewBuilder: makeRadioButtonTemplate(active: true)
        )
    }

    func testRadioButtonDisabled() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(size: buttonSize),
            viewBuilder: makeRadioButtonTemplate(active: false)
        )
    }
}

private extension RadioButtonTests {
    func makeRadioButtonTemplate(active: Bool) -> UIView {
        let radioButton = RadioButton()
        radioButton.isActivated = active
        return radioButton
    }
}
