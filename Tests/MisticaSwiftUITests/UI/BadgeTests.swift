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

@available(iOS 13.0, *)
final class BadgeTests: XCTestCase {
    override class func setUp() {
        isRecording = false
    }

    func testNumericBadgeContent() {
        assertSnapshot(
            matching: makeTemplateWithNumericBadge(),
            as: .image
        )
    }

    func testFlagBadgeContent() {
        assertSnapshot(
            matching: makeTemplateWithFlagBadge(),
            as: .image
        )
    }
}

// MARK: - Helpers

@available(iOS 13.0, *)
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
