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

    // MARK: Common behaviour

    func testEmptyHeader() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(on: .iPhoneSe),
            viewBuilder: sheetView(content: makeSingleSelectionContent())
        )
    }

    func testNoSubtitleAndDescription() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(on: .iPhoneSe),
            viewBuilder: sheetView(
                title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                content: makeSingleSelectionContent()
            )
        )
    }

    func testNoDescription() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(on: .iPhoneSe),
            viewBuilder: sheetView(
                title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                content: makeSingleSelectionContent()
            )
        )
    }

    // MARK: Single selection list type

    func testContentWithoutIcons() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(on: .iPhoneSe),
            viewBuilder: sheetView(
                title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                content: makeSingleSelectionContent()
            )
        )
    }

    func testContentWithoutIconsAndDescriptions() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(on: .iPhoneSe),
            viewBuilder: sheetView(
                title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                content: makeSingleSelectionContent()
            )
        )
    }

    func testContentWithIcons() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(on: .iPhoneSe),
            viewBuilder: sheetView(
                title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                content: makeSingleSelectionContent(iconEnabled: true)
            )
        )
    }

    func testContentWithSmallIcons() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(on: .iPhoneSe),
            viewBuilder: sheetView(
                title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                content: makeSingleSelectionContent(iconEnabled: true, isLargeIcon: false)
            )
        )
    }

    func testContentWithIconsAndWithoutDescriptions() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(on: .iPhoneSe),
            viewBuilder: sheetView(
                title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                content: makeSingleSelectionContent(iconEnabled: true)
            )
        )
    }

    // MARK: Informative list type

    func testInformativeWithoutDescriptionAndBulletIcon() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(on: .iPhoneSe),
            viewBuilder: sheetView(
                title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                description: "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                content: makeInformativeContent(
                    description: nil,
                    icon: .bullet
                )
            )
        )
    }

    func testInformativeWithoutDescriptionAndRegularIcon() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(on: .iPhoneSe),
            viewBuilder: sheetView(
                title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                description: "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                content: makeInformativeContent(
                    description: nil,
                    icon: .regular(url: iconPath, urlDark: iconPath)
                )
            )
        )
    }

    func testInformativeWithDescriptionAndRegularIcon() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(on: .iPhoneSe),
            viewBuilder: sheetView(
                title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                description: "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                content: makeInformativeContent(
                    description: "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                    icon: .regular(url: iconPath, urlDark: iconPath)
                )
            )
        )
    }

    func testInformativeWithoutDescriptionAndSmallIcon() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(on: .iPhoneSe),
            viewBuilder: sheetView(
                title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                description: "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                content: makeInformativeContent(
                    description: nil,
                    icon: .small(url: iconPath, urlDark: iconPath)
                )
            )
        )
    }

    func testInformativeWithDescriptionAndSmallIcon() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(on: .iPhoneSe),
            viewBuilder: sheetView(
                title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                description: "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                content: makeInformativeContent(
                    description: "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                    icon: .regular(url: iconPath, urlDark: iconPath)
                )
            )
        )
    }

    // MARK: Action list type

    func testActionWithoutUrls() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(on: .iPhoneSe),
            viewBuilder: sheetView(
                title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                description: "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                content: makeActionContent()
            )
        )
    }

    func testActionWithUrls() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(on: .iPhoneSe),
            viewBuilder: sheetView(
                title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                description: "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                content: makeActionContent(url: iconPath, urlDark: iconPath)
            )
        )
    }
}

// MARK: Utils

private extension SheetTests {
    var iconPath: String {
        guard let url = Bundle.module.url(forResource: "circleRed", withExtension: "png") else {
            fatalError("Asset named circleRed not found")
        }

        return url.absoluteString
    }

    func makeSingleSelectionContent(iconEnabled: Bool = false, isLargeIcon: Bool = true) -> [SheetList] {
        var rows: [SingleSelectionItem] = []
        for index in 1 ... 10 {
            let item = SingleSelectionItem(
                id: index.description,
                title: "Element \(index)",
                description: "Description",
                icon: iconEnabled ? .init(url: "https://img.icons8.com/ios-glyphs/344/bookmark.png", size: isLargeIcon ? .large : .small) : nil
            )
            rows.append(item)
        }
        let content = SheetList(
            id: UUID().uuidString,
            listType: .singleSelection(items: rows),
            autoSubmit: true,
            selectedId: ["1"]
        )

        return [content]
    }

    func makeInformativeContent(
        description: String? = nil,
        icon: InformativeItemIcon = .bullet
    ) -> [SheetList] {
        var rows: [InformativeItem] = []
        for index in 1 ... 10 {
            let item = InformativeItem(
                id: "\(index)",
                title: "Title \(index)",
                description: description,
                icon: icon
            )
            rows.append(item)
        }
        let content = SheetList(
            id: UUID().uuidString,
            listType: .informative(items: rows),
            autoSubmit: true,
            selectedId: []
        )

        return [content]
    }

    func makeActionContent(
        url: String? = nil,
        urlDark: String? = nil
    ) -> [SheetList] {
        var rows: [ActionItem] = []
        for index in 1 ... 10 {
            let style = index == 5 ? ActionItem.Style.destructive : ActionItem.Style.normal

            let item = ActionItem(
                id: "\(index)",
                title: "Title \(index)",
                style: style,
                url: url,
                urlDark: urlDark
            )
            rows.append(item)
        }
        let content = SheetList(
            id: UUID().uuidString,
            listType: .actions(items: rows),
            autoSubmit: true,
            selectedId: []
        )

        return [content]
    }

    func sheetView(
        title: String? = nil,
        subtitle: String? = nil,
        description: String? = nil,
        content: [SheetList]
    ) -> SheetViewController {
        let configuration = SheetConfiguration(
            header: .init(
                title: title,
                subtitle: subtitle,
                description: description
            ),
            content: content
        )
        let sheetVC = SheetViewController(configuration: configuration, completionHandler: nil)
        sheetVC.view.frame = CGRect(x: 0, y: 0, width: 300, height: 600)
        return sheetVC
    }
}
