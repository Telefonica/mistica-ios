//
//  UICatalogListsViewController.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import Mistica
import UIKit

private enum Section: Int, CaseIterable {
    case layoutStyle
    case text
    case subtitle
    case detailText
    case headline
    case assetStyle
    case controlType
    case show
}

class UICatalogListsViewController: UITableViewController {
    private lazy var layoutStyleCell: UISegmentedControlTableViewCell = {
        let cell = UISegmentedControlTableViewCell(reuseIdentifier: "layoutStyleCell")
        cell.segmentedControl.insertSegment(withTitle: "Full Width", at: 0, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "Boxed", at: 1, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "Boxed Inverse", at: 2, animated: false)
        cell.segmentedControl.selectedSegmentIndex = 0
        return cell
    }()

    private lazy var textCell: UITextFieldTableViewCell = {
        let cell = UITextFieldTableViewCell(reuseIdentifier: "textCell")
        cell.textField.text = "Title"
        return cell
    }()

    private lazy var subtitleCell: UITextFieldTableViewCell = {
        let cell = UITextFieldTableViewCell(reuseIdentifier: "Subtitle")
        cell.textField.text = "Subtitle"
        return cell
    }()

    private lazy var detailTextCell: UITextFieldTableViewCell = {
        let cell = UITextFieldTableViewCell(reuseIdentifier: "detailTextCell")
        cell.textField.text = "Description"
        return cell
    }()

    private lazy var headlineCell: UISegmentedControlTableViewCell = {
        let cell = UISegmentedControlTableViewCell(reuseIdentifier: "headlineCell")
        cell.segmentedControl.insertSegment(withTitle: "None", at: 0, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "Custom View", at: 1, animated: false)
        cell.segmentedControl.selectedSegmentIndex = 0
        return cell
    }()

    private lazy var assetStyleCell: UISegmentedControlTableViewCell = {
        let cell = UISegmentedControlTableViewCell(reuseIdentifier: "assetStyleCell")
        cell.segmentedControl.insertSegment(withTitle: "None", at: 0, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "Large Icon", at: 1, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "Small Icon", at: 2, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "Image", at: 3, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "URL", at: 4, animated: false)
        cell.segmentedControl.selectedSegmentIndex = 0
        return cell
    }()

    private lazy var controlCell: UISegmentedControlTableViewCell = {
        let cell = UISegmentedControlTableViewCell(reuseIdentifier: "controlCell")
        cell.segmentedControl.insertSegment(withTitle: "None", at: 0, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "Navigation", at: 1, animated: false)
        cell.segmentedControl.insertSegment(withTitle: "Custom View", at: 2, animated: false)
        cell.segmentedControl.selectedSegmentIndex = 0
        return cell
    }()

    private lazy var showListCell: UITableViewCell = {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "showListCell")
        cell.textLabel?.textColor = .textLink
        cell.textLabel?.text = "Show List"
        return cell
    }()

    private lazy var cells = [
        [layoutStyleCell],
        [textCell],
        [subtitleCell],
        [detailTextCell],
        [headlineCell],
        [assetStyleCell],
        [controlCell],
        [showListCell]
    ]

    init() {
        if #available(iOS 13.0, *) {
            super.init(style: .insetGrouped)
        } else {
            super.init(style: .grouped)
        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        UITableViewCell.register(on: tableView)
    }
}

extension UICatalogListsViewController {
    override func numberOfSections(in _: UITableView) -> Int {
        Section.allCases.count
    }

    override func tableView(_: UITableView, titleForHeaderInSection section: Int) -> String? {
        Section(rawValue: section)!.headerTitle
    }

    override func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        cells[section].count
    }

    override func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cells[indexPath.section][indexPath.row]
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.section == cells.indices.last! else { return }

        let sampleVC = UICatalogListSampleViewController()

        switch layoutStyleCell.segmentedControl.selectedSegmentIndex {
        case 0:
            sampleVC.cellLayoutStyle = .fullWidth
        case 1:
            sampleVC.cellLayoutStyle = .boxed
        case 2:
            sampleVC.cellLayoutStyle = .boxedInverse
        default:
            break
        }

        sampleVC.text = textCell.textField.text
        if !detailTextCell.textField.text.isEmpty {
            sampleVC.detailText = detailTextCell.textField.text
        }

        if !subtitleCell.textField.text.isEmpty {
            sampleVC.subtitle = subtitleCell.textField.text
        }

        switch assetStyleCell.segmentedControl.selectedSegmentIndex {
        case 0:
            sampleVC.assetType = ListCellContentView.CellAssetType.none
        case 1:
            sampleVC.assetType = .largeIcon(.imageIcon, backgroundColor: .neutralLow)
        case 2:
            sampleVC.assetType = .smallIcon(.imageIcon)
        case 3:
            sampleVC.assetType = .custom(.image(.netflixLogo), size: CGSize(width: 140, height: 80))
        case 4:
            sampleVC.assetType = .custom(.url(URL(string: "https://www.svgrepo.com/show/19461/url-link.svg")!), size: CGSize(width: 64, height: 64))
        default:
            break
        }

        if headlineCell.segmentedControl.selectedSegmentIndex == 1 {
            sampleVC.showHeadline = true
        }

        switch controlCell.segmentedControl.selectedSegmentIndex {
        case 0:
            sampleVC.customControl = .none
        case 1:
            sampleVC.customControl = .navigation
        case 2:
            sampleVC.customControl = .custom
        default:
            break
        }

        show(sampleVC, sender: self)
        tableView.deselectRow(animated: true)
        view.endEditing(true)
    }
}

private extension Section {
    var headerTitle: String? {
        switch self {
        case .text:
            return "Text"
        case .subtitle:
            return "Subtitle"
        case .detailText:
            return "Detail Text"
        case .headline:
            return "Headline"
        case .layoutStyle:
            return "Layout Style"
        case .assetStyle:
            return "Asset Style"
        case .controlType:
            return "Control Type"
        case .show:
            return nil
        }
    }
}

private class UICatalogListSampleViewController: UIViewController, UITableViewDataSource {
    enum CustomControl {
        case none
        case navigation
        case custom
    }

    private let listTableView = ListTableView()

    var text: String?
    var detailText: String?
    var subtitle: String?
    var showHeadline: Bool = false
    var assetType: ListCellContentView.CellAssetType!
    var customControl = CustomControl.none
    var cellLayoutStyle: ListCellContentView.CellStyle!

    let numberOfRows = 30

    override func loadView() {
        let view = UIView()
        view.backgroundColor = .background

        view.addSubview(withDefaultConstraints: listTableView)

        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.largeTitleDisplayMode = .never
        listTableView.dataSource = self
        ListTableViewCell.register(on: listTableView)
    }

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        numberOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ListTableViewCell.dequeueReusableCell(for: indexPath, from: tableView)

        cell.listCellContentView.title = text
        cell.listCellContentView.subtitle = subtitle
        cell.listCellContentView.detailText = detailText
        cell.listCellContentView.assetType = assetType
        cell.listCellContentView.subtitle = subtitle
        cell.listCellContentView.cellStyle = cellLayoutStyle

        if showHeadline {
            cell.listCellContentView.headlineView = TagView(text: "HEADLINE")
        }

        switch customControl {
        case .none:
            cell.listCellContentView.controlView = nil
        case .navigation:
            let navigationPreset = NavigationPresetView()
            navigationPreset.isBadgeHidden = false
            navigationPreset.badgeView.style = .numeric
            navigationPreset.badgeView.value = Int.random(in: 1 ... 10)
            cell.listCellContentView.controlView = navigationPreset
        case .custom:
            cell.listCellContentView.controlView = CustomPresetView()
        }

        cell.isCellSeparatorHidden = indexPath.row == (numberOfRows - 1)

        return cell
    }
}

private class CustomPresetView: UIStackView {
    init() {
        super.init(frame: .zero)
        alignment = .bottom
        let button = Button(title: "test")
        button.isSmall = true

        addArrangedSubview(button)

        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 115).isActive = true
    }

    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
