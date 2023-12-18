//
//  ListCellContentView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

protocol ListCellContentTableViewDelegate {
    func cellStyleChanged()
}

// MARK: ListCellContentView

open class ListCellContentView: UIView {
    // MARK: View Styles

    public enum ViewStyles {
        static let horizontalPadding: CGFloat = 16.0
        static let cellWidth: CGFloat = 324.0
    }

    public enum TitleTextColorType {
        case normal
        case danger

        var value: UIColor {
            switch self {
            case .normal:
                return .textPrimary
            case .danger:
                return .textLinkDanger
            }
        }
    }

    @frozen
    public enum CellStyle {
        case fullWidth
        case boxed
        case boxedInverse
    }

    @frozen
    public enum CellAssetType: Equatable {
        public enum Asset: Equatable {
            case image(UIImage)
            case url(URL)
        }

        case none
        case image(Asset, size: CGSize? = nil)
        case smallIcon(UIImage)
        case largeIcon(UIImage, backgroundColor: UIColor)
    }

    // MARK: SubViews

    /// View used in `ListCellStyle.boxed` style for show a rounded border arround the content
    lazy var cellBorderView = UIView()
    private lazy var cellContentView = UIStackView()
    var tableViewDelegate: ListCellContentTableViewDelegate?
    private lazy var leftSection = CellLeftSectionView()
    lazy var centerSection = CellCenterSectionView()

    // MARK: Public

    public var titleLabel: UILabel {
        centerSection.titleLabel
    }

    public var subtitleLabel: UILabel {
        centerSection.subtitleLabel
    }

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

    public var titleTextColorType: TitleTextColorType = .normal {
        didSet {
            centerSection.titleTextColor = titleTextColorType.value
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

    public var cellStyle = CellStyle.fullWidth {
        didSet {
            updateCellStyle()
        }
    }

    public var assetType: CellAssetType = .none {
        didSet {
            updateAssetView()
        }
    }

    public var assetTintColor: UIColor? {
        get {
            leftSection.assetTintColor
        }
        set {
            leftSection.assetTintColor = newValue
        }
    }

    public var assetDelegate: ListCellContentAssetDelegate? {
        get {
            leftSection.delegate
        }
        set {
            leftSection.delegate = newValue
        }
    }

    public var controlView: UIView? {
        didSet {
            oldValue?.removeFromSuperview()

            if let view = controlView {
                if cellStyle == .boxedInverse {
                    view.tintColor = .white
                }

                cellContentView.addArrangedSubview(view)
            }
        }
    }

    public convenience init() {
        self.init(frame: .zero)
    }

    override public init(frame _: CGRect) {
        super.init(frame: .zero)

        commonInit()
    }

    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Custom Accessibilities

public extension ListCellContentView {
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

    var subtitleAccessibilityLabel: String? {
        get {
            centerSection.subtitleLabel.accessibilityLabel
        }
        set {
            centerSection.subtitleLabel.accessibilityLabel = newValue
        }
    }

    var subtitleAccessibilityIdentifier: String? {
        get {
            centerSection.subtitleLabel.accessibilityIdentifier
        }
        set {
            centerSection.subtitleLabel.accessibilityIdentifier = newValue
        }
    }

    var detailAccessibilityLabel: String? {
        get {
            centerSection.detailLabel.accessibilityLabel
        }
        set {
            centerSection.detailLabel.accessibilityLabel = newValue
        }
    }

    var detailAccessibilityIdentifier: String? {
        get {
            centerSection.detailLabel.accessibilityIdentifier
        }
        set {
            centerSection.detailLabel.accessibilityIdentifier = newValue
        }
    }

    var assetAccessibilityLabel: String? {
        get {
            leftSection.accessibilityLabel
        }
        set {
            leftSection.accessibilityLabel = newValue
        }
    }

    var assetAccessibilityIdentifier: String? {
        get {
            leftSection.accessibilityIdentifier
        }
        set {
            leftSection.accessibilityIdentifier = newValue
        }
    }
}

// MARK: Private

private extension ListCellContentView {
    func commonInit() {
        layoutViews()
        updateCellStyle()
    }

    func layoutViews() {
        addSubview(constrainedToLayoutMarginsGuideOf: cellBorderView)
        addSubview(constrainedToLayoutMarginsGuideOf: cellContentView)

        cellContentView.addArrangedSubview(centerSection)
        cellContentView.spacing = ViewStyles.horizontalPadding
    }

    func updateCellStyle() {
        centerSection.titleTextColor = cellStyle.titleTextColor
        centerSection.subtitleTextColor = cellStyle.subtitleTextColor

        cellContentView.isLayoutMarginsRelativeArrangement = true
        cellContentView.directionalLayoutMargins = cellStyle.mainStackViewLayoutMargins

        cellBorderView.backgroundColor = cellStyle.backgroundColor
        cellBorderView.layer.cornerRadius = cellStyle.cornerRadius
        cellBorderView.layer.borderColor = cellStyle.borderColor
        cellBorderView.layer.borderWidth = cellStyle.borderWidth

        if cellStyle == .boxedInverse {
            controlView?.tintColor = .white
        }

        tableViewDelegate?.cellStyleChanged()
    }

    func updateAssetView() {
        guard assetType != .none else {
            leftSection.removeFromSuperview()
            return
        }

        updateAssetAligment()

        leftSection.assetType = assetType

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
