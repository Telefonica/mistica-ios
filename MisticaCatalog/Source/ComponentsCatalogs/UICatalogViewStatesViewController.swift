//
//  UICatalogViewStatesViewController.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import Mistica
import UIKit

class UICatalogViewStatesViewController: UIViewController {
    private enum Constants {
        static let viewStateDisappearDelay: TimeInterval = 3
        static let viewStateLoadingDelay: TimeInterval = 1.5
    }

    private lazy var tableView: UITableView = {
        if #available(iOS 13.0, *) {
            return UITableView(frame: .zero, style: .insetGrouped)
        } else {
            return UITableView(frame: .zero, style: .grouped)
        }
    }()

    private lazy var viewStateKindCell: UISegmentedControlTableViewCell = {
        let cell = UISegmentedControlTableViewCell(reuseIdentifier: "viewStateKindCell")
        ViewStateKind.allCases.enumerated().forEach { offset, viewStateKind in
            cell.segmentedControl.insertSegment(withTitle: viewStateKind.title, at: offset, animated: false)
        }

        cell.segmentedControl.selectedSegmentIndex = 0
        return cell
    }()

    private lazy var titleCell: UITextFieldTableViewCell = {
        let cell = UITextFieldTableViewCell(reuseIdentifier: "titleCell")
        cell.textField.text = "Oops, something went wrong"
        cell.textField.placeholder = "Title (Optional)"
        cell.textField.delegate = self
        return cell
    }()

    private lazy var descriptionCell: UITextFieldTableViewCell = {
        let cell = UITextFieldTableViewCell(reuseIdentifier: "descriptionCell")
        cell.textField.text = "There was an error loading the content, please, check your network connection and try again later."
        cell.textField.placeholder = "Description"
        cell.textField.delegate = self
        return cell
    }()

    private lazy var actionButtonTitleCell: UITextFieldTableViewCell = {
        let cell = UITextFieldTableViewCell(reuseIdentifier: "actionButtonTitleCell")
        cell.textField.text = "Retry"
        cell.textField.placeholder = "Action Button Title"
        cell.textField.delegate = self
        return cell
    }()

    private lazy var actionButtonEnabledCell: UISwitchTableViewCell = {
        let cell = UISwitchTableViewCell(reuseIdentifier: "actionButtonEnabledCell")
        cell.isOn = true
        cell.textLabel?.text = "Show Action Button"
        return cell
    }()

    private lazy var showStateCell: UITableViewCell = {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "showState")
        cell.textLabel?.textColor = .textLink
        cell.textLabel?.text = "Show State"
        return cell
    }()

    private lazy var sections = [
        Section(cells: [viewStateKindCell]),
        Section(header: "Title (Optional)", cells: [titleCell]),
        Section(header: "Description", cells: [descriptionCell]),
        Section(footer: "When the action button is disabled, the view state will disappear automatically after \(Constants.viewStateDisappearDelay) seconds", cells: [actionButtonTitleCell, actionButtonEnabledCell, showStateCell])
    ]

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View States"

        view.addSubview(withDefaultConstraints: tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.keyboardDismissMode = .interactive
    }
}

extension UICatalogViewStatesViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in _: UITableView) -> Int {
        sections.count
    }

    func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].count
    }

    func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        sections[indexPath.section].cells[indexPath.row]
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(animated: true)

        let cell = tableView.cellForRow(at: indexPath)!
        guard cell == showStateCell else { return }

        showSelectedViewState()
        view.endEditing(true)
    }

    func tableView(_: UITableView, titleForHeaderInSection section: Int) -> String? {
        sections[section].header
    }

    func tableView(_: UITableView, titleForFooterInSection section: Int) -> String? {
        sections[section].footer
    }
}

private extension UICatalogViewStatesViewController {
    var selectedViewStateKind: ViewStateKind {
        ViewStateKind(rawValue: viewStateKindCell.segmentedControl.selectedSegmentIndex)!
    }

    var titleText: String? {
        let title = titleCell.textField.text
        return title.isEmpty ? nil : title
    }

    var descriptionText: String {
        let description = descriptionCell.textField.text
        return description.isEmpty ? "Description text is mandatory" : description!
    }

    var actionButtonTitle: String {
        let title = actionButtonTitleCell.textField.text
        return title.isEmpty ? "Retry" : title!
    }

    func showSelectedViewState() {
        switch selectedViewStateKind {
        case .loadError:
            showLoadErrorState()
        }
    }

    func showLoadErrorState() {
        let showsActionButton = actionButtonEnabledCell.isOn

        let viewController = LoadErrorViewController(
            title: titleText,
            descriptionText: descriptionText,
            actionButtonTitle: actionButtonTitle,
            showActionButton: showsActionButton
        )

        viewController.delegate = self

        addChild(viewController)
        view.addSubview(withDefaultConstraints: viewController.view)
        viewController.didMove(toParent: self)

        if !showsActionButton {
            scheduleViewStateRemoval(viewController, after: Constants.viewStateDisappearDelay)
        }
    }

    func scheduleViewStateRemoval(_ viewController: UIViewController, after delay: TimeInterval) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            viewController.willMove(toParent: nil)
            viewController.view.removeFromSuperview()
            viewController.removeFromParent()
        }
    }
}

extension UICatalogViewStatesViewController: LoadErrorViewControllerDelegate {
    func loadErrorViewControllerDidTapRetry(_ viewController: LoadErrorViewController) {
        viewController.addActivityIndicatorToRetryButton()
        scheduleViewStateRemoval(viewController, after: Constants.viewStateLoadingDelay)
    }
}

extension UICatalogViewStatesViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        var nextResponder: UITextField? = nil

        if textField == titleCell.textField {
            nextResponder = descriptionCell.textField
        } else if textField == descriptionCell.textField {
            nextResponder = actionButtonTitleCell.textField
        }

        if let nextResponder = nextResponder {
            nextResponder.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }

        return true
    }
}

private enum ViewStateKind: Int, CaseIterable {
    case loadError
}

private extension ViewStateKind {
    var title: String {
        switch self {
        case .loadError:
            return "Load Error"
        }
    }
}

private struct Section {
    let header: String?
    let footer: String?
    let cells: [UITableViewCell]
    var count: Int { cells.count }

    init(header: String? = nil, footer: String? = nil, cells: [UITableViewCell]) {
        self.header = header
        self.cells = cells
        self.footer = footer
    }
}
