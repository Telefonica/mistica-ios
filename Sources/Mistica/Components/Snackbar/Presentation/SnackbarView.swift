//
//  SnackbarView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

// MARK: SnackbarViewDelegate definition

class SnackbarView: UIView {
    // MARK: Constants

    private enum Constants {
        static let actionlessDismissInterval: TimeInterval = 5
        static let withActionDismissInterval: TimeInterval = 10

        static let presentationAnimationDuration: TimeInterval = 0.30

        static let margins = NSDirectionalEdgeInsets(top: 14, leading: 16, bottom: 14, trailing: 16)

        static let buttonWidthThresholdForVerticalLayout: CGFloat = 128
        static let horizontalSpacing: CGFloat = 16
        static let verticalSpacing: CGFloat = 18
        static let containerMargin: CGFloat = 8
        static let closeButtonSize: CGFloat = 33
        static let iconCloseButtonSize: CGFloat = 20
        static let closeButtonCornerRadius: CGFloat = closeButtonSize / 2
    }

    public typealias DismissHandlerBlock = (SnackbarDismissReason) -> Void
    public typealias DidTapActionBlock = () -> Void

    // MARK: Private properties

    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = text
        label.numberOfLines = 0
        label.textColor = config.textColor
        label.font = .textPreset2(weight: .regular)
        return label
    }()

    private lazy var actionButton: Button? = {
        guard let action = action else { return nil }
        let button = Button(style: config.actionStyle, title: action.text)
        button.isSmall = true
        button.addTarget(self, action: #selector(didTapActionButton), for: .touchUpInside)
        button.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        button.setContentHuggingPriority(.required, for: .horizontal)
        button.accessibilityLabel = action.accessibilityLabel
        return button
    }()

    private lazy var actionButtonStackView: UIStackView? = {
        guard let actionButton = actionButton else { return nil }
        let stackView = UIStackView(arrangedSubviews: [])
        stackView.axis = .vertical
        stackView.alignment = .trailing
        return stackView
    }()

    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [horizontalStackView])
        stackView.axis = .vertical
        stackView.spacing = Constants.verticalSpacing
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()

    private lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [label])
        stackView.axis = .horizontal
        stackView.spacing = Constants.horizontalSpacing
        stackView.alignment = .center
        stackView.distribution = .fill
        return stackView
    }()

    private lazy var closeButton: UIButton? = {
        guard shouldShowCloseButton else { return nil }

        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = Constants.closeButtonCornerRadius
        button.clipsToBounds = true
        button.backgroundColor = .clear

        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: Constants.closeButtonSize),
            button.heightAnchor.constraint(equalToConstant: Constants.closeButtonSize)
        ])

        let imageView = UIImageView(image: UIImage.regularCloseButtonIcon.withRenderingMode(.alwaysTemplate))
        imageView.tintColor = .inverse
        button.addSubview(imageView)

        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: button.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: button.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: Constants.iconCloseButtonSize),
            imageView.heightAnchor.constraint(equalToConstant: Constants.iconCloseButtonSize)
        ])

        button.setBackgroundColor(config.closePressedBackgroundColor, for: .highlighted)
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)

        return button
    }()

    private var timer: Timer?

    private let text: String
    private let config: SnackbarStyleConfig
    private let dismissHandler: DismissHandlerBlock?
    private let action: (text: String, accessibilityLabel: String?, handler: DidTapActionBlock)?
    private let forceDismiss: Bool
    private var bottomConstraint: NSLayoutConstraint?
    private var dismissalOffset: CGFloat = 0

    init(text: String,
         action: (text: String, accessibilityLabel: String?, handler: DidTapActionBlock)? = nil,
         config: SnackbarStyleConfig,
         dismissHandler: DismissHandlerBlock? = nil,
         forceDismiss: Bool) {
        self.text = text
        self.action = action
        self.config = config
        self.dismissHandler = dismissHandler
        self.forceDismiss = forceDismiss

        super.init(frame: .zero)

        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = config.backgroundColor
        accessibilityLabel = text

        layoutViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func removeFromSuperview() {
        timer?.invalidate()
        super.removeFromSuperview()
    }

    override func didMoveToWindow() {
        super.didMoveToWindow()

        // Detect when the view has been dismissed because
        // the parent window has been dismissed before
        // we told the view to be dismissed
        guard window == nil else { return }
        guard superview != nil else { return }

        timer?.invalidate()

        invokeDismissHandler(reason: .dismiss)
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        adjustStackViewLayout(traitCollection: traitCollection)
    }

    override public func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        setMisticaRadius(.popup)
    }
}

// MARK: Internal methods

extension SnackbarView {
    func show(in container: UIView) {
        let previousClipsToBounds = container.clipsToBounds
        container.clipsToBounds = true

        adjustStackViewLayout(traitCollection: container.traitCollection)
        container.addSubview(self)
        container.layoutIfNeeded()
        layoutIfNeeded()

        addContainerConstraints(to: container)

        let originalBottomConstant = bottomConstraint?.constant ?? Constants.containerMargin
        let dismissalOffset = calculateDismissalOffset(in: container)
        bottomConstraint?.constant = dismissalOffset

        container.layoutIfNeeded()

        alpha = 0

        UIView.animate(
            withDuration: Constants.presentationAnimationDuration,
            delay: 0,
            options: .curveEaseInOut,
            animations: {
                self.alpha = 1
                self.bottomConstraint?.constant = originalBottomConstant
                container.layoutIfNeeded()
            },
            completion: { _ in

                self.triggerAccessibilityAction()

                container.clipsToBounds = previousClipsToBounds

                self.addCountdownToDismiss()
            }
        )
        fadeStackViewIn()
    }

    func dismiss(completion: (() -> Void)? = nil) {
        timer?.invalidate()

        guard let superview = superview else {
            DispatchQueue.main.async {
                completion?()
            }
            return
        }

        let previousClipsToBounds = superview.clipsToBounds
        superview.clipsToBounds = true

        let snackbarHeight = frame.height
        let temporaryHeightConstraint = heightAnchor.constraint(equalToConstant: snackbarHeight)
        temporaryHeightConstraint.isActive = true
        let dismissalOffset = calculateDismissalOffset(in: superview)

        UIView.animate(
            withDuration: Constants.presentationAnimationDuration,
            delay: 0,
            options: .curveEaseInOut,
            animations: {
                self.alpha = 0
                self.bottomConstraint?.constant = dismissalOffset
                superview.layoutIfNeeded()
            },
            completion: { _ in
                superview.clipsToBounds = previousClipsToBounds

                self.removeFromSuperview()

                temporaryHeightConstraint.isActive = false

                completion?()
            }
        )
        fadeStackViewOut()
    }
}

// MARK: Private methods

private extension SnackbarView {
    var shouldShowCloseButton: Bool {
        forceDismiss || (action == nil && config.overrideDismissInterval == .infinite(nil))
    }

    func triggerAccessibilityAction() {
        if config.overrideDismissInterval.autoFocus {
            let delay = config.overrideDismissInterval.autoFocusDelay ?? 0.0
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                UIAccessibility.post(notification: .layoutChanged, argument: self)
            }

        } else {
            AccessibilityHelper.post(text)
        }
    }

    func layoutViews() {
        addSubview(verticalStackView)

        verticalStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor)
        ])
    }

    func addContainerConstraints(to container: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        directionalLayoutMargins = Constants.margins

        let tabBar = findTabBar(in: container)

        var bottomConstraint = bottomAnchor.constraint(equalTo: container.safeAreaLayoutGuide.bottomAnchor, constant: -Constants.containerMargin)

        if let tabBar = tabBar, !tabBar.isHidden {
            bottomConstraint = bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -(tabBar.bounds.height + Constants.containerMargin))
        }

        let constraints = [
            trailingAnchor.constraint(equalTo: container.safeAreaLayoutGuide.trailingAnchor, constant: -Constants.containerMargin),
            leadingAnchor.constraint(equalTo: container.safeAreaLayoutGuide.leadingAnchor, constant: Constants.containerMargin),
            bottomConstraint
        ]
        self.bottomConstraint = bottomConstraint
        NSLayoutConstraint.activate(constraints)
    }

    private func findTabBar(in view: UIView) -> UITabBar? {
        for subview in view.subviews {
            if let tabBar = subview as? UITabBar {
                // Checks if the tabBar is in the bottom
                if let superview = tabBar.superview,
                   tabBar.frame.origin.y >= superview.bounds.height - tabBar.frame.height {
                    return tabBar
                }
            } else if let foundTabBar = findTabBar(in: subview) {
                return foundTabBar
            }
        }
        return nil
    }

    func calculateDismissalOffset(in container: UIView) -> CGFloat {
        let snackbarHeight = frame.height
        let originalBottomConstant = bottomConstraint?.constant ?? Constants.containerMargin

        var safeAreaBottomInset = container.safeAreaInsets.bottom

        // If the snackbar is above the tab bar, do not add the safe area inset.
        if originalBottomConstant < -Constants.containerMargin {
            safeAreaBottomInset = 0
        }

        // Calculate the dismissal offset by summing the height of the snackbar, the value of the bottom constant,
        // the safe area bottom inset, and add aditional space with container margin
        let dismissalOffset = snackbarHeight + abs(originalBottomConstant) + safeAreaBottomInset + abs(Constants.containerMargin)

        return dismissalOffset
    }

    func addCountdownToDismiss() {
        guard let timeInterval = config.overrideDismissInterval.timeInterval else {
            return
        }

        timer = Timer.scheduledTimer(
            timeInterval: timeInterval,
            target: self,
            selector: #selector(invokeCountdownDismissHandler),
            userInfo: nil,
            repeats: false
        )
    }

    @objc func invokeCountdownDismissHandler() {
        invokeDismissHandler(reason: .timeout)
    }

    func adjustStackViewLayout(traitCollection: UITraitCollection) {
        guard let actionButton = actionButton else {
            useHorizontalLayout()
            return
        }

        // On regular widths, always use horizontal layout
        if traitCollection.horizontalSizeClass == .regular {
            useHorizontalLayout()
            return
        }

        if actionButton.intrinsicContentSize.width > Constants.buttonWidthThresholdForVerticalLayout {
            useVerticalLayout()
        } else {
            useHorizontalLayout()
        }
    }

    /// Default layout where the button appears aligned to the text horizontally
    func useHorizontalLayout() {
        addHorizontalActionButtonIfNeeded()

        guard let closeButton = closeButton else { return }
        horizontalStackView.removeArrangedSubview(closeButton)
        horizontalStackView.addArrangedSubview(closeButton)
    }

    func addHorizontalActionButtonIfNeeded() {
        guard let actionButton = actionButton else { return }
        guard let actionButtonStackView = actionButtonStackView else { return }

        verticalStackView.removeArrangedSubview(actionButtonStackView)
        actionButton.removeFromSuperview()
        horizontalStackView.addArrangedSubview(actionButton)
    }

    /// Layout where the button appears below the text aligned to the right
    func useVerticalLayout() {
        addVerticalActionButtonStackIfNeeded()

        guard let closeButton = closeButton else { return }
        horizontalStackView.removeArrangedSubview(closeButton)
        horizontalStackView.addArrangedSubview(closeButton)
    }

    func addVerticalActionButtonStackIfNeeded() {
        guard let actionButton = actionButton else { return }
        guard let actionButtonStackView = actionButtonStackView else { return }

        horizontalStackView.removeArrangedSubview(actionButton)
        actionButtonStackView.addArrangedSubview(actionButton)
        verticalStackView.addArrangedSubview(actionButtonStackView)
    }

    func fadeStackViewIn() {
        verticalStackView.alpha = 0
        UIView.animate(
            withDuration: Constants.presentationAnimationDuration,
            delay: 0,
            options: .curveEaseInOut,
            animations: {
                self.verticalStackView.alpha = 1
            },
            completion: nil
        )
    }

    func fadeStackViewOut() {
        verticalStackView.alpha = 1
        UIView.animate(
            withDuration: Constants.presentationAnimationDuration,
            delay: 0,
            options: .curveEaseInOut,
            animations: {
                self.verticalStackView.alpha = 0
            },
            completion: nil
        )
    }

    @objc func didTapActionButton() {
        action?.handler()
    }

    @objc func invokeDismissHandler(reason: SnackbarDismissReason) {
        dismissHandler?(reason)
    }

    @objc func closeButtonTapped() {
        invokeDismissHandler(reason: .dismiss)
    }
}
