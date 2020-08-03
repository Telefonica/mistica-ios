//
//  UICatalogBadgeViewController.swift
//  AppCoreKit
//
//  Created by Jose Miguel Brocal on 07/02/2020.
//  Copyright © 2020 Tuenti Technologies S.L. All rights reserved.
//

import Mistica
import UIKit

class UICatalogBadgeViewController: UITableViewController {
    private lazy var nonNumericBadgeCell: CellView = {
        CellView(badgeViews: [UIView(), BadgeView(style: .flag), UIView()], reuseIdentifier: "NonNumericBadge")
    }()

    private lazy var numericBadgeCell: CellView = {
        var badges = [BadgeView]()

        for index in 0 ... 10 {
            let badgeView = BadgeView(style: .numeric)
            badgeView.value = index
            badges.append(badgeView)
        }

        return CellView(badgeViews: badges, reuseIdentifier: "NumericBadge")
    }()

    private lazy var cells = [
        nonNumericBadgeCell,
        numericBadgeCell
    ]

    init() {
        if #available(iOS 13.0, *) {
            super.init(style: .insetGrouped)
        } else {
            super.init(style: .grouped)
        }
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Badge"

        tableView.allowsSelection = false
        tableView.delaysContentTouches = false
    }

    override func numberOfSections(in _: UITableView) -> Int {
        2
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        1
    }

    override func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cells[indexPath.section]
    }

    override func tableView(_: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Non-numeric badge"
        } else {
            return "Numeric badge"
        }
    }
}

private class CellView: UITableViewCell {
    private let stackView: UIStackView

    public init(badgeViews: [UIView], reuseIdentifier: String?) {
        stackView = UIStackView(arrangedSubviews: badgeViews)

        super.init(style: .default, reuseIdentifier: reuseIdentifier)

        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing

        setUp()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUp() {
        selectionStyle = .none
        contentView.addSubview(constrainedToLayoutMarginsGuideOf: stackView)
    }
}
