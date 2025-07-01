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

public class TitleView: UIView {
    public enum Style {
        case title1
        case title2
        case title3
        case title4

        var font: UIFont {
            switch self {
            case .title1:
                return .textPreset1(weight: .title1)
            case .title2:
                return .textPreset3(weight: .title2)
            case .title3:
                return .textTitle3()
            case .title4:
                return .textPreset6()
            }
        }

        var textColor: UIColor {
            switch self {
            case .title1:
                return .textSecondary
            case .title2,
                 .title3,
                 .title4:
                return .textPrimary
            }
        }

        func format(text: String?) -> String? {
            switch self {
            case .title1:
                return text?.uppercased()
            case .title2,
                 .title3,
                 .title4:
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

    override public init(frame: CGRect) {
        super.init(frame: frame)

        commonInit()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)

        commonInit()
    }
}

// MARK: - Accessibility

public extension TitleView {
    var titleAccessibilityTraits: UIAccessibilityTraits {
        get {
            titleLabel.accessibilityTraits
        }
        set {
            titleLabel.accessibilityTraits = newValue
        }
    }
}

// MARK: - Private methods

private extension TitleView {
    func commonInit() {
        layoutViews()
        updateStyle()
    }

    func updateStyle() {
        backgroundColor = .background

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
        linkLabel.isUserInteractionEnabled = true
        linkLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(linkLabelTapped)))

        let stackView = UIStackView(arrangedSubviews: [
            titleLabel,
            linkLabel
        ])
        stackView.spacing = 16
        stackView.alignment = .firstBaseline

        preservesSuperviewLayoutMargins = false
        addSubview(constrainedToLayoutMarginsGuideOf: stackView)
        directionalLayoutMargins = NSDirectionalEdgeInsets(
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
            return .title3
        case .blau, .o2New, .vivo, .custom, .vivoNew, .telefonica, .tu:
            return .title1
        }
    }
}
