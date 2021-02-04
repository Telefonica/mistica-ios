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
    private lazy var tabItemSelectedTitleCell: UITextFieldTableViewCell = {
        let cell = UITextFieldTableViewCell(reuseIdentifier: "tabItemSelectedTitleCell")
        cell.textField.text = currentSelectedTabItems?.title
        return cell
    }()
    
    private lazy var tabItemSelectedIconCell: UISwitchTableViewCell = {
        let cell = UISwitchTableViewCell(reuseIdentifier: "tabItemSelectedIconCell")
        cell.isOn = currentSelectedTabItems?.icon != nil ? true : false
        cell.textLabel?.text = "Show icon"
        return cell
    }()
    
    private lazy var updateTabItemSelectedCell: UITableViewCell = {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "updateTabItemSelectedCell")
        cell.textLabel?.textColor = .link
        cell.textLabel?.text = "Update Item"
        return cell
    }()
    
    private lazy var removeTabItemSelectedCell: UITableViewCell = {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "removeTabsItemSelectedCell")
        cell.textLabel?.textColor = .textDanger
        cell.textLabel?.text = "Remove Item"
        return cell
    }()
    
    private var currentTabItems = TabsDataset.twoItems.tabItems
    private var currentSelectedTabItems: TabItem?
    private let tabs: TabsView
    private let optionsTable: UITableView
    private let datasetsCells: [TabsDataset] = [
        .twoItems,
        .threeItems,
        .fourItems
    ]
    private lazy var tabItemSelectedCells = [
        tabItemSelectedTitleCell,
        tabItemSelectedIconCell,
        updateTabItemSelectedCell,
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
        guard indexPath.section + 1 == Section.allCases.count else { return }
        
        switch indexPath.row {
        case 2:
            updateTabItem()
        case 3:
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
    static let eSports = TabItem(title: "eSports", icon: nil)
    static let movies = TabItem(title: "Movies", icon: "🎲")
    static let offers = TabItem(title: "Offers", icon: "🎲")
    static let television = TabItem(title: "Television", icon: "🎲")
}

private enum Section: Int, CaseIterable {
    case dataSet
    case tabItemSelected
}

private struct TabsDataset {
    let title: String
    let tabItems: [TabItem]
    
    static let twoItems = TabsDataset(title: "Two items", tabItems: [.eSports, .movies])
    static let threeItems = TabsDataset(title: "Three items", tabItems: [.eSports, .movies, .offers])
    static let fourItems = TabsDataset(title: "Four items", tabItems: [.eSports, .movies, .offers, .television])
}

// MARK: - Private methods

private extension UICatalogTabsViewController {
    func setUp() {
        setUpTabs()
        setUpOptionsTable()
    }
    
    func setUpTabs() {
        view.backgroundColor = .white

        view.addSubview(tabs, constraints: [
            tabs.topAnchor.constraint(equalTo: view.topAnchor),
            tabs.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabs.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabs.heightAnchor.constraint(equalToConstant: 61)
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

    func updateTabItem() {
        guard let currentSelectedTabItems = currentSelectedTabItems else { return }
        let newTabItem = TabItem(title: tabItemSelectedTitleCell.textLabel?.text ?? "",
                                 icon: tabItemSelectedIconCell.isOn ? "🎲": nil)
        tabs.update(currentSelectedTabItems, newTabItem: newTabItem)
    }
    
    func removeTabItem() {
        guard let currentSelectedTabItems = currentSelectedTabItems else { return }
        tabs.remove(currentSelectedTabItems)
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
