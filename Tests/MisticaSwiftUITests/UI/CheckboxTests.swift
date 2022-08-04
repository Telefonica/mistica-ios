//
//  CheckboxTests.swift
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
