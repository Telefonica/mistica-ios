//
//  LoadErrorViewControllerTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

@testable import Mistica
import SnapshotTesting
import XCTest

@MainActor
final class LoadErrorViewControllerTests: XCTestCase {
    override func invokeTest() {
        withSnapshotTesting(record: .never) {
            super.invokeTest()
        }
    }
}

extension LoadErrorViewControllerTests {
    func testStyles() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(drawHierarchyInKeyWindow: true),
            viewBuilder: makeLoadErrorViewController()
        )
    }

    func testNoTitle() {
        assertSnapshot(
            of: makeLoadErrorViewController(title: nil),
            as: .image
        )
    }

    func testNoAction() {
        assertSnapshot(
            of: makeLoadErrorViewController(showActionButton: false),
            as: .image
        )
    }

    func testEmptyDescriptionAction() {
        assertSnapshot(
            of: makeLoadErrorViewController(descriptionText: ""),
            as: .image
        )
    }
}

extension LoadErrorViewControllerTests {
    func makeLoadErrorViewController(
        title: String? = "Excepteur sint occaecat cupidatat",
        descriptionText: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        actionButtonTitle: String = "Nostrud",
        showActionButton: Bool = true
    ) -> LoadErrorViewController {
        LoadErrorViewController(
            title: title,
            descriptionText: descriptionText,
            actionButtonTitle: actionButtonTitle,
            showActionButton: showActionButton
        )
    }
}
