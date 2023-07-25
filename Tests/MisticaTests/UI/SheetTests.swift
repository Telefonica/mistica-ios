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

    // MARK: SVG compatibility

    func testSVGUrl() {
        let view = sheetView(
            title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            description: "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            content: makeActionContent(url: Constants.svgUrl, urlDark: Constants.svgUrlDark)
        )

        assertSnapshot(
            matching: view,
            as: .image
        )

        view.overrideUserInterfaceStyle = .dark
        assertSnapshot(
            matching: view,
            as: .image
        )
    }

    func testSVGDataUri() {
        let view = sheetView(
            title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            description: "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            content: makeActionContent(url: Constants.svgUri, urlDark: Constants.svgUriDark)
        )

        assertSnapshot(
            matching: view,
            as: .image
        )

        view.overrideUserInterfaceStyle = .dark
        assertSnapshot(
            matching: view,
            as: .image
        )
    }
}

// MARK: Utils

private extension SheetTests {
    enum Constants {
        static let svgUrl = "https://www.svgrepo.com/show/19461/url-link.svg"
        static let svgUrlDark = "https://www.svgrepo.com/show/75701/lock.svg"
        static let svgUri = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB2ZXJzaW9uPSIxLjEiIGlkPSJMYXllcl8xIiB4PSIwcHgiIHk9IjBweCIgdmlld0JveD0iMCAwIDEwMCAxMDAiIGVuYWJsZS1iYWNrZ3JvdW5kPSJuZXcgMCAwIDEwMCAxMDAiIHhtbDpzcGFjZT0icHJlc2VydmUiIGhlaWdodD0iMTAwcHgiIHdpZHRoPSIxMDBweCI+CjxnPgoJPHBhdGggZD0iTTI4LjEsMzYuNmM0LjYsMS45LDEyLjIsMS42LDIwLjksMS4xYzguOS0wLjQsMTktMC45LDI4LjksMC45YzYuMywxLjIsMTEuOSwzLjEsMTYuOCw2Yy0xLjUtMTIuMi03LjktMjMuNy0xOC42LTMxLjMgICBjLTQuOS0wLjItOS45LDAuMy0xNC44LDEuNEM0Ny44LDE3LjksMzYuMiwyNS42LDI4LjEsMzYuNnoiLz4KCTxwYXRoIGQ9Ik03MC4zLDkuOEM1Ny41LDMuNCw0Mi44LDMuNiwzMC41LDkuNWMtMyw2LTguNCwxOS42LTUuMywyNC45YzguNi0xMS43LDIwLjktMTkuOCwzNS4yLTIzLjFDNjMuNywxMC41LDY3LDEwLDcwLjMsOS44eiIvPgoJPHBhdGggZD0iTTE2LjUsNTEuM2MwLjYtMS43LDEuMi0zLjQsMi01LjFjLTMuOC0zLjQtNy41LTctMTEtMTAuOGMtMi4xLDYuMS0yLjgsMTIuNS0yLjMsMTguN0M5LjYsNTEuMSwxMy40LDUwLjIsMTYuNSw1MS4zeiIvPgoJPHBhdGggZD0iTTksMzEuNmMzLjUsMy45LDcuMiw3LjYsMTEuMSwxMS4xYzAuOC0xLjYsMS43LTMuMSwyLjYtNC42YzAuMS0wLjIsMC4zLTAuNCwwLjQtMC42Yy0yLjktMy4zLTMuMS05LjItMC42LTE3LjYgICBjMC44LTIuNywxLjgtNS4zLDIuNy03LjRjLTUuMiwzLjQtOS44LDgtMTMuMywxMy43QzEwLjgsMjcuOSw5LjgsMjkuNyw5LDMxLjZ6Ii8+Cgk8cGF0aCBkPSJNMTUuNCw1NC43Yy0yLjYtMS02LjEsMC43LTkuNywzLjRjMS4yLDYuNiwzLjksMTMsOCwxOC41QzEzLDY5LjMsMTMuNSw2MS44LDE1LjQsNTQuN3oiLz4KCTxwYXRoIGQ9Ik0zOS44LDU3LjZDNTQuMyw2Ni43LDcwLDczLDg2LjUsNzYuNGMwLjYtMC44LDEuMS0xLjYsMS43LTIuNWM0LjgtNy43LDctMTYuMyw2LjgtMjQuOGMtMTMuOC05LjMtMzEuMy04LjQtNDUuOC03LjcgICBjLTkuNSwwLjUtMTcuOCwwLjktMjMuMi0xLjdjLTAuMSwwLjEtMC4yLDAuMy0wLjMsMC40Yy0xLDEuNy0yLDMuNC0yLjksNS4xQzI4LjIsNDkuNywzMy44LDUzLjksMzkuOCw1Ny42eiIvPgoJPHBhdGggZD0iTTI2LjIsODguMmMzLjMsMiw2LjcsMy42LDEwLjIsNC43Yy0zLjUtNi4yLTYuMy0xMi42LTguOC0xOC41Yy0zLjEtNy4yLTUuOC0xMy41LTktMTcuMmMtMS45LDgtMiwxNi40LTAuMywyNC43ICAgQzIwLjYsODQuMiwyMy4yLDg2LjMsMjYuMiw4OC4yeiIvPgoJPHBhdGggZD0iTTMwLjksNzNjMi45LDYuOCw2LjEsMTQuNCwxMC41LDIxLjJjMTUuNiwzLDMyLTIuMyw0Mi42LTE0LjZDNjcuNyw3Niw1Mi4yLDY5LjYsMzcuOSw2MC43QzMyLDU3LDI2LjUsNTMsMjEuMyw0OC42ICAgYy0wLjYsMS41LTEuMiwzLTEuNyw0LjZDMjQuMSw1Ny4xLDI3LjMsNjQuNSwzMC45LDczeiIvPgo8L2c+Cjwvc3ZnPg=="
        static let svgUriDark = "data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz48IS0tIFVwbG9hZGVkIHRvOiBTVkcgUmVwbywgd3d3LnN2Z3JlcG8uY29tLCBHZW5lcmF0b3I6IFNWRyBSZXBvIE1peGVyIFRvb2xzIC0tPgo8c3ZnIHdpZHRoPSI4MDBweCIgaGVpZ2h0PSI4MDBweCIgdmlld0JveD0iMCAwIDI0IDI0IiBmaWxsPSJub25lIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPg0KPHBhdGggZmlsbC1ydWxlPSJldmVub2RkIiBjbGlwLXJ1bGU9ImV2ZW5vZGQiIGQ9Ik03LjUgNy4zNzVDNy41IDYuMzM5NDcgOC4zMzk0NyA1LjUgOS4zNzUgNS41QzEwLjQxMDUgNS41IDExLjI1IDYuMzM5NDcgMTEuMjUgNy4zNzVWMTYuNjI1QzExLjI1IDE4LjQ4OSAxMi43NjEgMjAgMTQuNjI1IDIwQzE2LjQ4OSAyMCAxOCAxOC40ODkgMTggMTYuNjI1VjExLjgxMDdMMTkuMjE5NyAxMy4wMzAzTDIwLjI4MDMgMTEuOTY5N0wxNy4yNSA4LjkzOTM0TDE0LjIxOTcgMTEuOTY5N0wxNS4yODAzIDEzLjAzMDNMMTYuNSAxMS44MTA3VjE2LjYyNUMxNi41IDE3LjY2MDUgMTUuNjYwNSAxOC41IDE0LjYyNSAxOC41QzEzLjU4OTUgMTguNSAxMi43NSAxNy42NjA1IDEyLjc1IDE2LjYyNVY3LjM3NUMxMi43NSA1LjUxMTA0IDExLjIzOSA0IDkuMzc1IDRDNy41MTEwNCA0IDYgNS41MTEwNCA2IDcuMzc1VjkuNUg0VjE1SDkuNVY5LjVINy41VjcuMzc1Wk01LjUgMTFWMTMuNUg4VjExSDUuNVoiIGZpbGw9IiMxRjIzMjgiLz4NCjwvc3ZnPg=="
    }

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
