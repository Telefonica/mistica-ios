//
//  LoadErrorViewController.swift
//  Mistica
//
//  Created by Guille Gonzalez on 10/09/2018.
//  Copyright © 2018 Tuenti Technologies S.L. All rights reserved.
//

import UIKit

public protocol LoadErrorViewControllerProvider: AnyObject {
	func loadErrorViewController(descriptionText: String) -> LoadErrorViewController
	func loadErrorViewController(title: String?,
	                             descriptionText: String,
	                             showActionButton: Bool) -> LoadErrorViewController

	func loadErrorViewController(title: String?,
	                             descriptionText: String,
	                             actionButtonTitle: String,
	                             showActionButton: Bool) -> LoadErrorViewController
}

/// Manages the view hierarchy for the load error view.
public class LoadErrorViewController: UIViewController {
	// MARK: - Properties

	public weak var delegate: LoadErrorViewControllerDelegate?
	public weak var lifecycleDelegate: LoadErrorViewControllerLifecycleDelegate?

	private let titleTextLabel = UILabel()
	private let descriptionLabel = UILabel()
	private let actionButton = Button(style: .secondary, title: Translations.retryButtonText)

	private let titleText: String?
	private let descriptionText: String
	private let showActionButton: Bool

	public init(title: String?,
	            descriptionText: String,
	            actionButtonTitle: String,
	            showActionButton: Bool) {
		titleText = title
		self.descriptionText = descriptionText
		self.showActionButton = showActionButton
		actionButton.title = actionButtonTitle
		super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Lifecycle

	public override func viewDidLoad() {
		super.viewDidLoad()
		setUp()
	}

	public override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		lifecycleDelegate?.loadErrorViewControllerDidAppear(self)
	}

	public override var preferredStatusBarStyle: UIStatusBarStyle {
        Mistica.brandStyle.preferredStatusBarStyle
	}
}

public extension LoadErrorViewController {
	func addActivityIndicatorToRetryButton() {
		actionButton.state = .loading
	}

	func removeActivityIndicatorFromRetryButton() {
		actionButton.state = .normal
	}
}

private extension LoadErrorViewController {
	enum Constants {
		static let contentInset: CGFloat = 24
		static let verticalSpacing: CGFloat = 16
	}

	func setUp() {
		view.backgroundColor = .background
		setUpTitleText()
		setUpDescriptionText()
		setUpRetryButton()
		setUpStackView()
	}

	func setUpTitleText() {
		titleTextLabel.font = .title
		titleTextLabel.textColor = .textPrimary
		titleTextLabel.textAlignment = .center
		titleTextLabel.numberOfLines = 0
		titleTextLabel.text = titleText
	}

	func setUpDescriptionText() {
		descriptionLabel.font = .body2
		descriptionLabel.textColor = .textSecondary
		descriptionLabel.textAlignment = .center
		descriptionLabel.numberOfLines = 0
		descriptionLabel.text = descriptionText
	}

	func setUpRetryButton() {
		actionButton.addTarget(self, action: #selector(didTapRetryButton), for: .touchUpInside)
	}

	func setUpStackView() {
		var subViews: [UIView] = []
		if titleText != nil {
			subViews.append(titleTextLabel)
		}
		subViews.append(descriptionLabel)
		if showActionButton {
			subViews.append(actionButton)
		}

		let stackView = UIStackView(arrangedSubviews: subViews)
		stackView.axis = .vertical
		stackView.spacing = Constants.verticalSpacing
		stackView.alignment = .center

		view.addSubview(stackView, constraints: [
			stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.contentInset),
			stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.contentInset),
			stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
		])
	}

	@objc func didTapRetryButton() {
		assert(delegate != nil, "Delegate of LoadErrorViewController is nil.")
		delegate?.loadErrorViewControllerDidTapRetry(self)
	}
}
