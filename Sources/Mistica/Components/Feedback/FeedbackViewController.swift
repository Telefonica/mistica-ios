//
//  FeedbackViewController.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit
import Shared
import Shared

public class FeedbackViewController: UIViewController {
    private let feedbackView: FeedbackView
    private let configuration: FeedbackConfiguration

    public init(configuration: FeedbackConfiguration) {
        self.configuration = configuration
        feedbackView = FeedbackView(configuration: configuration)
        super.init(nibName: nil, bundle: nil)

        if let modalPresentationStyle = configuration.modalPresentationStyle {
            self.modalPresentationStyle = modalPresentationStyle
        }

        if #available(iOS 13.0, *), configuration.shouldDisableSwipeToDismiss {
            isModalInPresentation = true
        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

public extension FeedbackViewController {
    var assetAccessibilityIdentifier: String? {
        get {
            feedbackView.assetAccessibilityIdentifier
        }
        set {
            feedbackView.assetAccessibilityIdentifier = newValue
        }
    }

    var titleAccessibilityIdentifier: String? {
        get {
            feedbackView.titleAccessibilityIdentifier
        }
        set {
            feedbackView.titleAccessibilityIdentifier = newValue
        }
    }

    var subtitleAccessibilityIdentifier: String? {
        get {
            feedbackView.subtitleAccessibilityIdentifier
        }
        set {
            feedbackView.subtitleAccessibilityIdentifier = newValue
        }
    }

    var errorReferenceAccessibilityIdentifier: String? {
        get {
            feedbackView.errorReferenceAccessibilityIdentifier
        }
        set {
            feedbackView.errorReferenceAccessibilityIdentifier = newValue
        }
    }

    var primaryButtonAccessibilityIdentifier: String? {
        get {
            feedbackView.primaryButtonAccessibilityIdentifier
        }
        set {
            feedbackView.primaryButtonAccessibilityIdentifier = newValue
        }
    }

    var secondaryButtonAccessibilityIdentifier: String? {
        get {
            feedbackView.secondaryButtonAccessibilityIdentifier
        }
        set {
            feedbackView.secondaryButtonAccessibilityIdentifier = newValue
        }
    }

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
        if configuration.backButton == .none {
            navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        MisticaConfig.brandStyle.preferredStatusBarStyle
    }
}

private extension FeedbackViewController {
    private func setupNavigationBar() {
        navigationItem.largeTitleDisplayMode = .never

        switch configuration.closeButton {
        case .none:
            navigationItem.rightBarButtonItem = nil
        case .keep:
            break
        case .custom(let button):
            navigationItem.rightBarButtonItem = button
        }

        switch configuration.backButton {
        case .none:
            navigationItem.hidesBackButton = true
            navigationItem.leftBarButtonItem = nil
        case .keep:
            break
        case .custom(let button):
            navigationItem.leftBarButtonItem = button
        }
    }
}
