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
        static let animationDelay: TimeInterval = 0.2
        static let animationDuration: TimeInterval = 0.8
        static let animationCurveControlPoint1 = CGPoint(x: 0.215, y: 0.61)
        static let animationCurveControlPoint2 = CGPoint(x: 0.355, y: 1)
    }

    private lazy var animator = UIViewPropertyAnimator(
        duration: Constants.animationDuration,
        controlPoint1: Constants.animationCurveControlPoint1,
        controlPoint2: Constants.animationCurveControlPoint2
    )

    // Setup properties
    private let style: FeedbackStyle
    private let primaryAction: FeedbackPrimaryAction
    private let secondaryAction: FeedbackSecondaryAction
    private let title: String
    private let subtitle: String?
    private let errorReference: String?

    // Private views
    private lazy var gradientView: GradientView = {
        let view = GradientView()
        view.applyStyle(.backgroundBrand)
        return view
    }()

    private lazy var icon: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFit
        icon.tintColor = .brand
        return icon
    }()

    private lazy var animatedIcon: AnimationView = {
        let animation = AnimationView()
        animation.translatesAutoresizingMaskIntoConstraints = false
        animation.contentMode = .scaleAspectFit
        animation.loopMode = .playOnce
        animation.isUserInteractionEnabled = false
        return animation
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = title
        label.font = .textPreset6(weight: .light)
        label.textColor = style.feedbackTextPrimary
        label.numberOfLines = 0
        return label
    }()

    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = subtitle
        label.font = .textPreset4(weight: .light)
        label.textColor = style.feedbackTextSecondary
        label.numberOfLines = 0
        return label
    }()

    private lazy var errorReferenceLabel: UILabel = {
        let label = UILabel()
        label.text = errorReference
        label.font = .textPreset2(weight: .regular)
        label.textColor = style.feedbackTextSecondary
        label.numberOfLines = 0
        return label
    }()

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
        return button
    }()

    private lazy var secondaryButton: Button? = {
        let button: Button?
        switch secondaryAction {
        case .button(let title, _):
            button = Button(style: style.feedbackSecondary, title: title)
        case .link(let title, _):
            button = Button(style: style.feedbackLink, title: title)
        case .none:
            button = nil
        }
        button?.addTarget(self, action: #selector(secondaryButtonTapped), for: .touchUpInside)
        return button
    }()

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
        scrollStackView.stackView.layoutMargins = UIEdgeInsets(top: 64, left: 24, bottom: 16, right: 24)
        return scrollStackView
    }()

    private lazy var contentContainerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        if !errorReference.isEmpty {
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
        animator.startAnimation(afterDelay: Constants.animationDelay)
        triggerHapticFeedback()

        if UIView.areAnimationsEnabled {
            animatedIcon.play()
        } else {
            animatedIcon.stop()
            animatedIcon.currentProgress = 1
        }
    }
}

private extension FeedbackView {
    func setupView() {
        setupIcon()
        setupContent()
        setupBackground()
        prepareAnimation()
    }

    func setupContent() {
        addSubview(scrollStackView)
        addSubview(buttonsView)
        NSLayoutConstraint.activate([
            scrollStackView.topAnchor.constraint(equalTo: topAnchor),
            scrollStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollStackView.bottomAnchor.constraint(equalTo: buttonsView.topAnchor),
            buttonsView.trailingAnchor.constraint(equalTo: trailingAnchor),
            buttonsView.leadingAnchor.constraint(equalTo: leadingAnchor),
            buttonsView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    func setupBackground() {
        if style.shouldUseInverseFeedbacks {
            insertSubview(withDefaultConstraints: gradientView, at: 0)
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
            let width = animation.bounds.width
            let height = animation.bounds.height
            NSLayoutConstraint.activate([
                animatedIcon.widthAnchor.constraint(equalToConstant: width),
                animatedIcon.heightAnchor.constraint(equalToConstant: height)
            ])
            // To center animations that are not 1:1 squares
            let leftMargin = (width - height) / 2
            animatedIcon.transform = CGAffineTransform(translationX: -leftMargin, y: 0)
            scrollStackView.stackView.insertArrangedSubview(animatedIcon, at: 0)
        }
    }

    func prepareAnimation() {
        guard style.shouldAnimate else { return }
        animationFired = false
        contentContainerStackView.alpha = 0
        contentContainerStackView.transform = CGAffineTransform(translationX: 0, y: 20)
        animator.addAnimations {
            self.contentContainerStackView.alpha = 1
            self.contentContainerStackView.transform = CGAffineTransform(translationX: 0, y: 0)
        }
        prepareHapticFeedback()
    }

    func prepareHapticFeedback() {
        feedbackGenerator?.prepare()
    }

    func triggerHapticFeedback() {
        Timer.scheduledTimer(withTimeInterval: style.hapticFeedbackDelay, repeats: false) { [weak self] _ in
            guard let self = self else { return }
            self.feedbackGenerator?.notificationOccurred(self.style.hapticFeedbackStyle)
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
