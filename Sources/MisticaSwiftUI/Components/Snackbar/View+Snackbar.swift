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

@available(iOS 13.0, *)
public extension View {
    @ViewBuilder
    func crouton(
        isVisible: Binding<Bool>,
        style: SnackbarStyle = .normal,
        isInsideTabbar: Bool = false,
        autoDismissDelay: TimeInterval? = 5,
        title: String
    ) -> some View {
        modifier(
            SnackbarModifier(
                isVisible: isVisible,
                style: style,
                isInsideTabbar: isInsideTabbar,
                presentationMode: .crouton(isInsideTabbar: isInsideTabbar),
                autoDismissDelay: autoDismissDelay,
                title: title
            )
        )
    }

    @ViewBuilder
    func crouton(
        isVisible: Binding<Bool>,
        style: SnackbarStyle = .normal,
        isInsideTabbar: Bool = false,
        buttonStyle: SnackbarButtonStyle = .short,
        autoDismissDelay: TimeInterval? = 10,
        title: String,
        buttonTitle: String,
        buttonAction: @escaping () -> Void
    ) -> some View {
        modifier(
            SnackbarModifier(
                isVisible: isVisible,
                style: style,
                isInsideTabbar: isInsideTabbar,
                buttonStyle: buttonStyle,
                presentationMode: .crouton(isInsideTabbar: isInsideTabbar),
                autoDismissDelay: autoDismissDelay,
                title: title,
                buttonTitle: buttonTitle,
                buttonAction: buttonAction
            )
        )
    }
}

// MARK: Snackbar

@available(iOS 13.0, *)
public extension View {
    @ViewBuilder
    func snackbar(
        isVisible: Binding<Bool>,
        style: SnackbarStyle = .normal,
        autoDismissDelay: TimeInterval? = 5,
        title: String
    ) -> some View {
        modifier(
            SnackbarModifier(
                isVisible: isVisible,
                style: style,
                presentationMode: .normal,
                autoDismissDelay: autoDismissDelay,
                title: title
            )
        )
    }

    @ViewBuilder
    func snackbar(
        isVisible: Binding<Bool>,
        style: SnackbarStyle = .normal,
        buttonStyle: SnackbarButtonStyle = .short,
        autoDismissDelay: TimeInterval? = 10,
        title: String,
        buttonTitle: String,
        buttonAction: @escaping () -> Void
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
                buttonAction: buttonAction
            )
        )
    }
}

// MARK: Modifier

@available(iOS 13.0, *)
private struct SnackbarModifier: ViewModifier {
    @Binding var isVisible: Bool
    var style: SnackbarStyle = .normal
    var isInsideTabbar: Bool = false
    var buttonStyle: SnackbarButtonStyle = .short
    var presentationMode: SnackbarPresentationMode = .normal
    var autoDismissDelay: TimeInterval? = nil
    var title: String
    var buttonTitle: String? = nil
    var buttonAction: (() -> Void)? = nil

    func body(content: Content) -> some View {
        ZStack(alignment: .bottom) {
            content
                .zIndex(0)

            if isVisible {
                VStack {
                    Spacer()

                    Snackbar(
                        title: title,
                        button: {
                            if let buttonTitle = buttonTitle, let buttonAction = buttonAction {
                                Button(buttonTitle, action: buttonAction)
                            }
                        }
                    )
                    .presentationMode(presentationMode)
                    .style(style)
                    .buttonStyle(buttonStyle)
                    .onAppear {
                        if let autoDismissDelay = autoDismissDelay {
                            DispatchQueue.main.asyncAfter(deadline: .now() + autoDismissDelay) {
                                withAnimation { isVisible = false }
                            }
                        }
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
            return isInsideTabbar ? [] : .bottom
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
