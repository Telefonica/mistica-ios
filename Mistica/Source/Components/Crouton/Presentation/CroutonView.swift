//
//  CroutonView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

import UIKit

// MARK: CroutonViewDelegate definition

class CroutonView: UIView {
    // MARK: Constants

    private enum Constants {
        static let actionlessDismissInterval: TimeInterval = 5
        static let withActionDismissInterval: TimeInterval = 10

        static let presentationAnimationDuration: TimeInterval = 0.25
        static let contentAnimationDelay: TimeInterval = 0.07
        static let contentAnimationDuration = presentationAnimationDuration - contentAnimationDelay

        static let margins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        static let buttonWidthThresholdForVerticalLayout: CGFloat = 128
        static let horizontalSpacing: CGFloat = 24
        static let verticalSpacing: CGFloat = 40
    }

    public typealias DismissHandlerBlock = () -> Void
    public typealias DidTapActionBlock = () -> Void

    // MARK: Private properties

    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = text
        label.numberOfLines = 0
        label.textColor = config.textColor
        label.font = .textPreset7(weight: .regular)
        return label
    }()

    private lazy var actionButton: Button? = {
        guard let action = action else { return nil }
        let button = Button(style: config.actionStyle, title: action.text)
        button.addTarget(self, action: #selector(didTapActionButton), for: .touchUpInside)
        button.setContentCompressionResistancePriority(.required, for: .horizontal)
        return button
    }()

    private lazy var actionButtonStackView: UIStackView? = {
        guard let actionButton = actionButton else { return nil }
        let stackView = UIStackView(arrangedSubviews: [])
        stackView.axis = .vertical
        stackView.alignment = .trailing
        return stackView
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [label])
        stackView.axis = .horizontal
        return stackView
    }()

    private var timer: Timer?
    private var showCroutonConstraint: NSLayoutConstraint?

    private let text: String
    private let config: CroutonConfig
    private let dismissHandler: DismissHandlerBlock?
    private let action: (text: String, handler: DidTapActionBlock)?

    init(text: String,
         action: (text: String, handler: DidTapActionBlock)? = nil,
         config: CroutonConfig,
         dismissHandler: DismissHandlerBlock? = nil) {
        self.text = text
        self.action = action
        self.config = config
        self.dismissHandler = dismissHandler

        super.init(frame: .zero)

        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = config.backgroundColor
        accessibilityLabel = text
        layoutMargins = Constants.margins

        addSubview(constrainedToLayoutMarginsGuideOf: stackView)
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

        invokeDismissHandler()
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        adjustStackViewLayout(traitCollection: traitCollection)
    }
}

// MARK: Internal methods

extension CroutonView {
    func show(in container: UIView) {
        let previousClipsToBounds = container.clipsToBounds
        container.clipsToBounds = true

        adjustStackViewLayout(traitCollection: container.traitCollection)

        container.addSubview(self)

        addContainerConstraints(to: container)

        container.layoutIfNeeded()
        layoutIfNeeded()

        transform = CGAffineTransform(translationX: 0, y: frameHeight)

        UIView.animate(withDuration: Constants.presentationAnimationDuration,
                       delay: 0,
                       options: .curveEaseOut,
                       animations: {
                           self.transform = .identity
                       },
                       completion: { _ in
                           container.clipsToBounds = previousClipsToBounds

                           self.addCountdownToDismiss()
                       })

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

        transform = .identity

        UIView.animate(withDuration: Constants.presentationAnimationDuration,
                       delay: 0,
                       options: .curveEaseIn,
                       animations: {
                           self.transform = CGAffineTransform(translationX: 0, y: self.frameHeight)
                       },
                       completion: { _ in
                           superview.clipsToBounds = previousClipsToBounds

                           self.removeFromSuperview()

                           completion?()
                       })

        fadeStackViewOut()
    }
}

// MARK: Private methods

private extension CroutonView {
    func addContainerConstraints(to container: UIView) {
        translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            container.leadingAnchor.constraint(equalTo: leadingAnchor),
            container.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])

        showCroutonConstraint = container.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        showCroutonConstraint?.isActive = true
    }

    func addCountdownToDismiss() {
        let dismissInterval = (action == nil) ? Constants.actionlessDismissInterval
            : Constants.withActionDismissInterval

        timer = Timer.scheduledTimer(timeInterval: dismissInterval,
                                     target: self,
                                     selector: #selector(invokeDismissHandler),
                                     userInfo: nil,
                                     repeats: false)
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
        guard let actionButton = actionButton else { return }
        guard let actionButtonStackView = actionButtonStackView else { return }

        stackView.axis = .horizontal
        stackView.spacing = Constants.horizontalSpacing
        stackView.alignment = .center
        stackView.distribution = .fillProportionally

        stackView.removeArrangedSubview(actionButtonStackView)
        actionButton.removeFromSuperview()
        stackView.addArrangedSubview(actionButton)
    }

    /// Layout where the button appears below the text aligned to the right
    func useVerticalLayout() {
        guard let actionButton = actionButton else { return }
        guard let actionButtonStackView = actionButtonStackView else { return }

        stackView.axis = .vertical
        stackView.spacing = Constants.verticalSpacing
        stackView.alignment = .fill
        stackView.distribution = .fill

        stackView.removeArrangedSubview(actionButton)
        actionButtonStackView.addArrangedSubview(actionButton)
        stackView.addArrangedSubview(actionButtonStackView)
    }

    func fadeStackViewIn() {
        stackView.alpha = 0
        UIView.animate(withDuration: Constants.contentAnimationDuration,
                       delay: Constants.contentAnimationDelay,
                       options: .curveEaseOut,
                       animations: {
                           self.stackView.alpha = 1
                       },
                       completion: nil)
    }

    func fadeStackViewOut() {
        stackView.alpha = 1
        UIView.animate(withDuration: Constants.contentAnimationDuration,
                       delay: 0,
                       options: .curveEaseIn,
                       animations: {
                           self.stackView.alpha = 0
                       },
                       completion: nil)
    }

    @objc func didTapActionButton() {
        action?.handler()
    }

    @objc func invokeDismissHandler() {
        dismissHandler?()
    }
}
