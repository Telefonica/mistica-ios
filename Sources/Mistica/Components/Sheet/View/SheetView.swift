//
//  SheetView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import UIKit

public class SheetView: UIView {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = config.header.title
        label.numberOfLines = 0
        label.textColor = .textPrimary
        label.font = .textPreset4(weight: .regular)
        return label
    }()

    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = config.header.subtitle
        label.numberOfLines = 0
        label.textColor = .textPrimary
        label.font = .textPreset2(weight: .regular)
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = config.header.description
        label.numberOfLines = 0
        label.textColor = .textSecondary
        label.font = .textPreset2(weight: .regular)
        return label
    }()

    private let config: SheetConfiguration
    private var contentInfo: [String: [String: RadioButton]] = [:]
    private var contentSelected: [SheetResponseResult] = []
    public var dismissSheet: (() -> Void)?
    private var isDismissing: Bool = false
    public var sheetSelectionResponse: SheetSelectionResponse

    private class ItemInformationTapGesture: UITapGestureRecognizer {
        var contentId: String = ""
        var itemId: String = ""
        var autoSubmit: Bool = false
    }

    public init(configuration: SheetConfiguration) {
        config = configuration
        // Initial value for a dismissed response
        sheetSelectionResponse = .init(
            action: .dismiss,
            selectedIds: config.content.map {
                SheetResponseResult(id: $0.id, selected: ($0.selectedId != nil) ? [$0.selectedId!] : [])
            }
        )
        super.init(frame: .zero)

        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension SheetView {
    func setupView() {
        backgroundColor = .backgroundContainer
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        let wrapperView = UIView()
        wrapperView.translatesAutoresizingMaskIntoConstraints = false

        let contentStackView = UIStackView()
        contentStackView.axis = .vertical
        contentStackView.distribution = .fill
        contentStackView.alignment = .leading
        contentStackView.spacing = 16.0
        contentStackView.translatesAutoresizingMaskIntoConstraints = false

        // Header section for sheet information
        let headerStackView = UIStackView()
        headerStackView.axis = .vertical
        headerStackView.distribution = .fillEqually
        headerStackView.alignment = .leading
        headerStackView.spacing = 8.0
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        headerStackView.addArrangedSubview(subtitleLabel)
        headerStackView.addArrangedSubview(descriptionLabel)
        subtitleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        descriptionLabel.setContentCompressionResistancePriority(.required, for: .vertical)

        // Section for every item in sheet request content
        let itemsStackView = UIStackView()
        itemsStackView.axis = .vertical
        itemsStackView.distribution = .fill
        itemsStackView.alignment = .leading
        itemsStackView.spacing = 16.0
        itemsStackView.translatesAutoresizingMaskIntoConstraints = false

        for content in config.content {
            contentInfo[content.id] = [:]
            for item in content.items {
                let containerItemStackView = UIStackView()
                containerItemStackView.axis = .horizontal
                containerItemStackView.distribution = .fill
                containerItemStackView.alignment = .center
                containerItemStackView.spacing = 16.0

                let itemStackView = UIStackView()
                itemStackView.axis = .horizontal
                itemStackView.distribution = .fill
                itemStackView.alignment = (item.description != nil) ? .top : .center
                itemStackView.spacing = 16.0

                let itemTapGesture = ItemInformationTapGesture(target: self, action: #selector(selectItem(_:)))
                itemTapGesture.contentId = content.id
                itemTapGesture.itemId = item.id
                itemTapGesture.autoSubmit = content.autoSubmit ?? false
                itemStackView.addGestureRecognizer(itemTapGesture)

                if let icon = item.icon {
                    let imageView = UIImageView()
                    imageView.heightAnchor.constraint(equalToConstant: 24.0).isActive = true
                    imageView.widthAnchor.constraint(equalToConstant: 24.0).isActive = true
                    imageView.contentMode = .scaleAspectFit
                    imageView.image = icon
                    itemStackView.addArrangedSubview(imageView)
                }

                let elementTextStackView = UIStackView()
                elementTextStackView.axis = .vertical
                elementTextStackView.distribution = .fill
                elementTextStackView.alignment = .leading

                let titleElementLabel = UILabel()
                titleElementLabel.text = item.title
                titleElementLabel.numberOfLines = 0
                titleElementLabel.textColor = .textPrimary
                titleElementLabel.font = .textPreset3(weight: .regular)
                titleElementLabel.textAlignment = .left
                titleElementLabel.setContentCompressionResistancePriority(.required, for: .vertical)

                elementTextStackView.addArrangedSubview(titleElementLabel)

                if let description = item.description {
                    let descriptionElementLabel = UILabel()
                    descriptionElementLabel.text = description
                    descriptionElementLabel.numberOfLines = 0
                    descriptionElementLabel.textColor = .textSecondary
                    descriptionElementLabel.font = .textPreset2(weight: .regular)
                    descriptionElementLabel.textAlignment = .left
                    descriptionElementLabel.setContentCompressionResistancePriority(.required, for: .vertical)
                    elementTextStackView.addArrangedSubview(descriptionElementLabel)
                }

                itemStackView.addArrangedSubview(elementTextStackView)
                containerItemStackView.addArrangedSubview(itemStackView)

                let radioButton = RadioButton()
                radioButton.isActivated = item.id == content.selectedId
                radioButton.isUserInteractionEnabled = false
                radioButton.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
                radioButton.widthAnchor.constraint(equalToConstant: 20.0).isActive = true

                contentInfo[content.id]?[item.id] = radioButton
                containerItemStackView.addArrangedSubview((contentInfo[content.id]?[item.id])!)
                itemsStackView.addArrangedSubview(containerItemStackView)

                let divider = UIView()
                divider.backgroundColor = .divider
                itemsStackView.addArrangedSubview(divider)
                divider.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
                divider.widthAnchor.constraint(equalTo: itemStackView.widthAnchor).isActive = true
            }
        }

        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false

        contentStackView.addArrangedSubview(headerStackView)
        contentStackView.addArrangedSubview(itemsStackView)
        addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(scrollView)
        scrollView.addSubview(wrapperView)
        wrapperView.addSubview(contentStackView)

        // Set sheet maximum height in 70% of device screen height.
        let scrollHeightMax = scrollView.heightAnchor.constraint(lessThanOrEqualToConstant: UIScreen.main.bounds.height * 0.7)
        scrollHeightMax.priority = .required
        scrollHeightMax.isActive = true

        let scrollHeight = scrollView.heightAnchor.constraint(equalTo: wrapperView.heightAnchor)
        scrollHeight.priority = .defaultHigh
        scrollHeight.isActive = true

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),

            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 24.0),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16.0),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16.0),

            scrollView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8.0),
            scrollView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16.0),
            scrollView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16.0),
            scrollView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),

            wrapperView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            wrapperView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            wrapperView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            wrapperView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            contentStackView.topAnchor.constraint(equalTo: wrapperView.topAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: wrapperView.bottomAnchor, constant: -8.0),
            contentStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            itemsStackView.widthAnchor.constraint(equalTo: contentStackView.widthAnchor)
        ])
    }

    @objc private func selectItem(_ sender: ItemInformationTapGesture) {
        if let content = contentInfo[sender.contentId], let item = content[sender.itemId] {
            contentSelected.append(.init(id: sender.contentId, selected: [sender.itemId]))
            content.filter { $0.key != sender.itemId }.forEach { $1.isActivated = false }
            item.isActivated = true
            if !isDismissing && sender.autoSubmit {
                isDismissing = true
                sheetSelectionResponse.action = .submit
                sheetSelectionResponse.selectedIds = contentSelected
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.dismissSheet?()
                }
            }
        }
    }
}
