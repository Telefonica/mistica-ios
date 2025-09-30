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

@MainActor
final class CheckboxTests: XCTestCase {
    override func invokeTest() {
        withSnapshotTesting(record: .never) {
            super.invokeTest()
        }
    }

    func testUnselectedCheckbox() {
        let checkbox = Checkbox(isSelected: .constant(false))

        assertSnapshot(
            of: checkbox,
            as: .image
        )
    }
}
