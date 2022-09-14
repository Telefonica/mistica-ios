//
//  BottomSheetView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import UIKit

public class BottomSheetView: UIView {
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

    private let config: BottomSheetConfiguration
    private var contentInfo: [String: [String: RadioButton]] = [:]
    private var contentSelected: [SheetResponseResult] = []
    public var dismissBottomSheet: (() -> Void)?
    private var isDismissing: Bool = false
    public var bottomSheetSelectionResponse: BottomSheetSelectionResponse

    private class ItemInformationTapGesture: UITapGestureRecognizer {
        var contentId: String = ""
        var itemId: String = ""
        var autoSubmit: Bool = false
    }

    public init(configuration: BottomSheetConfiguration) {
        config = configuration
        // Initial value for a dismissed response
        bottomSheetSelectionResponse = .init(
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

private extension BottomSheetView {
    func setupView() {
        backgroundColor = .white

        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        let wrapperView = UIView()
        scrollView.addSubview(wrapperView)
        wrapperView.translatesAutoresizingMaskIntoConstraints = false

        let contentStackView = UIStackView()
        contentStackView.axis = .vertical
        contentStackView.distribution = .fill
        contentStackView.alignment = .leading
        contentStackView.spacing = 16.0
        contentStackView.translatesAutoresizingMaskIntoConstraints = false

        // Header section for bottom sheet information
        let headerStackView = UIStackView()
        headerStackView.axis = .vertical
        headerStackView.distribution = .fill
        headerStackView.alignment = .leading
        headerStackView.spacing = 4.0

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalToConstant: 20.0)
        ])
        headerStackView.addArrangedSubview(titleLabel)

        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subtitleLabel.heightAnchor.constraint(equalToConstant: 20.0)
        ])
        headerStackView.addArrangedSubview(subtitleLabel)

        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.heightAnchor.constraint(equalToConstant: 20.0)
        ])
        headerStackView.addArrangedSubview(descriptionLabel)

        // Section for every item in bottom sheet request content
        let itemsStackView = UIStackView()
        itemsStackView.axis = .vertical
        itemsStackView.distribution = .equalSpacing
        itemsStackView.alignment = .leading
        itemsStackView.spacing = 8.0
        itemsStackView.translatesAutoresizingMaskIntoConstraints = false

        for content in config.content {
            contentInfo[content.id] = [:]
            for item in content.items {
                let itemStackView = UIStackView()
                // Stack View
                itemStackView.axis = .horizontal
                itemStackView.distribution = .fill
                itemStackView.alignment = .center
                itemStackView.spacing = 16.0

                let itemTapGesture = ItemInformationTapGesture(target: self, action: #selector(selectItem(_:)))
                itemTapGesture.contentId = content.id
                itemTapGesture.itemId = item.id
                itemTapGesture.autoSubmit = content.autoSubmit ?? false
                itemStackView.addGestureRecognizer(itemTapGesture)

                if let icon = item.icon {
                    let imageView = UIImageView()
                    imageView.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
                    imageView.widthAnchor.constraint(equalToConstant: 30.0).isActive = true
                    imageView.contentMode = .scaleAspectFit
                    imageView.image = icon
                    itemStackView.addArrangedSubview(imageView)
                }

                let elementTextStackView = UIStackView()
                elementTextStackView.axis = .vertical
                elementTextStackView.distribution = .fill
                elementTextStackView.alignment = .leading

                let titleElementLabel = UILabel()
                titleElementLabel.heightAnchor.constraint(equalToConstant: 25.0).isActive = true
                titleElementLabel.text = item.title
                titleElementLabel.numberOfLines = 1
                titleElementLabel.textColor = .textPrimary
                titleElementLabel.font = .textPreset3(weight: .regular)
                titleElementLabel.textAlignment = .left
                elementTextStackView.addArrangedSubview(titleElementLabel)

                if let description = item.description {
                    let descriptionElementLabel = UILabel()
                    descriptionElementLabel.heightAnchor.constraint(equalToConstant: 25.0).isActive = true
                    descriptionElementLabel.text = description
                    descriptionElementLabel.numberOfLines = 1
                    descriptionElementLabel.textColor = .textSecondary
                    descriptionElementLabel.font = .textPreset2(weight: .regular)
                    descriptionElementLabel.textAlignment = .left
                    elementTextStackView.addArrangedSubview(descriptionElementLabel)
                }

                itemStackView.addArrangedSubview(elementTextStackView)

                let radioButton = RadioButton()
                radioButton.isActivated = item.id == content.selectedId
                radioButton.isUserInteractionEnabled = false
                radioButton.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
                radioButton.widthAnchor.constraint(equalToConstant: 20.0).isActive = true

                contentInfo[content.id]?[item.id] = radioButton
                itemStackView.addArrangedSubview((contentInfo[content.id]?[item.id])!)
                itemsStackView.addArrangedSubview(itemStackView)

                let divider = UIView()
                divider.backgroundColor = .divider
                itemsStackView.addArrangedSubview(divider)
                divider.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
                divider.widthAnchor.constraint(equalTo: itemStackView.widthAnchor).isActive = true

                itemStackView.widthAnchor.constraint(equalTo: itemsStackView.widthAnchor).isActive = true
            }
        }

        contentStackView.addArrangedSubview(headerStackView)
        contentStackView.addArrangedSubview(itemsStackView)
        addSubview(scrollView)
        scrollView.addSubview(wrapperView)
        wrapperView.addSubview(contentStackView)

        // Set bottom sheet maximum height in 70% of device screen height.
        let scrollHeightMax = scrollView.heightAnchor.constraint(lessThanOrEqualToConstant: UIScreen.main.bounds.height * 0.7)
        scrollHeightMax.priority = .required
        scrollHeightMax.isActive = true

        let scrollHeight = scrollView.heightAnchor.constraint(equalTo: wrapperView.heightAnchor)
        scrollHeight.priority = .defaultHigh
        scrollHeight.isActive = true

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor, constant: 16.0),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),

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
                bottomSheetSelectionResponse.action = .submit
                bottomSheetSelectionResponse.selectedIds = contentSelected
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.dismissBottomSheet?()
                }
            }
        }
    }
}
