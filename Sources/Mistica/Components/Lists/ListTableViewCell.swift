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
    public var shouldSetSelectedBeCalled = false
    private lazy var cellSeparatorView = SeparatorView(axis: .horizontal)

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

    /// Cell accessibility type.
    /// - Possible values:
    ///   - .interactive: Interactive cell (e.g: navigates when tap). Whole cell will be focused. Parameter: AccessibilityListCellInteractiveData
    ///     - AccessibilityListCellInteractiveData.label: Optional label to be read instead of default one
    ///     - AccessibilityListCellInteractiveData.action: Custom action associated to double tap (e.g: toggle switch)
    ///   - .doubleInteraction: Double interaction: (e.g: navigates when tap on cell and a custom button in the controlView). Two elements focused: center view and control view. Parameter: AccessibilityListCellInteractiveData
    ///     - AccessibilityListCellInteractiveData.label: Optional label to be read instead of default one for main content (center view)
    ///     - AccessibilityListCellInteractiveData.action: Custom action associated to double tap on main content (center view)
    ///   - case informative: Informative cell. Each cell element will be focused/read individually
    ///   - case customInformative(String): Whole cell will be focused/read using the string parameter as accessibility label
    public var accessibilityType: AccessibilityListCellType = .default {
        didSet {
            accessibilityTypeUpdated()
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

    override public func setSelected(_ selected: Bool, animated: Bool) {
        // Do nothing
        super.setSelected(selected, animated: animated)
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
//        backgroundColor = .background
        let view = UIView()
        view.backgroundColor = .background
        backgroundView = view
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

    func accessibilityTypeUpdated() {
        listCellContentView.accessibilityType = accessibilityType

        // When `isAccessibilityElement = true` then the whole cell is focused as one block
        // and when `isAccessibilityElement = false` then all the cell elements would be focused individually
        // or just the elements specified in the accessibilityElements property if defined
        switch accessibilityType {
        case .interactive(let accessibilityInteractiveData):
            isAccessibilityElement = true
            // Set accessibility label to the provided one or the default one if not provided
            accessibilityLabel = accessibilityInteractiveData.label ?? defaultAccessibilityLabel
        case .doubleInteraction:
            // Cell has to have two focusable blocks: center section (main data) and right section (extra element like a button) => isAccessibilityElement = false
            // and delegate focus management to subviews
            isAccessibilityElement = false
            accessibilityLabel = nil
        case .informative:
            isAccessibilityElement = false
            accessibilityLabel = nil
        case .customInformative(let accessibilityText):
            isAccessibilityElement = true
            // Set accessibility label to the provided custom one
            accessibilityLabel = accessibilityText
        }
    }
}
