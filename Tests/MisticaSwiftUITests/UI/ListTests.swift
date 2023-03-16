//
//  ListTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

@testable import MisticaSwiftUI
import SnapshotTesting
import SwiftUI
import XCTest

final class ListTests: XCTestCase {
    override class func setUp() {
        isRecording = false
    }

    func testFullwidthRowContent() {
        assertSnapshot(
            matching: makeTemplateWithStyle(style: .fullwidth),
            as: .image
        )
    }

    func testBoxedRowContent() {
        assertSnapshot(
            matching: makeTemplateWithStyle(style: .boxed),
            as: .image
        )
    }

    func testLargeTextInBoxedContent() {
        let row = Cell(
            style: .boxed,
            title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
            subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua"
        ).frame(width: 400, height: 200)

        assertSnapshot(
            matching: row,
            as: .image
        )
    }

    func testLargeTextInFullwidthdContent() {
        let row = Cell(
            style: .fullwidth,
            title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
            subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua"
        ).frame(width: 400, height: 200)

        assertSnapshot(
            matching: row,
            as: .image
        )
    }

    func testImageAlignment() {
        let photo = Image(systemName: "photo")

        let rows = VStack(spacing: 0) {
            Cell(
                style: .fullwidth,
                title: "Lorem ipsum dolor",
                assetType: .smallIcon(photo, foregroundColor: .borderHigh)
            )
            Cell(
                style: .fullwidth,
                title: "Lorem ipsum dolor",
                subtitle: "Lorem ipsum dolor",
                assetType: .smallIcon(photo, foregroundColor: .borderHigh)
            )
            Cell(
                style: .fullwidth,
                title: "Lorem ipsum dolor",
                description: "Lorem ipsum dolor",
                assetType: .smallIcon(photo, foregroundColor: .borderHigh)
            )
            Cell(
                style: .fullwidth,
                title: "Lorem ipsum dolor",
                subtitle: "Lorem ipsum dolor",
                description: "Lorem ipsum dolor",
                assetType: .smallIcon(photo, foregroundColor: .borderHigh)
            )
        }
        .frame(width: 250, height: 400)

        assertSnapshot(
            matching: rows,
            as: .image
        )
    }
}

// MARK: - Helpers

private extension ListTests {
    func makeTemplateWithStyle(style: CellStyle) -> some View {
        let photo = Image(systemName: "photo")

        return List {
            Cell(style: style, title: "Title")
            Cell(style: style, title: "Title", subtitle: "Subtitle")
            Cell(style: style, title: "Title", subtitle: "Subtitle", description: "Description")

            Cell(style: style, title: "Title", subtitle: "Subtitle", assetType: .roundImage(photo), presetView: { CellNavigationPreset() })
            Cell(style: style, title: "Title", subtitle: "Subtitle", assetType: .squaredImage(photo, size: .init(width: 80, height: 80)), presetView: { CellNavigationPreset() })
            Cell(style: style, title: "Title", subtitle: "Subtitle", assetType: .largeIcon(photo, foregroundColor: .white, backgroundColor: .brandHigh), presetView: { CellNavigationPreset() })
            Cell(style: style, title: "Title", subtitle: "Subtitle", assetType: .smallIcon(photo, foregroundColor: .borderHigh), presetView: { CellNavigationPreset() })

            Cell(style: style, title: "Title", subtitle: "Subtitle", presetView: { Toggle("", isOn: .constant(false)) })

            Cell(style: style, title: "Title", subtitle: "Subtitle", headlineView: { Tag(style: .promo, text: "TAG") })
        }
        .misticaListStyle()
        .frame(width: 400, height: style == .fullwidth ? 800 : 950)
    }
}
