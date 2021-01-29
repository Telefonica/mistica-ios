//
//  UICatalogViewController.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Mistica
import UIKit

private enum UICatalogRow: Int, CaseIterable {
    case badge
    case buttons
    case cards
    case checkbox
    case controls
    case crouton
    case feedbacks
    case fonts
    case forms
    case header
    case inputFields
    case lists
    case radioButton
    case scrollContentIndicator
    case sectionTitle
    case segmentSelector
    case stepper
    case tag
    case tooltip
    case viewStates
}

private enum UICatalogSection: Int, CaseIterable {
    case playAndTouchTitle
    case componentsList
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

    public func numberOfSections(in tableView: UITableView) -> Int {
        UICatalogSection.allCases.count
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch UICatalogSection(rawValue: section)! {
        case .playAndTouchTitle:
            return 0
        case .componentsList:
            return UICatalogRow.allCases.count
        }
    }

    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .background

        switch UICatalogSection(rawValue: section)! {
        case .playAndTouchTitle:
            let label = UILabel()
            label.text = "Touch and play with\nMística iOS components"
            label.font = .textPreset2(weight: .light)
            label.textColor = UIColor(red: 0, green: 50 / 255, blue: 69 / 255, alpha: 1)
            label.numberOfLines = 0

            headerView.addSubview(label, constraints: [
                label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
                label.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 32),
                label.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
                label.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -32)
            ])

        case .componentsList:
            headerView.addSubview(brandsSegmentedControl, constraints: [
                brandsSegmentedControl.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
                brandsSegmentedControl.centerXAnchor.constraint(equalTo: headerView.centerXAnchor)
            ])

            headerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }

        return headerView
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellReusableIdentifier, for: indexPath) as! ListViewCell

        let catalogRow = UICatalogRow(rawValue: indexPath.row)!

        cell.title = catalogRow.title
        cell.assetType = .smallIcon(catalogRow.icon)
        cell.controlView = NavigationPresetView()

        return cell
    }

    // MARK: - Table view delegate

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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
        case .cards:
            show(UICatalogCardsViewController(), sender: self)
        case .checkbox:
            show(UICatalogCheckboxViewController(), sender: self)
        case .stepper:
            show(UICatalogStepperViewController(), sender: self)
        }
    }
}

private extension UICatalogViewController {
    func styleViews() {
        view.backgroundColor = .background
        navigationController?.navigationBar.applyMisticaStyle()
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
        tableView.register(ListViewCell.self, forCellReuseIdentifier: Constants.cellReusableIdentifier)
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = 80

        setUpBrandsSegmentedControl()
    }

    func setUpBrandsSegmentedControl() {
        BrandStyle.allCases.enumerated().forEach { offset, brand in
            brandsSegmentedControl.insertSegment(withTitle: brand.rawValue, at: offset, animated: false)

            if brand == MisticaConfig.brandStyle {
                brandsSegmentedControl.selectedSegmentIndex = offset
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
        let keyWindow = UIApplication.shared.windows.first { $0.isKeyWindow }
        keyWindow?.reload()
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
        case .checkbox:
            return "Checkbox"
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
        case .cards:
            return "Cards"
        case .stepper:
            return "Stepper"
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
        case .checkbox:
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
        case .cards:
            return .cardIcon
        case .stepper:
            return .stepperIcon
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
