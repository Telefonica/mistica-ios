//
//  UICatalogHeaderViewController.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Mistica
import UIKit

private enum Section: Int, CaseIterable {
    case pretitle
    case title
    case description
    case style
    case show
}

class UICatalogHeaderViewController: UIViewController {
    private enum Constants {
        static let selectedSegmentEnabled = 0
        static let normalStyleIndex = 0
        static let inverseStyleIndex = 1
        static let defaultSizeStyleIndex = 0
        static let smallSizeStyleIndex = 1
    }

    private lazy var tableView: UITableView = {
        if #available(iOS 13.0, *) {
            return UITableView(frame: .zero, style: .insetGrouped)
        } else {
            return UITableView(frame: .zero, style: .grouped)
        }
    }()

    private lazy var showPretitleCell: UISegmentedControlTableViewCell = {
        createSegmentedControl(
            reuseIdentifier: "showPretitleCell",
            segments: "Yes", "No"
        )
    }()

    private lazy var pretitleCell: UITextFieldTableViewCell = {
        let cell = UITextFieldTableViewCell(reuseIdentifier: "Pretitle")
        cell.textField.text = "The pretitle"
        cell.textField.placeholder = "Empty"
        return cell
    }()

    private lazy var showTitleCell: UISegmentedControlTableViewCell = {
        createSegmentedControl(
            reuseIdentifier: "showTitleCell",
            segments: "Yes", "No"
        )
    }()

    private lazy var titleCell: UITextFieldTableViewCell = {
        let cell = UITextFieldTableViewCell(reuseIdentifier: "Title")
        cell.textField.text = "The title"
        return cell
    }()

    private lazy var showDescriptionCell: UISegmentedControlTableViewCell = {
        createSegmentedControl(
            reuseIdentifier: "showDescriptionCell",
            segments: "Yes", "No"
        )
    }()

    private lazy var descriptionCell: UITextFieldTableViewCell = {
        let cell = UITextFieldTableViewCell(reuseIdentifier: "Description")
        cell.textField.text = "The description"
        return cell
    }()

    private lazy var headerStyleCell: UISegmentedControlTableViewCell = {
        createSegmentedControl(
            reuseIdentifier: "headerStyleCell",
            segments: "normal", "inverse"
        )
    }()

    private lazy var headerSizeStyleCell: UISegmentedControlTableViewCell = {
        createSegmentedControl(
            reuseIdentifier: "headerSmallStyleCell",
            segments: "default size", "small size"
        )
    }()

    private lazy var showHeaderCell: UITableViewCell = {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "showHeaderCell")
        cell.textLabel?.textColor = .textLink
        cell.textLabel?.text = "Show Header"
        return cell
    }()

    private lazy var cells = [
        [showPretitleCell, pretitleCell],
        [showTitleCell, titleCell],
        [showDescriptionCell, descriptionCell],
        [headerStyleCell, headerSizeStyleCell],
        [showHeaderCell]
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

extension UICatalogHeaderViewController: UITableViewDataSource, UITableViewDelegate {
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

        let vc = HeaderViewSampleViewController()

        var pretitleText: HeaderText?
        var titleText: HeaderText?
        var descriptionText: HeaderText?

        if showPretitleCell.segmentedControl.selectedSegmentIndex == Constants.selectedSegmentEnabled {
            pretitleText = HeaderText(
                text: pretitleCell.textField.text ?? "",
                lineLimit: 0
            )
        }

        if showTitleCell.segmentedControl.selectedSegmentIndex == Constants.selectedSegmentEnabled {
            titleText = HeaderText(
                text: titleCell.textField.text ?? "",
                lineLimit: 0
            )
        }

        if showDescriptionCell.segmentedControl.selectedSegmentIndex == Constants.selectedSegmentEnabled {
            descriptionText = HeaderText(
                text: descriptionCell.textField.text ?? "",
                lineLimit: 0
            )
        }

        let style: HeaderViewStyle
        switch (
            headerStyleCell.segmentedControl.selectedSegmentIndex,
            headerSizeStyleCell.segmentedControl.selectedSegmentIndex
        ) {
        case (Constants.normalStyleIndex, Constants.smallSizeStyleIndex):
            style = HeaderViewStyle.normalSmall
        case (Constants.inverseStyleIndex, Constants.defaultSizeStyleIndex):
            style = HeaderViewStyle.inverse
        case (Constants.inverseStyleIndex, Constants.smallSizeStyleIndex):
            style = HeaderViewStyle.inverseSmall
        default:
            style = HeaderViewStyle.normal
        }

        vc.headerView.style = style
        vc.headerView.pretitle = pretitleText
        vc.headerView.title = titleText
        vc.headerView.descriptionValue = descriptionText

        show(vc, sender: self)
    }
}

private extension UICatalogHeaderViewController {
    func createSegmentedControl(reuseIdentifier: String, segments: String...) -> UISegmentedControlTableViewCell {
        let segmented = UISegmentedControlTableViewCell(reuseIdentifier: reuseIdentifier)

        segments.indices.forEach { index in
            segmented.segmentedControl.insertSegment(withTitle: segments[index], at: index, animated: false)
        }

        segmented.segmentedControl.selectedSegmentIndex = 0

        return segmented
    }
}

private class HeaderViewSampleViewController: UIViewController {
    var headerView = HeaderView()

    override func loadView() {
        let view = UIView()
        view.backgroundColor = .background

        view.addSubview(headerView, constraints: [
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Header"
    }
}

private extension Section {
    var headerTitle: String? {
        switch self {
        case .pretitle:
            return "Has Pretitle"
        case .title:
            return "Has Title"
        case .description:
            return "Has Description"
        case .style:
            return "Style"
        case .show:
            return nil
        }
    }
}
