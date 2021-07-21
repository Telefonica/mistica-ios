//
//  UICatalogCalloutViewController.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Mistica
import UIKit

private enum Section: Int, CaseIterable {
    case title
    case message
    case canClose
    case asset
    case buttons
    case show
}

class UICatalogCalloutViewController: UIViewController {
    private lazy var tableView: UITableView = {
        if #available(iOS 13.0, *) {
            return UITableView(frame: .zero, style: .insetGrouped)
        } else {
            return UITableView(frame: .zero, style: .grouped)
        }
    }()

    private lazy var titleCell: UITextFieldTableViewCell = {
        let cell = UITextFieldTableViewCell(reuseIdentifier: "title")
        cell.textField.text = "This is the title"
        cell.textField.placeholder = "Empty"
        return cell
    }()

    private lazy var messageCell: UITextFieldTableViewCell = {
        let cell = UITextFieldTableViewCell(reuseIdentifier: "description")
        cell.textField.text = "This is a description"
        cell.textField.placeholder = "Empty"
        return cell
    }()

    private lazy var assetCell: UISegmentedControlTableViewCell = {
        let cell = UISegmentedControlTableViewCell(reuseIdentifier: "asset")

        cell.segmentedControl.insertSegment(withTitle: "None", at: 0, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "Yes", at: 1, animated: false)

        cell.segmentedControl.selectedSegmentIndex = 0
        return cell
    }()

    private lazy var canCloseCell: UISegmentedControlTableViewCell = {
        let cell = UISegmentedControlTableViewCell(reuseIdentifier: "canClose")

        cell.segmentedControl.insertSegment(withTitle: "Yes", at: 0, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "No", at: 1, animated: false)

        cell.segmentedControl.selectedSegmentIndex = 0
        return cell
    }()

    private lazy var buttonsCell: UISegmentedControlTableViewCell = {
        let cell = UISegmentedControlTableViewCell(reuseIdentifier: "ActionButtonStyleCell")

        cell.segmentedControl.insertSegment(withTitle: "P", at: 0, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "P + L", at: 1, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "P + S", at: 2, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "S", at: 3, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "S + L", at: 4, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "L", at: 5, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "EMPTY", at: 6, animated: false)
        cell.segmentedControl.selectedSegmentIndex = 0

        return cell
    }()

    private lazy var showCalloutCell: UITableViewCell = {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "showCallout")
        cell.textLabel?.textColor = .textLink
        cell.textLabel?.text = "Show Callout"
        return cell
    }()

    private lazy var cells = [
        [titleCell],
        [messageCell],
        [canCloseCell],
        [assetCell],
        [buttonsCell],
        [showCalloutCell]
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
        title = "Callout"

        view.addSubview(withDefaultConstraints: tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.keyboardDismissMode = .interactive

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard(_:)))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }

    @objc func dismissKeyboard(_: UITapGestureRecognizer) {
        cells.flatMap { $0 }.forEach { cell in
            guard let textFieldCell = cell as? UITextFieldTableViewCell else { return }
            textFieldCell.textField.resignFirstResponder()
        }
    }
}

extension UICatalogCalloutViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in _: UITableView) -> Int {
        Section.allCases.count
    }

    func tableView(_: UITableView, titleForHeaderInSection section: Int) -> String? {
        Section(rawValue: section)!.headerTitle
    }

    func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        cells[section].count
    }

    func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cells[indexPath.section][indexPath.row]
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.section == cells.indices.last!, indexPath.row == cells[indexPath.section].indices.last! else { return }
        tableView.deselectRow(animated: true)
        view.endEditing(true)

        let assetType: CalloutConfiguration.CalloutAssetType
        if let image = assetCell.segmentedControl.selectedSegmentIndex == 0 ? nil : UIImage(color: .success) {
            assetType = .smallIcon(image)
        } else {
            assetType = .none
        }

        let canCloseCallout = canCloseCell.segmentedControl.selectedSegmentIndex == 0 ? true : false

        let actions: CalloutConfiguration.CalloutActions

        switch buttonsCell.segmentedControl.selectedSegmentIndex {
        case 0:
            actions = .primary(CalloutButton(title: "Button small", loadingTitle: nil, tapHandler: nil))
        case 1:
            actions = .primaryAndLink(
                primary: CalloutButton(title: "Button small", loadingTitle: nil, tapHandler: nil),
                link: CalloutLinkButton(title: "Link", tapHandler: nil)
            )
        case 2:
            actions = .primaryAndSecondary(
                primary: CalloutButton(title: "Button small", loadingTitle: nil, tapHandler: nil),
                secondary: CalloutButton(title: "Secondary", loadingTitle: nil, tapHandler: nil)
            )
        case 3:
            actions = .secondary(CalloutButton(title: "Secondary", loadingTitle: nil, tapHandler: nil))
        case 4:
            actions = .secondaryAndLink(
                secondary: CalloutButton(title: "Secondary", loadingTitle: nil, tapHandler: nil),
                link: CalloutLinkButton(title: "Link", tapHandler: nil)
            )
        case 5:
            actions = .link(CalloutLinkButton(title: "Link", tapHandler: nil))
        case 6:
            actions = .empty
        default:
            fatalError("Case not implemented")
        }

        let configuration = CalloutConfiguration(asset: assetType, title: calloutTitle, description: calloutMessage, actions: actions, canClose: canCloseCallout)
        let vc = CalloutViewSampleViewController()
        vc.callout.contentConfiguration = configuration

        show(vc, sender: self)
    }
}

private extension UICatalogCalloutViewController {
    var calloutTitle: String? {
        guard let text = titleCell.textField.text, !text.isEmpty else { return nil }
        return text
    }

    var calloutMessage: String {
        guard let text = messageCell.textField.text, !text.isEmpty else { return "No text setted" }
        return text
    }
}

private extension Section {
    var headerTitle: String? {
        switch self {
        case .title: return "Title"
        case .message: return "Message"
        case .canClose: return "Can Close"
        case .asset: return "Has asset"
        case .buttons: return "Actions"
        case .show: return nil
        }
    }
}

private class CalloutViewSampleViewController: UIViewController {
    var callout = Callout()

    override func loadView() {
        let view = UIView()
        view.backgroundColor = .background
        view.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)

        view.addSubview(callout, constraints: [
            callout.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            callout.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            callout.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
        ])

        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "CallOut"
    }
}
