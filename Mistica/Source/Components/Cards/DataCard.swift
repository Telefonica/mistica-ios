//
//  DataCard.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

import Foundation
import UIKit

public struct DataCardConfiguration {
    let icon: UIImage?
    let headline: String?
    let title: String
    let subtitle: String?
    let detailTitle: String
    let button: DataCardAction?
    let link: DataCardAction?

    public init(
        icon: UIImage? = nil,
        headline: String? = nil,
        title: String,
        subtitle: String? = nil,
        detailTitle: String,
        button: DataCardAction? = nil,
        link: DataCardAction? = nil
    ) {
        self.icon = icon
        self.headline = headline
        self.title = title
        self.subtitle = subtitle
        self.detailTitle = detailTitle
        self.button = button
        self.link = link
    }
}

public struct DataCardAction {
    public let title: String
    public let loadingTitle: String?
    public let tapHandler: (() -> Void)?

    public init(title: String,
                loadingTitle: String?,
                tapHandler: (() -> Void)?) {
        self.title = title
        self.loadingTitle = loadingTitle
        self.tapHandler = tapHandler
    }
}

public class DataCard: UIView {
    private let stackView = UIStackView()

    let iconImageView = IntrinsictImageView()
    lazy var mediaView = CardRichMedia(itemView: iconImageView, topSpacing: 8, bottomSpacing: 8)
    let contentView = CommonCardContent(frame: .zero)
    let actionsView = CardActionsView()

    public var fragmentView: UIView? {
        didSet {
            oldValue?.removeFromSuperview()

            if let view = fragmentView {
                if iconImageView.superview != nil {
                    stackView.insertArrangedSubview(view, at: 2)
                } else if actionsView.superview != nil {
                    stackView.insertArrangedSubview(view, at: 1)
                } else {
                    stackView.addArrangedSubview(view)
                }

                updateSpacingBeforeActions()
            }
        }
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)
        commomInit()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commomInit()
    }

    override public func layoutSubviews() {
        super.layoutSubviews()
        makeRounded(cornerRadius: 4)
    }
}

// MARK: Public

public extension DataCard {
    func configure(with configuration: DataCardConfiguration) {
        iconImageView.image = configuration.icon

        if configuration.icon == nil {
            mediaView.removeFromSuperview()
        } else if mediaView.superview == nil {
            stackView.insertArrangedSubview(mediaView, at: 0)
        }

        contentView.headline = configuration.headline
        contentView.title = configuration.title
        contentView.subtitle = configuration.subtitle
        contentView.detailText = configuration.detailTitle

        actionsView.configureActions(primaryAction: configuration.button, linkAction: configuration.link)

        if actionsView.arrangedSubviews.isEmpty {
            actionsView.removeFromSuperview()
        } else if actionsView.superview == nil {
            stackView.addArrangedSubview(actionsView)

            updateSpacingBeforeActions()
        }
    }

    var iconContentMode: UIView.ContentMode {
        get {
            iconImageView.contentMode
        }
        set {
            iconImageView.contentMode = newValue
        }
    }

    var primaryActionState: Button.State {
        get {
            actionsView.buttonState
        }
        set {
            actionsView.buttonState = newValue
        }
    }

    var linkActionState: Button.State {
        get {
            actionsView.linkState
        }
        set {
            actionsView.linkState = newValue
        }
    }
}

// MARK: Private

private extension DataCard {
    func commomInit() {
        layoutViews()
        styleViews()
    }

    func layoutViews() {
        directionalLayoutMargins = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 24, trailing: 16)
        insetsLayoutMarginsFromSafeArea = false

        addSubview(constrainedToLayoutMarginsGuideOf: stackView)

        stackView.addArrangedSubview(contentView)
        stackView.axis = .vertical

        iconImageView.intrinsicWidth = 40
        iconImageView.intrinsicHeight = 40
    }

    func styleViews() {
        backgroundColor = .background
    }

    func updateSpacingBeforeActions() {
        if let fragmentView = fragmentView {
            stackView.setCustomSpacing(16, after: fragmentView)
        } else {
            stackView.setCustomSpacing(16, after: contentView)
        }
    }
}
