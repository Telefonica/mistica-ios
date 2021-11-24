//
//  UICatalogFeedbacksViewController.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import Mistica
import UIKit

private enum Section: Int, CaseIterable {
    case title
    case subtitle
    case errorReference
    case primaryButton
    case secondaryButton
    case extraContent
    case style
    case closeButton
    case backButton
    case show
}

class UICatalogFeedbacksViewController: UITableViewController {
    private lazy var titleCell: UITextFieldTableViewCell = {
        let cell = UITextFieldTableViewCell(reuseIdentifier: "titleCell")
        cell.textField.text = "Feedback message"
        return cell
    }()

    private lazy var subtitleCell: UITextFieldTableViewCell = {
        let cell = UITextFieldTableViewCell(reuseIdentifier: "subtitleCell")
        cell.textField.text = "Insert here the message that will be included in the feedback."
        return cell
    }()

    private lazy var errorReferenceCell: UITextFieldTableViewCell = {
        let cell = UITextFieldTableViewCell(reuseIdentifier: "errorReferenceCell")
        cell.textField.text = "Insert here the error reference message that will be included in the feedback."
        return cell
    }()

    private lazy var primaryActionTitleCell: UITextFieldTableViewCell = {
        let cell = UITextFieldTableViewCell(reuseIdentifier: "primaryActionTitleCell")
        cell.textField.text = "Primary button"
        return cell
    }()

    private lazy var primaryActionLoadingTitleCell: UITextFieldTableViewCell = {
        let cell = UITextFieldTableViewCell(reuseIdentifier: "primaryActionLoadingTitleCell")
        cell.textField.text = "Loading Title"
        cell.textField.placeholder = "Primary Loading Title"
        return cell
    }()

    private lazy var primaryActionLoadingTitleVisibleCell: UISwitchTableViewCell = {
        let cell = UISwitchTableViewCell(reuseIdentifier: "primaryActionLoadingTitleVisibleCell")
        cell.isOn = true
        cell.textLabel?.text = "Show Primary Loading Title"
        return cell
    }()

    private lazy var primaryActionStyleCell: UISegmentedControlTableViewCell = {
        let cell = UISegmentedControlTableViewCell(reuseIdentifier: "primaryActionStyleCell")
        cell.segmentedControl.insertSegment(withTitle: "None", at: 0, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "Button", at: 1, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "Retry Button", at: 2, animated: false)
        cell.segmentedControl.selectedSegmentIndex = 1
        return cell
    }()

    private lazy var secondaryActionStyleCell: UISegmentedControlTableViewCell = {
        let cell = UISegmentedControlTableViewCell(reuseIdentifier: "secondaryActionStyleCell")
        cell.segmentedControl.insertSegment(withTitle: "None", at: 0, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "Button", at: 1, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "Link", at: 2, animated: false)
        cell.segmentedControl.selectedSegmentIndex = 1
        return cell
    }()

    private lazy var secondaryActionTitleCell: UITextFieldTableViewCell = {
        let cell = UITextFieldTableViewCell(reuseIdentifier: "secondaryActionTitleCell")
        cell.textField.text = "Secondary button"
        return cell
    }()

    private lazy var extraContentCell: UISegmentedControlTableViewCell = {
        let cell = UISegmentedControlTableViewCell(reuseIdentifier: "secondaryActionStyleCell")
        cell.segmentedControl.insertSegment(withTitle: "None", at: 0, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "Custom View", at: 1, animated: false)
        cell.segmentedControl.selectedSegmentIndex = 0
        return cell
    }()

    private lazy var feedbackStyleCell: UISegmentedControlTableViewCell = {
        let cell = UISegmentedControlTableViewCell(reuseIdentifier: "feedbackStyleCell")
        FeedbackStyle.allCases.enumerated().forEach { index, style in
            cell.segmentedControl.insertSegment(withTitle: style.title, at: index, animated: false)
        }
        cell.segmentedControl.selectedSegmentIndex = 0
        return cell
    }()

    private lazy var closeButtonCell: UISegmentedControlTableViewCell = {
        let cell = UISegmentedControlTableViewCell(reuseIdentifier: "closeButtonCell")
        cell.segmentedControl.insertSegment(withTitle: "None", at: 0, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "Custom Close", at: 1, animated: false)
        cell.segmentedControl.selectedSegmentIndex = 0
        return cell
    }()

    private lazy var backButtonCell: UISegmentedControlTableViewCell = {
        let cell = UISegmentedControlTableViewCell(reuseIdentifier: "backButtonCell")
        cell.segmentedControl.insertSegment(withTitle: "None", at: 0, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "Custom Back", at: 1, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "Keep Default", at: 2, animated: false)
        cell.segmentedControl.selectedSegmentIndex = 2
        return cell
    }()

    private lazy var pushFeedbackCell: UITableViewCell = {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "showCrouton")
        cell.textLabel?.textColor = .textLink
        cell.textLabel?.text = "Push feedback"
        return cell
    }()

    private lazy var presentFeedbackCell: UITableViewCell = {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "showCrouton")
        cell.textLabel?.textColor = .textLink
        cell.textLabel?.text = "Present feedback"
        return cell
    }()

    private lazy var cells = [
        [titleCell],
        [subtitleCell],
        [errorReferenceCell],
        [primaryActionStyleCell, primaryActionTitleCell, primaryActionLoadingTitleCell, primaryActionLoadingTitleVisibleCell],
        [secondaryActionStyleCell, secondaryActionTitleCell],
        [extraContentCell],
        [feedbackStyleCell],
        [closeButtonCell],
        [backButtonCell],
        [presentFeedbackCell, pushFeedbackCell]
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
        title = "Feedbacks"
        UITableViewCell.register(on: tableView)
    }
}

extension UICatalogFeedbacksViewController {
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
        guard indexPath.section == cells.indices.last! else { return }

        let feedbackViewController = FeedbackViewController(configuration: buildConfiguration())

        switch indexPath.row {
        case 0:
            let navigationController = UINavigationController(rootViewController: feedbackViewController)
            navigationController.navigationBar.applyMisticaStyle()
            present(navigationController, animated: true, completion: nil)
        case 1:
            navigationController?.pushViewController(feedbackViewController, animated: true)
        default:
            return
        }

        tableView.deselectRow(animated: true)
        view.endEditing(true)
    }
}

private extension UICatalogFeedbacksViewController {
    func buildConfiguration() -> FeedbackConfiguration {
        let primaryAction = buildPrimaryAction(
            for: primaryActionStyleCell.segmentedControl.selectedSegmentIndex,
            title: primaryActionTitleCell.textField.text ?? "",
            loadingTitle: primaryActionLoadingTitleVisibleCell.isOn ? primaryActionLoadingTitleCell.textField.text : nil
        )
        let secondaryAction = buildSecondaryAction(
            for: secondaryActionStyleCell.segmentedControl.selectedSegmentIndex,
            title: secondaryActionTitleCell.textField.text ?? ""
        )
        let shouldUseExtraContent = extraContentCell.segmentedControl.selectedSegmentIndex == 1
        return FeedbackConfiguration(
            style: selectedStyle,
            title: titleCell.textField.text ?? "",
            subtitle: subtitleCell.textField.text ?? "",
            errorReference: errorReferenceCell.textField.text ?? "",
            primaryAction: primaryAction,
            secondaryAction: secondaryAction,
            extraContent: shouldUseExtraContent ? buildExtraView() : nil,
            closeButton: buildCloseButton(for: closeButtonCell.segmentedControl.selectedSegmentIndex),
            backButton: buildBackButton(for: backButtonCell.segmentedControl.selectedSegmentIndex)
        )
    }

    var selectedStyle: FeedbackStyle {
        FeedbackStyle.allCases[feedbackStyleCell.segmentedControl.selectedSegmentIndex]
    }

    func buildExtraView() -> UIView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        stackView.isLayoutMarginsRelativeArrangement = true

        let texts = [
            "👇 This extra view is optional",
            "✅ Any UIView is allowed here",
            "⚠️ It will always be placed below the subtitle",
            "🌀 It will be animated along the other text"
        ]

        texts.forEach { string in
            let label = UILabel()
            label.text = string
            label.font = .textPreset3(weight: .regular)
            label.numberOfLines = 0
            label.textColor = .lightGray
            stackView.addArrangedSubview(label)
        }
        return stackView
    }

    func buildPrimaryAction(for selectedIndex: Int, title: String, loadingTitle: String? = nil) -> FeedbackPrimaryAction {
        switch selectedIndex {
        case 0:
            return .none
        case 1:
            let primaryActionCompletion: FeedbackCompletion = { [weak self] in
                self?.showAlert(withTitle: "Primary Action", message: nil, cancelActionTitle: "OK")
            }
            return .button(title: title, completion: primaryActionCompletion)
        case 2:
            let retryablePrimaryActionCompletion: FeedbackRetryCompletion = { [weak self] completionRetryHanlder in
                DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
                    DispatchQueue.main.async {
                        completionRetryHanlder()
                        self?.showAlert(withTitle: "Primary Action", message: nil, cancelActionTitle: "OK")
                    }
                }
            }
            return .retryButton(title: title, loadingTitle: loadingTitle, retryCompletion: retryablePrimaryActionCompletion)
        default:
            fatalError("Unknown secondary action selected for index: \(selectedIndex)")
        }
    }

    func buildSecondaryAction(for selectedIndex: Int, title: String) -> FeedbackSecondaryAction {
        let secondaryActionCompletion: FeedbackCompletion = { [weak self] in
            self?.showAlert(withTitle: "Secondary Action", message: nil, cancelActionTitle: "OK")
        }

        switch selectedIndex {
        case 0:
            return .none
        case 1:
            return .button(title: title, completion: secondaryActionCompletion)
        case 2:
            return .link(title: title, completion: secondaryActionCompletion)
        default:
            fatalError("Unknown secondary action selected for index: \(selectedIndex)")
        }
    }

    func buildBackButton(for selectedIndex: Int) -> FeedbackNavigationButton {
        switch selectedIndex {
        case 0:
            return .none
        case 1:
            let button = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(dismissFeedback))
            return .custom(button: button)
        case 2:
            return .keep
        default:
            fatalError("Unknown option selected for index: \(selectedIndex)")
        }
    }

    func buildCloseButton(for selectedIndex: Int) -> FeedbackNavigationButton {
        switch selectedIndex {
        case 0:
            return .none
        case 1:
            let button = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(dismissFeedback))
            return .custom(button: button)
        default:
            fatalError("Unknown option selected for index: \(selectedIndex)")
        }
    }

    func showAlert(withTitle title: String, message: String?, cancelActionTitle: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: cancelActionTitle, style: .cancel) { [weak self] _ in
            self?.dismissFeedback()
        }
        alertController.addAction(alertAction)

        if let presentedVC = presentedViewController {
            presentedVC.present(alertController, animated: true)
        } else {
            present(alertController, animated: true)
        }
    }
}

private extension UICatalogFeedbacksViewController {
    @objc func dismissFeedback() {
        if let presentedVC = presentedViewController {
            presentedVC.dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
}

private extension FeedbackStyle {
    static var allCases: [FeedbackStyle] {
        [
            .success,
            .informative,
            .error
        ]
    }

    var title: String {
        switch self {
        case .success:
            return "Success"
        case .error:
            return "Error"
        case .informative:
            return "Informative"
        }
    }
}

private extension Section {
    var headerTitle: String? {
        switch self {
        case .title:
            return "Title"
        case .subtitle:
            return "Subtitle"
        case .errorReference:
            return "Error Reference"
        case .primaryButton:
            return "Primary button"
        case .secondaryButton:
            return "Secondary button"
        case .extraContent:
            return "Extra Content"
        case .style:
            return "Feedback style"
        case .closeButton:
            return "Close button"
        case .backButton:
            return "Back button"
        case .show:
            return nil
        }
    }
}
