//
//  TagTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

@testable import MisticaSwiftUI
import SnapshotTesting
import SwiftUI
import XCTest

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
