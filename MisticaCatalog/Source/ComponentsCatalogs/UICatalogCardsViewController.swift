//
//  UICatalogCardsViewController.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Mistica
import UIKit

private enum UICardRow: Int, CaseIterable {
    case highlighted
    case data
    case media
}

private enum Constants {
    static let cellReusableIdentifier = "catalog-card-cell"
}

public class UICatalogCardsViewController: UIViewController {
    private let tableView = ListView()

    public init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        title = "Cards"

        setUp()
        styleViews()
    }
}

extension UICatalogCardsViewController: UITableViewDataSource, UITableViewDelegate {
    // MARK: - Table view data source

    public func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        UICardRow.allCases.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellReusableIdentifier, for: indexPath) as! ListViewCell

        let catalogRow = UICardRow(rawValue: indexPath.row)!

        cell.title = catalogRow.title
        cell.assetType = .smallIcon(catalogRow.icon)
        cell.controlView = NavigationPresetView()

        return cell
    }

    // MARK: - Table view delegate

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = UICardRow(rawValue: indexPath.row)!
        switch row {
        case .highlighted:
            show(UICatalogHighlightedCardViewController(), sender: self)
        case .media:
            show(UICatalogMediaCardViewController(), sender: self)
        case .data:
            show(UICatalogDataCardViewController(), sender: self)
        }
    }
}

private extension UICatalogCardsViewController {
    func styleViews() {
        view.backgroundColor = .background
        navigationController?.navigationBar.applyMisticaStyle()
    }

    func setUp() {
        view.addSubview(tableView, constraints: [
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ListViewCell.self, forCellReuseIdentifier: Constants.cellReusableIdentifier)
    }
}

private extension UICardRow {
    var title: String {
        switch self {
        case .highlighted:
            return "HighlightedCard"
        case .media:
            return "MediaCard"
        case .data:
            return "DataCard"
        }
    }

    var icon: UIImage {
        switch self {
        case .highlighted, .media, .data:
            return .cardIcon
        }
    }
}
