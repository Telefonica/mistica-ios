//
//  SheetTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

@testable import Mistica
import SnapshotTesting
import XCTest

final class SheetTests: XCTestCase {
	override func setUp() {
		super.setUp()
		UIView.setAnimationsEnabled(false)

		isRecording = true
	}

	func testEmptyContent() {
		let sheetVC = SheetViewController(configuration: .init(header: .init(
			title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
			subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
			description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
			content: []), completionHandler: nil)

		assertSnapshot(
			matching: sheetVC,
			as: .image
		)
	}

	func testEmptyHeader() {
		var rows: [SheetListRow] = []
		for index in 1 ... 10 {
			let item = SheetListRow(
				id: index.description,
				title: "Element \(index)",
				description: "Description",
				icon: nil
			)
			rows.append(item)
		}
		let content = SheetList(
			id: UUID().uuidString,
			type: "LIST",
			listType: "SINGLE_SELECTION",
			autoSubmit: true,
			selectedId: "1",
			items: rows
		)

		let sheetVC = SheetViewController(configuration: .init(header: .init(title: nil, subtitle: nil, description: nil), content: [content]), completionHandler: nil)
		sheetVC.view.backgroundColor = .background

		assertSnapshot(
			matching: sheetVC,
			as: .image
		)
	}

	func testContentWithoutIcons() {
		var rows: [SheetListRow] = []
		for index in 1 ... 10 {
			let item = SheetListRow(
				id: index.description,
				title: "Element \(index)",
				description: "Description",
				icon: nil
			)
			rows.append(item)
		}
		let content = SheetList(
			id: UUID().uuidString,
			type: "LIST",
			listType: "SINGLE_SELECTION",
			autoSubmit: true,
			selectedId: "1",
			items: rows
		)

		let sheetVC = SheetViewController(configuration: .init(header: .init(
			title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
			subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
			description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
			content: [content]), completionHandler: nil)

		assertSnapshot(
			matching: sheetVC,
			as: .image
		)
	}

	func testContentWithoutIconsAndDescriptions() {
		var rows: [SheetListRow] = []
		for index in 1 ... 10 {
			let item = SheetListRow(
				id: index.description,
				title: "Element \(index)",
				description: nil,
				icon: nil
			)
			rows.append(item)
		}
		let content = SheetList(
			id: UUID().uuidString,
			type: "LIST",
			listType: "SINGLE_SELECTION",
			autoSubmit: true,
			selectedId: "1",
			items: rows
		)

		let sheetVC = SheetViewController(configuration: .init(header: .init(
			title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
			subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
			description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
			content: [content]), completionHandler: nil)

		assertSnapshot(
			matching: sheetVC,
			as: .image
		)
	}

	func testContentWithIcons() {
		var rows: [SheetListRow] = []
		for index in 1 ... 5 {
			let item = SheetListRow(
				id: index.description,
				title: "Element \(index)",
				description: "Description",
				icon: .init(url: "https://img.icons8.com/ios-glyphs/344/bookmark.png")
			)
			rows.append(item)
		}
		let content = SheetList(
			id: UUID().uuidString,
			type: "LIST",
			listType: "SINGLE_SELECTION",
			autoSubmit: true,
			selectedId: "1",
			items: rows
		)

		let sheetVC = SheetViewController(configuration: .init(header: .init(
			title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
			subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
			description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
			content: [content]), completionHandler: nil)

		assertSnapshot(
			matching: sheetVC,
			as: .image
		)
	}

	func testContentWithIconsAndWithoutDescriptions() {
		var rows: [SheetListRow] = []
		for index in 1 ... 5 {
			let item = SheetListRow(
				id: index.description,
				title: "Element \(index)",
				description: nil,
				icon: .init(url: "https://img.icons8.com/ios-glyphs/344/bookmark.png")
			)
			rows.append(item)
		}
		let content = SheetList(
			id: UUID().uuidString,
			type: "LIST",
			listType: "SINGLE_SELECTION",
			autoSubmit: true,
			selectedId: "1",
			items: rows
		)

		let sheetVC = SheetViewController(configuration: .init(header: .init(
			title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
			subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
			description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
			content: [content]), completionHandler: nil)

		assertSnapshot(
			matching: sheetVC,
			as: .image
		)
	}

	func testNoSubtitleAndDescription() {
		var rows: [SheetListRow] = []
		for index in 1 ... 10 {
			let item = SheetListRow(
				id: index.description,
				title: "Element \(index)",
				description: "Description",
				icon: nil
			)
			rows.append(item)
		}
		let content = SheetList(
			id: UUID().uuidString,
			type: "LIST",
			listType: "SINGLE_SELECTION",
			autoSubmit: true,
			selectedId: "1",
			items: rows
		)

		let sheetVC = SheetViewController(configuration: .init(header: .init(
			title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
			content: [content]), completionHandler: nil)

		assertSnapshot(
			matching: sheetVC,
			as: .image
		)
	}

	func testNoDescription() {
		var rows: [SheetListRow] = []
		for index in 1 ... 10 {
			let item = SheetListRow(
				id: index.description,
				title: "Element \(index)",
				description: "Description",
				icon: nil
			)
			rows.append(item)
		}
		let content = SheetList(
			id: UUID().uuidString,
			type: "LIST",
			listType: "SINGLE_SELECTION",
			autoSubmit: true,
			selectedId: "1",
			items: rows
		)

		let sheetVC = SheetViewController(configuration: .init(header: .init(
			title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
			subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
			content: [content]), completionHandler: nil)

		assertSnapshot(
			matching: sheetVC,
			as: .image
		)
	}
}
