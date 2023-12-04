//
//  View+Snackbar.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import SwiftUI

public enum CroutonDismissInterval {
    case fiveSeconds
    case tenSeconds
    case infinite

    var timeInterval: TimeInterval? {
        switch self {
        case .fiveSeconds:
            return 5
        case .tenSeconds:
            return 10
        case .infinite:
            return nil
        }
    }
}

// MARK: Crouton

public extension View {
    @ViewBuilder
    func crouton(
        isVisible: Binding<Bool>,
        style: SnackbarStyle = .normal,
        autoDismissDelay: CroutonDismissInterval? = .fiveSeconds,
        title: String,
        forceDismiss: Bool = false,
        dismissHandlerBlock: ((SnackbarDismissReason) -> Void)? = nil
    ) -> some View {
        modifier(
            SnackbarModifier(
                isVisible: isVisible,
                style: style,
                presentationMode: .crouton,
                autoDismissDelay: autoDismissDelay,
                title: title,
                forceDismiss: forceDismiss,
                dismissHandlerBlock: dismissHandlerBlock
            )
        )
    }

    @ViewBuilder
    func crouton(
        isVisible: Binding<Bool>,
        style: SnackbarStyle = .normal,
        buttonStyle: SnackbarButtonStyle = .short,
        autoDismissDelay: CroutonDismissInterval? = .tenSeconds,
        title: String,
        buttonTitle: String,
        buttonAction: (() -> Void)?,
        forceDismiss: Bool = false,
        dismissHandlerBlock: ((SnackbarDismissReason) -> Void)? = nil
    ) -> some View {
        modifier(
            SnackbarModifier(
                isVisible: isVisible,
                style: style,
                buttonStyle: buttonStyle,
                presentationMode: .crouton,
                autoDismissDelay: autoDismissDelay,
                title: title,
                buttonTitle: buttonTitle,
                buttonAction: buttonAction,
                forceDismiss: forceDismiss,
                dismissHandlerBlock: dismissHandlerBlock
            )
        )
    }
}

// MARK: Snackbar

public extension View {
    @ViewBuilder
    func snackbar(
        isVisible: Binding<Bool>,
        style: SnackbarStyle = .normal,
        autoDismissDelay: CroutonDismissInterval? = .fiveSeconds,
        title: String,
        forceDismiss: Bool = false,
        dismissHandlerBlock: ((SnackbarDismissReason) -> Void)? = nil
    ) -> some View {
        modifier(
            SnackbarModifier(
                isVisible: isVisible,
                style: style,
                presentationMode: .normal,
                autoDismissDelay: autoDismissDelay,
                title: title,
                forceDismiss: forceDismiss,
                dismissHandlerBlock: dismissHandlerBlock
            )
        )
    }

    @ViewBuilder
    func snackbar(
        isVisible: Binding<Bool>,
        style: SnackbarStyle = .normal,
        buttonStyle: SnackbarButtonStyle = .short,
        autoDismissDelay: CroutonDismissInterval? = .tenSeconds,
        title: String,
        buttonTitle: String,
        buttonAction: (() -> Void)?,
        forceDismiss: Bool = false,
        dismissHandlerBlock: ((SnackbarDismissReason) -> Void)? = nil
    ) -> some View {
        modifier(
            SnackbarModifier(
                isVisible: isVisible,
                style: style,
                buttonStyle: buttonStyle,
                presentationMode: .normal,
                autoDismissDelay: autoDismissDelay,
                title: title,
                buttonTitle: buttonTitle,
                buttonAction: buttonAction,
                forceDismiss: forceDismiss,
                dismissHandlerBlock: dismissHandlerBlock
            )
        )
    }
}

// MARK: Modifier

private struct SnackbarModifier: ViewModifier {
    @Binding var isVisible: Bool
    var style: SnackbarStyle = .normal
    var buttonStyle: SnackbarButtonStyle = .short
    var presentationMode: SnackbarPresentationMode = .normal
    var autoDismissDelay: CroutonDismissInterval? = nil
    var title: String
    var buttonTitle: String? = nil
    var buttonAction: (() -> Void)? = nil
    var forceDismiss: Bool = false
    var dismissHandlerBlock: ((SnackbarDismissReason) -> Void)? = nil

    func body(content: Content) -> some View {
        ZStack(alignment: .bottom) {
            content
                .zIndex(0)

            if isVisible {
                VStack {
                    Spacer()

                    Snackbar(
                        title: title,
                        buttonTitle: buttonTitle?.isEmpty == true ? nil : buttonTitle,
                        buttonAction: buttonAction,
                        forceDismiss: forceDismiss,
                        autoDismissDelay: normalizeDismissInterval(from: buttonAction, croutonDismissInterval: autoDismissDelay)
                    )
                    .presentationMode(presentationMode)
                    .style(style)
                    .buttonStyle(buttonStyle)
                    .onClose { reason in
                        dismiss(with: reason)
                    }
                }
                .zIndex(1)
                .edgesIgnoringSafeArea(edgesIgnoringSafeAreas)
                .transition(transition.animation(.misticaTimingCurve))
            }
        }
    }

    var edgesIgnoringSafeAreas: Edge.Set {
        switch presentationMode {
        case .normal:
            return []
        case .crouton:
            return .bottom
        }
    }

    var transition: AnyTransition {
        switch presentationMode {
        case .normal:
            return .opacity
        case .crouton:
            return .move(edge: .bottom)
        }
    }
}

private extension SnackbarModifier {
    func normalizeDismissInterval(from action: (() -> Void)?, croutonDismissInterval: CroutonDismissInterval?) -> CroutonDismissInterval {
        switch croutonDismissInterval {
        case .none where action != nil:
            return .tenSeconds
        case .fiveSeconds where action != nil:
            return .tenSeconds
        case .tenSeconds where action == nil:
            return .fiveSeconds
        case .none:
            return .fiveSeconds
        case .fiveSeconds:
            return .fiveSeconds
        case .tenSeconds:
            return .tenSeconds
        case .infinite:
            return .infinite
        }
    }

    func dismiss(with reason: SnackbarDismissReason) {
        DispatchQueue.main.async {
            withAnimation { isVisible = false }
            dismissHandlerBlock?(reason)
        }
    }
}
