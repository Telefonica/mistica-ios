//
//  FeedbackViewController.swift
//  Mistica
//
//  Created by pbartolome on 18/11/2019.
//  Copyright © 2019 Tuenti Technologies S.L. All rights reserved.
//

import UIKit

public protocol FeedbackViewControllerProvider: AnyObject {
	func feedbackViewController(configuration: FeedbackConfiguration) -> FeedbackViewController
}

public class FeedbackViewController: UIViewController {
	private let feedbackView: FeedbackView
	private let style: FeedbackStyle
	private let shouldHideCloseButton: Bool

	private unowned let barButtonProvider: BarButtonProvider

	public init(barButtonProvider: BarButtonProvider,
	            configuration: FeedbackConfiguration) {
		style = configuration.style
		shouldHideCloseButton = configuration.shouldHideCloseButton
		feedbackView = FeedbackView(configuration: configuration)
		self.barButtonProvider = barButtonProvider
		super.init(nibName: nil, bundle: nil)

		if let modalPresentationStyle = configuration.modalPresentationStyle {
			self.modalPresentationStyle = modalPresentationStyle
		}
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

public extension FeedbackViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		setupNavigationBar()
		view.addSubview(withDefaultConstraints: feedbackView)
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		feedbackView.startAnimation()
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		if !shouldShowBackButton {
			navigationController?.interactivePopGestureRecognizer?.isEnabled = false
		}
	}

	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		navigationController?.interactivePopGestureRecognizer?.isEnabled = true
	}

	override var preferredStatusBarStyle: UIStatusBarStyle {
		tu_preferredStatusBarStyle
	}
}

private extension FeedbackViewController {
	private func setupNavigationBar() {
		if shouldShowCloseButton {
			navigationItem.rightBarButtonItem = barButtonProvider.closeBarButtonItem(responder: self)
		}

		if shouldShowBackButton {
			navigationItem.leftBarButtonItem = barButtonProvider.backBarButtonItem(responder: self)
		} else {
			navigationItem.hidesBackButton = true
		}
	}

	var shouldShowCloseButton: Bool {
		guard let navigationController = navigationController else { return false }
		return navigationController.presentingViewController?.presentedViewController == navigationController && !shouldHideCloseButton
	}

	var shouldShowBackButton: Bool {
		guard style != .success else { return false }
		guard let navigationController = navigationController else { return false }
		return navigationController.viewControllers.count > 1
	}
}

extension FeedbackViewController: CloseBarButtonResponder {
	public func didTapCloseButton(_ sender: UIBarButtonItem) {
		dismiss(animated: true)
	}
}

extension FeedbackViewController: BackBarButtonResponder {
	public func didTapBackButton(_ sender: UIBarButtonItem) {
		navigationController?.popViewController(animated: true)
	}
}
