//
//  UICatalogFontsViewController.swift
//  AppCoreKit
//
//  Created by Jose Miguel Brocal on 17/01/2020.
//  Copyright © 2020 Tuenti Technologies S.L. All rights reserved.
//

import Mistica
import UIKit

class UICatalogFontsViewController: UITableViewController {
    init() {
        if #available(iOS 13.0, *) {
            super.init(style: .insetGrouped)
        } else {
            super.init(style: .grouped)
        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Fonts"

        tableView.allowsSelection = false
        tableView.delaysContentTouches = false
    }

    override func numberOfSections(in _: UITableView) -> Int {
        FontStyle.allCases.count
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        1
    }

    override func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        configureCell(at: indexPath)
    }

    override func tableView(_: UITableView, titleForHeaderInSection section: Int) -> String? {
        "\(FontStyle.allCases[section])"
    }

    func configureCell(at indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "showTooltip")
        let fontStyle = FontStyle.allCases[indexPath.section]
        let preferredContentSizeCategory = UIScreen.main.traitCollection.preferredContentSizeCategory

        cell.textLabel?.text = "lorem ipsum dolor"
        cell.textLabel?.font = .preferredFont(for: fontStyle, constrainedToPreferredSize: preferredContentSizeCategory)
        cell.textLabel?.numberOfLines = 0

        return cell
    }
}
