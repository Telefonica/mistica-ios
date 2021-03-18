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
        static let defaultIcon = UIImage.tabsIcon
    }
    
    private lazy var tabItemSelectedTitleCell: UITextFieldTableViewCell = {
        let cell = UITextFieldTableViewCell(reuseIdentifier: "tabItemSelectedTitleCell")
        cell.textField.text = currentSelectedTabItems?.title
        cell.textField.addTarget(self, action: #selector(tabItemSelectedTitleDidChange(_:)),
                                 for: .editingChanged)
        return cell
    }()
    
    private lazy var tabItemSelectedIconCell: UISwitchTableViewCell = {
        let cell = UISwitchTableViewCell(reuseIdentifier: "tabItemSelectedIconCell")
        cell.isOn = currentSelectedTabItems?.icon != nil ? true : false
        cell.textLabel?.text = "Show icon"
        cell.didValueChange = tabItemSelectedIconDidChange
        return cell
    }()
    
    private lazy var removeTabItemSelectedCell: UITableViewCell = {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "removeTabsItemSelectedCell")
        cell.textLabel?.textColor = .buttonDangerBackground
        cell.textLabel?.text = "Remove Item"
        return cell
    }()
    
    private var currentTabItems = TabsDataset.oneItems.tabItems
    private var currentSelectedTabItems: TabItem?
    private let tabs: TabsView
    private let optionsTable: UITableView
    private let datasetsCells: [TabsDataset] = [
        .oneItems,
        .twoItems,
        .twoItemsWithLargeText,
        .twoItemsWithSmallText,
        .threeItems,
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
        currentSelectedTabItems = currentTabItems.first

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
        title = "Tabs"

        setUp()
    }
    
    @objc func tabItemSelectedTitleDidChange(_ textField: UITextField) {
        guard let currentSelectedTabItems = self.currentSelectedTabItems else { return }
        updateCurrentSelectedTabItem(withTitle: textField.text ?? "",
                                     icon: currentSelectedTabItems.icon)
    }
    
    func tabItemSelectedIconDidChange(_ `switch`: UISwitch) {
        guard let currentSelectedTabItems = self.currentSelectedTabItems else { return }
        let icon = `switch`.isOn ? Constants.defaultIcon : nil
        updateCurrentSelectedTabItem(withTitle: currentSelectedTabItems.title,
                                     icon: icon)
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
            tabs.reload(with: datasetsCells[index].tabItems)
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
        currentSelectedTabItems = tabItem
        tabItemSelectedTitleCell.textField.text = tabItem.title
        tabItemSelectedIconCell.isOn = tabItem.icon == nil ? false : true
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
    
    static let oneItems = TabsDataset(title: "One item", tabItems: [.eSports])
    static let twoItems = TabsDataset(title: "Two items", tabItems: [.movies, .eSports])
    static let twoItemsWithLargeText = TabsDataset(title: "Two items with large text", tabItems: [.longText, .longText])
    static let twoItemsWithSmallText = TabsDataset(title: "Two items with small text", tabItems: [.movies, .television])
    static let threeItems = TabsDataset(title: "Three items", tabItems: [.phone, .movies, .television])
    static let sixItems = TabsDataset(title: "Six items", tabItems: [.phone, .eSports, .movies, .offers, .television, .shop])
}

// MARK: - Private methods

private extension UICatalogTabsViewController {
    func setUp() {
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
        guard let currentSelectedTabItems = currentSelectedTabItems else { return }
        tabs.remove(currentSelectedTabItems)
    }
    
    func updateCurrentSelectedTabItem(withTitle title: String, icon: UIImage?) {
        guard let currentSelectedTabItems = self.currentSelectedTabItems else { return }
        let newSelectedTabItem = TabItem(title: title,
                                         icon: icon)
        tabs.update(currentSelectedTabItems, newTabItem: newSelectedTabItem)
        self.currentSelectedTabItems = newSelectedTabItem
    }
}

private extension UITableViewCell {
    func setUp(for dataset: TabsDataset) {
        self.textLabel?.text = dataset.title
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
