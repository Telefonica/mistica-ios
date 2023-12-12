//
//  View+Snackbar.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import SwiftUI

// MARK: Crouton

public extension View {
    @ViewBuilder
    func crouton(
        isVisible: Binding<Bool>,
        style: SnackbarStyle = .normal,
        config: SnackbarConfig,
        dismissHandlerBlock: ((SnackbarDismissReason) -> Void)? = nil
    ) -> some View {
        modifier(
            SnackbarModifier(
                isVisible: isVisible,
                style: style,
                presentationMode: .crouton,
                config: config,
                dismissHandlerBlock: dismissHandlerBlock
            )
        )
    }

    @ViewBuilder
    func crouton(
        isVisible: Binding<Bool>,
        style: SnackbarStyle = .normal,
        buttonStyle: SnackbarButtonStyle = .short,
        config: SnackbarConfig,
        dismissHandlerBlock: ((SnackbarDismissReason) -> Void)? = nil
    ) -> some View {
        modifier(
            SnackbarModifier(
                isVisible: isVisible,
                style: style,
                buttonStyle: buttonStyle,
                presentationMode: .crouton,
                config: config,
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
        config: SnackbarConfig,
        dismissHandlerBlock: ((SnackbarDismissReason) -> Void)? = nil
    ) -> some View {
        modifier(
            SnackbarModifier(
                isVisible: isVisible,
                style: style,
                presentationMode: .normal,
                config: config,
                dismissHandlerBlock: dismissHandlerBlock
            )
        )
    }

    @ViewBuilder
    func snackbar(
        isVisible: Binding<Bool>,
        style: SnackbarStyle = .normal,
        buttonStyle: SnackbarButtonStyle = .short,
        config: SnackbarConfig,
        dismissHandlerBlock: ((SnackbarDismissReason) -> Void)? = nil
    ) -> some View {
        modifier(
            SnackbarModifier(
                isVisible: isVisible,
                style: style,
                buttonStyle: buttonStyle,
                presentationMode: .normal,
                config: config,
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
    var config: SnackbarConfig
    var dismissHandlerBlock: ((SnackbarDismissReason) -> Void)? = nil

    func body(content: Content) -> some View {
        ZStack(alignment: .bottom) {
            content
                .zIndex(0)

            if isVisible {
                VStack {
                    Spacer()

                    Snackbar(
                        config: config
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
    func dismiss(with reason: SnackbarDismissReason) {
        withAnimation { isVisible = false }
        dismissHandlerBlock?(reason)
    }
}
