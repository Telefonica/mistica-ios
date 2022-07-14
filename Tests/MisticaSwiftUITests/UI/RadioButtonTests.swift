@testable import Mistica
import SnapshotTesting
import SwiftUI
import XCTest

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
