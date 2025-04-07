//
//  TextLinkTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

@testable import Mistica
import SnapshotTesting
import XCTest

final class TextLinkTests: XCTestCase {
    override func setUp() {
        super.setUp()
        UIView.setAnimationsEnabled(false)
        isRecording = false
    }
    
    func testFullTextLinkView() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(size: CGSize(width: 200.0, height: 33.0)),
            viewBuilder: TextLink(fullText: "All text is a link")
        )
    }

    func testSingleWordTextLinkView() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(size: CGSize(width: 200.0, height: 33.0)),
            viewBuilder: TextLink(fullText: "Text 1 link word", linkedWords: ["link"])
        )
    }

    func testMultipleWordTextLinkView() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(size: CGSize(width: 200.0, height: 33.0)),
            viewBuilder: TextLink(fullText: "Text multiple words as link", linkedWords: ["multiple", "link"])
        )
    }

    func testInverseFullTextLinkView() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(size: CGSize(width: 200.0, height: 33.0)),
            viewBuilder: TextLink(fullText: "All text is a link", isInverse: true)
        )
    }

    func testInverseSingleWordTextLinkView() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(size: CGSize(width: 200.0, height: 33.0)),
            viewBuilder: TextLink(fullText: "Text 1 link word", linkedWords: ["link"], isInverse: true)
        )
    }

    func testInverseMultipleWordTextLinkView() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(size: CGSize(width: 200.0, height: 33.0)),
            viewBuilder: TextLink(fullText: "Text multiple words as link", linkedWords: ["multiple", "link"], isInverse: true)
        )
    }
}
