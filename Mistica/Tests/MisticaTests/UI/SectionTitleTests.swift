//
//  SectionTitleTests.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

@testable import Mistica
import SnapshotTesting
import XCTest

final class SectionTitleTests: XCTestCase {
    override func setUp() {
        super.setUp()
        UIView.setAnimationsEnabled(false)

        isRecording = false
    }

    func testSectionTitle() {
        assertSnapshotForAllBrands(
            as: .image(on: .iPhoneSe),
            viewBuilder: makeSectionTitle(title: "Section title test")
        )
    }

    func testSectionTitleMultiline() {
        assertSnapshotForAllBrands(
            as: .image(on: .iPhoneSe),
            viewBuilder: makeSectionTitle(title: "This is a very long test text to check multiline text work fine")
        )
    }
}

private extension SectionTitleTests {
    func makeSectionTitle(title: String) -> UIViewController {
        SectionTitleViewControler(sectionTitle: title)
    }
}

private class SectionTitleViewControler: UITableViewController {
    private var sectionTitle: String!

    init(sectionTitle: String) {
        self.sectionTitle = sectionTitle
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

        tableView.register(SectionTitleHeaderView.self, forHeaderFooterViewReuseIdentifier: "Header")
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
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "Header") as! SectionTitleHeaderView
        headerView.title = sectionTitle

        return headerView
    }
}
