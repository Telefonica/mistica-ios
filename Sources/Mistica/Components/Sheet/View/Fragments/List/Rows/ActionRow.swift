//
//  ActionRow.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

class ActionRow: UIStackView {
    let item: ActionListItem

    init(item: ActionListItem) {
        self.item = item

        super.init(frame: .zero)

        commonInit()
    }

    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private let titleLabel: IntrinsictHeightLabel = {
        let label = IntrinsictHeightLabel()
        label.minHeight = 72
        label.numberOfLines = 0
        label.textColor = .textPrimary
        return label
    }()

    lazy var iconImageView: IntrinsictImageView = {
        let image = IntrinsictImageView()
        image.contentMode = .scaleAspectFit
        image.intrinsicWidth = 24
        image.intrinsicHeight = 24
        return image
    }()
}

private extension ActionRow {
    func commonInit() {
        layoutViews()

        titleLabel.text = item.title

        let imageTintColor: UIColor

        switch item.style {
        case .destructive:
            titleLabel.textColor = .textLinkDanger
            imageTintColor = .textLinkDanger
        case .normal:
            titleLabel.textColor = .textPrimary
            imageTintColor = .neutralHigh
        }

        if let url = item.url {
            load(url: url, urlDark: item.urlDark, in: iconImageView)
            iconImageView.tintColor = imageTintColor
        } else {
            iconImageView.isHidden = true
        }
    }

    func layoutViews() {
        spacing = 16
        alignment = .center
        backgroundColor = .backgroundContainer

        addArrangedSubview(iconImageView)
        addArrangedSubview(titleLabel)
    }

    func load(url: String, urlDark: String?, in imageView: UIImageView) {
        guard let url = URL(urlString: url) else { return }
        if let urlDark = urlDark,
           let urlForDarkMode = URL(urlString: urlDark) {
            imageView.load(url: url, urlForDarkMode: urlForDarkMode, renderAsTemplate: true)
        } else {
            imageView.load(url: url, renderAsTemplate: true)
        }
    }
}

extension ActionRow: Touchable {
    func touchBegan() {
        backgroundColor = .backgroundAlternative
    }

    func touchEnded() {
        backgroundColor = .backgroundContainer
    }
}
