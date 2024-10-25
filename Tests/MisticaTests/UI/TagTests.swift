//
//  TagTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

@testable import Mistica
import SnapshotTesting
import XCTest

@MainActor
final class TagTests: XCTestCase {
    override func setUp() {
        super.setUp()
        Task { @MainActor in
            UIView.setAnimationsEnabled(false)
        }
    }

    override func invokeTest() {
        withSnapshotTesting(record: .never) {
            super.invokeTest()
        }
    }

    func testPromoTagView() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(size: CGSize(width: 150.0, height: 33.0)),
            viewBuilder: TagView(text: "Promo tag", style: .promo)
        )
    }

    func testActiveTagView() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(size: CGSize(width: 150.0, height: 33.0)),
            viewBuilder: TagView(text: "Active tag", style: .active)
        )
    }

    func testInactiveTagView() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(size: CGSize(width: 150.0, height: 33.0)),
            viewBuilder: TagView(text: "Inactive tag", style: .inactive)
        )
    }

    func testSuccessTagView() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(size: CGSize(width: 150.0, height: 33.0)),
            viewBuilder: TagView(text: "Success tag", style: .success)
        )
    }

    func testWarningTagView() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(size: CGSize(width: 150.0, height: 33.0)),
            viewBuilder: TagView(text: "Warning tag", style: .warning)
        )
    }

    func testErrorTagView() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(size: CGSize(width: 150.0, height: 33.0)),
            viewBuilder: TagView(text: "Error tag", style: .error)
        )
    }

    func testTagViewWithIcon() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(size: CGSize(width: 100.0, height: 33.0)),
            viewBuilder: TagView(text: "Tag with icon", icon: .checkmarkIcon)
        )
    }

    func testTagXibIntegration() {
        MisticaConfig.brandStyle = .movistar

        let view = TagXIBIntegration.viewFromNib()
        view.tagView.text = "Xib integration"

        assertSnapshot(
            of: view,
            as: .image
        )
    }
}
