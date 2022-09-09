//
//  UICatalogBottomSheetViewController.swift
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
    case description
    case numberOfElements
    case hasAsset
    case showBottom
}

class UICatalogBottomSheetViewController: UIViewController {
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

    private lazy var subtitleCell: UITextFieldTableViewCell = {
        let cell = UITextFieldTableViewCell(reuseIdentifier: "subtitle")
        cell.textField.text = "This is a subtitle"
        cell.textField.placeholder = "Empty"
        return cell
    }()

    private lazy var descriptionCell: UITextFieldTableViewCell = {
        let cell = UITextFieldTableViewCell(reuseIdentifier: "description")
        cell.textField.text = "This is a description"
        cell.textField.placeholder = "Empty"
        return cell
    }()

    private lazy var numberOfElementsCell: UIStepperTableViewCell = {
        let cell = UIStepperTableViewCell(reuseIdentifier: "numberOfElements")
        cell.title = "Number of elements: "
        cell.didValueChange = stepperValueDidChange
        cell.numberOfSteps = "1"
        cell.minValue = 1
        return cell
    }()

    private lazy var assetCell: UISegmentedControlTableViewCell = {
        let cell = UISegmentedControlTableViewCell(reuseIdentifier: "asset")

        cell.segmentedControl.insertSegment(withTitle: "Yes", at: 0, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "None", at: 1, animated: false)

        cell.segmentedControl.selectedSegmentIndex = 0
        return cell
    }()

    private lazy var showBottomSheetCell: UITableViewCell = {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "showBottomSheet")
        cell.textLabel?.textColor = .textLink
        cell.textLabel?.text = "Show Bottom Sheet"
        return cell
    }()

    private lazy var cells = [
        [titleCell],
        [subtitleCell],
        [descriptionCell],
        [numberOfElementsCell],
        [assetCell],
        [showBottomSheetCell]
    ]

    private let bottomSheetTransitioningDelegate = SheetTransitioningDelegate()

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

    func stepperValueDidChange(_ stepper: UIStepper) {
        numberOfElementsCell.numberOfSteps = String(Int(stepper.value))
    }
}

extension UICatalogBottomSheetViewController: UITableViewDataSource, UITableViewDelegate {
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

        var rows: [BottomSheetListRow] = []
        for index in 1 ... bottomSheetNumElements {
            rows.append(.init(
                id: index.description,
                title: "Element \(index)",
                description: "Description",
                icon: assetCell.segmentedControl.selectedSegmentIndex == 0 ? .imageIcon : nil
            ))
        }
        let content: BottomSheetList = .init(
            id: UUID().uuidString,
            type: "LIST",
            listType: "SINGLE_SELECTION",
            autoSubmit: true,
            selectedId: "1",
            items: rows
        )

        let configuration = BottomSheetConfiguration(
            header: .init(
                title: bottomSheetTitle,
                subtitle: bottomSheetSubtitle,
                description: bottomSheetDescription
            ),
            content: [content]
        )

        let viewController = BottomSheetViewController(configuration: configuration) { _ in }
        viewController.transitioningDelegate = bottomSheetTransitioningDelegate
        viewController.modalPresentationStyle = .custom

        present(viewController, animated: true)
    }
}

private extension UICatalogBottomSheetViewController {
    var bottomSheetTitle: String? {
        guard let text = titleCell.textField.text, !text.isEmpty else { return nil }
        return text
    }

    var bottomSheetSubtitle: String? {
        guard let text = subtitleCell.textField.text, !text.isEmpty else { return nil }
        return text
    }

    var bottomSheetDescription: String? {
        guard let text = descriptionCell.textField.text, !text.isEmpty else { return nil }
        return text
    }

    var bottomSheetNumElements: Int {
        Int(numberOfElementsCell.currentValue)
    }
}

private extension Section {
    var headerTitle: String? {
        switch self {
        case .title: return "Title"
        case .message: return "Message"
        case .description: return "Description"
        case .numberOfElements: return "Configuration"
        case .hasAsset: return "Has asset"
        case .showBottom: return nil
        }
    }
}
