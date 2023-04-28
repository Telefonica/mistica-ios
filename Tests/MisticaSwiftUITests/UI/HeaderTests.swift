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

final class HeaderTests: XCTestCase {
    override class func setUp() {
        super.setUp()
        UIView.setAnimationsEnabled(false)

        isRecording = false
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
            matching: UIHostingController(rootView: header),
            as: .image(on: .iPhone8)
        )
    }

    func testMinimalPretitleHeaderWithInverseStyle() {
        let header = Header(
            pretitle: HeaderText(text: "The pretitle"),
            style: .inverse
        )

        assertSnapshot(
            matching: UIHostingController(rootView: header),
            as: .image(on: .iPhone8)
        )
    }

    func testMinimalTitleHeader() {
        let header = Header(
            title: HeaderText(text: "The title"),
            style: .normal
        )

        assertSnapshot(
            matching: UIHostingController(rootView: header),
            as: .image(on: .iPhone8)
        )
    }

    func testMinimalTitleHeaderWithInverseStyle() {
        let header = Header(
            title: HeaderText(text: "The title"),
            style: .inverse
        )

        assertSnapshot(
            matching: UIHostingController(rootView: header),
            as: .image(on: .iPhone8)
        )
    }

    func testMinimalDescriptionHeader() {
        let header = Header(
            description: HeaderText(text: "The description"),
            style: .normal
        )

        assertSnapshot(
            matching: UIHostingController(rootView: header),
            as: .image(on: .iPhone8)
        )
    }

    func testMinimalDescriptionHeaderWithInverseStyle() {
        let header = Header(
            description: HeaderText(text: "The description"),
            style: .inverse
        )

        assertSnapshot(
            matching: UIHostingController(rootView: header),
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
            matching: UIHostingController(rootView: header),
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
            matching: UIHostingController(rootView: header),
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
            matching: UIHostingController(rootView: header),
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
            matching: UIHostingController(rootView: header),
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
            matching: UIHostingController(rootView: header),
            as: .image(on: .iPhone8)
        )

    }
}
