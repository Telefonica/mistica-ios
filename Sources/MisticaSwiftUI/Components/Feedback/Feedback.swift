//
//  Feedback.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import SwiftUI

private enum Constants {
    static let spacing: CGFloat = 16
    static let iconHeight: CGFloat = 64
    static let topPadding: CGFloat = 64
    static let shadowRadius: CGFloat = 4
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

                    Spacer()
                        .frame(height: Constants.spacing)

                    Text(message)
                        .font(.textPreset4(weight: .light))
                        .foregroundColor(messageForegroundColor)
                        .accessibilityIdentifier(messageAccessibilityIdentifier)
                        .accessibilityLabel(messageAccessibilityLabel)

                    reference
                }
                .expandHorizontally(alignment: .leading)
                .padding(.horizontal, 24)
                .padding(.top, Constants.topPadding)

                extraContent

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
        case .animation(let lottieView):
            lottieView
                .onAppear {
                    feedbackGenerator.prepare()

                    Timer.scheduledTimer(withTimeInterval: style.hapticFeedbackDelay, repeats: false) { _ in
                        feedbackGenerator.notificationOccurred(self.style.hapticFeedbackStyle)
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

        case .success, .informative, .error:
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
