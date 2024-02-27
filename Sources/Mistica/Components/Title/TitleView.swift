//
//  TitleView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

private enum ViewStyles {
    static let horizontalMargin: CGFloat = 16
    static let topMargin: CGFloat = 16
    static let bottomMargin: CGFloat = 8
    static let minimumHeight: CGFloat = 40
}

public class TitleView: UITableViewHeaderFooterView {
    public enum Style {
        case title1
        case title2

        var font: UIFont {
            switch self {
            case .title1:
                return .textPreset1(weight: .title1)
            case .title2:
                return .textPreset5()
            }
        }

        var textColor: UIColor {
            switch self {
            case .title1:
                return .textSecondary
            case .title2:
                return .textPrimary
            }
        }

        func format(text: String?) -> String? {
            switch self {
            case .title1:
                return text?.uppercased()
            case .title2:
                return text
            }
        }
    }

    private lazy var titleLabel = UILabel()
    private lazy var linkLabel = UILabel()

    public var onLinkLabelTapped: (() -> Void)?

    public var style: Style = .default {
        didSet {
            updateStyle()
        }
    }

    private var unformattedTitle: String?
    public var title: String? {
        get {
            titleLabel.text
        }
        set {
            unformattedTitle = newValue
            titleLabel.text = style.format(text: newValue)
            layoutIfNeeded()
        }
    }

    public var linkTitle: String? {
        get {
            linkLabel.text
        }
        set {
            linkLabel.text = newValue
            linkLabel.isHidden = newValue?.isEmpty ?? true
            layoutIfNeeded()
        }
    }

    override public init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

        commonInit()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)

        commonInit()
    }

    public init(style: Style, reuseIdentifier: String? = nil) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.style = style

        commonInit()
    }
}

private extension TitleView {
    func commonInit() {
        layoutViews()
        updateStyle()
    }

    func updateStyle() {
        contentView.backgroundColor = .background

        titleLabel.text = style.format(text: unformattedTitle)
        titleLabel.font = style.font
        titleLabel.textColor = style.textColor
        titleLabel.numberOfLines = 0

        linkLabel.font = .textPreset2(weight: .link)
        linkLabel.textColor = .textLink
        linkLabel.isHidden = linkLabel.text?.isEmpty ?? true
    }

    func layoutViews() {
        linkLabel.setContentHuggingPriority(.required, for: .horizontal)
        linkLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
        linkLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(linkLabelTapped)))

        let stackView = UIStackView(arrangedSubviews: [
            titleLabel,
            linkLabel
        ])
        stackView.spacing = 16
        stackView.alignment = .firstBaseline

        preservesSuperviewLayoutMargins = false
        contentView.preservesSuperviewLayoutMargins = false
        contentView.addSubview(constrainedToLayoutMarginsGuideOf: stackView)
        contentView.directionalLayoutMargins = NSDirectionalEdgeInsets(
            top: ViewStyles.topMargin,
            leading: ViewStyles.horizontalMargin,
            bottom: ViewStyles.bottomMargin,
            trailing: ViewStyles.horizontalMargin
        )
    }

    @objc func linkLabelTapped() {
        onLinkLabelTapped?()
    }
}

private extension TitleView.Style {
    static var `default`: Self {
        switch MisticaConfig.brandStyle {
        case .movistar:
            return .title2
        case .blau, .o2, .vivo, .custom, .vivoNew, .telefonica, .tu:
            return .title1
        }
    }
}
