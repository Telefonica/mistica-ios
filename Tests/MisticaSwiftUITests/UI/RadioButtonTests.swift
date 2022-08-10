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

@available(iOS 13.0, *)
final class RadioButtonTests: XCTestCase {
    override class func setUp() {
        isRecording = false
    }

    func testSelectedRadioButton() {
        let radioButton = RadioButton(isSelected: .constant(true))

        assertSnapshot(
            matching: radioButton,
            as: .image
        )
    }

    func testNonSelectedRadioButton() {
        let radioButton = RadioButton(isSelected: .constant(false))

        assertSnapshot(
            matching: radioButton,
            as: .image
        )
    }
}
