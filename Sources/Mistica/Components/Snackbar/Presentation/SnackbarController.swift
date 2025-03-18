//
//  SnackbarController.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

public class SnackbarController: NSObject {
    public enum RootViewController {
        public typealias Closure = () -> UIViewController?
        public static let `default`: Closure = { UIApplication.shared.windows.filter(\.isKeyWindow).first?.rootViewController }
    }

    public typealias Token = UUID
    public typealias ActionConfig = (text: String, accessibilityLabel: String?, handler: DidTapActionBlock)

    public typealias DismissHandlerBlock = (SnackbarDismissReason) -> Void
    public typealias DidTapActionBlock = () -> Void

    private var currentSnackbar: OngoingSnackbar?

    public static let shared = SnackbarController()

    override init() {}
}

// MARK: Public functions

public extension SnackbarController {
    /// Show a snackbar
    /// - Parameters:
    ///   - text: The text to display in the snackbar
    ///   - action: An optional action which will show a button with the given title and invoke the handler when the button is pressed
    ///   - style: The style of the snackbar, `.info` by default
    ///   - dismissHandler: A handler which is called when the handler is removed from the screen
    ///   - exactViewController: The exact viewController where the snackbar will be show. Has priority over rootViewController
    ///   - rootViewController: The root view controller that will show the snackbar.
    @discardableResult
    func showSnackbar(
        config: SnackbarConfig,
        style: SnackbarStyle = .info,
        dismissHandler: DismissHandlerBlock? = nil,
        exactViewController: UIViewController? = nil,
        rootViewController: RootViewController.Closure? = nil
    ) -> Token {
        assertMainThread()

        let styleConfig = SnackbarStyleConfig(style: style, snackbarDismissInterval: config.dismissInterval)

        let token = Token()
        let dismissHandler: (SnackbarDismissReason) -> Void = { dismissReason in
            self.dismiss(token: token)

            dismissHandler?(dismissReason)
        }

        let overwrittenAction = config.dismissInterval.action.map { action -> ActionConfig in
            (
                action.title,
                action.accessibilityTitleLabel,
                {
                    dismissHandler(.button)
                    action.handler()
                }
            )
        }

        let snackbarView = SnackbarView(
            text: config.title,
            action: overwrittenAction,
            config: styleConfig,
            dismissHandler: dismissHandler,
            forceDismiss: config.forceDismiss
        )

        let ongoingSnackbar = OngoingSnackbar(
            token: token,
            snackbarView: snackbarView,
            exactViewController: exactViewController,
            rootViewController: rootViewController
        )
        show(ongoingSnackbar)

        return token
    }

    var isShowingASnackbar: Bool {
        currentSnackbar != nil
    }

    /// Dismisses the current snackbar if it exists
    func dismiss(token: Token) {
        assertMainThread()

        guard let currentToken = currentSnackbar?.token, currentToken == token else { return }

        dismissCurrentSnackbar()
    }
}

// MARK: Private methods

private extension SnackbarController {
    func show(_ snackbar: OngoingSnackbar) {
        dismissCurrentSnackbar()
        guard let view = snackbar.view() else { return }
        snackbar.snackbarView.show(in: view)
        currentSnackbar = snackbar
    }

    func dismissCurrentSnackbar() {
        currentSnackbar?.snackbarView.dismiss()
        currentSnackbar = nil
    }
}
