//
//  Feedback.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import SwiftUI

private enum Constants {
    static let sideMargin: CGFloat = 16
    static let spacing: CGFloat = 16
    static let iconHeight: CGFloat = 48
    static let topPadding: CGFloat = 64
    static let shadowRadius: CGFloat = 4

    enum Delay {
        static let initial: Double = 0.2
        static let large: Double = 0.6
        static let small: Double = 0.3
    }
}

public struct Feedback<ContentView: View, PrimaryButton: View, SecondaryButton: View>: View {
    private let style: FeedbackStyle
    private let title: String
    private let message: String
    private let primaryButton: PrimaryButton
    private let secondaryButton: SecondaryButton
    private let secondaryButtonStyle: MisticaButtonStyle
    private let contentView: ContentView

    private var titleAccessibilityLabel: String?
    private var titleAccessibilityIdentifier: String?
    private var messageAccessibilityLabel: String?
    private var messageAccessibilityIdentifier: String?
    private var imageAccessibilityLabel: String?
    private var imageAccessibilityIdentifier: String?

    private var feedbackGenerator = UINotificationFeedbackGenerator()

    fileprivate init(
        style: FeedbackStyle,
        title: String,
        message: String,
        contentView: ContentView,
        primaryButton: PrimaryButton,
        secondaryButton: SecondaryButton,
        secondaryButtonStyle: MisticaButtonStyle
    ) {
        self.style = style
        self.title = title
        self.message = message
        self.contentView = contentView
        self.primaryButton = primaryButton
        self.secondaryButton = secondaryButton
        self.secondaryButtonStyle = secondaryButtonStyle
    }

    public var body: some View {
        ZStack {
            backgroundColor
                .edgesIgnoringSafeArea(.all)
                .zIndex(0)

            VStack(spacing: 0) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        icon
                            .frame(width: Constants.iconHeight, height: Constants.iconHeight, alignment: .bottomLeading)
                            .accessibilityIdentifier(imageAccessibilityIdentifier)
                            .accessibilityLabel(imageAccessibilityLabel)

                        Spacer()
                            .frame(height: 24)

                        Text(title)
                            .font(.textPreset6())
                            .foregroundColor(titleForegroundColor)
                            .accessibilityIdentifier(titleAccessibilityIdentifier)
                            .accessibilityLabel(titleAccessibilityLabel)
                            .animate(delay: titleDelay)

                        Spacer()
                            .frame(height: Constants.spacing)

                        Text(message)
                            .font(.textPreset4(weight: .light))
                            .foregroundColor(messageForegroundColor)
                            .accessibilityIdentifier(messageAccessibilityIdentifier)
                            .accessibilityLabel(messageAccessibilityLabel)
                            .animate(delay: messageDelay)

                        reference
                            .animate(delay: referenceDelay)
                    }
                    .expandHorizontally(alignment: .leading)
                    .padding(.horizontal, Constants.sideMargin)
                    .padding(.top, Constants.topPadding)

                    extraContent
                        .animate(delay: contentDelay)
                }

                VStack {
                    primaryButton.buttonStyle(style.primaryButtonStyle)
                    secondaryButton.buttonStyle(secondaryButtonStyle)
                }
                .padding(Constants.spacing)
                .background(backgroundColor)
                .clipped()
                .shadow(color: hasContent ? .black : .clear, radius: Constants.shadowRadius, x: 0, y: 0).mask(Rectangle().padding(.top, -Constants.shadowRadius))
            }
            .zIndex(1)
        }
    }

    @ViewBuilder
    var icon: some View {
        switch style.iconStyle {
        case .animation(var lottieView):
            lottieView
                .setDelay(Constants.Delay.initial)
                .onAppear {
                    guard let hapticFeedbackDelay = style.hapticFeedbackDelay,
                          let hapticFeedbackStyle = style.hapticFeedbackStyle else { return }
                    feedbackGenerator.prepare()

                    Timer.scheduledTimer(withTimeInterval: hapticFeedbackDelay, repeats: false) { _ in
                        feedbackGenerator.notificationOccurred(hapticFeedbackStyle)
                    }
                }
        case .image(let image):
            image
                .foregroundColor(.brand)
        case .none:
            EmptyView()
        }
    }

    @ViewBuilder
    var reference: some View {
        switch style {
        case .error(let reference) where reference != nil:
            Spacer()
                .frame(height: Constants.spacing)

            Text(reference!)
                .font(.textPreset2(weight: .regular))
                .foregroundColor(messageForegroundColor)

        case .success, .informative, .error, .feedback:
            EmptyView()
        }
    }

    @ViewBuilder
    var extraContent: some View {
        if hasContent {
            Spacer()
                .frame(height: Constants.spacing)

            contentView
                .padding(.horizontal, 24)
                .expandVertically()
        } else {
            Spacer()
        }
    }

    private var backgroundColor: Color {
        style.shouldUseInverseFeedbacks ? .backgroundBrand : .background
    }

    private var titleForegroundColor: Color {
        style.shouldUseInverseFeedbacks ? .textPrimaryInverse : .textPrimary
    }

    private var messageForegroundColor: Color {
        style.shouldUseInverseFeedbacks ? .textPrimaryInverse : .textSecondary
    }

    private var imageForegroundColor: Color {
        style.shouldUseInverseFeedbacks ? .backgroundBrand : .textSecondary
    }

    private var hasContent: Bool {
        ContentView.self != EmptyView.self
    }

    private var titleDelay: Double {
        guard style.shouldAnimate else { return .zero }
        return Constants.Delay.initial + Constants.Delay.large
    }

    private var messageDelay: Double {
        guard style.shouldAnimate else { return .zero }
        return titleDelay + Constants.Delay.small
    }

    private var referenceDelay: Double {
        guard style.shouldAnimate else { return .zero }
        return messageDelay
    }

    private var contentDelay: Double {
        guard style.shouldAnimate else { return .zero }
        return messageDelay + Constants.Delay.small
    }
}

// MARK: Initialisers

public extension Feedback {
    init(
        style: FeedbackStyle,
        title: String,
        message: String,
        @ViewBuilder contentView: () -> ContentView,
        @ViewBuilder primaryButton: () -> PrimaryButton,
        @ViewBuilder secondaryButton: () -> SecondaryButton
    ) {
        self.init(
            style: style,
            title: title,
            message: message,
            contentView: contentView(),
            primaryButton: primaryButton(),
            secondaryButton: secondaryButton(),
            secondaryButtonStyle: style.secondaryButtonStyle
        )
    }

    init(
        style: FeedbackStyle,
        title: String,
        message: String,
        @ViewBuilder contentView: () -> ContentView,
        @ViewBuilder primaryButton: () -> PrimaryButton,
        @ViewBuilder linkButton: () -> SecondaryButton
    ) {
        self.init(
            style: style,
            title: title,
            message: message,
            contentView: contentView(),
            primaryButton: primaryButton(),
            secondaryButton: linkButton(),
            secondaryButtonStyle: style.linkButtonStyle
        )
    }

    init(
        style: FeedbackStyle,
        title: String,
        message: String,
        @ViewBuilder primaryButton: () -> PrimaryButton,
        @ViewBuilder secondaryButton: () -> SecondaryButton
    ) where ContentView == EmptyView {
        self.init(
            style: style,
            title: title,
            message: message,
            contentView: EmptyView(),
            primaryButton: primaryButton(),
            secondaryButton: secondaryButton(),
            secondaryButtonStyle: style.secondaryButtonStyle
        )
    }

    init(
        style: FeedbackStyle,
        title: String,
        message: String,
        @ViewBuilder primaryButton: () -> PrimaryButton,
        @ViewBuilder linkButton: () -> SecondaryButton
    ) where ContentView == EmptyView {
        self.init(
            style: style,
            title: title,
            message: message,
            contentView: EmptyView(),
            primaryButton: primaryButton(),
            secondaryButton: linkButton(),
            secondaryButtonStyle: style.linkButtonStyle
        )
    }

    init(
        style: FeedbackStyle,
        title: String,
        message: String,
        @ViewBuilder contentView: () -> ContentView,
        @ViewBuilder primaryButton: () -> PrimaryButton
    ) where SecondaryButton == EmptyView {
        self.init(
            style: style,
            title: title,
            message: message,
            contentView: contentView(),
            primaryButton: primaryButton(),
            secondaryButton: EmptyView(),
            secondaryButtonStyle: style.secondaryButtonStyle
        )
    }

    init(
        style: FeedbackStyle,
        title: String,
        message: String,
        @ViewBuilder primaryButton: () -> PrimaryButton
    ) where SecondaryButton == EmptyView, ContentView == EmptyView {
        self.init(
            style: style,
            title: title,
            message: message,
            contentView: EmptyView(),
            primaryButton: primaryButton(),
            secondaryButton: EmptyView(),
            secondaryButtonStyle: style.secondaryButtonStyle
        )
    }
}

// MARK: Modifiers

public extension Feedback {
    func titleAccessibilityLabel(_ titleAccessibilityLabel: String?) -> Feedback {
        var feedback = self
        feedback.titleAccessibilityLabel = titleAccessibilityLabel
        return feedback
    }

    func titleAccessibilityIdentifier(_ titleAccessibilityIdentifier: String?) -> Feedback {
        var feedback = self
        feedback.titleAccessibilityIdentifier = titleAccessibilityIdentifier
        return feedback
    }

    func messageAccessibilityLabel(_ messageAccessibilityLabel: String?) -> Feedback {
        var feedback = self
        feedback.messageAccessibilityLabel = messageAccessibilityLabel
        return feedback
    }

    func messageAccessibilityIdentifier(_ messageAccessibilityIdentifier: String?) -> Feedback {
        var feedback = self
        feedback.messageAccessibilityIdentifier = messageAccessibilityIdentifier
        return feedback
    }

    func imageAccessibilityLabel(_ imageAccessibilityLabel: String?) -> Feedback {
        var feedback = self
        feedback.imageAccessibilityLabel = imageAccessibilityLabel
        return feedback
    }

    func imageAccessibilityIdentifier(_ imageAccessibilityIdentifier: String?) -> Feedback {
        var feedback = self
        feedback.imageAccessibilityIdentifier = imageAccessibilityIdentifier
        return feedback
    }
}

// MARK: Animation

private struct Animation: ViewModifier {
    enum Constant {
        enum Opacity {
            static let initial = CGFloat.zero
            static let final = CGFloat(1)
        }

        enum Offset {
            static let initial = CGFloat(20)
            static let final = CGFloat.zero
        }

        enum Animation {
            static let duration: Double = 0.8
            static let controlPoint1 = CGPoint(x: 0.215, y: 0.61)
            static let controlPoint2 = CGPoint(x: 0.355, y: 1)
        }
    }

    @State var opacity = Constant.Opacity.initial
    @State var offset = Constant.Offset.initial

    let animation = SwiftUI.Animation.timingCurve(
        Constant.Animation.controlPoint1.x,
        Constant.Animation.controlPoint1.y,
        Constant.Animation.controlPoint2.x,
        Constant.Animation.controlPoint2.y,
        duration: Constant.Animation.duration
    )
    let delay: Double

    func body(content: Content) -> some View {
        content
            .opacity(opacity)
            .offset(y: offset)
            .onAppear {
                withAnimation(animation.delay(delay)) {
                    opacity = Constant.Opacity.final
                    offset = Constant.Offset.final
                }
            }
    }
}

private extension View {
    @ViewBuilder
    func animate(delay: Double) -> some View {
        if UIView.areAnimationsEnabled {
            modifier(Animation(delay: delay))
        } else {
            self
        }
    }
}

// MARK: Previews

#if DEBUG
    struct Feedback_Previews: PreviewProvider {
        static var previews: some View {
            Feedback(
                style: .informative,
                title: "Title",
                message: "Message"
            ) {
                VStack(alignment: .leading, spacing: 10) {
                    Text("This extra view is optional")
                        .font(.textPreset3(weight: .regular))
                        .foregroundColor(.textPrimary)
                    Text("Any UIView is allowed here")
                        .font(.textPreset3(weight: .regular))
                        .foregroundColor(.textPrimary)
                    Text("It will always be placed below the subtitle")
                        .font(.textPreset3(weight: .regular))
                        .foregroundColor(.textPrimary)
                    Text("It will be animated along the other text")
                        .font(.textPreset3(weight: .regular))
                        .foregroundColor(.textPrimary)
                }
            } primaryButton: {
                Button("Primary") {}
            } secondaryButton: {
                Button("Secondary") {}
            }
            .titleAccessibilityLabel("Title Label")
            .titleAccessibilityIdentifier("Title identifier")
            .messageAccessibilityLabel("Message identifier")
            .messageAccessibilityIdentifier("Message identifier")
            .imageAccessibilityLabel("Image Label")
            .imageAccessibilityIdentifier("Image identifier")
        }
    }
#endif
