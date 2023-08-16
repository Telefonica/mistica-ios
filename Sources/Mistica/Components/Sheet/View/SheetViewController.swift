//
//  SheetViewController.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import UIKit

public class SheetViewController: UIViewController {
    private lazy var bottomSheetTransitioningDelegate = BottomSheetTransitioningDelegate()

    override public var modalPresentationStyle: UIModalPresentationStyle {
        get {
            .custom
        }
        set {}
    }

    override public var transitioningDelegate: UIViewControllerTransitioningDelegate? {
        get {
            bottomSheetTransitioningDelegate
        }
        set {}
    }

    private lazy var titleLabel: IntrinsictHeightLabel? = {
        if let title = config.header.title {
            let label = IntrinsictHeightLabel()
            label.minHeight = 24
            label.text = title
            label.numberOfLines = 0
            label.textAlignment = .left
            label.textColor = .textPrimary
            label.font = .textPreset5()
            return label
        }
        return nil
    }()

    var titleAccessibilityIdentifier: String? {
        get {
            titleLabel?.accessibilityIdentifier
        }
        set {
            titleLabel?.accessibilityIdentifier = newValue
        }
    }

    private lazy var subtitleLabel: UILabel? = {
        if let subtitle = config.header.subtitle {
            let label = UILabel()
            label.text = subtitle
            label.numberOfLines = 0
            label.textColor = .textPrimary
            label.font = .textPreset3(weight: .regular)
            return label
        }
        return nil
    }()

    var subtitleAccessibilityIdentifier: String? {
        get {
            subtitleLabel?.accessibilityIdentifier
        }
        set {
            subtitleLabel?.accessibilityIdentifier = newValue
        }
    }

    private lazy var descriptionLabel: UILabel? = {
        if let description = config.header.description {
            let label = UILabel()
            label.text = description
            label.numberOfLines = 0
            label.textColor = .textSecondary
            label.font = .textPreset2(weight: .regular)
            return label
        }
        return nil
    }()

    var descriptionAccessibilityIdentifier: String? {
        get {
            descriptionLabel?.accessibilityIdentifier
        }
        set {
            descriptionLabel?.accessibilityIdentifier = newValue
        }
    }

    /// The view displaying a handle on the presented view.
    private let handleView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 2.0
        view.backgroundColor = .control
        return view
    }()

    public var completionHandler: ((SheetSelectionResponse) -> Void)?
    public var sheetSelectionResponse: SheetSelectionResponse

    private let config: SheetConfiguration
    private var contentInfo: [String: [String: RadioButton]] = [:]
    private var contentSelected: [SheetResponseResult] = []

    private class ItemInformationTapGesture: UITapGestureRecognizer {
        var contentId: String = ""
        var itemId: String = ""
        var autoSubmit: Bool = false
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
    }

    public init(configuration: SheetConfiguration, completionHandler: ((SheetSelectionResponse) -> Void)?) {
        config = configuration
        self.completionHandler = completionHandler
        // Initial value for a dismissed response
        sheetSelectionResponse = .init(
            action: .dismiss,
            selectedIds: config.content
                .filter { $0.listType.isInformative == false }
                .map { SheetResponseResult(id: $0.id, selected: $0.selectedId) }
        )

        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        completionHandler?(sheetSelectionResponse)
    }

    override public func loadView() {
        view = UIView()
        setupView()
    }
}

public extension SheetViewController {
    func setupView() {
        view.backgroundColor = .backgroundContainer

        let containerView = UIStackView()
        containerView.axis = .vertical
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)

        let topStackView = UIStackView()
        topStackView.axis = .vertical
        topStackView.distribution = .fill
        topStackView.spacing = 12.0
        topStackView.translatesAutoresizingMaskIntoConstraints = false

        handleView.translatesAutoresizingMaskIntoConstraints = false
        handleView.heightAnchor.constraint(equalToConstant: 4.0).isActive = true
        handleView.widthAnchor.constraint(equalToConstant: 32.0).isActive = true
        topStackView.addArrangedSubview(CenterView(arrangedSubview: handleView, axis: .horizontal))
        containerView.addArrangedSubview(topStackView)

        containerView.setCustomSpacing(8, after: topStackView)

        if let titleLabel = titleLabel {
            titleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
            topStackView.addArrangedSubview(titleLabel)
        }

        let contentStackView = FittingCompressedScrollStackView(arrangedSubviews: [])
        contentStackView.axis = .vertical
        contentStackView.layoutMargins = .zero
        contentStackView.showsVerticalScrollIndicator = false
        containerView.addArrangedSubview(contentStackView)

        // Header section for sheet information
        let headerStackView = UIStackView()
        headerStackView.axis = .vertical
        headerStackView.distribution = .fill
        headerStackView.alignment = .leading
        headerStackView.spacing = 8.0
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.addArrangedSubview(headerStackView)

        contentStackView.stackView.setCustomSpacing(8, after: headerStackView)

        if let subtitleLabel = subtitleLabel {
            headerStackView.addArrangedSubview(subtitleLabel)
            subtitleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        }

        if let descriptionLabel = descriptionLabel {
            headerStackView.addArrangedSubview(descriptionLabel)
            descriptionLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        }

        // Section for every item in sheet request content

        for content in config.content {
            contentStackView.addArrangedSubview(
                ListFragmentView(
                    sheetList: content,
                    didTapItem: { [weak self] tapItem in
                        guard let s = self else { return }
                        s.handleListRowTapped(content, rowTapped: tapItem)
                    }
                )
            )
        }

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 8.0),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0),
            containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

private extension SheetViewController {
    func handleListRowTapped(_ sheetList: SheetList, rowTapped: ListFragmentView.ItemTappedType) {
        if sheetList.autoSubmit {
            switch rowTapped {
            case .actionList(let item):
                sheetSelectionResponse = .init(action: .submit, selectedIds: [.init(id: sheetList.id, selected: [item.id])])
            case .informative:
                sheetSelectionResponse = .init(action: .submit, selectedIds: [])
            case .singleSelection(let item):
                sheetSelectionResponse = .init(action: .submit, selectedIds: [.init(id: sheetList.id, selected: [item.id])])
            case .action(item: let item):
                sheetSelectionResponse = .init(action: .submit, selectedIds: [.init(id: sheetList.id, selected: [item.id])])
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) { [weak self] in
                guard let s = self else { return }
                s.dismiss(animated: true)
            }
        }
    }
}

private class FittingCompressedScrollStackView: ScrollStackView {
    override var intrinsicContentSize: CGSize {
        stackView.systemLayoutSizeFitting(
            CGSize(
                width: UIScreen.main.bounds.width,
                height: UIView.layoutFittingCompressedSize.height
            ),
            withHorizontalFittingPriority: .required,
            verticalFittingPriority: .defaultLow
        )
    }
}
