//
//  HeaderTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import MisticaSwiftUI
import SnapshotTesting
import SwiftUI
import XCTest

@MainActor
final class HeaderTests: XCTestCase {
    override func invokeTest() {
        withSnapshotTesting(record: .never) {
            super.invokeTest()
        }
    }
}

// MARK: - Minimal header

extension HeaderTests {
    func testMinimalPretitleHeader() {
        let header = Header(
            pretitle: HeaderText(text: "The pretitle"),
            style: .normal
        )

        assertSnapshot(
            of: UIHostingController(rootView: header),
            as: .image(on: .iPhone8)
        )
    }

    func testMinimalPretitleHeaderWithInverseStyle() {
        let header = Header(
            pretitle: HeaderText(text: "The pretitle"),
            style: .inverse
        )

        assertSnapshot(
            of: UIHostingController(rootView: header),
            as: .image(on: .iPhone8)
        )
    }

    func testMinimalTitleHeader() {
        let header = Header(
            title: HeaderText(text: "The title"),
            style: .normal
        )

        assertSnapshot(
            of: UIHostingController(rootView: header),
            as: .image(on: .iPhone8)
        )
    }

    func testMinimalTitleHeaderWithInverseStyle() {
        let header = Header(
            title: HeaderText(text: "The title"),
            style: .inverse
        )

        assertSnapshot(
            of: UIHostingController(rootView: header),
            as: .image(on: .iPhone8)
        )
    }

    func testMinimalDescriptionHeader() {
        let header = Header(
            description: HeaderText(text: "The description"),
            style: .normal
        )

        assertSnapshot(
            of: UIHostingController(rootView: header),
            as: .image(on: .iPhone8)
        )
    }

    func testMinimalDescriptionHeaderWithInverseStyle() {
        let header = Header(
            description: HeaderText(text: "The description"),
            style: .inverse
        )

        assertSnapshot(
            of: UIHostingController(rootView: header),
            as: .image(on: .iPhone8)
        )
    }
}

extension HeaderTests {
    func testFullHeader() {
        let header = Header(
            pretitle: HeaderText(text: "The pretitle"),
            title: HeaderText(text: "The title"),
            description: HeaderText(text: "The description"),
            style: .normal
        )

        assertSnapshot(
            of: UIHostingController(rootView: header),
            as: .image(on: .iPhone8)
        )
    }

    func testFullHeaderAndSmallStyle() {
        let header = Header(
            pretitle: HeaderText(text: "The pretitle"),
            title: HeaderText(text: "The title"),
            description: HeaderText(text: "The description"),
            style: .normalSmall
        )

        assertSnapshot(
            of: UIHostingController(rootView: header),
            as: .image(on: .iPhone8)
        )
    }

    func testFullHeaderWithInverseStyle() {
        let header = Header(
            pretitle: HeaderText(text: "The pretitle"),
            title: HeaderText(text: "The title"),
            description: HeaderText(text: "The description"),
            style: .inverse
        )

        assertSnapshot(
            of: UIHostingController(rootView: header),
            as: .image(on: .iPhone8)
        )
    }

    func testFullHeaderWithInverseAndSmallStyle() {
        let header = Header(
            pretitle: HeaderText(text: "The pretitle"),
            title: HeaderText(text: "The title"),
            description: HeaderText(text: "The description"),
            style: .inverseSmall
        )

        assertSnapshot(
            of: UIHostingController(rootView: header),
            as: .image(on: .iPhone8)
        )
    }
}

// MARK: - Long Texts

extension HeaderTests {
    func testFullHeaderWithLongTexts() {
        let header = Header(
            pretitle: HeaderText(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"),
            title: HeaderText(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"),
            description: HeaderText(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"),
            style: .normal
        )

        assertSnapshot(
            of: UIHostingController(rootView: header),
            as: .image(on: .iPhone8)
        )
    }

    func testFullHeaderWithLongTextsAndInverseStyle() {
        let header = Header(
            pretitle: HeaderText(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"),
            title: HeaderText(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"),
            description: HeaderText(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"),
            style: .inverse
        )

        assertSnapshot(
            of: UIHostingController(rootView: header),
            as: .image(on: .iPhone8)
        )
    }

    func testFullHeaderWithLongTextsAndLineLimitToTwo() {
        let header = Header(
            pretitle: HeaderText(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit", lineLimit: 2),
            title: HeaderText(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit", lineLimit: 2),
            description: HeaderText(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit", lineLimit: 2),
            style: .normal
        )

        assertSnapshot(
            of: UIHostingController(rootView: header),
            as: .image(on: .iPhone8)
        )
    }
}
