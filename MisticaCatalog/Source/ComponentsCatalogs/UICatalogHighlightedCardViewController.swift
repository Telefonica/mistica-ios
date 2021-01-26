//
//  UICatalogHighlightedCardViewController.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import Mistica
import UIKit

private enum Section: Int, CaseIterable {
    case inverseColorPalette
    case background
    case title
    case subtitle
    case action
    case image
    case close
    case show
}

class UICatalogHighlightedCardViewController: UIViewController {
    private lazy var tableView: UITableView = {
        if #available(iOS 13.0, *) {
            return UITableView(frame: .zero, style: .insetGrouped)
        } else {
            return UITableView(frame: .zero, style: .grouped)
        }
    }()

    private lazy var showInverseColorPaletteCell: UISegmentedControlTableViewCell = {
        let cell = UISegmentedControlTableViewCell(reuseIdentifier: "ShowInverseColorPaletteCell")

        cell.segmentedControl.insertSegment(withTitle: "Normal", at: 0, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "Inverse", at: 1, animated: false)
        cell.segmentedControl.selectedSegmentIndex = 0

        return cell
    }()

    private lazy var titleCell: UITextFieldTableViewCell = {
        let cell = UITextFieldTableViewCell(reuseIdentifier: "Title")
        cell.textField.text = "Solve technical problems"
        return cell
    }()

    private lazy var subtitleCell: UITextFieldTableViewCell = {
        let cell = UITextFieldTableViewCell(reuseIdentifier: "Subtitle")
        cell.textField.text = "Use our tool to solve your technical problems"
        return cell
    }()

    private lazy var actionButtonCell: UITextFieldTableViewCell = {
        let cell = UITextFieldTableViewCell(reuseIdentifier: "ActionButton")
        cell.textField.text = "Start testing"
        return cell
    }()

    private lazy var actionButtonStyleCell: UISegmentedControlTableViewCell = {
        let cell = UISegmentedControlTableViewCell(reuseIdentifier: "ActionButtonStyleCell")

        cell.segmentedControl.insertSegment(withTitle: "Primary", at: 0, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "Secondary", at: 1, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "Link", at: 2, animated: false)
        cell.segmentedControl.selectedSegmentIndex = 0

        return cell
    }()

    private lazy var showActionButtonCell: UISegmentedControlTableViewCell = {
        let cell = UISegmentedControlTableViewCell(reuseIdentifier: "ShowActionButtonCell")

        cell.segmentedControl.insertSegment(withTitle: "Yes", at: 0, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "No", at: 1, animated: false)
        cell.segmentedControl.selectedSegmentIndex = 0
        cell.segmentedControl.addTarget(self, action: #selector(showActionSegmentedControlValueChanged), for: .valueChanged)

        return cell
    }()

    @objc func showActionSegmentedControlValueChanged(sender: UISegmentedControl) {
        let hasButton = sender.selectedSegmentIndex == 0
        actionButtonStyleCell.segmentedControl.isEnabled = hasButton
        actionButtonCell.textField.isEnabled = hasButton
        actionButtonCell.textField.alpha = hasButton ? 1.0 : 0.5
    }

    private lazy var showCloseButtonCell: UISegmentedControlTableViewCell = {
        let cell = UISegmentedControlTableViewCell(reuseIdentifier: "ShowCloseButtonCell")

        cell.segmentedControl.insertSegment(withTitle: "No", at: 0, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "Yes", at: 1, animated: false)
        cell.segmentedControl.selectedSegmentIndex = 0

        return cell
    }()

    private lazy var showRightImageCell: UISegmentedControlTableViewCell = {
        let cell = UISegmentedControlTableViewCell(reuseIdentifier: "ShowImageCell")

        cell.segmentedControl.insertSegment(withTitle: "No", at: 0, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "Yes", at: 1, animated: false)
        cell.segmentedControl.selectedSegmentIndex = 0
        cell.segmentedControl.addTarget(self, action: #selector(showRightImagSegmentedControlValueChanged), for: .valueChanged)

        return cell
    }()

    @objc func showRightImagSegmentedControlValueChanged(sender: UISegmentedControl) {
        let hasImage = sender.selectedSegmentIndex == 1
        rightImageStyleCell.segmentedControl.isEnabled = hasImage
    }

    private lazy var rightImageStyleCell: UISegmentedControlTableViewCell = {
        let cell = UISegmentedControlTableViewCell(reuseIdentifier: "RightImageStyleCell")

        cell.segmentedControl.insertSegment(withTitle: "Fit", at: 0, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "Fill", at: 1, animated: false)
        cell.segmentedControl.isEnabled = showRightImageCell.segmentedControl.selectedSegmentIndex == 1
        cell.segmentedControl.selectedSegmentIndex = 0

        return cell
    }()

    private lazy var showBackgrounImageCell: UISegmentedControlTableViewCell = {
        let cell = UISegmentedControlTableViewCell(reuseIdentifier: "ShowBackgrounImageCell")

        cell.segmentedControl.insertSegment(withTitle: "No", at: 0, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "Yes", at: 1, animated: false)
        cell.segmentedControl.selectedSegmentIndex = 0

        return cell
    }()

    private lazy var showCardCell: UITableViewCell = {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "ShowCardCell")
        cell.textLabel?.textColor = .textLink
        cell.textLabel?.text = "Show Card"
        return cell
    }()

    private lazy var cells = [
        [showInverseColorPaletteCell],
        [showBackgrounImageCell],
        [titleCell],
        [subtitleCell],
        [showActionButtonCell, actionButtonCell, actionButtonStyleCell],
        [showRightImageCell, rightImageStyleCell],
        [showCloseButtonCell],
        [showCardCell]
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
        title = "HighlightedCard"

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

extension UICatalogHighlightedCardViewController: UITableViewDataSource, UITableViewDelegate {
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
        guard indexPath.section == cells.indices.last! else { return }
        tableView.deselectRow(animated: true)

        let vc = HighlightedCardViewSampleViewController()

        if showInverseColorPaletteCell.segmentedControl.isEnabled {
            vc.highlightedCard.style = showInverseColorPaletteCell.segmentedControl.selectedSegmentIndex == 0 ? .normal : .inverse
        }

        vc.highlightedCard.title = titleCell.textField.text

        vc.highlightedCard.subtitle = subtitleCell.textField.text

        vc.highlightedCard.actionButtonTitle = actionButtonCell.textField.text

        if actionButtonStyleCell.segmentedControl.selectedSegmentIndex == 0 {
            vc.highlightedCard.actionButtonStyle = .primary
        } else if actionButtonStyleCell.segmentedControl.selectedSegmentIndex == 1 {
            vc.highlightedCard.actionButtonStyle = .secondary
        } else {
            vc.highlightedCard.actionButtonStyle = .link
        }

        if showBackgrounImageCell.segmentedControl.selectedSegmentIndex > 0 {
            vc.highlightedCard.backgroundImage = .highlightedCardBackgroundImageSample
        }

        if showActionButtonCell.segmentedControl.selectedSegmentIndex > 0 {
            vc.highlightedCard.showActionButton = true
        }

        if showCloseButtonCell.segmentedControl.selectedSegmentIndex > 0 {
            vc.highlightedCard.showCloseButton = false
        }

        if showRightImageCell.segmentedControl.selectedSegmentIndex > 0 {
            vc.highlightedCard.rightImage = .highlightedCardImageSample
        }

        if rightImageStyleCell.segmentedControl.selectedSegmentIndex == 0 {
            vc.highlightedCard.rightImageStyle = .fit
        } else {
            vc.highlightedCard.rightImageStyle = .fill
        }

        show(vc, sender: self)
    }
}

private class HighlightedCardViewSampleViewController: UIViewController {
    var highlightedCard = HighlightedCard()

    override func loadView() {
        let view = UIView()
        view.backgroundColor = .background

        view.addSubview(highlightedCard, constraints: [
            highlightedCard.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            highlightedCard.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            highlightedCard.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24)
        ])

        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "HighlightedCard"
    }
}

private extension Section {
    var headerTitle: String? {
        switch self {
        case .inverseColorPalette:
            return "Use Inverse Color Palette"
        case .background:
            return "Has Background Image"
        case .title:
            return "Title"
        case .subtitle:
            return "Subtitle"
        case .show:
            return nil
        case .action:
            return "Button"
        case .image:
            return "Has Right Image"
        case .close:
            return "Has Close"
        }
    }
}
