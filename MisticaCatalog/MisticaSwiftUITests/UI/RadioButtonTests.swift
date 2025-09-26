//
//  RadioButtonTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

@testable import MisticaSwiftUI
import SnapshotTesting
import SwiftUI
import XCTest

@MainActor
final class RadioButtonTests: XCTestCase {
    override func invokeTest() {
        withSnapshotTesting(record: .never) {
            super.invokeTest()
        }
    }

    func testSelectedRadioButton() {
        let radioButton = RadioButton(isSelected: .constant(true))

        assertSnapshot(
            of: radioButton,
            as: .image
        )
    }

    func testNonSelectedRadioButton() {
        let radioButton = RadioButton(isSelected: .constant(false))

        assertSnapshot(
            of: radioButton,
            as: .image
        )
    }
}
