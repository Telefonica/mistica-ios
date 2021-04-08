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

final class TagTests: XCTestCase {
    override func setUp() {
        super.setUp()
        UIView.setAnimationsEnabled(false)

        isRecording = false
    }

    func testTagView() {
        assertSnapshotForAllBrands(
            as: .image(size: CGSize(width: 100.0, height: 33.0)),
            viewBuilder: makeTag(text: "Tag")
        )
    }

    func testTagXibIntegration() {
        MisticaConfig.brandStyle = .movistar

        let view = TagXIBIntegration.viewFromNib()
        view.tagView.text = "Xib integration"

        assertSnapshot(
            matching: view,
            as: .image
        )
    }
}

private extension TagTests {
    func makeTag(text: String) -> TagView {
        let view = TagView()
        view.text = text
        return view
    }
}
