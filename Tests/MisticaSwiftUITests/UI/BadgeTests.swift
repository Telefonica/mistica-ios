//
//  BadgeTests.swift
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
final class BadgeTests: XCTestCase {
    override func invokeTest() {
        withSnapshotTesting(record: .never) {
            super.invokeTest()
        }
    }

    func testNumericBadgeContent() {
        assertSnapshot(
            of: makeTemplateWithNumericBadge(),
            as: .image
        )
    }

    func testFlagBadgeContent() {
        assertSnapshot(
            of: makeTemplateWithFlagBadge(),
            as: .image
        )
    }
}

// MARK: - Helpers

private extension BadgeTests {
    func makeTemplateWithNumericBadge() -> some View {
        HStack {
            ForEach(0 ..< 11) {
                Badge(style: .numeric($0))
            }
        }
    }

    func makeTemplateWithFlagBadge() -> some View {
        HStack {
            ForEach(0 ..< 11) { _ in
                Badge(style: .flag)
            }
        }
    }
}
