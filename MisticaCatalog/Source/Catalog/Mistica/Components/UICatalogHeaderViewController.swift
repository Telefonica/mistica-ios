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
            firstSegmentedTitle: "Yes",
            secondSegmentedTitle: "No"
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
            firstSegmentedTitle: "Yes",
            secondSegmentedTitle: "No"
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
            firstSegmentedTitle: "Yes",
            secondSegmentedTitle: "No"
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
            firstSegmentedTitle: "normal",
            secondSegmentedTitle: "inverse"
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
        [headerStyleCell],
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

        let style: HeaderViewStyle = headerStyleCell.segmentedControl.selectedSegmentIndex == 0 ? .normal : .inverse

        vc.headerView.pretitle = HeaderText(text: pretitleText?.text ?? "")
        vc.headerView.title = HeaderText(text: titleText?.text ?? "")
        vc.headerView.descriptionValue = HeaderText(text: descriptionText?.text ?? "")
        vc.headerView.style = style

        show(vc, sender: self)
    }
}

private extension UICatalogHeaderViewController {
    func createSegmentedControl(reuseIdentifier: String, firstSegmentedTitle: String, secondSegmentedTitle: String) -> UISegmentedControlTableViewCell {
        let segmented = UISegmentedControlTableViewCell(reuseIdentifier: reuseIdentifier)

        segmented.segmentedControl.insertSegment(withTitle: firstSegmentedTitle, at: 0, animated: false)
        segmented.segmentedControl.insertSegment(withTitle: secondSegmentedTitle, at: 1, animated: false)

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
