//
//  SingleSelectionRow.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import UIKit

class SingleSelectionRowView: UIView {
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = .init(top: 16, left: 0, bottom: 0, right: 0)
        return stackView
    }()

    private lazy var radioButton: RadioButton = {
        let radioButton = RadioButton()
        radioButton.isUserInteractionEnabled = false
        return radioButton
    }()

    private lazy var titleLabel: IntrinsictHeightLabel = {
        let titleElementLabel = IntrinsictHeightLabel()
        titleElementLabel.minHeight = 20
        titleElementLabel.text = item.title
        titleElementLabel.numberOfLines = 0
        titleElementLabel.textColor = .textPrimary
        titleElementLabel.font = .textPreset3(weight: .regular)
        return titleElementLabel
    }()

    private lazy var descriptionLabel: IntrinsictHeightLabel? = {
        if let description = item.description {
            let descriptionElementLabel = IntrinsictHeightLabel()
            descriptionElementLabel.minHeight = 20
            descriptionElementLabel.text = description
            descriptionElementLabel.numberOfLines = 0
            descriptionElementLabel.textColor = .textSecondary
            descriptionElementLabel.font = .textPreset2(weight: .regular)
            return descriptionElementLabel
        }

        return nil
    }()

    let item: SingleSelectionItem

    init(item: SingleSelectionItem) {
        self.item = item

        super.init(frame: .zero)

        commonInit()
    }

    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SingleSelectionRowView {
    var isSelected: Bool {
        get {
            radioButton.isActivated
        }
        set {
            radioButton.isActivated = newValue
        }
    }
}

private extension SingleSelectionRowView {
    func commonInit() {
        addSubview(withDefaultConstraints: stackView)

        let itemStackView = UIStackView()
        itemStackView.spacing = 16.0
        itemStackView.alignment = .center

        if let icon = item.icon {
            let imageView = IntrinsictImageView()
            imageView.intrinsicWidth = icon.size.value
            imageView.intrinsicHeight = icon.size.value
            imageView.contentMode = .scaleAspectFit
            load(icon: icon, in: imageView)
            itemStackView.addArrangedSubview(imageView)
        }

        let elementTextStackView = UIStackView()
        elementTextStackView.axis = .vertical
        elementTextStackView.spacing = 2

        elementTextStackView.addArrangedSubview(titleLabel)

        if let descriptionLabel = descriptionLabel {
            elementTextStackView.addArrangedSubview(descriptionLabel)
        }

        itemStackView.addArrangedSubview(elementTextStackView)
        itemStackView.addArrangedSubview(CenterView(arrangedSubview: radioButton, axis: .vertical))

        stackView.addArrangedSubview(itemStackView)
        stackView.addArrangedSubview(SeparatorView(axis: .horizontal))
    }

    func load(icon: SingleSelectionItemIcon, in imageView: UIImageView) {
        guard let url = URL(string: icon.url) else { return }
        if let urlDark = icon.urlDark,
           let urlForDarkMode = URL(string: urlDark) {
            imageView.load(url: url, urlForDarkMode: urlForDarkMode)
        } else {
            imageView.load(url: url)
        }
    }
}

extension SingleSelectionRowView: Touchable {
    func touchBegan() {
        backgroundColor = .backgroundAlternative
        
    }
    
    func touchEnded() {
        backgroundColor = .background
    }
}
