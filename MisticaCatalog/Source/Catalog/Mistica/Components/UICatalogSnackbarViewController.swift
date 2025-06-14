//
//  UICatalogSnackbarViewController.swift
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

class UICatalogSnackbarViewController: UITableViewController {
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

    private lazy var snackbarStyleCell: UISegmentedControlTableViewCell = {
        let cell = UISegmentedControlTableViewCell(reuseIdentifier: "snackbar-style")
        for style in SnackbarStyle.allCases {
            cell.segmentedControl.insertSegment(withTitle: style.title, at: style.rawValue, animated: false)
        }
        cell.segmentedControl.selectedSegmentIndex = 0
        return cell
    }()

    private lazy var showSnackbarCell: UITableViewCell = {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "showSnackbar")
        cell.textLabel?.textColor = .textLink
        cell.textLabel?.text = "Show Snackbar"
        return cell
    }()

    private lazy var forceDismissEnabledCell: UISwitchTableViewCell = {
        let cell = UISwitchTableViewCell(reuseIdentifier: "forceDismissEnabled")
        cell.textLabel?.text = "Force Dismiss"
        return cell
    }()

    private lazy var snackbarDismissIntervalCell: UISegmentedControlTableViewCell = {
        let cell = UISegmentedControlTableViewCell(reuseIdentifier: "snackbar-dismiss-interval")
        for interval in SnackbarCatalogDismissInterval.allCases {
            cell.segmentedControl.insertSegment(withTitle: "\(timeIntervalDescription(from: interval)) seconds", at: 0, animated: false)
        }
        cell.segmentedControl.selectedSegmentIndex = 0
        return cell
    }()

    private lazy var cells = [
        [titleCell],
        [actionTitleCell],
        [snackbarStyleCell],
        [
            snackbarDismissIntervalCell,
            forceDismissEnabledCell,
            showSnackbarCell
        ]
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

extension UICatalogSnackbarViewController {
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
        guard indexPath.section == cells.indices.last!, indexPath.row != 0 && indexPath.row != 1 else { return }
        tableView.deselectRow(animated: true)
        view.endEditing(true)

        if indexPath.row == 2 {
            let config = SnackbarConfig(
                title: titleCell.textField.text ?? "",
                dismissInterval: snackbarDismissInterval,
                forceDismiss: forceDismiss
            )
            SnackbarController.shared.showSnackbar(
                config: config,
                style: selectedSnackbarStyle,
                dismissHandler: { reason in
                    print("\(reason.rawValue)")
                }
            )
        } else {
            let sampleTabBarViewController = SampleTabBarViewController()
            sampleTabBarViewController.text = titleCell.textField.text ?? ""
            sampleTabBarViewController.action = snackbarAction
            sampleTabBarViewController.style = selectedSnackbarStyle

            show(sampleTabBarViewController, sender: self)
        }
    }
}

private extension UICatalogSnackbarViewController {
    var selectedSnackbarStyle: SnackbarStyle {
        let selectedStyleIndex = snackbarStyleCell.segmentedControl.selectedSegmentIndex
        return SnackbarStyle(rawValue: selectedStyleIndex)!
    }

    private var snackbarAction: SnackbarController.ActionConfig? {
        guard let title = actionTitleCell.textField.text, !title.isEmpty else { return nil }
        return SnackbarController.ActionConfig(text: title, accessibilityLabel: "Snackbar action", handler: { print("Snacbar Action Tapped") })
    }

    var snackbarDismissInterval: SnackbarDismissInterval {
        let selectedSnackbarDismissIntervalIndex = snackbarDismissIntervalCell.segmentedControl.selectedSegmentIndex
        let catalogDismissInterval = SnackbarCatalogDismissInterval(rawValue: selectedSnackbarDismissIntervalIndex)

        switch catalogDismissInterval {
        case .fiveSeconds:
            return .fiveSeconds
        case .tenSeconds:
            guard let actionTitle = actionTitleCell.textField.text, !actionTitle.isEmpty else {
                return .tenSeconds(SnackbarAction(title: "Action", handler: {}))
            }

            return .tenSeconds(SnackbarAction(title: actionTitle, handler: {}))

        case .infinite:
            guard let action = actionTitleCell.textField.text, !action.isEmpty else {
                return .infinite(nil, autoFocus: false)
            }

            return .infinite(SnackbarAction(title: action, handler: {}), autoFocus: true)
        case .none:
            return .fiveSeconds
        }
    }

    var forceDismiss: Bool {
        forceDismissEnabledCell.isOn
    }
}

private extension SnackbarStyle {
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

extension SnackbarCatalogDismissInterval {
    init?(rawValue: Int) {
        switch rawValue {
        case 0:
            self = .infinite
        case 1:
            self = .tenSeconds
        case 2:
            self = .fiveSeconds
        default:
            return nil
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
    var action: SnackbarController.ActionConfig?
    var style: SnackbarStyle!

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
        var config: SnackbarConfig
        if let action = action {
            config = SnackbarConfig(title: text, dismissInterval: .tenSeconds(SnackbarAction(title: action.text, handler: action.handler)))
        } else {
            config = SnackbarConfig(title: text, dismissInterval: .fiveSeconds)
        }
        SnackbarController.shared.showSnackbar(
            config: config,
            style: style
        )
    }
}

private extension UICatalogSnackbarViewController {
    func timeIntervalDescription(from interval: SnackbarCatalogDismissInterval) -> String {
        switch interval {
        case .fiveSeconds:
            return "5"
        case .tenSeconds:
            return "10"
        case .infinite:
            return "∞"
        }
    }
}
