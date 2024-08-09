//
//  ListTableViewCell.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import UIKit

public enum ListCellAccessibilityType {
    case navigation
    case action
    case informative(accessibilityLabel: String?)
}

open class ListTableViewCell: UITableViewCell {
    public var listCellAccessibilityType: ListCellAccessibilityType = .navigation
    public var listCellContentView = ListCellContentView()
    private lazy var cellSeparatorView = SeparatorView(axis: .horizontal)

    public var isCellSeparatorHidden: Bool = true {
        didSet {
            guard listCellContentView.cellStyle != .boxed && listCellContentView.cellStyle != .boxedInverse else { return }

            cellSeparatorView.isHidden = isCellSeparatorHidden
        }
    }

    // MARK: Accessibility properties

    public var fullCellAccessibilityConfig: FullCellAccessibilityConfig? = nil {
        didSet {
            if let fullCellAccessibilityConfig {
                isAccessibilityElement = true
                accessibilityLabel = fullCellAccessibilityConfig.accessibilityLabel
            } else {
                isAccessibilityElement = false
                accessibilityLabel = nil
            }
        }
    }

    public var defaultAccessibilityLabel: String {
        listCellContentView.defaultAccessibilityLabel
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
        fullCellAccessibilityConfig = FullCellAccessibilityConfig(accessibilityLabel: listCellContentView.defaultAccessibilityLabel)
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
        guard let activationAction = fullCellAccessibilityConfig?.activationAction else { return false }

        activationAction()
        return true
    }
}

// MARK: Accessibility

extension ListTableViewCell {
    public func setDefaultFullCellAccessibilityConfig(activationAction: (() -> Void)? = nil) {
        fullCellAccessibilityConfig = FullCellAccessibilityConfig(accessibilityLabel: defaultAccessibilityLabel, activationAction: activationAction)
    }
}

// MARK: ListCellContentTableViewDelegate

extension ListTableViewCell: ListCellContentTableViewDelegate {
    public func cellStyleChanged() {
        listCellContentView.directionalLayoutMargins = listCellContentView.cellStyle.contentViewLayoutMargins
        cellSeparatorView.isHidden = listCellContentView.cellStyle.cellSeparatorIsHidden
    }

    func accessibilityChanged() {
        fullCellAccessibilityConfig?.accessibilityLabel = listCellContentView.defaultAccessibilityLabel
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
