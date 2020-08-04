//
//  UICatalogViewController.swift
//  AppCoreKit
//
//  Created by Pablo Carcelén on 26/08/2019.
//  Copyright © 2019 Tuenti Technologies S.L. All rights reserved.
//

import Mistica
import UIKit

private enum UICatalogRow: Int, CaseIterable {
    case buttons
    case feedbacks
    case crouton
    case segmentSelector
    case tooltip
    case viewStates
    case fonts
    case badge
    case inputFields
    case forms
    case scrollContentIndicator
    case tag
    case lists
    case sectionTitle
    case header
}

private enum Constants {
    static let cellReusableIdentifier = "catalog-cell"
}

public class UICatalogViewController: UIViewController {
    private let headerView = BrandStyleSelectorView()
    private let tableView = ListView()

    private let oldBrandStyle: BrandStyle
    
    public var showBrandSelector = true {
        didSet {
            headerView.showBrandSelector = showBrandSelector
            view.setNeedsLayout()
        }
    }

    public init() {
        oldBrandStyle = Mistica.brandStyle
        
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func viewDidLoad() {
        super.viewDidLoad()

        setUp()
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        Mistica.brandStyle = oldBrandStyle
    }
}

extension UICatalogViewController: UITableViewDataSource, UITableViewDelegate {
    // MARK: - Table view data source

    public func numberOfSections(in _: UITableView) -> Int {
        1
    }

    public func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        UICatalogRow.allCases.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellReusableIdentifier, for: indexPath) as! ListCellView

        let catalogRow = UICatalogRow(rawValue: indexPath.row)!

        cell.title = catalogRow.title
        cell.assetImage = catalogRow.icon.withRenderingMode(.alwaysTemplate)
        cell.assetTintColor = .backgroundBrandFirst
        cell.assetSize = .small
        cell.controlView = NavigationPresetView()

        return cell
    }

    // MARK: - Table view delegate

    public func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = UICatalogRow(rawValue: indexPath.row)!
        switch row {
        case .buttons:
            show(UICatalogButtonsViewController(), sender: self)
        case .feedbacks:
            show(UICatalogFeedbacksViewController(), sender: self)
        case .crouton:
            show(UICatalogCroutonViewController(), sender: self)
        case .segmentSelector:
            show(UICatalogSegmentSelectorViewController(), sender: self)
        case .tooltip:
            show(UICatalogPopoverViewController(), sender: self)
        case .viewStates:
            show(UICatalogViewStatesViewController(), sender: self)
        case .fonts:
            show(UICatalogFontsViewController(), sender: self)
        case .badge:
            show(UICatalogBadgeViewController(), sender: self)
        case .inputFields:
            show(UICatalogInputFieldsViewController(), sender: self)
        case .forms:
            show(UICatalogFormViewController(), sender: self)
        case .scrollContentIndicator:
            show(UICatalogScrollContentIndicatorViewController(), sender: self)
        case .tag:
            show(UICatalogTagsViewController(), sender: self)
        case .lists:
            show(UICatalogListsViewController(), sender: self)
        case .sectionTitle:
            show(UICatalogSectionTitleViewController(), sender: self)
        case .header:
            show(UICatalogHeaderViewController(), sender: self)
        }
    }
}

private extension UICatalogViewController {
    func setUp() {
        view.addSubview(headerView, constraints: [
            headerView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 200)
        ])
        view.addSubview(tableView, constraints: [
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor)
        ])

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ListCellView.self, forCellReuseIdentifier: Constants.cellReusableIdentifier)

        styleViews()

        headerView.didSelectBrandStyle = { [weak self] newValue in
            Mistica.brandStyle = newValue
            self?.tableView.reloadData()

            // Force update `UIAppearance` changes
            UIApplication.shared.windows.forEach { $0.reload() }
        }
    }

    func styleViews() {
        view.backgroundColor = .background
    }
}

private extension UICatalogRow {
    var title: String {
        switch self {
        case .buttons:
            return "Buttons"
        case .feedbacks:
            return "Feedbacks"
        case .crouton:
            return "Crouton"
        case .segmentSelector:
            return "Scrollable Segmented Control"
        case .tooltip:
            return "Popover"
        case .viewStates:
            return "View States"
        case .fonts:
            return "Fonts"
        case .badge:
            return "Badge"
        case .inputFields:
            return "InputFields"
        case .forms:
            return "Forms"
        case .scrollContentIndicator:
            return "Scroll Content Indicator"
        case .tag:
            return "Tags"
        case .lists:
            return "Lists"
        case .sectionTitle:
            return "Section Title"
        case .header:
            return "Headers"
        }
    }

    var icon: UIImage {
        switch self {
        case .buttons:
            return .buttonsIcon
        case .feedbacks:
            return .feedbacksIcon
        case .crouton:
            return .croutonIcon
        case .segmentSelector:
            return .segmentSelectorIcon
        case .tooltip:
            return .popoverIcon
        case .viewStates:
            return .viewStatesIcon
        case .fonts:
            return .fontsIcon
        case .badge:
            return .badgeIcon
        case .inputFields:
            return .inputFieldsIcon
        case .forms:
            return .inputFieldsIcon
        case .scrollContentIndicator:
            return .scrollContentIndicatorIcon
        case .tag:
            return .tagsIcon
        case .lists:
            return .listIcon
        case .sectionTitle:
            return .sectionTitleIcon
        case .header:
            return .headerIcon
        }
    }
}

private extension UIWindow {
    func reload() {
        subviews.forEach { view in
            view.removeFromSuperview()
            addSubview(view)
        }
    }
}
