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

    func testSingleWordTextLinkView() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(size: CGSize(width: 200.0, height: 33.0)),
            viewBuilder: TextLink(fullText: "Text 1 link word", linkedWords: [LinkedWord(word: "link")])
        )
    }

    func testMultipleWordTextLinkView() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(size: CGSize(width: 200.0, height: 33.0)),
            viewBuilder: TextLink(fullText: "Text multiple words as link", linkedWords: [LinkedWord(word: "multiple"), LinkedWord(word: "link")])
        )
    }

    func testInverseSingleWordTextLinkView() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(size: CGSize(width: 200.0, height: 33.0)),
            viewBuilder: TextLink(fullText: "Text 1 link word", linkedWords: [LinkedWord(word: "link")], isInverse: true)
        )
    }

    func testInverseMultipleWordTextLinkView() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(size: CGSize(width: 200.0, height: 33.0)),
            viewBuilder: TextLink(fullText: "Text multiple words as link", linkedWords: [LinkedWord(word: "multiple"), LinkedWord(word: "link")], isInverse: true)
        )
    }

    func testEmptyText() {
        MisticaConfig.brandStyle = .movistar

        assertSnapshot(
            matching: TextLink(fullText: "", linkedWords: [LinkedWord(word: "link")]),
            as: .image(size: CGSize(width: 200.0, height: 33.0))
        )
    }

    func testWithNoLink() {
        MisticaConfig.brandStyle = .movistar

        assertSnapshot(
            matching: TextLink(fullText: "Text with no link", linkedWords: []),
            as: .image(size: CGSize(width: 200.0, height: 33.0))
        )
    }
}
