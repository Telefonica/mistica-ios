//
//  UICatalogCroutonViewController.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Mistica
import UIKit

private enum Section: Int, CaseIterable {
    case title
    case action
    case show
    case showInTab
}

class UICatalogCroutonViewController: UITableViewController {
    private lazy var titleCell: UITextFieldTableViewCell = {
        let cell = UITextFieldTableViewCell(reuseIdentifier: "title")
        cell.textField.text = "You have no Internet connection. Please insert your SIM card to fix it."
        return cell
    }()

    private lazy var actionTitleCell: UITextFieldTableViewCell = {
        let cell = UITextFieldTableViewCell(reuseIdentifier: "action-title")
        cell.textField.placeholder = "Optional"
        return cell
    }()

    private lazy var croutonStyleCell: UISegmentedControlTableViewCell = {
        let cell = UISegmentedControlTableViewCell(reuseIdentifier: "crouton-style")
        for style in CroutonStyle.allCases {
            cell.segmentedControl.insertSegment(withTitle: style.title, at: style.rawValue, animated: false)
        }
        cell.segmentedControl.selectedSegmentIndex = 0
        return cell
    }()

    private lazy var showCroutonCell: UITableViewCell = {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "showCrouton")
        cell.textLabel?.textColor = .textLink
        cell.textLabel?.text = "Show Crouton"
        return cell
    }()

    private lazy var cells = [
        [titleCell],
        [actionTitleCell],
        [croutonStyleCell, showCroutonCell]
    ]

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

        tableView.dataSource = self
        tableView.delegate = self
        tableView.keyboardDismissMode = .interactive
    }
}

extension UICatalogCroutonViewController {
    override func numberOfSections(in _: UITableView) -> Int {
        cells.count
    }

    override func tableView(_: UITableView, titleForHeaderInSection section: Int) -> String? {
        Section(rawValue: section)!.headerTitle
    }

    override func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        cells[section].count
    }

    override func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cells[indexPath.section][indexPath.row]
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.section == cells.indices.last!, indexPath.row != 0 else { return }
        tableView.deselectRow(animated: true)
        view.endEditing(true)

        if indexPath.row == 1 {
            CroutonController.shared.showCrouton(
                withText: titleCell.textField.text ?? "",
                action: croutonAction,
                style: selectedCroutonStyle
            )
        } else {
            let sampleTabBarViewController = SampleTabBarViewController()
            sampleTabBarViewController.text = titleCell.textField.text ?? ""
            sampleTabBarViewController.action = croutonAction
            sampleTabBarViewController.style = selectedCroutonStyle

            show(sampleTabBarViewController, sender: self)
        }
    }
}

private extension UICatalogCroutonViewController {
    var selectedCroutonStyle: CroutonStyle {
        let selectedStyleIndex = croutonStyleCell.segmentedControl.selectedSegmentIndex
        return CroutonStyle(rawValue: selectedStyleIndex)!
    }

    private var croutonAction: CroutonController.ActionConfig? {
        guard let title = actionTitleCell.textField.text, !title.isEmpty else { return nil }
        return CroutonController.ActionConfig(text: title, handler: { print("Crouton Action Tapped") })
    }
}

private extension CroutonStyle {
    var title: String {
        switch self {
        case .critical:
            return "Critical"
        case .info:
            return "Default"
        }
    }
}

private extension Section {
    var headerTitle: String? {
        switch self {
        case .title: return "Title"
        case .action: return "Action Title"
        case .show, .showInTab: return nil
        }
    }
}

private class SampleTabViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .background
    }
}

private class SampleTabBarViewController: UITabBarController {
    var text: String!
    var action: CroutonController.ActionConfig?
    var style: CroutonStyle!

    override func viewDidLoad() {
        super.viewDidLoad()

        let tabOne = SampleTabViewController()
        tabOne.title = "Tab 1"

        let tabTwo = SampleTabViewController()
        tabTwo.title = "Tab 2"

        viewControllers = [tabOne, tabTwo]
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        CroutonController.shared.showCrouton(
            withText: text,
            action: action,
            style: style
        )
    }
}
