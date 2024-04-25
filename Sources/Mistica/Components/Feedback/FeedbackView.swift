//
//  FeedbackView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Lottie

import UIKit

public class FeedbackView: UIView {
    private enum Constants {
        static let iconSize: CGFloat = 48
        enum Animation {
            enum Animator {
                static let duration: TimeInterval = 0.8
                static let curveControlPoint1 = CGPoint(x: 0.215, y: 0.61)
                static let curveControlPoint2 = CGPoint(x: 0.355, y: 1)
            }

            enum Delay {
                static let initial: TimeInterval = 0.2
                static let large: TimeInterval = 0.6
                static let small: TimeInterval = 0.3
            }

            enum Opacity {
                static let initial = CGFloat.zero
                static let final = CGFloat(1)
            }

            enum Offset {
                static let initial = CGFloat(20)
                static let final = CGFloat.zero
            }
        }
    }

    private var animators = [UIViewPropertyAnimator]()
    private var animator: UIViewPropertyAnimator {
        UIViewPropertyAnimator(
            duration: Constants.Animation.Animator.duration,
            controlPoint1: Constants.Animation.Animator.curveControlPoint1,
            controlPoint2: Constants.Animation.Animator.curveControlPoint2
        )
    }

    // Setup properties
    private let style: FeedbackStyle
    private let primaryAction: FeedbackPrimaryAction
    private let secondaryAction: FeedbackSecondaryAction
    private let title: String
    private let subtitle: String?
    private let errorReference: String?

    private lazy var icon: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFit
        icon.tintColor = .brand
        NSLayoutConstraint.activate([
            icon.widthAnchor.constraint(equalToConstant: Constants.iconSize),
            icon.heightAnchor.constraint(equalToConstant: Constants.iconSize)
        ])
        icon.isAccessibilityElement = false
        icon.accessibilityIdentifier = DefaultIdentifiers.Feedback.asset
        return icon
    }()

    private lazy var animatedIcon: LottieAnimationView = {
        let animation = LottieAnimationView(configuration: .current)
        animation.translatesAutoresizingMaskIntoConstraints = false
        animation.contentMode = .scaleAspectFit
        animation.loopMode = .playOnce
        animation.isUserInteractionEnabled = false
        NSLayoutConstraint.activate([
            animation.widthAnchor.constraint(equalToConstant: Constants.iconSize),
            animation.heightAnchor.constraint(equalToConstant: Constants.iconSize)
        ])
        animation.isAccessibilityElement = false
        animation.accessibilityIdentifier = DefaultIdentifiers.Feedback.asset
        return animation
    }()

    var assetAccessibilityIdentifier: String? {
        get {
            icon.accessibilityIdentifier
        }
        set {
            icon.accessibilityIdentifier = newValue
            animatedIcon.accessibilityIdentifier = newValue
        }
    }

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = title
        label.font = .textPreset6()
        label.textColor = style.feedbackTextPrimary
        label.numberOfLines = 0
        label.isAccessibilityElement = true
        label.accessibilityIdentifier = DefaultIdentifiers.Feedback.title
        return label
    }()

    var titleAccessibilityIdentifier: String? {
        get {
            titleLabel.accessibilityIdentifier
        }
        set {
            titleLabel.accessibilityIdentifier = newValue
        }
    }

    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = subtitle
        label.font = .textPreset3(weight: .regular)
        label.textColor = style.feedbackTextSecondary
        label.numberOfLines = 0
        label.isAccessibilityElement = true
        label.accessibilityIdentifier = DefaultIdentifiers.Feedback.subtitle
        return label
    }()

    var subtitleAccessibilityIdentifier: String? {
        get {
            subtitleLabel.accessibilityIdentifier
        }
        set {
            subtitleLabel.accessibilityIdentifier = newValue
        }
    }

    private lazy var errorReferenceLabel: UILabel = {
        let label = UILabel()
        label.text = errorReference
        label.font = .textPreset2(weight: .regular)
        label.textColor = style.feedbackTextSecondary
        label.numberOfLines = 0
        label.isAccessibilityElement = true
        label.accessibilityIdentifier = DefaultIdentifiers.Feedback.errorLabel
        return label
    }()

    var errorReferenceAccessibilityIdentifier: String? {
        get {
            errorReferenceLabel.accessibilityIdentifier
        }
        set {
            errorReferenceLabel.accessibilityIdentifier = newValue
        }
    }

    private lazy var primaryButton: Button? = {
        let button: Button?
        switch primaryAction {
        case .button(let title, _):
            button = Button(style: style.feedbackPrimary, title: title)
        case .retryButton(let title, let loadingTitle, _):
            button = Button(style: style.feedbackPrimary, title: title, loadingTitle: loadingTitle)
        case .none:
            button = nil
        }
        button?.addTarget(self, action: #selector(primaryButtonTapped), for: .touchUpInside)
        button?.isAccessibilityElement = true
        button?.accessibilityIdentifier = DefaultIdentifiers.Feedback.firstButton
        return button
    }()

    var primaryButtonAccessibilityIdentifier: String? {
        get {
            primaryButton?.accessibilityIdentifier
        }
        set {
            primaryButton?.accessibilityIdentifier = newValue
        }
    }

    private lazy var secondaryButton: Button? = {
        let button: Button?
        switch secondaryAction {
        case .button(let title, _):
            button = Button(style: style.feedbackSecondary, title: title)
            button?.accessibilityIdentifier = DefaultIdentifiers.Feedback.secondButton
        case .link(let title, _):
            button = Button(style: style.feedbackLink, title: title)
            button?.accessibilityIdentifier = DefaultIdentifiers.Feedback.linkButton
        case .none:
            button = nil
        }
        button?.addTarget(self, action: #selector(secondaryButtonTapped), for: .touchUpInside)
        button?.isAccessibilityElement = true

        return button
    }()

    var secondaryButtonAccessibilityIdentifier: String? {
        get {
            secondaryButton?.accessibilityIdentifier
        }
        set {
            secondaryButton?.accessibilityIdentifier = newValue
        }
    }

    private lazy var buttonsView: UIView = {
        let buttonsView = UIStackView(arrangedSubviews: [])

        [primaryButton, secondaryButton].compactMap { $0 }
            .forEach(buttonsView.addArrangedSubview(_:))

        buttonsView.alignment = .fill
        buttonsView.axis = .vertical
        buttonsView.spacing = 16
        buttonsView.isLayoutMarginsRelativeArrangement = true
        buttonsView.translatesAutoresizingMaskIntoConstraints = false
        buttonsView.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        return buttonsView
    }()

    private lazy var scrollStackView: ScrollStackView = {
        let scrollStackView = ScrollStackView(arrangedSubviews: [contentContainerStackView])
        scrollStackView.translatesAutoresizingMaskIntoConstraints = false
        scrollStackView.stackView.spacing = 24
        scrollStackView.stackView.alignment = .leading
        scrollStackView.stackView.layoutMargins = UIEdgeInsets(top: 64, left: 16, bottom: 16, right: 16)
        scrollStackView.stackView.preservesSuperviewLayoutMargins = false
        return scrollStackView
    }()

    private lazy var contentContainerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        if !errorReference.isEmpty && style == .error {
            stackView.addArrangedSubview(errorReferenceLabel)
        }
        if let extraContent = extraContent {
            stackView.addArrangedSubview(extraContent)
        }
        stackView.spacing = 16
        stackView.alignment = .leading
        stackView.axis = .vertical
        return stackView
    }()

    private var extraContent: UIView?
    private var animationFired: Bool = false
    private lazy var feedbackGenerator: UINotificationFeedbackGenerator? = UINotificationFeedbackGenerator()

    public init(configuration: FeedbackConfiguration) {
        style = configuration.style
        primaryAction = configuration.primaryAction
        secondaryAction = configuration.secondaryAction
        extraContent = configuration.extraContent
        title = configuration.title
        subtitle = configuration.subtitle
        errorReference = configuration.errorReference

        super.init(frame: .zero)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

public extension FeedbackView {
    func startAnimation() {
        guard style.shouldAnimate, !animationFired else { return }
        animationFired = true
        triggerHapticFeedback()

        if UIView.areAnimationsEnabled {
            startAnimations()
        } else {
            animatedIcon.stop()
            animatedIcon.currentProgress = 1
        }
    }
}

private extension FeedbackView {
    func setupView() {
        setupIcon()
        setupBackground()
        setupContent()
        prepareAnimation()
        prepareHapticFeedback()
    }

    func setupContent() {
        addSubview(scrollStackView)
        addSubview(buttonsView)
        NSLayoutConstraint.activate([
            scrollStackView.topAnchor.constraint(equalTo: topAnchor),
            scrollStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollStackView.bottomAnchor.constraint(equalTo: buttonsView.subviews.isEmpty ? bottomAnchor : buttonsView.topAnchor),
            buttonsView.trailingAnchor.constraint(equalTo: trailingAnchor),
            buttonsView.leadingAnchor.constraint(equalTo: leadingAnchor),
            buttonsView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    func setupBackground() {
        if style.shouldUseInverseFeedbacks {
            setMisticaColorBackground(.backgroundBrand, ignoreSafeArea: true)
        } else {
            backgroundColor = .background
        }
    }

    func setupIcon() {
        switch style.iconStyle {
        case .none:
            break
        case .asset(let image):
            icon.image = image
            scrollStackView.stackView.insertArrangedSubview(icon, at: 0)
        case .animation(let animation):
            animatedIcon.animation = animation
            scrollStackView.stackView.insertArrangedSubview(animatedIcon, at: 0)
        }
    }

    func prepareAnimation() {
        // Initial state
        func prepare(view: UIView) {
            view.alpha = Constants.Animation.Opacity.initial
            view.transform = CGAffineTransform(
                translationX: 0,
                y: Constants.Animation.Offset.initial
            )
        }
        // Final state
        func animation(for view: UIView) -> () -> Void {
            {
                view.alpha = Constants.Animation.Opacity.final
                view.transform = CGAffineTransform(
                    translationX: 0,
                    y: Constants.Animation.Offset.final
                )
            }
        }

        guard UIView.areAnimationsEnabled, style.shouldAnimate else { return }
        animationFired = false

        // Views that should animate
        var views = [UIView]()
        if title.isEmpty == false {
            views.append(titleLabel)
        }
        if let subtitle, subtitle.isEmpty == false {
            views.append(subtitleLabel)
        }
        if let errorReference, errorReference.isEmpty == false {
            views.append(errorReferenceLabel)
        }
        if let extraContent {
            views.append(extraContent)
        }

        // Prepare
        views.forEach(prepare(view:))
        // Generate animators
        animators = views.map(animation).map { animation in
            let animator = animator
            animator.addAnimations(animation)
            return animator
        }
    }

    func startAnimations() {
        // Start the initial
        DispatchQueue.main.asyncAfter(deadline: .now() + Constants.Animation.Delay.initial) { [weak self] in
            self?.animatedIcon.play()

            // Animate views
            guard let animators = self?.animators, animators.isEmpty == false else { return }
            DispatchQueue.main.asyncAfter(deadline: .now() + Constants.Animation.Delay.large) {
                self?.animate(remaining: animators)
            }
        }
    }

    func animate(remaining animators: [UIViewPropertyAnimator]) {
        var animators = animators

        let animator = animators.removeFirst()
        animator.startAnimation()

        // Animate other views
        guard animators.isEmpty == false else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + Constants.Animation.Delay.small) { [weak self] in
            self?.animate(remaining: animators)
        }
    }

    func prepareHapticFeedback() {
        guard UIView.areAnimationsEnabled else { return }
        feedbackGenerator?.prepare()
    }

    func triggerHapticFeedback() {
        guard let hapticFeedbackStyle = style.hapticFeedbackStyle,
              let hapticFeedbackDelay = style.hapticFeedbackDelay else { return }
        Timer.scheduledTimer(withTimeInterval: hapticFeedbackDelay, repeats: false) { [weak self] _ in
            guard let self = self else { return }
            self.feedbackGenerator?.notificationOccurred(hapticFeedbackStyle)
            self.feedbackGenerator = nil
        }
    }

    @objc func primaryButtonTapped() {
        switch primaryAction {
        case .button(_, let completion):
            completion()
        case .retryButton(let title, _, let completion):
            primaryButton?.isLoading = true
            prepareHapticFeedback()
            completion { [weak self] in
                self?.prepareAnimation()
                self?.startAnimation()

                self?.primaryButton?.title = title
                self?.primaryButton?.isLoading = false
            }
        case .none:
            break
        }
    }

    @objc func secondaryButtonTapped() {
        switch secondaryAction {
        case .button(_, let completion), .link(_, let completion):
            completion()
        case .none:
            break
        }
    }
}
