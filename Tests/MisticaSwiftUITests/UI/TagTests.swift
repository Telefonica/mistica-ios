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

    func testSmallTagContentWitchIcon() {
        assertSnapshot(
            matching: makeTemplateWithAllTags(content: "TAG", icon: true),
            as: .image
        )
    }
}

// MARK: - Helpers

private extension TagTests {
    func makeTemplateWithAllTags(content: String, icon: Bool = false) -> some View {
        VStack {
            ForEach(0 ..< Tag.Style.allCases.count, id: \.self) { index in
                Tag(style: Tag.Style.allCases[index], text: content, icon: icon ? Image(systemName: "star.fill") : nil)
            }
        }
        .frame(minWidth: 100)
    }
}
