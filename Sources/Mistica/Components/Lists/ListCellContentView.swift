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
    func accessibilityChanged()
}

// MARK: ListCellContentView

open class ListCellContentView: UIView {
    // MARK: Accessibility properties

    var defaultAccessibilityLabel: String {
        let titleText = titleAccessibilityLabel ?? titleAttributedText?.string ?? title
        let subtitleText = subtitleAccessibilityLabel ?? subtitleAttributedText?.string ?? subtitle
        let detailText = detailAccessibilityLabel ?? detailTextAttributedText?.string ?? detailText
        let headlineText = headlineView?.accessibleText

        var accessibilityComponents: [String?] = [
            titleText,
            headlineText,
            subtitleText,
            detailText
        ]

        return accessibilityComponents.compactMap { $0 }.joined(separator: ", ")
    }

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
        case custom(Asset, size: CGSize? = nil)
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
            updateAccessibility()
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
            updateAccessibility()
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
            updateAccessibility()
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
            updateAccessibility()
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
            updateAccessibility()
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
            updateAccessibility()
        }
    }

    public var headlineView: AccessibleTextualView? {
        get {
            centerSection.headlineView
        }
        set {
            centerSection.headlineView = newValue
            updateAssetView()
            updateAccessibility()
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
            if newValue == nil {
                centerSection.titleLabel.accessibilityIdentifier = ListAccessibilityIdentifiers.title.rawValue
            }
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
            if newValue == nil {
                centerSection.subtitleLabel.accessibilityIdentifier = ListAccessibilityIdentifiers.subtitle.rawValue
            }
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
            if newValue == nil {
                centerSection.detailLabel.accessibilityIdentifier = ListAccessibilityIdentifiers.description.rawValue
            }
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
            if newValue == nil {
                leftSection.accessibilityIdentifier = ListAccessibilityIdentifiers.icon.rawValue
            }
        }
    }
}

// MARK: Private

private extension ListCellContentView {
    func commonInit() {
        layoutViews()
        updateCellStyle()
        accessibilityElements = [headlineView, centerSection.titleLabel, centerSection.subtitleLabel, centerSection.detailLabel].compactMap { $0 }
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
        centerSection.detailTextColor = cellStyle.detailTextColor

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

    func updateAccessibility() {
        tableViewDelegate?.accessibilityChanged()
    }
}
