//
//  SheetView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import UIKit

public protocol SheetViewControllerDelegate: AnyObject {
	func sheetViewControllerDidStartDragging(_ sheetViewController: SheetViewController)
	func sheetViewController(
		_ sheetViewController: SheetViewController,
		didDrag percentage: CGFloat
	)
	func sheetViewControllerDidEndDragging(_ selectorViewController: SheetViewController)
}

public class SheetViewController: UIViewController {
	private lazy var titleLabel: UILabel? = {
		if let title = config.header.title {
			let label = UILabel()
			label.text = title
			label.numberOfLines = 0
			label.textAlignment = .left
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

	/// The view displaying a handle on the presented view.
	private let handleView: UIView = {
		let view = UIView()
		view.clipsToBounds = true
		view.layer.cornerRadius = 2.0
		view.backgroundColor = .control
		return view
	}()

	public var completionHandler: ((SheetSelectionResponse) -> Void)?
	public var sheetSelectionResponse: SheetSelectionResponse
	public weak var delegate: SheetViewControllerDelegate?

    private let config: SheetConfiguration
    private var contentInfo: [String: [String: RadioButton]] = [:]
    private var contentSelected: [SheetResponseResult] = []
	private var panGestureBeginningY: CGFloat = 0
	private var isDismissing: Bool = false

    private class ItemInformationTapGesture: UITapGestureRecognizer {
        var contentId: String = ""
        var itemId: String = ""
        var autoSubmit: Bool = false
    }

	public override func viewDidLoad() {
		super.viewDidLoad()

		setupView()

		let gesture = UIPanGestureRecognizer(target: self, action: #selector(didPan(gesture:)))
		view.addGestureRecognizer(gesture)
	}

	public init(configuration: SheetConfiguration, completionHandler: ((SheetSelectionResponse) -> Void)?) {
		self.config = configuration
		self.completionHandler = completionHandler
		// Initial value for a dismissed response
		self.sheetSelectionResponse = .init(
			action: .dismiss,
			selectedIds: config.content.map {
				SheetResponseResult(id: $0.id, selected: ($0.selectedId != nil) ? [$0.selectedId!] : [])
			}
		)

        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

public extension SheetViewController {
    func setupView() {
		view.backgroundColor = .backgroundContainer
		view.makeRounded(cornerRadius: 8.0)

		let containerView = UIStackView()
		containerView.axis = .vertical
		containerView.distribution = .fill
		containerView.alignment = .leading
		containerView.spacing = 8.0
		containerView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(containerView)

		let scrollView = UIScrollView()
		scrollView.showsVerticalScrollIndicator = false
		scrollView.translatesAutoresizingMaskIntoConstraints = false

		let topStackView = UIStackView()
		topStackView.axis = .vertical
		topStackView.distribution = .fill
		topStackView.alignment = .center
		topStackView.spacing = 12.0
		topStackView.translatesAutoresizingMaskIntoConstraints = false

		handleView.translatesAutoresizingMaskIntoConstraints = false
		handleView.heightAnchor.constraint(equalToConstant: 4.0).isActive = true
		handleView.widthAnchor.constraint(equalToConstant: 24.0).isActive = true
		topStackView.addArrangedSubview(handleView)

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

		if let titleLabel = titleLabel {
			titleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
			topStackView.addArrangedSubview(titleLabel)
			containerView.addArrangedSubview(topStackView)
			containerView.addArrangedSubview(scrollView)
			scrollView.addSubview(contentStackView)
			contentStackView.addArrangedSubview(headerStackView)
			contentStackView.addArrangedSubview(itemsStackView)

			NSLayoutConstraint.activate([
				titleLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
				topStackView.bottomAnchor.constraint(equalTo: scrollView.topAnchor, constant: -8.0)
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
		let scrollHeightMax = containerView.heightAnchor.constraint(lessThanOrEqualToConstant: UIScreen.main.bounds.height * 0.7)
		scrollHeightMax.priority = .required
		scrollHeightMax.isActive = true

		let scrollHeight = scrollView.heightAnchor.constraint(equalTo: contentStackView.heightAnchor)
		scrollHeight.priority = .defaultHigh
		scrollHeight.isActive = true

		NSLayoutConstraint.activate([
			containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 8.0),
			containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0),
			containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0),
			containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

			topStackView.widthAnchor.constraint(equalTo: containerView.widthAnchor),

			scrollView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
			scrollView.widthAnchor.constraint(equalTo: containerView.widthAnchor),

			contentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
			contentStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
			contentStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
			contentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
			contentStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

			itemsStackView.widthAnchor.constraint(equalTo: contentStackView.widthAnchor)
		])
    }

	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		if scrollView.contentOffset.y < 0 && scrollView.isTracking {
			let percentage = 2 * -scrollView.contentOffset.y / scrollView.frame.height
			delegate?.sheetViewController(self, didDrag: percentage)
		}
	}

	func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
		delegate?.sheetViewControllerDidStartDragging(self)
	}

	func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
		delegate?.sheetViewControllerDidEndDragging(self)
	}
}

private extension SheetViewController {

	func load(icon: SheetListRowIcon, in imageView: UIImageView) {
		guard let url = URL(string: icon.url) else { return }
		if let urlDark = icon.urlDark,
		   let urlForDarkMode = URL(string: urlDark) {
			imageView.load(url: url, urlForDarkMode: urlForDarkMode)
		} else {
			imageView.load(url: url)
		}
	}

	@objc func didPan(gesture: UIPanGestureRecognizer) {
		if gesture.state == .began {
			panGestureBeginningY = gesture.translation(in: view).y
			delegate?.sheetViewControllerDidStartDragging(self)
		} else if gesture.state == .changed {
			let y = max(0, gesture.translation(in: view).y)
			let percentage = y / view.frame.height
			delegate?.sheetViewController(self, didDrag: percentage)
		} else {
			panGestureBeginningY = 0 // just sanitizing it...
			delegate?.sheetViewControllerDidEndDragging(self)
		}
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
					self.completionHandler?(self.sheetSelectionResponse)
					self.dismiss(animated: true)
				}
			}
		}
	}
}
