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

@MainActor
final class TagTests: XCTestCase {
    override func invokeTest() {
        withSnapshotTesting(record: .never) {
            super.invokeTest()
        }
    }

    func testLargeTagContent() {
        assertSnapshot(
            of: makeTemplateWithAllTags(content: "Large tag content"),
            as: .image
        )
    }

    func testSmallTagContent() {
        assertSnapshot(
            of: makeTemplateWithAllTags(content: "Tag"),
            as: .image
        )
    }

    func testSmallTagContentWitchIcon() {
        assertSnapshot(
            of: makeTemplateWithAllTags(content: "Tag", icon: true),
            as: .image
        )
    }

    func testInverseTagContentWitchIcon() {
        assertSnapshot(
            of: makeTemplateWithAllTags(content: "Tag", icon: true, isInverse: true),
            as: .image
        )
    }
}

// MARK: - Helpers

private extension TagTests {
    func makeTemplateWithAllTags(content: String, icon: Bool = false, isInverse: Bool = false) -> some View {
        VStack {
            ForEach(0 ..< TagStyle.allCases.count, id: \.self) { index in
                Tag(style: TagStyle.allCases[index], text: content, icon: icon ? Image(systemName: "star.fill") : nil).inverse(isInverse)
            }
        }
        .frame(minWidth: 100)
        .background(isInverse ? Color.navigationBarBackground : nil)
    }
}
