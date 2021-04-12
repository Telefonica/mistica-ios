//
//  UICatalogRadioButtonViewController.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Mistica
import UIKit

private enum Section: Int, CaseIterable {
    case activated
    case disabld
}

class UICatalogRadioButtonViewController: UITableViewController {
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
        title = "RadioButton"

        tableView.dataSource = self
        tableView.delegate = self
        tableView.keyboardDismissMode = .interactive
    }
}

extension UICatalogRadioButtonViewController {
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
        let activatedRadioButton = RadioButton()

        if indexPath.section == 0 {
            activatedRadioButton.isActivated = true
        } else {
            activatedRadioButton.isActivated = false
        }

        return CellView(radioButton: activatedRadioButton, reuseIdentifier: "Activated")
    }
}

private class CellView: UITableViewCell {
    public init(radioButton: RadioButton, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)

        selectionStyle = .none

        radioButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(radioButton, constraints: [
            radioButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            radioButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            radioButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            radioButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
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
        case .disabld:
            return "Disabled"
        }
    }
}
