@testable import Mistica
import SnapshotTesting
import SwiftUI
import XCTest

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
