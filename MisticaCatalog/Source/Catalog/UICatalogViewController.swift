//
//  UICatalogViewController.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

import Mistica
import UIKit

private enum UICatalogRow: Int, CaseIterable {
    case badge
    case buttons
    case checkBox
    case controls
    case crouton
    case feedbacks
    case fonts
    case forms
    case header
    case highlightedCard
    case inputFields
    case lists
    case radioButton
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
    private let brandsSegmentedControl = UISegmentedControl()
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
        setUp()
        styleViews()
    }

    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override public func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

extension UICatalogViewController: UITableViewDataSource, UITableViewDelegate {
    // MARK: - Table view data source

    public func numberOfSections(in _: UITableView) -> Int {
        2
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 0
        } else {
            return UICatalogRow.allCases.count
        }
    }

    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let v = UIView()
        v.backgroundColor = .background

        if section == 0 {
            let label = UILabel()
            label.text = "Touch and play with\nMística iOS components"
            label.font = .textPreset2(weight: .light)
            label.textColor = UIColor(red: 0, green: 50 / 255, blue: 69 / 255, alpha: 1)
            label.numberOfLines = 0

            v.addSubview(label, constraints: [
                label.leadingAnchor.constraint(equalTo: v.leadingAnchor, constant: 16),
                label.topAnchor.constraint(equalTo: v.topAnchor, constant: 32),
                label.trailingAnchor.constraint(equalTo: v.trailingAnchor, constant: 16),
                label.bottomAnchor.constraint(equalTo: v.bottomAnchor, constant: 32),
                v.heightAnchor.constraint(equalTo: label.heightAnchor, constant: 64) // label height plus top and bottom margins
            ])
        } else {
            v.addSubview(brandsSegmentedControl, constraints: [
                brandsSegmentedControl.centerYAnchor.constraint(equalTo: v.centerYAnchor),
                brandsSegmentedControl.centerXAnchor.constraint(equalTo: v.centerXAnchor)
            ])

            v.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }

        return v
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
        case .radioButton:
            show(UICatalogRadioButtonViewController(), sender: self)
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
        case .checkBox:
            show(UICatalogCheckBoxViewController(), sender: self)
        }
    }
}

private extension UICatalogViewController {
    func styleViews() {
        view.backgroundColor = .background
        navigationController?.navigationBar.applyOpaqueStyleWithoutShadow()
    }

    func setUp() {
        view.addSubview(tableView, constraints: [
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ListCellView.self, forCellReuseIdentifier: Constants.cellReusableIdentifier)

        setUpBrandsSegmentedControl()
    }

    func setUpBrandsSegmentedControl() {
        BrandStyle.allCases.enumerated().forEach { pair in
            brandsSegmentedControl.insertSegment(withTitle: pair.element.rawValue, at: pair.offset, animated: false)

            if pair.element == MisticaConfig.brandStyle {
                brandsSegmentedControl.selectedSegmentIndex = pair.offset
            }
        }

        brandsSegmentedControl.addTarget(self, action: #selector(didValueChange(_:)), for: .valueChanged)
    }

    @objc func didValueChange(_ segment: UISegmentedControl) {
        let newBrandStyle = BrandStyle.allCases[segment.selectedSegmentIndex]

        MisticaConfig.brandStyle = newBrandStyle
        MisticaConfig.styleControls(MisticaControlStyle.allCases)
        tableView.reloadData()

        // Force update `UIAppearance` changes
        UIApplication.shared.windows.forEach { $0.reload() }
        styleViews()
    }
}

private extension UICatalogRow {
    var title: String {
        switch self {
        case .buttons:
            return "Buttons"
        case .feedbacks:
            return "Feedbacks"
        case .checkBox:
            return "CheckBox"
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
        case .radioButton:
            return "Radio Button"
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
        case .checkBox:
            return .controlsIcon
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
        case .radioButton:
            return .controlsIcon
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
