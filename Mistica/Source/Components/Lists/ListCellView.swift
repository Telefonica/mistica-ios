//
//  ListCellView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

import UIKit

// MARK: View Styles

private enum ViewStyles {
    static let horizontalPadding: CGFloat = 16
}

// MARK: ListCellView

open class ListCellView: UITableViewCell {
    @frozen
    public enum AssetSize {
        case none
        case large
        case small
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

    // MARK: SubViews

    /// View used in `ListCellStyle.boxed` style for show a rounded border arround the content
    private lazy var cellBorderView = UIView()
    private lazy var cellContentView = UIStackView()
    /// A cell separator visible only in` ListCellStyle.fullWidth`
    private lazy var cellSeparatorView = SeparatorView(axis: .horizontal)
    private lazy var leftSection = CellLeftSectionView()
    private lazy var centerSection = CellCenterSectionView()

    // MARK: Public

    public var title: String? {
        get {
            centerSection.titleLabel.text
        }
        set {
            centerSection.titleLabel.text = newValue
            updateAssetAligment()
        }
    }

    public var titleNumberOfLines: Int {
        get {
            centerSection.titleLabel.numberOfLines
        }
        set {
            centerSection.titleLabel.numberOfLines = newValue
        }
    }

    public var titleAttributedText: NSAttributedString? {
        get {
            centerSection.titleLabel.attributedText
        }
        set {
            centerSection.titleLabel.attributedText = newValue
        }
    }

    public var subtitle: String? {
        get {
            centerSection.subtitleLabel.text
        }
        set {
            centerSection.subtitleLabel.text = newValue
            centerSection.didSetTextToSubtitleLabel()
            updateAssetView()
        }
    }

    public var subtitleNumberOfLines: Int {
        get {
            centerSection.subtitleLabel.numberOfLines
        }
        set {
            centerSection.subtitleLabel.numberOfLines = newValue
        }
    }

    public var subtitleAttributedText: NSAttributedString? {
        get {
            centerSection.subtitleLabel.attributedText
        }
        set {
            centerSection.subtitleLabel.attributedText = newValue
            centerSection.didSetTextToSubtitleLabel()
        }
    }

    public var detailText: String? {
        get {
            centerSection.detailLabel.text
        }
        set {
            centerSection.detailLabel.text = newValue
            centerSection.didSetTexToDetailText()
            updateAssetView()
        }
    }

    public var detailTextNumberOfLines: Int {
        get {
            centerSection.detailLabel.numberOfLines
        }
        set {
            centerSection.detailLabel.numberOfLines = newValue
        }
    }

    public var detailTextAttributedText: NSAttributedString? {
        get {
            centerSection.detailLabel.attributedText
        }
        set {
            centerSection.detailLabel.attributedText = newValue
            centerSection.didSetTexToDetailText()
        }
    }

    public var headlineView: UIView? {
        get {
            centerSection.headlineView
        }
        set {
            centerSection.headlineView = newValue
            updateAssetView()
        }
    }

    public var assetImage: UIImage? {
        get {
            leftSection.imageView.image
        }
        set {
            leftSection.imageView.image = newValue
        }
    }

    public var listCellStyle = ListCellStyle.fullWidth {
        didSet {
            updateCellStyle()
        }
    }

    public var assetSize: AssetSize = .none {
        didSet {
            updateAssetView()
        }
    }

    public var assetTintColor: UIColor? {
        get {
            leftSection.imageView.tintColor
        }
        set {
            leftSection.imageView.tintColor = newValue
        }
    }

    public var controlView: UIView? {
        didSet {
            oldValue?.removeFromSuperview()

            if let view = controlView {
                cellContentView.addArrangedSubview(view)
            }
        }
    }

    public var isCellSeparatorHidden: Bool = true {
        didSet {
            guard listCellStyle != .boxed else { return }

            cellSeparatorView.isHidden = isCellSeparatorHidden
        }
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

        return CGSize(width: size.width, height: max(size.height, listCellStyle.minHeight))
    }

    override public func setHighlighted(_ highlighted: Bool, animated _: Bool) {
        if highlighted {
            highlightedView.backgroundColor = .rowBackgroundHighlighted
        } else {
            highlightedView.backgroundColor = .background
        }
    }

    override public func setSelected(_: Bool, animated _: Bool) {
        // Do nothing
    }

    override open var isUserInteractionEnabled: Bool {
        didSet {
            centerSection.isUserInteractionEnabled = isUserInteractionEnabled
        }
    }
}

// MARK: Custom Accessibilities

public extension ListCellView {
    var titleAccessibilityLabel: String? {
        get {
            centerSection.titleLabel.accessibilityLabel
        }
        set {
            centerSection.titleLabel.accessibilityLabel = newValue
        }
    }

    var titleAccessibilityIdentifier: String? {
        get {
            centerSection.titleLabel.accessibilityIdentifier
        }
        set {
            centerSection.titleLabel.accessibilityIdentifier = newValue
        }
    }

    var assetAccessibilityLabel: String? {
        get {
            leftSection.imageView.accessibilityLabel
        }
        set {
            leftSection.imageView.accessibilityLabel = newValue
        }
    }

    var assetAccessibilityIdentifier: String? {
        get {
            leftSection.imageView.accessibilityIdentifier
        }
        set {
            leftSection.imageView.accessibilityIdentifier = newValue
        }
    }
}

// MARK: Private

private extension ListCellView {
    var highlightedView: UIView {
        switch listCellStyle {
        case .fullWidth:
            return contentView
        case .boxed:
            return cellBorderView
        }
    }

    func commonInit() {
        layoutViews()
        updateCellStyle()
    }

    func layoutViews() {
        contentView.addSubview(constrainedToLayoutMarginsGuideOf: cellBorderView)
        contentView.addSubview(constrainedToLayoutMarginsGuideOf: cellContentView)

        contentView.addSubview(cellSeparatorView, constraints: [
            cellSeparatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cellSeparatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -ViewStyles.horizontalPadding),
            cellSeparatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ViewStyles.horizontalPadding),
            cellSeparatorView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])

        cellContentView.addArrangedSubview(centerSection)
        cellContentView.spacing = ViewStyles.horizontalPadding
    }

    func updateCellStyle() {
        contentView.directionalLayoutMargins = listCellStyle.contentViewLayoutMargins
        contentView.preservesSuperviewLayoutMargins = false

        cellContentView.isLayoutMarginsRelativeArrangement = true
        cellContentView.directionalLayoutMargins = listCellStyle.mainStackViewLayoutMargins

        cellBorderView.backgroundColor = .background
        cellBorderView.layer.cornerRadius = listCellStyle.cornerRadius
        cellBorderView.layer.borderColor = listCellStyle.borderColor
        cellBorderView.layer.borderWidth = listCellStyle.borderWidth

        cellSeparatorView.isHidden = listCellStyle.cellSeparatorIsHidden
    }

    func updateAssetView() {
        guard assetSize != .none else {
            leftSection.removeFromSuperview()
            return
        }

        updateAssetAligment()

        leftSection.assetIsSmall = assetSize == .small

        if leftSection.superview == nil {
            cellContentView.insertArrangedSubview(leftSection, at: 0)
        }
    }

    func updateAssetAligment() {
        if centerSection.headlineView == nil, !centerSection.hasSubtitleText, !centerSection.hasDetailText {
            leftSection.centerAlignment()
        } else {
            leftSection.topAlignment()
        }
    }
}
