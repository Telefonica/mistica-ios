@testable import Mistica
import SnapshotTesting
import SwiftUI
import XCTest

final class CheckboxTests: XCTestCase {
    override class func setUp() {
        isRecording = false
    }

    func testUnselectedCheckbox() {
        let checkbox = Checkbox(isSelected: .constant(false))

        assertSnapshot(
            matching: checkbox,
            as: .image
        )
    }
}
