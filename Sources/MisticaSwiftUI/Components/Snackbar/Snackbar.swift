//
//  Snackbar.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation

import SwiftUI

public enum SnackbarStyle {
    case normal
    case error
}

public enum SnackbarPresentationMode {
    case normal
    case crouton
}

public enum SnackbarButtonStyle {
    case large
    case short
}

public enum SnackbarDismissReason: Int, RawRepresentable {
    case dismiss
    case button
    case timeout

    public typealias RawValue = String

    public var rawValue: RawValue {
        switch self {
        case .dismiss:
            return "DISMISS"
        case .button:
            return "BUTTON"
        case .timeout:
            return "TIMEOUT"
        }
    }

    public init?(rawValue: RawValue) {
        switch rawValue {
        case "DISMISS":
            self = .dismiss
        case "BUTTON":
            self = .button
        case "TIMEOUT":
            self = .timeout
        default:
            return nil
        }
    }
}

public struct Snackbar: View {
    @Environment(\.safeAreaInsets) private var safeAreaInsets

    public typealias DismissHandlerBlock = (SnackbarDismissReason) -> Void
    public typealias DidTapActionBlock = () -> Void

    private var style: SnackbarStyle = .normal
    private var presentationMode: SnackbarPresentationMode = .normal
    private var buttonStyle: SnackbarButtonStyle = .short
    private var title: String
    private var buttonTitle: String?
    private var buttonAction: (() -> Void)?
    private var autoDismissDelay: CroutonDismissInterval?

    private var buttonAccessibilityLabel: String?
    private var buttonAccessibilityIdentifier: String?
    private var titleAccessibilityLabel: String?
    private var titleAccessibilityIdentifier: String?
    private var forceDismiss: Bool
    private var dismissHandlerBlock: DismissHandlerBlock?
    @State private var timer: Timer?

    public init(
        title: String,
        buttonTitle: String?,
        buttonAction: (() -> Void)?,
        forceDismiss: Bool = false,
        autoDismissDelay: CroutonDismissInterval? = nil
    ) {
        self.title = title
        self.buttonTitle = buttonTitle
        self.buttonAction = buttonAction
        self.forceDismiss = forceDismiss
        self.autoDismissDelay = autoDismissDelay
    }

    public var body: some View {
        stack {
            switch buttonStyle {
            case .large:
                horizontalStack {
                    Text(title)
                        .font(.textPreset2(weight: .regular))
                        .foregroundColor(.textPrimaryInverse)
                        .accessibilityLabel(titleAccessibilityLabel)
                        .accessibilityIdentifier(titleAccessibilityIdentifier)
                        .expandHorizontally(alignment: .leading)
                    if shouldShowCloseButton {
                        dismissView
                    }
                }

                alignedButton
            case .short:
                horizontalStack {
                    Text(title)
                        .font(.textPreset2(weight: .regular))
                        .foregroundColor(.textPrimaryInverse)
                        .accessibilityLabel(titleAccessibilityLabel)
                        .accessibilityIdentifier(titleAccessibilityIdentifier)
                        .expandHorizontally(alignment: .leading)
                    alignedButton
                    if shouldShowCloseButton {
                        dismissView
                    }
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 14)
        .applying { content in
            switch presentationMode {
            case .normal:
                content
                    .background(backgroundColor)
                    .round(radiusStyle: .popup)
                    .padding(8)

            case .crouton:
                content
                    .padding(.bottom, safeAreaInsets.bottom)
                    .background(backgroundColor)
            }
        }
        .onAppear(perform: {
            guard let timeInterval = autoDismissDelay?.timeInterval else {
                return
            }

            timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: false, block: { _ in
                executeDismissHandlerBlock(with: .timeout)
            })
        })
    }
}

// MARK: Private

private extension Snackbar {
    @ViewBuilder
    func stack<T: View>(@ViewBuilder content: () -> T) -> some View {
        VStack(alignment: .trailing, spacing: 18, content: content)
    }

    @ViewBuilder
    var alignedButton: some View {
        switch buttonStyle {
        case .large:
            if let title = buttonTitle, let action = buttonAction {
                Button(title) {
                    action()
                    executeDismissHandlerBlock(with: .button)
                }
                .accessibilityLabel(buttonAccessibilityLabel)
                .accessibilityIdentifier(buttonAccessibilityIdentifier)
                .buttonStyle(misticaButtonStyle)
            }
        case .short:
            if let title = buttonTitle, let action = buttonAction {
                Spacer()
                Button(title) {
                    action()
                    executeDismissHandlerBlock(with: .button)
                }
                .accessibilityLabel(buttonAccessibilityLabel)
                .accessibilityIdentifier(buttonAccessibilityIdentifier)
                .buttonStyle(misticaButtonStyle)
            }
        }
    }

    @ViewBuilder
    private var dismissView: some View {
        Button(action: {
            executeDismissHandlerBlock(with: .dismiss)
        }, label: {
            Image.closeButtonBlackSmallIcon.renderingMode(.template)
                .frame(width: 22, height: 22, alignment: .center)
                .foregroundColor(.inverse)
        })
    }

    @ViewBuilder
    func horizontalStack<T: View>(@ViewBuilder content: () -> T) -> some View {
        HStack(spacing: 16, content: content)
    }

    @ViewBuilder
    func verticalStack<T: View>(@ViewBuilder content: () -> T) -> some View {
        VStack(alignment: .trailing, spacing: 18, content: content)
    }

    var misticaButtonStyle: MisticaButtonStyle {
        style == .normal
            ? .misticaSnackbar(small: true, bleedingAlignment: .trailing)
            : .misticaLinkInverse(small: true, bleedingAlignment: .trailing)
    }

    var backgroundColor: Color {
        style == .normal ? .feedbackInfoBackground : .feedbackErrorBackground
    }

    var shouldShowCloseButton: Bool {
        guard autoDismissDelay == .infinite else {
            return false
        }

        return buttonTitle == nil || (buttonTitle != nil && forceDismiss)
    }

    func executeDismissHandlerBlock(with reason: SnackbarDismissReason) {
        timer?.invalidate()
        timer = nil
        dismissHandlerBlock?(reason)
    }
}

// MARK: Modifiers

public extension Snackbar {
    func style(_ style: SnackbarStyle) -> Snackbar {
        var view = self
        view.style = style
        return view
    }

    func presentationMode(_ presentationMode: SnackbarPresentationMode) -> Snackbar {
        var view = self
        view.presentationMode = presentationMode
        return view
    }

    func buttonStyle(_ buttonStyle: SnackbarButtonStyle) -> Snackbar {
        var view = self
        view.buttonStyle = buttonStyle
        return view
    }

    func buttonAccessibilityLabel(_ buttonAccessibilityLabel: String?) -> Snackbar {
        var snackbar = self
        snackbar.buttonAccessibilityLabel = buttonAccessibilityLabel
        return snackbar
    }

    func buttonAccessibilityIdentifier(_ buttonAccessibilityIdentifier: String?) -> Snackbar {
        var snackbar = self
        snackbar.buttonAccessibilityIdentifier = buttonAccessibilityIdentifier
        return snackbar
    }

    func titleAccessibilityLabel(_ titleAccessibilityLabel: String?) -> Snackbar {
        var snackbar = self
        snackbar.titleAccessibilityLabel = titleAccessibilityLabel
        return snackbar
    }

    func titleAccessibilityIdentifier(_ titleAccessibilityIdentifier: String?) -> Snackbar {
        var snackbar = self
        snackbar.titleAccessibilityIdentifier = titleAccessibilityIdentifier
        return snackbar
    }

    func onClose(perform action: DismissHandlerBlock? = nil) -> Snackbar {
        var snackbar = self
        snackbar.dismissHandlerBlock = action
        return snackbar
    }
}
