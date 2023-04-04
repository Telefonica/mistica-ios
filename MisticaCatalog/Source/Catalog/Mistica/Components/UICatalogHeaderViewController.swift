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
    case usingInLargeNavigationBar
    case inverseColorPalette
    case pretitle
    case title
    case show
}

class UICatalogHeaderViewController: UIViewController {
    private lazy var tableView: UITableView = {
        if #available(iOS 13.0, *) {
            return UITableView(frame: .zero, style: .insetGrouped)
        } else {
            return UITableView(frame: .zero, style: .grouped)
        }
    }()

    private lazy var usingInLargeNavigationBarCell: UISegmentedControlTableViewCell = {
        let cell = UISegmentedControlTableViewCell(reuseIdentifier: "usingInLargeNavigationBarCell")

        cell.segmentedControl.insertSegment(withTitle: "No", at: 0, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "Yes", at: 1, animated: false)
        cell.segmentedControl.addTarget(self, action: #selector(usingInLargeNavigationBar), for: .valueChanged)

        cell.segmentedControl.selectedSegmentIndex = 0
        return cell
    }()

    @objc func usingInLargeNavigationBar(_ sender: UISegmentedControl) {
        showInverseColorPaletteCell.segmentedControl.isEnabled = sender.selectedSegmentIndex == 0
    }

    private lazy var showInverseColorPaletteCell: UISegmentedControlTableViewCell = {
        let cell = UISegmentedControlTableViewCell(reuseIdentifier: "showInverseColorPaletteCell")

        cell.segmentedControl.insertSegment(withTitle: "Normal", at: 0, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "Inverse", at: 1, animated: false)

        cell.segmentedControl.selectedSegmentIndex = 0
        return cell
    }()

    private lazy var showPretitleCell: UISegmentedControlTableViewCell = {
        let cell = UISegmentedControlTableViewCell(reuseIdentifier: "showPretitleCell")

        cell.segmentedControl.insertSegment(withTitle: "No", at: 0, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "Primary", at: 1, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "Secondary", at: 2, animated: false)

        cell.segmentedControl.selectedSegmentIndex = 0
        return cell
    }()

    private lazy var pretitleCell: UITextFieldTableViewCell = {
        let cell = UITextFieldTableViewCell(reuseIdentifier: "Pretitle")
        cell.textField.text = "Pretitle"
        cell.textField.placeholder = "Empty"
        return cell
    }()

    private lazy var titleCell: UITextFieldTableViewCell = {
        let cell = UITextFieldTableViewCell(reuseIdentifier: "Title")
        cell.textField.text = "Title"
        return cell
    }()

    private lazy var showHeaderCell: UITableViewCell = {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "showHeaderCell")
        cell.textLabel?.textColor = .textLink
        cell.textLabel?.text = "Show Header"
        return cell
    }()

    private lazy var cells = [
        [usingInLargeNavigationBarCell],
        [showInverseColorPaletteCell],
        [showPretitleCell, pretitleCell],
        [titleCell],
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

        vc.headerView.usingInLargeNavigationBar = usingInLargeNavigationBarCell.segmentedControl.selectedSegmentIndex == 0 ? false : true

        if showInverseColorPaletteCell.segmentedControl.isEnabled {
            vc.headerView.style = showInverseColorPaletteCell.segmentedControl.selectedSegmentIndex == 0 ? .normal : .inverse
        }

        if showPretitleCell.segmentedControl.selectedSegmentIndex > 0 {
            vc.headerView.pretitle = pretitleCell.textField.text
        }

        if showPretitleCell.segmentedControl.selectedSegmentIndex == 2 {
            vc.headerView.pretitleHasSecondaryColor = true
        }

        vc.headerView.title = titleCell.textField.text!.isEmpty ? nil : titleCell.textField.text

        show(vc, sender: self)
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
        case .inverseColorPalette:
            return "Use inverse color palette"
        case .title:
            return "Title"
        case .pretitle:
            return "Has Pretitle"
        case .show:
            return nil
        case .usingInLargeNavigationBar:
            return "Embeded in Large Navigation Bar"
        }
    }
}
