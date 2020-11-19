//
//  UICatalogPopoverViewController.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

import Mistica
import UIKit

private enum Section: Int, CaseIterable {
    case title
    case message
    case canClose
    case asset
    case tipDirection
    case show
}

class UICatalogPopoverViewController: UIViewController {
    private lazy var tableView: UITableView = {
        if #available(iOS 13.0, *) {
            return UITableView(frame: .zero, style: .insetGrouped)
        } else {
            return UITableView(frame: .zero, style: .grouped)
        }
    }()

    private lazy var titleCell: UITextFieldTableViewCell = {
        let cell = UITextFieldTableViewCell(reuseIdentifier: "title")
        cell.textField.text = "Courage"
        cell.textField.placeholder = "Empty"
        return cell
    }()

    private lazy var messageCell: UITextFieldTableViewCell = {
        let cell = UITextFieldTableViewCell(reuseIdentifier: "message")
        cell.textField.text = "The reason to move on really comes down to one word: courage. The courage to move on and do something new that betters all of us."
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

    private lazy var tooltipTipDirection: UISegmentedControlTableViewCell = {
        let cell = UISegmentedControlTableViewCell(reuseIdentifier: "tip-direction")

        cell.segmentedControl.insertSegment(withTitle: "Up", at: 0, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "Down", at: 1, animated: false)

        cell.segmentedControl.selectedSegmentIndex = 0
        return cell
    }()

    private lazy var showTooltipCell: UITableViewCell = {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "showTooltip")
        cell.textLabel?.textColor = .textLink
        cell.textLabel?.text = "Show Tooltip"
        return cell
    }()

    private lazy var cells = [
        [titleCell],
        [messageCell],
        [canCloseCell],
        [assetCell],
        [tooltipTipDirection],
        [showTooltipCell]
    ]

    private var shownPopover: PopoverView!

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tooltip"

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

extension UICatalogPopoverViewController: UITableViewDataSource, UITableViewDelegate {
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

        shownPopover?.dismiss(animated: true)

        shownPopover = PopoverView()

        let tipDirection: PopoverView.TipDirection

        switch tooltipTipDirection.segmentedControl.selectedSegmentIndex {
        case 0:
            tipDirection = .up
        case 1:
            tipDirection = .down
        default:
            fatalError("Selected segment index unknown")
        }

        let image: UIImage? = assetCell.segmentedControl.selectedSegmentIndex == 0 ? nil : UIImage(color: .accentBackground)
        let canClosePopover = canCloseCell.segmentedControl.selectedSegmentIndex == 0 ? true : false

        let configuration = PopoverConfiguration(
            tipDirection: tipDirection,
            image: image,
            title: tooltipTile,
            subtitle: tooltipMessage,
            canClose: canClosePopover
        )
        let targetView: UIView

        switch tipDirection {
        case .up:
            targetView = titleCell
        case .down:
            targetView = showTooltipCell
        }

        shownPopover?.show(configuration: configuration, pointingAtView: targetView, in: tableView, animated: true)
    }
}

private extension UICatalogPopoverViewController {
    var tooltipTile: String? {
        guard let text = titleCell.textField.text, !text.isEmpty else { return nil }
        return text
    }

    var tooltipMessage: String? {
        guard let text = messageCell.textField.text, !text.isEmpty else { return nil }
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
        case .tipDirection: return "Tip direction"
        case .show: return nil
        }
    }
}
