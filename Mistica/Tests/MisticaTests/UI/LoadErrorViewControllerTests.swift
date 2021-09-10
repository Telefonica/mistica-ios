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

final class LoadErrorViewControllerTests: XCTestCase {
    override func setUp() {
        super.setUp()

        isRecording = false
    }
}

extension LoadErrorViewControllerTests {
    func testStyles() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image,
            viewBuilder: makeLoadErrorViewController()
        )
    }

    func testNoTitle() {
        assertSnapshot(
            matching: makeLoadErrorViewController(title: nil),
            as: .image
        )
    }

    func testNoAction() {
        assertSnapshot(
            matching: makeLoadErrorViewController(showActionButton: false),
            as: .image
        )
    }

    func testEmptyDescriptionAction() {
        assertSnapshot(
            matching: makeLoadErrorViewController(descriptionText: ""),
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
