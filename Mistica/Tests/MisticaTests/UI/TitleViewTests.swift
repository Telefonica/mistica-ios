//
//  TitleViewTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

@testable import Mistica
import SnapshotTesting
import XCTest

final class TitleViewTests: XCTestCase {
    override func setUp() {
        super.setUp()
        UIView.setAnimationsEnabled(false)

        isRecording = false
    }

    func testTitle1() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(on: .iPhoneSe),
            viewBuilder: makeSectionTitle(title: "Title text", style: .title1)
        )
    }
    
    func testTitle1WithLink() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(on: .iPhoneSe),
            viewBuilder: makeSectionTitle(title: "Title text", linkTitle: "Link text", style: .title1)
        )
    }

    func testTitle1Multiline() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(on: .iPhoneSe),
            viewBuilder: makeSectionTitle(title: "This is a very long test text to check multiline text work fine", style: .title1)
        )
    }
    
    func testTitle1MultilineAndLink() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(on: .iPhoneSe),
            viewBuilder: makeSectionTitle(title: "This is a very long test text to check multiline text work fine", linkTitle: "Link text", style: .title1)
        )
    }
    
    func testTitle2() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(on: .iPhoneSe),
            viewBuilder: makeSectionTitle(title: "Title text", style: .title2)
        )
    }
    
    func testTitle2WithLink() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(on: .iPhoneSe),
            viewBuilder: makeSectionTitle(title: "Title text", linkTitle: "Link text", style: .title2)
        )
    }

    func testTitle2Multiline() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(on: .iPhoneSe),
            viewBuilder: makeSectionTitle(title: "This is a very long test text to check multiline", style: .title2)
        )
    }
    
    func testTitle2MultilineAndLink() {
        assertSnapshotForAllBrandsAndStyles(
            as: .image(on: .iPhoneSe),
            viewBuilder: makeSectionTitle(title: "This is a very long test text to check multiline", linkTitle: "Link text", style: .title2)
        )
    }
}

private extension TitleViewTests {
    func makeSectionTitle(title: String, linkTitle: String? = nil, style: TitleView.Style) -> UIViewController {
        SectionTitleViewController(titleText: title, linkTitleText: linkTitle, style: style)
    }
}

private class SectionTitleViewController: UITableViewController {
    private let titleText: String
    private let linkTitleText: String?
    private let style: TitleView.Style
    
    init(titleText: String, linkTitleText: String?, style: TitleView.Style) {
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

        tableView.register(TitleView.self, forHeaderFooterViewReuseIdentifier: "Header")
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
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "Header") as! TitleView
        headerView.title = titleText
        headerView.style = style
        headerView.linkTitle = linkTitleText
        return headerView
    }
}
