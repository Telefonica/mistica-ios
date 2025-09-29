//
//  TitleHeaderFooterViewTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

@testable import Mistica
import SnapshotTesting
import XCTest

@MainActor
final class TitleHeaderFooterViewTests: XCTestCase {
    override func setUp() {
        super.setUp()
        Task { @MainActor in
            UIView.setAnimationsEnabled(false)
        }
    }

    override func invokeTest() {
        withSnapshotTesting(record: .never) {
            super.invokeTest()
        }
    }

    func testTitle1() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true),
            viewBuilder: makeSectionTitle(title: "Title text", style: .title1)
        )
    }

    func testTitle1WithLink() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true),
            viewBuilder: makeSectionTitle(title: "Title text", linkTitle: "Link text", style: .title1)
        )
    }

    func testTitle1Multiline() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true),
            viewBuilder: makeSectionTitle(title: "This is a very long test text to check multiline text work fine", style: .title1)
        )
    }

    func testTitle1MultilineAndLink() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true),
            viewBuilder: makeSectionTitle(title: "This is a very long test text to check multiline text work fine", linkTitle: "Link text", style: .title1)
        )
    }

    func testTitle2() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true),
            viewBuilder: makeSectionTitle(title: "Title text", style: .title2)
        )
    }

    func testTitle2WithLink() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true),
            viewBuilder: makeSectionTitle(title: "Title text", linkTitle: "Link text", style: .title2)
        )
    }

    func testTitle2Multiline() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true),
            viewBuilder: makeSectionTitle(title: "This is a very long test text to check multiline", style: .title2)
        )
    }

    func testTitle2MultilineAndLink() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true),
            viewBuilder: makeSectionTitle(title: "This is a very long test text to check multiline", linkTitle: "Link text", style: .title2)
        )
    }

    func testTitle3() {
        assertSnapshot(
            for: [.vivoNew, .movistar],
            and: [.light],
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true),
            viewBuilder: makeSectionTitle(title: "Title text", style: .title3)
        )
    }

    func testTitle3WithLink() {
        assertSnapshot(
            for: [.vivoNew, .movistar],
            and: [.light],
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true),
            viewBuilder: makeSectionTitle(title: "Title text", linkTitle: "Link text", style: .title3)
        )
    }

    func testTitle3Multiline() {
        assertSnapshot(
            for: [.vivoNew, .movistar],
            and: [.light],
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true),
            viewBuilder: makeSectionTitle(title: "This is a very long test text to check multiline", style: .title3)
        )
    }

    func testTitle3MultilineAndLink() {
        assertSnapshot(
            for: [.vivoNew, .movistar],
            and: [.light],
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true),
            viewBuilder: makeSectionTitle(title: "This is a very long test text to check multiline", linkTitle: "Link text", style: .title3)
        )
    }

    func testTitle4() {
        assertSnapshot(
            for: [.vivoNew],
            and: [.light],
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true),
            viewBuilder: makeSectionTitle(title: "Title text", style: .title4)
        )
    }

    func testTitle4WithLink() {
        assertSnapshot(
            for: [.vivoNew],
            and: [.light],
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true),
            viewBuilder: makeSectionTitle(title: "Title text", linkTitle: "Link text", style: .title4)
        )
    }

    func testTitle4Multiline() {
        assertSnapshot(
            for: [.vivoNew],
            and: [.light],
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true),
            viewBuilder: makeSectionTitle(title: "This is a very long test text to check multiline", style: .title4)
        )
    }

    func testTitle4MultilineAndLink() {
        assertSnapshot(
            for: [.vivoNew],
            and: [.light],
            as: .image(on: .iPhoneSe, drawHierarchyInKeyWindow: true),
            viewBuilder: makeSectionTitle(title: "This is a very long test text to check multiline", linkTitle: "Link text", style: .title4)
        )
    }
}

private extension TitleHeaderFooterViewTests {
    func makeSectionTitle(title: String, linkTitle: String? = nil, style: TitleHeaderFooterView.Style) -> UIViewController {
        SectionTitleHeaderFooterViewController(titleText: title, linkTitleText: linkTitle, style: style)
    }
}

private class SectionTitleHeaderFooterViewController: UITableViewController {
    private let titleText: String
    private let linkTitleText: String?
    private let style: TitleHeaderFooterView.Style

    init(titleText: String, linkTitleText: String?, style: TitleHeaderFooterView.Style) {
        self.titleText = titleText
        self.linkTitleText = linkTitleText
        self.style = style
        super.init(style: .grouped)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.separatorStyle = .none
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.sectionFooterHeight = 0.0

        tableView.register(TitleHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "Header")
    }

    override func numberOfSections(in _: UITableView) -> Int {
        1
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "Header") as! TitleHeaderFooterView
        headerView.title = titleText
        headerView.style = style
        headerView.linkTitle = linkTitleText
        return headerView
    }
}
