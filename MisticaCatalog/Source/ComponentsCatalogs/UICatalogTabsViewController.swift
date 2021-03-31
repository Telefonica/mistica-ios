//
//  UICatalogTabsViewController.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Mistica
import UIKit

// MARK: - UICatalogTabsViewController

class UICatalogTabsViewController: UIViewController {
    enum Constants {
        static let headerTitle = "Tabs"
        static let defaultIcon = UIImage.tabsIcon
        static let iconTitle = "Show icon"
        static let removeItemButtonTitle = "Remove Item"
    }

    private lazy var tabItemSelectedTitleCell: UITextFieldTableViewCell = {
        let cell = UITextFieldTableViewCell(reuseIdentifier: "tabItemSelectedTitleCell")
        cell.textField.text = currentSelectedTabItems.title
        cell.textField.addTarget(
            self,
            action: #selector(tabItemSelectedTitleDidChange(_:)),
            for: .editingChanged
        )
        cell.textField.addTarget(
            self,
            action: #selector(tabItemSelectedTitleEditingDidEndOnExit(_:)),
            for: .editingDidEndOnExit
        )
        return cell
    }()

    private lazy var tabItemSelectedIconCell: UISwitchTableViewCell = {
        let cell = UISwitchTableViewCell(reuseIdentifier: "tabItemSelectedIconCell")
        cell.isOn = currentSelectedTabItems.icon != nil ? true : false
        cell.textLabel?.text = Constants.iconTitle
        cell.didValueChange = tabItemSelectedIconDidChange
        return cell
    }()

    private lazy var removeTabItemSelectedCell: UITableViewCell = {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "removeTabsItemSelectedCell")
        cell.textLabel?.textColor = .buttonDangerBackground
        cell.textLabel?.text = Constants.removeItemButtonTitle
        return cell
    }()

    private let keyboardNotificationCenter = KeyboardNotificationCenter()
    private var currentSelectedTabItems: TabItem {
        currentTabItems[currentSelectedRow]
    }

    private var currentTabItems = TabsDataset.twoItems.tabItems
    private var currentSelectedRow: Int = 0
    private let tabs: TabsView
    private let optionsTable: UITableView
    private let datasetsCells: [TabsDataset] = [
        .twoItems,
        .twoItemsWithLargeText,
        .twoItemsWithSmallText,
        .threeItems,
        .threeItemsWithLargeText,
        .sixItems
    ]
    private lazy var tabItemSelectedCells = [
        tabItemSelectedTitleCell,
        tabItemSelectedIconCell,
        removeTabItemSelectedCell
    ]

    public init() {
        if #available(iOS 13.0, *) {
            optionsTable = UITableView(frame: .zero, style: .insetGrouped)
        } else {
            optionsTable = UITableView(frame: .zero, style: .grouped)
        }
        tabs = TabsView(tabItems: currentTabItems)

        super.init(nibName: nil, bundle: nil)

        tabs.delegate = self
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = []
        title = Constants.headerTitle

        setUp()
    }

    @objc func tabItemSelectedTitleDidChange(_ textField: UITextField) {
        updateCurrentSelectedTabItem(
            withTitle: textField.text ?? "",
            icon: currentSelectedTabItems.icon
        )
    }

    @objc func tabItemSelectedTitleEditingDidEndOnExit(_ textField: UITextField) {
        textField.resignFirstResponder()
    }

    func tabItemSelectedIconDidChange(_ switch: UISwitch) {
        let icon = `switch`.isOn ? Constants.defaultIcon : nil
        updateCurrentSelectedTabItem(
            withTitle: currentSelectedTabItems.title,
            icon: icon
        )
    }
}

// MARK: - UITableViewDataSource

extension UICatalogTabsViewController: UITableViewDataSource {
    func numberOfSections(in _: UITableView) -> Int {
        Section.allCases.count
    }

    func tableView(_: UITableView, titleForHeaderInSection section: Int) -> String? {
        Section(rawValue: section)!.headerTitle
    }

    func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = Section(rawValue: section) else { return 0 }

        return numberOfRows(In: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = Section(rawValue: indexPath.section) else { fatalError() }

        return cellForRow(at: indexPath.row, section: section, tableView: tableView)
    }

    func tableView(_: UITableView, titleForFooterInSection section: Int) -> String? {
        Section(rawValue: section)!.footerTitle
    }
}

// MARK: - UITableViewDelegate

extension UICatalogTabsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch (indexPath.section, indexPath.row) {
        case(Section.dataSet.rawValue, let index):
            currentTabItems = datasetsCells[index].tabItems
            tabs.reload(with: currentTabItems)
        case (Section.tabItemSelected.rawValue, 2):
            removeTabItem()
        default:
            return
        }

        tableView.deselectRow(animated: true)
        view.endEditing(true)
    }
}

// MARK: - TabsViewDelegate

extension UICatalogTabsViewController: TabsViewDelegate {
    public func tabsView(_ tabsView: TabsView, didSelectTab tabItem: TabItem) {
        currentSelectedRow = currentTabItems.firstIndex(where: { $0 == tabItem }) ?? 0
        tabItemSelectedTitleCell.textField.text = tabItem.title
        tabItemSelectedIconCell.isOn = tabItem.icon != nil
    }
}

// MARK: - Helper

private extension TabItem {
    static let eSports = TabItem(title: "Movistar Spain eSports 2021", icon: .tagsIcon)
    static let movies = TabItem(title: "Movies", icon: .buttonsIcon)
    static let offers = TabItem(title: "Super Summer Offers 2021", icon: .tabsIcon)
    static let television = TabItem(title: "Television", icon: .cardIcon)
    static let phone = TabItem(title: "Phone", icon: .imageIcon)
    static let shop = TabItem(title: "Shop", icon: .fontsIcon)
    static let longText = TabItem(title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit", icon: .fontsIcon)
}

private enum Section: Int, CaseIterable {
    case dataSet
    case tabItemSelected
}

private struct TabsDataset {
    let title: String
    let tabItems: [TabItem]

    static let twoItems = TabsDataset(title: "Two items", tabItems: [.movies, .eSports])
    static let twoItemsWithLargeText = TabsDataset(title: "Two items with large text", tabItems: [.longText, .longText])
    static let twoItemsWithSmallText = TabsDataset(title: "Two items with small text", tabItems: [.movies, .television])
    static let threeItems = TabsDataset(title: "Three items", tabItems: [.phone, .movies, .television])
    static let threeItemsWithLargeText = TabsDataset(title: "Three items with large text", tabItems: [.longText, .longText, .longText])
    static let sixItems = TabsDataset(title: "Six items", tabItems: [.phone, .shop, .television, .offers, .movies, .eSports])
}

// MARK: - Private methods

private extension UICatalogTabsViewController {
    func setUp() {
        startListeningKeyboardNotifications()
        setUpTabs()
        setUpOptionsTable()
        setUpInitialState()
    }

    func setUpTabs() {
        view.backgroundColor = .white

        view.addSubview(tabs, constraints: [
            tabs.topAnchor.constraint(equalTo: view.topAnchor),
            tabs.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabs.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }

    func setUpOptionsTable() {
        view.addSubview(optionsTable, constraints: [
            optionsTable.topAnchor.constraint(equalTo: tabs.bottomAnchor),
            optionsTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            optionsTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            optionsTable.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        optionsTable.dataSource = self
        optionsTable.delegate = self
        optionsTable.rowHeight = UITableView.automaticDimension
        optionsTable.estimatedRowHeight = 50
        optionsTable.register(UITableViewCell.self, forCellReuseIdentifier: "dequeueReusableCell")
    }

    func setUpInitialState() {
        optionsTable.selectRow(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: .top)
    }

    func numberOfRows(In section: Section) -> Int {
        switch section {
        case .dataSet:
            return datasetsCells.count
        case .tabItemSelected:
            return tabItemSelectedCells.count
        }
    }

    func cellForRow(at row: Int, section: Section, tableView: UITableView) -> UITableViewCell {
        switch section {
        case .dataSet:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "dequeueReusableCell") else {
                fatalError()
            }
            cell.setUp(for: datasetsCells[row])
            return cell
        case .tabItemSelected:
            return tabItemSelectedCells[row]
        }
    }

    func removeTabItem() {
        guard currentTabItems.count > 1 else { return }
        currentTabItems.remove(at: currentSelectedRow)
        tabs.remove(currentSelectedRow)
    }

    func updateCurrentSelectedTabItem(withTitle title: String, icon: UIImage?) {
        let newSelectedTabItem = TabItem(
            title: title,
            icon: icon
        )
        tabs.update(currentSelectedTabItems, newTabItem: newSelectedTabItem)
        currentTabItems[currentSelectedRow] = newSelectedTabItem
    }

    func startListeningKeyboardNotifications() {
        keyboardNotificationCenter.subscribe(.willShow) { [weak self] keyboardInfo in
            self?.handleWillShowKeyboardNotification(keyboardInfo: keyboardInfo)
        }

        keyboardNotificationCenter.subscribe(.willHide) { [weak self] keyboardInfo in
            self?.handleWillHideKeyboardNotification(keyboardInfo: keyboardInfo)
        }
    }

    func handleWillShowKeyboardNotification(keyboardInfo: KeyboardInfo) {
        optionsTable.contentInset.bottom = keyboardInfo.frameEnd.height
    }

    func handleWillHideKeyboardNotification(keyboardInfo _: KeyboardInfo) {
        optionsTable.contentInset.bottom = 0
    }
}

private extension UITableViewCell {
    func setUp(for dataset: TabsDataset) {
        textLabel?.text = dataset.title
    }
}

private extension Section {
    var headerTitle: String? {
        switch self {
        case .dataSet:
            return "Test Datasets"
        case .tabItemSelected:
            return "Tabs selected"
        }
    }

    var footerTitle: String? {
        switch self {
        case .dataSet:
            return "Select one of the datasets above to see how it is rendered in the component"
        case .tabItemSelected:
            return ""
        }
    }
}
