//
//  UICatalogSectionTitleViewController.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Mistica
import UIKit

private enum Constants {
    struct Style {
        let titleStyle: TitleView.Style
        let title: String
        let linkTitle: String?
    }

    static let listCellReusableIdentifier = "listCellReusableIdentifier"
    static let sectionTitleReusableIdentifier = "sectionTitleReusableIdentifier"

    static var styles: [Style] {
        [
            Style(titleStyle: .title1, title: "Title1 with link", linkTitle: "Text link"),
            Style(titleStyle: .title1, title: "Title1 with no link", linkTitle: nil),
            Style(titleStyle: .title1, title: "Title1 with link and some large title using 2 lines", linkTitle: "Text link"),
            Style(titleStyle: .title1, title: "Title1 with no link and some large title using 2 lines", linkTitle: nil),
            Style(titleStyle: .title2, title: "Title2 with link", linkTitle: "Text link"),
            Style(titleStyle: .title2, title: "Title2 with no link", linkTitle: nil),
            Style(titleStyle: .title2, title: "Title2 with link and some large title using 2 lines", linkTitle: "Text link"),
            Style(titleStyle: .title2, title: "Title2 with no link and some large title using 2 lines", linkTitle: nil)
        ]
    }
}

class UICatalogSectionTitleViewController: UITableViewController {
    init() {
        super.init(style: .grouped)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Title"
        tableView.separatorStyle = .none
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.sectionFooterHeight = 0.0

        tableView.register(ListViewCell.self, forCellReuseIdentifier: Constants.listCellReusableIdentifier)
        tableView.register(TitleView.self, forHeaderFooterViewReuseIdentifier: Constants.sectionTitleReusableIdentifier)
    }

    override func numberOfSections(in _: UITableView) -> Int {
        Constants.styles.count
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.listCellReusableIdentifier, for: indexPath) as! ListViewCell

        cell.title = "Lorem ipsum dolor sit amet"
        cell.isCellSeparatorHidden = indexPath.section == 2 && indexPath.row == 1

        return cell
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: Constants.sectionTitleReusableIdentifier) as! TitleView
        let style = Constants.styles[section]
        headerView.title = style.title
        headerView.style = style.titleStyle
        headerView.linkTitle = style.linkTitle
        return headerView
    }
}
