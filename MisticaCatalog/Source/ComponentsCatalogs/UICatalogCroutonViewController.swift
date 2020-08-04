//
//  UICatalogCroutonViewController.swift
//  AppCoreKit
//
//  Created by Pablo Carcelén on 18/11/2019.
//  Copyright © 2019 Tuenti Technologies S.L. All rights reserved.
//

import Mistica
import UIKit

private enum Section: Int, CaseIterable {
    case title
    case action
    case show
}

class UICatalogCroutonViewController: UITableViewController {
    lazy var croutonController = CroutonController.shared

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

    private lazy var cells = [[titleCell], [actionTitleCell], [croutonStyleCell, showCroutonCell]]

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
        title = "Crouton"

        tableView.dataSource = self
        tableView.delegate = self
        tableView.keyboardDismissMode = .interactive
    }
}

extension UICatalogCroutonViewController {
    override func numberOfSections(in _: UITableView) -> Int {
        Section.allCases.count
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
        guard indexPath.section == cells.indices.last!, indexPath.row == cells[indexPath.section].indices.last! else { return }
        tableView.deselectRow(animated: true)
        view.endEditing(true)

        croutonController.showCrouton(withText: titleCell.textField.text ?? "",
                                      action: croutonAction,
                                      style: selectedCroutonStyle)
    }
}

private extension UICatalogCroutonViewController {
    private var selectedCroutonStyle: CroutonStyle {
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
		@unknown default:
            return "Default"
        }
    }
}

private extension Section {
    var headerTitle: String? {
        switch self {
        case .title: return "Title"
        case .action: return "Action Title"
        case .show: return nil
        }
    }
}
