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

		isRecording = false
	}

	func testEmptyContent() {
		assertSnapshot(
			matching: sheetView(title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
										  subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
										  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
										  content: []).view,
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

		assertSnapshot(
			matching: sheetView(content: [content]).view,
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

		assertSnapshot(
			matching: sheetView(title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
										  subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
										  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
										  content: [content]),
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

		assertSnapshot(
			matching: sheetView(title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
										  subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
										  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
										  content: [content]).view,
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

		assertSnapshot(
			matching: sheetView(title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
										  subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
										  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
										  content: [content]).view,
			as: .image
		)
	}

	func testContentWithSmallIcons() {
		var rows: [SheetListRow] = []
		for index in 1 ... 5 {
			let item = SheetListRow(
				id: index.description,
				title: "Element \(index)",
				description: "Description",
				icon: .init(url: "https://img.icons8.com/ios-glyphs/344/bookmark.png", size: .small)
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

		assertSnapshot(
			matching: sheetView(title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
										  subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
										  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
										  content: [content]).view,
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

		assertSnapshot(
			matching: sheetView(title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
										  subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
										  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
										  content: [content]).view,
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

		assertSnapshot(
			matching: sheetView(title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
										  content: [content]).view,
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


		assertSnapshot(
			matching: sheetView(title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
										  subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
								content: [content]).view,
			as: .image
		)
	}
}

private extension SheetTests {
	func sheetView(
		title: String? = nil,
		subtitle: String? = nil,
		description: String? = nil,
		content: [SheetList]
	) -> SheetViewController {
		let configuration = SheetConfiguration(header: .init(title: title,
															 subtitle: subtitle,
															 description: description),
											   content: content)
		let sheetVC = SheetViewController(configuration: configuration, completionHandler: nil)
		sheetVC.view.frame = CGRect(x: 0, y: 0, width: 300, height: 600)
		return sheetVC
	}
}
