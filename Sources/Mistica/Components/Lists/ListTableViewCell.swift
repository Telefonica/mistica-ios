//
//  ListTableViewCell.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import UIKit

open class ListTableViewCell: UITableViewCell {
    public var listCellContentView = ListCellContentView()
    private lazy var cellSeparatorView = SeparatorView(axis: .horizontal)
    private var accessibilityActivationAction: (() -> Void)?

    public var isCellSeparatorHidden: Bool = true {
        didSet {
            guard listCellContentView.cellStyle != .boxed && listCellContentView.cellStyle != .boxedInverse else { return }

            cellSeparatorView.isHidden = isCellSeparatorHidden
        }
    }

    // MARK: Accessibility properties

    public var defaultAccessibilityLabel: String {
        listCellContentView.defaultAccessibilityLabel
    }

    public var accessibilityType: AccessibilityListCellType = .default {
        didSet {
            accessibilityTypeUpdated()
        }
    }

    func accessibilityTypeUpdated() {
        switch accessibilityType {
        case .interactive(let accessibilityInteractiveData):
            isAccessibilityElement = true
            accessibilityLabel = accessibilityInteractiveData.label ?? defaultAccessibilityLabel
            accessibilityActivationAction = accessibilityInteractiveData.action
        case .informative:
            isAccessibilityElement = false
            accessibilityLabel = nil
        case .customInformative(let accessibilityText):
            isAccessibilityElement = true
            accessibilityLabel = accessibilityText
        }
    }

    // MARK: Initializers

    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        commonInit()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)

        commonInit()
    }

    // MARK: UITableViewCell Overrides

    override public func systemLayoutSizeFitting(_ targetSize: CGSize,
                                                 withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority,
                                                 verticalFittingPriority: UILayoutPriority) -> CGSize {
        let size = super.systemLayoutSizeFitting(
            targetSize,
            withHorizontalFittingPriority: horizontalFittingPriority,
            verticalFittingPriority: verticalFittingPriority
        )

        return CGSize(width: size.width, height: max(size.height, listCellContentView.cellStyle.minHeight))
    }

    override public func setHighlighted(_ highlighted: Bool, animated _: Bool) {
        if highlighted {
            highlightedView.backgroundColor = .backgroundAlternative
        } else {
            highlightedView.backgroundColor = .backgroundContainer
        }
    }

    override public func setSelected(_: Bool, animated _: Bool) {
        // Do nothing
    }

    override open var isUserInteractionEnabled: Bool {
        didSet {
            listCellContentView.centerSection.isUserInteractionEnabled = isUserInteractionEnabled
        }
    }

    override open func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        guard traitCollection.userInterfaceStyle != previousTraitCollection?.userInterfaceStyle else { return }
        listCellContentView.cellBorderView.layer.borderColor = listCellContentView.cellStyle.borderColor
    }

    func commonInit() {
        listCellContentView.tableViewDelegate = self
        layoutViews()
        updateCellStyle()
    }

    func layoutViews() {
        listCellContentView.directionalLayoutMargins = listCellContentView.cellStyle.contentViewLayoutMargins
        listCellContentView.preservesSuperviewLayoutMargins = false
        contentView.addSubview(withDefaultConstraints: listCellContentView)

        contentView.addSubview(cellSeparatorView, constraints: [
            cellSeparatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cellSeparatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -ListCellContentView.ViewStyles.horizontalPadding),
            cellSeparatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ListCellContentView.ViewStyles.horizontalPadding),
            cellSeparatorView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }

    func updateCellStyle() {
        backgroundColor = .background
    }

    override public func accessibilityActivate() -> Bool {
        guard case let .interactive(accessibilityInteractiveData) = accessibilityType,
                let action = accessibilityInteractiveData.action else {
            return false
        }

        action()
        return true
    }
}

// MARK: ListCellContentTableViewDelegate

extension ListTableViewCell: ListCellContentTableViewDelegate {
    public func cellStyleChanged() {
        listCellContentView.directionalLayoutMargins = listCellContentView.cellStyle.contentViewLayoutMargins
        cellSeparatorView.isHidden = listCellContentView.cellStyle.cellSeparatorIsHidden
    }

    func accessibilityChanged() {
        accessibilityTypeUpdated()
    }
}

// MARK: Private methods

private extension ListTableViewCell {
    var highlightedView: UIView {
        switch listCellContentView.cellStyle {
        case .fullWidth, .boxedInverse:
            return contentView
        case .boxed:
            return listCellContentView.cellBorderView
        }
    }
}
