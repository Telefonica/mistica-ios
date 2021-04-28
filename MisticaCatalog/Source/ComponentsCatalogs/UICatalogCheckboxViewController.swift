//
//  UICatalogCheckboxViewController.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Mistica
import UIKit

private enum Section: Int, CaseIterable {
    case activated
    case disabled
}

class UICatalogCheckboxViewController: UITableViewController {
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
        title = "Checkbox"

        tableView.dataSource = self
        tableView.delegate = self
        tableView.keyboardDismissMode = .interactive
    }
}

extension UICatalogCheckboxViewController {
    override func numberOfSections(in _: UITableView) -> Int {
        Section.allCases.count
    }

    override func tableView(_: UITableView, titleForHeaderInSection section: Int) -> String? {
        Section(rawValue: section)!.headerTitle
    }

    override func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    override func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let checkBox = Checkbox()

        if indexPath.section == 0 {
            checkBox.isChecked = true
        } else {
            checkBox.isChecked = false
        }

        return CellView(checkBox: checkBox, reuseIdentifier: "Activated")
    }
}

private class CellView: UITableViewCell {
    public init(checkBox: Checkbox, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)

        selectionStyle = .none

        checkBox.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(checkBox, constraints: [
            checkBox.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            checkBox.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            checkBox.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            checkBox.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension Section {
    var headerTitle: String {
        switch self {
        case .activated:
            return "Activated"
        case .disabled:
            return "Disabled"
        }
    }
}
