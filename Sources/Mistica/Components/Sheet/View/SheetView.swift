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
    private lazy var titleLabel: UILabel? = {
		if let title = config.header.title {
			let label = UILabel()
			label.text = title
			label.numberOfLines = 0
			label.textColor = .textPrimary
			label.font = .textPreset4(weight: .regular)
			return label
		}
		return nil
    }()

	var titleAccessibilityIdentifier: String? {
		get {
			titleLabel?.accessibilityIdentifier
		}
		set {
			titleLabel?.accessibilityIdentifier = newValue
		}
	}

    private lazy var subtitleLabel: UILabel? = {
		if let subtitle = config.header.subtitle {
			let label = UILabel()
			label.text = subtitle
			label.numberOfLines = 0
			label.textColor = .textPrimary
			label.font = .textPreset2(weight: .regular)
			return label
		}
		return nil
    }()

	var subtitleAccessibilityIdentifier: String? {
		get {
			subtitleLabel?.accessibilityIdentifier
		}
		set {
			subtitleLabel?.accessibilityIdentifier = newValue
		}
	}

    private lazy var descriptionLabel: UILabel? = {
		if let description = config.header.description {
			let label = UILabel()
			label.text = description
			label.numberOfLines = 0
			label.textColor = .textSecondary
			label.font = .textPreset2(weight: .regular)
			return label
		}
		return nil
    }()

	var descriptionAccessibilityIdentifier: String? {
		get {
			descriptionLabel?.accessibilityIdentifier
		}
		set {
			descriptionLabel?.accessibilityIdentifier = newValue
		}
	}

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

        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        let contentStackView = UIStackView()
        contentStackView.axis = .vertical
        contentStackView.distribution = .fill
        contentStackView.alignment = .leading
        contentStackView.spacing = 16.0
        contentStackView.translatesAutoresizingMaskIntoConstraints = false

        // Header section for sheet information
        let headerStackView = UIStackView()
        headerStackView.axis = .vertical
        headerStackView.distribution = .fill
        headerStackView.alignment = .leading
        headerStackView.spacing = 8.0
        headerStackView.translatesAutoresizingMaskIntoConstraints = false

		if let subtitleLabel = subtitleLabel {
			headerStackView.addArrangedSubview(subtitleLabel)
			subtitleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
		}

		if let descriptionLabel = descriptionLabel {
			headerStackView.addArrangedSubview(descriptionLabel)
			descriptionLabel.setContentCompressionResistancePriority(.required, for: .vertical)
		}

        // Section for every item in sheet request content
        let itemsStackView = UIStackView()
        itemsStackView.axis = .vertical
        itemsStackView.distribution = .equalSpacing
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
                containerItemStackView.addGestureRecognizer(itemTapGesture)

                if let icon = item.icon {
                    let imageView = UIImageView()
                    imageView.heightAnchor.constraint(equalToConstant: icon.size.value).isActive = true
                    imageView.widthAnchor.constraint(equalToConstant: icon.size.value).isActive = true
                    imageView.contentMode = .scaleAspectFit
                    if let url = URL(string: icon.url),
                       let data = try? Data(contentsOf: url) {
                        let lightImage = UIImage(data: data)
                        if let iconDark = icon.urlDark,
                           let urlDark = URL(string: iconDark),
                           let dataDark = try? Data(contentsOf: urlDark),
                           let darkImage = UIImage(data: dataDark) {
                            lightImage?.imageAsset?.register(darkImage, with: .init(userInterfaceStyle: .dark))
                        }
                        imageView.image = lightImage
                    }
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
                divider.widthAnchor.constraint(equalTo: itemsStackView.widthAnchor).isActive = true

                itemStackView.widthAnchor.constraint(equalTo: itemsStackView.widthAnchor, constant: -40.0).isActive = true
            }
        }

        let containerView = UIStackView()
		containerView.axis = .vertical
		containerView.distribution = .fill
		containerView.alignment = .leading
		containerView.spacing = 8.0
        containerView.translatesAutoresizingMaskIntoConstraints = false
		addSubview(containerView)

		if let titleLabel = titleLabel {
			titleLabel.setContentCompressionResistancePriority(.required, for: .vertical)

			containerView.addArrangedSubview(titleLabel)
			containerView.addArrangedSubview(scrollView)
			scrollView.addSubview(contentStackView)
			contentStackView.addArrangedSubview(headerStackView)
			contentStackView.addArrangedSubview(itemsStackView)

			NSLayoutConstraint.activate([
				titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 24.0),
				titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16.0),
				titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16.0),
				titleLabel.bottomAnchor.constraint(equalTo: scrollView.topAnchor, constant: -8.0)
			])
		} else {
			containerView.addSubview(scrollView)
			scrollView.addSubview(contentStackView)
			contentStackView.addArrangedSubview(headerStackView)
			contentStackView.addArrangedSubview(itemsStackView)
			NSLayoutConstraint.activate([
				scrollView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 24.0)
			])
		}

        // Set sheet maximum height in 70% of device screen height.
        let scrollHeightMax = scrollView.heightAnchor.constraint(lessThanOrEqualToConstant: UIScreen.main.bounds.height * 0.7)
        scrollHeightMax.priority = .required
        scrollHeightMax.isActive = true

        let scrollHeight = scrollView.heightAnchor.constraint(equalTo: contentStackView.heightAnchor)
        scrollHeight.priority = .defaultHigh
        scrollHeight.isActive = true

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),

            scrollView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16.0),
            scrollView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16.0),
            scrollView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),

            contentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -8.0),
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
