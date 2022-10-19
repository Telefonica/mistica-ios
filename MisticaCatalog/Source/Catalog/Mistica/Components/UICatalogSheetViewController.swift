//
//  UICatalogSheetViewController.swift
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
    case assetSize
    case sheetType
    case informativeIconType
    case actionStyle
    case showSheet
}

class UICatalogSheetViewController: UIViewController {
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

    private lazy var assetSizeCell: UISegmentedControlTableViewCell = {
        let cell = UISegmentedControlTableViewCell(reuseIdentifier: "assetSize")

        cell.segmentedControl.insertSegment(withTitle: "Small", at: 0, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "Large", at: 1, animated: false)

        cell.segmentedControl.selectedSegmentIndex = 1
        return cell
    }()

    private lazy var sheetTypeCell: UISegmentedControlTableViewCell = {
        let cell = UISegmentedControlTableViewCell(reuseIdentifier: "sheetType")

        cell.segmentedControl.insertSegment(withTitle: "Single Selection", at: 0, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "Informative", at: 1, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "Action", at: 2, animated: false)

        cell.segmentedControl.selectedSegmentIndex = 0
        return cell
    }()
    
    private lazy var informativeIconTypeCell: UISegmentedControlTableViewCell = {
        let cell = UISegmentedControlTableViewCell(reuseIdentifier: "informativeIconType")

        cell.segmentedControl.insertSegment(withTitle: "bullet", at: 0, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "regular", at: 1, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "small", at: 2, animated: false)

        cell.segmentedControl.selectedSegmentIndex = 0
        return cell
    }()
    
    private lazy var actionStyleCell: UISegmentedControlTableViewCell = {
        let cell = UISegmentedControlTableViewCell(reuseIdentifier: "actionStyle")

        cell.segmentedControl.insertSegment(withTitle: "default", at: 0, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "destructive", at: 1, animated: false)

        cell.segmentedControl.selectedSegmentIndex = 0
        return cell
    }()
    
    private lazy var showSheetCell: UITableViewCell = {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "showSheet")
        cell.textLabel?.textColor = .textLink
        cell.textLabel?.text = "Show Sheet"
        return cell
    }()

    private lazy var cells = [
        [titleCell],
        [subtitleCell],
        [descriptionCell],
        [numberOfElementsCell],
        [assetCell],
        [assetSizeCell],
        [sheetTypeCell],
        [informativeIconTypeCell],
        [actionStyleCell],
        [showSheetCell]
    ]

    private let sheetTransitioningDelegate = SheetTransitioningDelegate()

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

extension UICatalogSheetViewController: UITableViewDataSource, UITableViewDelegate {
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

        let configuration: SheetConfiguration
        
        switch sheetTypeCell.segmentedControl.selectedSegmentIndex {
        case 0:
            configuration = singleSelectionSheet
        case 1:
            configuration = informativeSheet
        case 2:
            configuration = actionSheet
        default:
            fatalError("Unhandled sheet type")
        }

        let viewController = SheetViewController(configuration: configuration) { sheetResponse in
            print("Sheet selection response:")
            print("\tAction:\(sheetResponse.action)")
            print("\tSelected ids:\(sheetResponse.selectedIds)")
        }
        viewController.delegate = sheetTransitioningDelegate
        viewController.transitioningDelegate = sheetTransitioningDelegate
        viewController.modalPresentationStyle = .custom

        present(viewController, animated: true)
    }
}

private extension UICatalogSheetViewController {
    var sheetTitle: String? {
        guard let title = titleCell.textField.text, !title.isEmpty else { return nil }
        return title
    }

    var sheetSubtitle: String? {
        guard let subtitle = subtitleCell.textField.text, !subtitle.isEmpty else { return nil }
        return subtitle
    }

    var sheetDescription: String? {
        guard let description = descriptionCell.textField.text, !description.isEmpty else { return nil }
        return description
    }

    var sheetNumElements: Int {
        Int(numberOfElementsCell.currentValue)
    }
    
    var singleSelectionSheet: SheetConfiguration {
        var rows: [SingleSelectionItem] = []
        
        for index in 1 ... sheetNumElements {
            let item = SingleSelectionItem(
                id: index.description,
                title: "Element \(index)",
                description: "Description",
                icon: assetCell.segmentedControl.selectedSegmentIndex == 0
                    ? SingleSelectionItemIcon(
                        url: "https://img.icons8.com/ios-glyphs/344/bookmark.png",
                        urlDark: "https://img.icons8.com/ios/344/bookmark--v1.png",
                        size: assetSizeCell.segmentedControl.selectedSegmentIndex == 0 ? .small : .large
                    )
                    : nil
            )
            rows.append(item)
        }
        let content = SheetList(
            id: UUID().uuidString,
            type: "LIST",
            listType: .singleSelection(items: rows),
            autoSubmit: true,
            selectedId: "1"
        )

        let configuration = SheetConfiguration(
            header: SheetHeader(
                title: sheetTitle,
                subtitle: sheetSubtitle,
                description: sheetDescription
            ),
            content: [content]
        )
        
        return configuration
    }
    
    var informativeSheet: SheetConfiguration {
        var rows: [InformativeItem] = []
        
        let icon: InformativeItemIcon
        
        switch informativeIconTypeCell.segmentedControl.selectedSegmentIndex {
        case 0:
            icon = .bullet
        case 1:
            icon = .regular(
                url: "https://img.icons8.com/ios-glyphs/344/bookmark.png",
                urlDark: "https://img.icons8.com/ios/344/bookmark--v1.png"
            )
        case 2:
            icon = .small(
                url: "https://img.icons8.com/ios-glyphs/344/bookmark.png",
                urlDark: "https://img.icons8.com/ios/344/bookmark--v1.png"
            )
        default:
            fatalError("Unhandled informative icon type")
        }
        
        for index in 1 ... sheetNumElements {
            let item = InformativeItem(
                id: index.description,
                title: "List Item \(index)",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse laoreet odio erat, a auctor augue faucibus id.",
                icon: icon
            )
            rows.append(item)
        }
        let content = SheetList(
            id: UUID().uuidString,
            type: "LIST",
            listType: .informative(items: rows),
            autoSubmit: true,
            selectedId: "1"
        )

        let configuration = SheetConfiguration(
            header: SheetHeader(
                title: sheetTitle,
                subtitle: sheetSubtitle,
                description: sheetDescription
            ),
            content: [content]
        )
        
        return configuration
    }
    
    var actionSheet: SheetConfiguration {
        var rows: [ActionItem] = []
        
        for index in 1 ... sheetNumElements {
            let item = ActionItem(
                id: index.description,
                title: "List ItemList ItemList ItemList ItemList ItemList ItemList ItemList ItemList ItemList ItemList ItemList Item \(index)",
                style: actionStyleCell.segmentedControl.selectedSegmentIndex == 0 ? .normal : .destructive,
                url: "https://img.icons8.com/ios-glyphs/344/bookmark.png",
                urlDark: "https://img.icons8.com/ios/344/bookmark--v1.png"
            )
            
            rows.append(item)
        }
        let content = SheetList(
            id: UUID().uuidString,
            type: "LIST",
            listType: .actions(items: rows),
            autoSubmit: true,
            selectedId: "1"
        )

        let configuration = SheetConfiguration(
            header: SheetHeader(
                title: sheetTitle,
                subtitle: sheetSubtitle,
                description: sheetDescription
            ),
            content: [content]
        )
        
        return configuration
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
        case .sheetType: return "Sheet type"
        case .assetSize: return "Asset size"
        case .informativeIconType: return "Informative icon type"
        case .actionStyle: return "Action style"
        case .showSheet: return nil
        }
    }
}
