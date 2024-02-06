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
    case imageType
    case actionStyle
    case actions
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
        cell.segmentedControl.insertSegment(withTitle: "Action List", at: 2, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "Action", at: 3, animated: false)

        cell.segmentedControl.selectedSegmentIndex = 0
        return cell
    }()

    private lazy var informativeIconTypeCell: UISegmentedControlTableViewCell = {
        let cell = UISegmentedControlTableViewCell(reuseIdentifier: "informativeIconType")

        cell.segmentedControl.insertSegment(withTitle: "Bullet", at: 0, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "Regular", at: 1, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "Small", at: 2, animated: false)

        cell.segmentedControl.selectedSegmentIndex = 0
        return cell
    }()

    private lazy var iconURLTypeCell: UISegmentedControlTableViewCell = {
        let cell = UISegmentedControlTableViewCell(reuseIdentifier: "iconURLTypeCell")

        cell.segmentedControl.insertSegment(withTitle: "PNG", at: 0, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "SVG URL", at: 1, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "SVG URI", at: 2, animated: false)

        cell.segmentedControl.selectedSegmentIndex = 0
        return cell
    }()

    private lazy var actionStyleCell: UISegmentedControlTableViewCell = {
        let cell = UISegmentedControlTableViewCell(reuseIdentifier: "actionStyle")

        cell.segmentedControl.insertSegment(withTitle: "Default", at: 0, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "Destructive", at: 1, animated: false)

        cell.segmentedControl.selectedSegmentIndex = 0
        return cell
    }()

    private lazy var primaryActionEnabledCell: UISwitchTableViewCell = {
        let cell = UISwitchTableViewCell(reuseIdentifier: "primaryActionEnabled")
        cell.textLabel?.text = "Primary Action"
        return cell
    }()

    private lazy var secondaryActionEnabledCell: UISwitchTableViewCell = {
        let cell = UISwitchTableViewCell(reuseIdentifier: "primaryActionEnabled")
        cell.textLabel?.text = "Secondary Action"
        return cell
    }()

    private lazy var linkActionEnabledCell: UISwitchTableViewCell = {
        let cell = UISwitchTableViewCell(reuseIdentifier: "primaryActionEnabled")
        cell.textLabel?.text = "Link Action"
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
        [iconURLTypeCell],
        [actionStyleCell],
        [
            primaryActionEnabledCell,
            secondaryActionEnabledCell,
            linkActionEnabledCell
        ],
        [showSheetCell]
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
            configuration = actionListSheet
        case 3:
            configuration = actionSheet
        default:
            fatalError("Unhandled sheet type")
        }

        let viewController = SheetViewController(configuration: configuration) { sheetResponse in
            print("Sheet selection response:")
            print("\tAction:\(sheetResponse.action)")
            print("\tSelected ids:\(sheetResponse.selectedIds)")
        }

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

    var iconURL: String {
        switch iconURLTypeCell.segmentedControl.selectedSegmentIndex {
        case 0: return "https://img.icons8.com/ios-glyphs/344/bookmark.png"
        case 1: return "https://www.svgrepo.com/show/19461/url-link.svg"
        case 2: return "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB2ZXJzaW9uPSIxLjEiIGlkPSJMYXllcl8xIiB4PSIwcHgiIHk9IjBweCIgdmlld0JveD0iMCAwIDEwMCAxMDAiIGVuYWJsZS1iYWNrZ3JvdW5kPSJuZXcgMCAwIDEwMCAxMDAiIHhtbDpzcGFjZT0icHJlc2VydmUiIGhlaWdodD0iMTAwcHgiIHdpZHRoPSIxMDBweCI+CjxnPgoJPHBhdGggZD0iTTI4LjEsMzYuNmM0LjYsMS45LDEyLjIsMS42LDIwLjksMS4xYzguOS0wLjQsMTktMC45LDI4LjksMC45YzYuMywxLjIsMTEuOSwzLjEsMTYuOCw2Yy0xLjUtMTIuMi03LjktMjMuNy0xOC42LTMxLjMgICBjLTQuOS0wLjItOS45LDAuMy0xNC44LDEuNEM0Ny44LDE3LjksMzYuMiwyNS42LDI4LjEsMzYuNnoiLz4KCTxwYXRoIGQ9Ik03MC4zLDkuOEM1Ny41LDMuNCw0Mi44LDMuNiwzMC41LDkuNWMtMyw2LTguNCwxOS42LTUuMywyNC45YzguNi0xMS43LDIwLjktMTkuOCwzNS4yLTIzLjFDNjMuNywxMC41LDY3LDEwLDcwLjMsOS44eiIvPgoJPHBhdGggZD0iTTE2LjUsNTEuM2MwLjYtMS43LDEuMi0zLjQsMi01LjFjLTMuOC0zLjQtNy41LTctMTEtMTAuOGMtMi4xLDYuMS0yLjgsMTIuNS0yLjMsMTguN0M5LjYsNTEuMSwxMy40LDUwLjIsMTYuNSw1MS4zeiIvPgoJPHBhdGggZD0iTTksMzEuNmMzLjUsMy45LDcuMiw3LjYsMTEuMSwxMS4xYzAuOC0xLjYsMS43LTMuMSwyLjYtNC42YzAuMS0wLjIsMC4zLTAuNCwwLjQtMC42Yy0yLjktMy4zLTMuMS05LjItMC42LTE3LjYgICBjMC44LTIuNywxLjgtNS4zLDIuNy03LjRjLTUuMiwzLjQtOS44LDgtMTMuMywxMy43QzEwLjgsMjcuOSw5LjgsMjkuNyw5LDMxLjZ6Ii8+Cgk8cGF0aCBkPSJNMTUuNCw1NC43Yy0yLjYtMS02LjEsMC43LTkuNywzLjRjMS4yLDYuNiwzLjksMTMsOCwxOC41QzEzLDY5LjMsMTMuNSw2MS44LDE1LjQsNTQuN3oiLz4KCTxwYXRoIGQ9Ik0zOS44LDU3LjZDNTQuMyw2Ni43LDcwLDczLDg2LjUsNzYuNGMwLjYtMC44LDEuMS0xLjYsMS43LTIuNWM0LjgtNy43LDctMTYuMyw2LjgtMjQuOGMtMTMuOC05LjMtMzEuMy04LjQtNDUuOC03LjcgICBjLTkuNSwwLjUtMTcuOCwwLjktMjMuMi0xLjdjLTAuMSwwLjEtMC4yLDAuMy0wLjMsMC40Yy0xLDEuNy0yLDMuNC0yLjksNS4xQzI4LjIsNDkuNywzMy44LDUzLjksMzkuOCw1Ny42eiIvPgoJPHBhdGggZD0iTTI2LjIsODguMmMzLjMsMiw2LjcsMy42LDEwLjIsNC43Yy0zLjUtNi4yLTYuMy0xMi42LTguOC0xOC41Yy0zLjEtNy4yLTUuOC0xMy41LTktMTcuMmMtMS45LDgtMiwxNi40LTAuMywyNC43ICAgQzIwLjYsODQuMiwyMy4yLDg2LjMsMjYuMiw4OC4yeiIvPgoJPHBhdGggZD0iTTMwLjksNzNjMi45LDYuOCw2LjEsMTQuNCwxMC41LDIxLjJjMTUuNiwzLDMyLTIuMyw0Mi42LTE0LjZDNjcuNyw3Niw1Mi4yLDY5LjYsMzcuOSw2MC43QzMyLDU3LDI2LjUsNTMsMjEuMyw0OC42ICAgYy0wLjYsMS41LTEuMiwzLTEuNyw0LjZDMjQuMSw1Ny4xLDI3LjMsNjQuNSwzMC45LDczeiIvPgo8L2c+Cjwvc3ZnPg=="
        default: fatalError("Unhandled icon type")
        }
    }

    var iconURLDark: String {
        switch iconURLTypeCell.segmentedControl.selectedSegmentIndex {
        case 0: return "https://img.icons8.com/ios/344/bookmark--v1.png"
        case 1: return "https://www.svgrepo.com/show/75701/lock.svg"
        case 2: return "data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz48IS0tIFVwbG9hZGVkIHRvOiBTVkcgUmVwbywgd3d3LnN2Z3JlcG8uY29tLCBHZW5lcmF0b3I6IFNWRyBSZXBvIE1peGVyIFRvb2xzIC0tPgo8c3ZnIHdpZHRoPSI4MDBweCIgaGVpZ2h0PSI4MDBweCIgdmlld0JveD0iMCAwIDI0IDI0IiBmaWxsPSJub25lIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPg0KPHBhdGggZmlsbC1ydWxlPSJldmVub2RkIiBjbGlwLXJ1bGU9ImV2ZW5vZGQiIGQ9Ik03LjUgNy4zNzVDNy41IDYuMzM5NDcgOC4zMzk0NyA1LjUgOS4zNzUgNS41QzEwLjQxMDUgNS41IDExLjI1IDYuMzM5NDcgMTEuMjUgNy4zNzVWMTYuNjI1QzExLjI1IDE4LjQ4OSAxMi43NjEgMjAgMTQuNjI1IDIwQzE2LjQ4OSAyMCAxOCAxOC40ODkgMTggMTYuNjI1VjExLjgxMDdMMTkuMjE5NyAxMy4wMzAzTDIwLjI4MDMgMTEuOTY5N0wxNy4yNSA4LjkzOTM0TDE0LjIxOTcgMTEuOTY5N0wxNS4yODAzIDEzLjAzMDNMMTYuNSAxMS44MTA3VjE2LjYyNUMxNi41IDE3LjY2MDUgMTUuNjYwNSAxOC41IDE0LjYyNSAxOC41QzEzLjU4OTUgMTguNSAxMi43NSAxNy42NjA1IDEyLjc1IDE2LjYyNVY3LjM3NUMxMi43NSA1LjUxMTA0IDExLjIzOSA0IDkuMzc1IDRDNy41MTEwNCA0IDYgNS41MTEwNCA2IDcuMzc1VjkuNUg0VjE1SDkuNVY5LjVINy41VjcuMzc1Wk01LjUgMTFWMTMuNUg4VjExSDUuNVoiIGZpbGw9IiMxRjIzMjgiLz4NCjwvc3ZnPg=="
        default: fatalError("Unhandled icon type")
        }
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
                        url: iconURL,
                        urlDark: iconURLDark,
                        size: assetSizeCell.segmentedControl.selectedSegmentIndex == 0 ? .small : .large
                    )
                    : nil
            )
            rows.append(item)
        }
        let content = SheetList(
            id: UUID().uuidString,
            listType: .singleSelection(items: rows),
            autoSubmit: true,
            selectedId: ["1"]
        )

        let configuration = SheetConfiguration(
            header: SheetHeader(
                title: sheetTitle,
                subtitle: sheetSubtitle,
                description: sheetDescription
            ),
            content: [content],
            backgroundViewAccessibilityLabel: "Close"
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
                url: iconURL,
                urlDark: iconURLDark
            )
        case 2:
            icon = .small(
                url: iconURL,
                urlDark: iconURLDark
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
            listType: .informative(items: rows),
            autoSubmit: true,
            selectedId: []
        )

        let configuration = SheetConfiguration(
            header: SheetHeader(
                title: sheetTitle,
                subtitle: sheetSubtitle,
                description: sheetDescription
            ),
            content: [content],
            backgroundViewAccessibilityLabel: "Close"
        )

        return configuration
    }

    var actionListSheet: SheetConfiguration {
        var rows: [ActionListItem] = []

        for index in 1 ... sheetNumElements {
            let item = ActionListItem(
                id: index.description,
                title: "List Item \(index)",
                style: actionStyleCell.segmentedControl.selectedSegmentIndex == 0 ? .normal : .destructive,
                url: iconURL,
                urlDark: iconURLDark
            )

            rows.append(item)
        }
        let content = SheetList(
            id: UUID().uuidString,
            listType: .actionList(items: rows),
            autoSubmit: true,
            selectedId: []
        )

        let configuration = SheetConfiguration(
            header: SheetHeader(
                title: sheetTitle,
                subtitle: sheetSubtitle,
                description: sheetDescription
            ),
            content: [content],
            backgroundViewAccessibilityLabel: "Close"
        )

        return configuration
    }

    var actionSheet: SheetConfiguration {
        var actions = [ActionItem]()
        if primaryActionEnabledCell.isOn {
            actions.append(ActionItem(
                id: UUID().uuidString,
                style: .primary,
                title: "Primary Button"
            ))
        }
        if secondaryActionEnabledCell.isOn {
            actions.append(ActionItem(
                id: UUID().uuidString,
                style: .secondary,
                title: "Secondary Button"
            ))
        }
        if linkActionEnabledCell.isOn {
            actions.append(ActionItem(
                id: UUID().uuidString,
                style: .link,
                title: "Link Button",
                rightImage: .chevron
            ))
        }

        let configuration = SheetConfiguration(
            header: SheetHeader(
                title: sheetTitle,
                subtitle: sheetSubtitle,
                description: sheetDescription
            ),
            content: [SheetList(
                id: UUID().uuidString,
                listType: .actions(items: actions),
                autoSubmit: true,
                selectedId: []
            )],
            backgroundViewAccessibilityLabel: "Close"
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
        case .imageType: return "Image format"
        case .actionStyle: return "Action style"
        case .actions: return "Actions"
        case .showSheet: return nil
        }
    }
}
