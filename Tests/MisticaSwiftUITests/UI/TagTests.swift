@testable import MisticaSwiftUI
import SnapshotTesting
import SwiftUI
import XCTest

@available(iOS 13.0, *)
final class TagTests: XCTestCase {
    override class func setUp() {
        isRecording = false
    }

    func testLargeTagContent() {
        assertSnapshot(
            matching: makeTemplateWithAllTags(content: "LARGE TAG CONTENT"),
            as: .image
        )
    }

    func testSmallTagContent() {
        assertSnapshot(
            matching: makeTemplateWithAllTags(content: "TAG"),
            as: .image
        )
    }
}

// MARK: - Helpers

@available(iOS 13.0, *)
private extension TagTests {
    func makeTemplateWithAllTags(content: String) -> some View {
        VStack {
            ForEach(0 ..< Tag.Style.allCases.count) { index in
                Tag(style: Tag.Style.allCases[index], text: content)
            }
        }
        .frame(minWidth: 100)
    }
}
