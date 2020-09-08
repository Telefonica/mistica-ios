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
    case badge
    case buttons
    case controls
    case crouton
    case feedbacks
    case fonts
    case forms
    case header
    case highlightedCard
    case inputFields
    case lists
    case scrollContentIndicator
    case sectionTitle
    case segmentSelector
    case tag
    case tooltip
    case viewStates
}

private enum Constants {
    static let cellReusableIdentifier = "catalog-cell"
}

public class UICatalogViewController: UIViewController {
    private let headerView = BrandStyleSelectorView()
    private let tableView = ListView()

    public var showBrandSelector = true {
        didSet {
            headerView.showBrandSelector = showBrandSelector
            view.setNeedsLayout()
        }
    }

    public init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.applyOpaqueStyleWithoutShadow()

        setUp()
    }

    override public func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }

    override public func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillDisappear(animated)
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
        cell.assetImage = catalogRow.icon
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
        case .controls:
            show(UICatalogControlsViewController(), sender: self)
        case .highlightedCard:
            show(UICatalogHighlightedCardViewController(), sender: self)
        }
    }
}

private extension UICatalogViewController {
    func setUp() {
        view.addSubview(headerView, constraints: [
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            headerView.heightAnchor.constraint(equalToConstant: 200)
        ])
        view.addSubview(tableView, constraints: [
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 5),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ListCellView.self, forCellReuseIdentifier: Constants.cellReusableIdentifier)

        styleViews()

        headerView.didSelectBrandStyle = { [weak self] newValue in
            MisticaConfig.brandStyle = newValue
            MisticaConfig.styleControls(MisticaControlStyle.allCases)
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
        case .controls:
            return "Controls"
        case .highlightedCard:
            return "HighlightedCard"
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
        case .controls:
            return .controlsIcon
        case .highlightedCard:
            return .highlightedCardIcon
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
