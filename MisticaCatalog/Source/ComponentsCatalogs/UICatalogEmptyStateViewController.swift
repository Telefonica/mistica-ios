//
//  UICatalogEmptyStateViewController.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Mistica
import UIKit

private enum Section: Int, CaseIterable {
    case asset
    case title
    case message
    case buttons
    case isCardStyle
    case show
}

class UICatalogEmptyStateViewController: UIViewController {
    private lazy var tableView: UITableView = {
        if #available(iOS 13.0, *) {
            return UITableView(frame: .zero, style: .insetGrouped)
        } else {
            return UITableView(frame: .zero, style: .grouped)
        }
    }()

    private lazy var assetCell: UISegmentedControlTableViewCell = {
        let cell = UISegmentedControlTableViewCell(reuseIdentifier: "asset")

        cell.segmentedControl.insertSegment(withTitle: "Icon", at: 0, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "Small", at: 1, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "Full", at: 2, animated: false)

        cell.segmentedControl.selectedSegmentIndex = 0

        return cell
    }()

    private lazy var titleCell: UITextFieldTableViewCell = {
        let cell = UITextFieldTableViewCell(reuseIdentifier: "title")
        cell.textField.text = "Your cart is empty"
        cell.textField.placeholder = "Empty"
        return cell
    }()

    private lazy var messageCell: UITextFieldTableViewCell = {
        let cell = UITextFieldTableViewCell(reuseIdentifier: "description")
        cell.textField.text = "Check our marketplaces and find something for you"
        cell.textField.placeholder = "Empty"
        return cell
    }()

    private lazy var buttonsCell: UISegmentedControlTableViewCell = {
        let cell = UISegmentedControlTableViewCell(reuseIdentifier: "ActionButtonStyleCell")

        cell.segmentedControl.insertSegment(withTitle: "P", at: 0, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "P + L", at: 1, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "S", at: 2, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "S + L", at: 3, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "EMPTY", at: 4, animated: false)
        cell.segmentedControl.selectedSegmentIndex = 0

        return cell
    }()

    private lazy var isCardCell: UISegmentedControlTableViewCell = {
        let cell = UISegmentedControlTableViewCell(reuseIdentifier: "isCardStyle")

        cell.segmentedControl.insertSegment(withTitle: "Yes", at: 0, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "No", at: 1, animated: false)

        cell.segmentedControl.selectedSegmentIndex = 0
        return cell
    }()

    private lazy var showEmptyStateCell: UITableViewCell = {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "showEmptyState")
        cell.textLabel?.textColor = .textLink
        cell.textLabel?.text = "Show Empty State"
        return cell
    }()

    private lazy var cells = [
        [assetCell],
        [titleCell],
        [messageCell],
        [buttonsCell],
        [isCardCell],
        [showEmptyStateCell]
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
        title = "Empty State"

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

extension UICatalogEmptyStateViewController: UITableViewDataSource, UITableViewDelegate {
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

        let actions: EmptyStateConfiguration.EmptyStateActions
        switch buttonsCell.segmentedControl.selectedSegmentIndex {
        case 0:
            actions = .primary(EmptyStateButton(title: "Button small", loadingTitle: nil, tapHandler: nil))
        case 1:
            actions = .primaryAndLink(
                primary: EmptyStateButton(title: "Button small", loadingTitle: nil, tapHandler: nil),
                link: EmptyStateLinkButton(title: "Link", tapHandler: nil)
            )
        case 2:
            actions = .secondary(EmptyStateButton(title: "Secondary", loadingTitle: nil, tapHandler: nil))
        case 3:
            actions = .secondaryAndLink(
                secondary: EmptyStateButton(title: "Secondary", loadingTitle: nil, tapHandler: nil),
                link: EmptyStateLinkButton(title: "Link", tapHandler: nil)
            )
        case 4:
            actions = .empty
        default:
            fatalError("Case not implemented")
        }

        let configuration: EmptyStateConfiguration
        let isCard = isCardCell.segmentedControl.selectedSegmentIndex == 0 ? true : false
        if isCard {
            let image = UIImage(color: .success)
            let asset: EmptyStateConfiguration.EmptyStateCardAsset
            switch assetCell.segmentedControl.selectedSegmentIndex {
            case 0:
                asset = .icon(image)
            case 1:
                asset = .smallImage(image)
            default:
                fatalError("Case not implemented")
            }
            configuration = EmptyStateConfiguration(type: .card(asset), title: emptyStateTitle, description: emptyStateMessage, actions: actions)
        } else {
            let imageDefault = UIImage(color: .success)
            let asset: EmptyStateConfiguration.EmptyStateDefaultAsset
            switch assetCell.segmentedControl.selectedSegmentIndex {
            case 0:
                asset = .icon(imageDefault)
            case 1:
                asset = .smallImage(imageDefault)
            case 2:
                let image = UIImage(named: "avengers-movie-logo")!
                asset = .fullWidthImage(image)
            default:
                fatalError("Case not implemented")
            }
            configuration = EmptyStateConfiguration(type: .default(asset), title: emptyStateTitle, description: emptyStateMessage, actions: actions)
        }
        let vc = EmptyStateViewSampleViewController()
        vc.emptyState.contentConfiguration = configuration

        show(vc, sender: self)
    }
}

private extension UICatalogEmptyStateViewController {
    var emptyStateTitle: String {
        guard let text = titleCell.textField.text, !text.isEmpty else { return "No title setted" }
        return text
    }

    var emptyStateMessage: String? {
        guard let text = messageCell.textField.text, !text.isEmpty else { return nil }
        return text
    }
}

private extension Section {
    var headerTitle: String? {
        switch self {
        case .asset: return "Has asset"
        case .title: return "Title"
        case .message: return "Message"
        case .buttons: return "Actions"
        case .isCardStyle: return "Is it a Card?"
        case .show: return nil
        }
    }
}

private class EmptyStateViewSampleViewController: UIViewController {
    var emptyState = EmptyState()

    override func loadView() {
        let view = UIView()
        view.backgroundColor = .background
        view.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)

        view.addSubview(emptyState, constraints: [
            emptyState.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            emptyState.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            emptyState.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
        ])

        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Empty State"
    }
}
