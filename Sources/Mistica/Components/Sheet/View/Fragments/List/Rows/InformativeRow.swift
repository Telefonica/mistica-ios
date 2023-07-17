//
//  InformativeRow.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

// MARK: InformativeRow

class InformativeRow: UIView {
    struct Asset {
        let url: String
        let urlDark: String?
        let size: CGSize
    }

    enum AssetAlignment {
        case topLeading
        case centerInTitleHeight
    }

    let item: InformativeItem

    // MARK: Initializers

    init(item: InformativeItem) {
        self.item = item
        super.init(frame: .zero)
        commonInit()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: SubViews

    private let centerSection: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 2
        stackView.alignment = .leading
        stackView.axis = .vertical
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = .init(top: 16, left: 0, bottom: 0, right: 0)
        return stackView
    }()

    private let topContent = TopContentView()

    private let bottomContent: UIStackView = {
        let stackView = UIStackView()
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()

    private let detailLabel: IntrinsictHeightLabel = {
        let label = IntrinsictHeightLabel()
        label.numberOfLines = 0
        label.font = .textPreset2(weight: .regular)
        label.textColor = .textSecondary
        label.minHeight = 20
        return label
    }()
}

// MARK: Private

private extension InformativeRow {
    func commonInit() {
        layoutViews()

        topContent.title = item.title
        topContent.icon = item.icon

        if let detailText = item.description {
            detailLabel.text = detailText
        } else {
            bottomContent.isHidden = true
        }

        bottomContent.layoutMargins.left = item.icon.size.width + 8
    }

    func layoutViews() {
        addSubview(withDefaultConstraints: centerSection)

        bottomContent.addArrangedSubview(detailLabel)

        centerSection.addArrangedSubview(topContent)
        centerSection.addArrangedSubview(bottomContent)
    }
}

private class TopContentView: UIView {
    private var backStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.spacing = 8
        return stackView
    }()

    private var frontStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()

    lazy var iconImageView: IntrinsictImageView = {
        let image = IntrinsictImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()

    private let titleLabel: IntrinsictHeightLabel = {
        let label = IntrinsictHeightLabel()
        label.minHeight = 24
        label.numberOfLines = 0
        label.font = .textPreset3(weight: .regular)
        label.textColor = .textPrimary
        return label
    }()

    private let dummyTitleLabel: IntrinsictHeightLabel = {
        let label = IntrinsictHeightLabel()
        label.minHeight = 24
        label.numberOfLines = 1
        label.font = .textPreset3(weight: .regular)
        label.textColor = .clear
        return label
    }()

    var title: String? {
        didSet {
            dummyTitleLabel.text = title
            titleLabel.text = title
        }
    }

    var icon: InformativeItemIcon = .bullet {
        didSet {
            iconImageView.intrinsicHeight = icon.size.height
            iconImageView.intrinsicWidth = icon.size.width
            frontStackView.layoutMargins.left = icon.size.width + 8

            load(icon: icon, in: iconImageView)

            iconImageView.tintColor = .neutralHigh
        }
    }

    init() {
        super.init(frame: .zero)
        commonInit()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func commonInit() {
        addSubview(backStackView, constraints: [
            backStackView.topAnchor.constraint(equalTo: topAnchor),
            backStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backStackView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
        addSubview(withDefaultConstraints: frontStackView)

        backStackView.addArrangedSubview(iconImageView)
        backStackView.addArrangedSubview(dummyTitleLabel)

        frontStackView.addArrangedSubview(titleLabel)
    }

    func load(icon: InformativeItemIcon, in imageView: UIImageView) {
        switch icon {
        case .bullet:
            imageView.image = .bullet.withRenderingMode(.alwaysTemplate)
        case .small(let url, let urlDark),
             .regular(let url, let urlDark):
            guard let url = URL(string: url) else { return }
            if let urlDark = urlDark,
               let urlForDarkMode = URL(string: urlDark) {
                imageView.load(url: url, urlForDarkMode: urlForDarkMode, renderAsTemplate: true)
            } else {
                imageView.load(url: url, renderAsTemplate: true)
            }
        }
    }
}
