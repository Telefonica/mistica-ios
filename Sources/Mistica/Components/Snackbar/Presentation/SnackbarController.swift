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

    private var snackbarViewList = [OngoingSnackbar]()
    private var showingToken: Token?

    public static let shared = SnackbarController()

    override init() {}
}

// MARK: Public functions

public extension SnackbarController {
    /// Show a snackbar (or enqueue one if there is already a snackbar shown)
    /// - Parameters:
    ///   - text: The text to display in the snackbar
    ///   - action: An optional action which will show a button with the given title and invoke the handler when the button is pressed
    ///   - style: The style of the snackbar, `.info` by default
    ///   - dismissHandler: A handler which is called when the handler is removed from the screen
    ///   - exactViewController: The exacti viewCotroller where the snackbar will be show. Has priority over rootViewController
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

        let dismissHandler: (SnackbarDismissReason) -> Void = { dismissReason in
            self.dismissCurrentSnackbar()

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

        let token = Token()
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

    /// Dismisses (or removes from enqueued snackbar) the snackbar identified by `token`
    /// - Parameter token: a unique token that identifies a snackbar
    func dismiss(token: Token) {
        assertMainThread()

        // There has to be a shown snackbar (even if it's not the one we are interested in)
        guard let showingToken = showingToken else { return }

        if showingToken == token {
            dismissCurrentSnackbar()
        } else if let index = snackbarViewList.firstIndex(where: { token == $0.token }) {
            snackbarViewList.remove(at: index)
        }
    }

    func dismissAll() {
        assertMainThread()
        dismissAllFromCurrentSnackbar()
    }
}

// MARK: Private methods

private extension SnackbarController {
    func show(_ snackbar: OngoingSnackbar) {
        enqueue(snackbar)
        showEnqueuedSnackbar()
    }

    func dismissCurrentSnackbar() {
        guard let snackbar = dequeue() else { return }

        snackbar.snackbarView.dismiss {
            self.showingToken = nil
            self.showEnqueuedSnackbar()
        }
    }

    func dismissAllFromCurrentSnackbar() {
        guard let ongoingSnackbarView = dequeue() else { return }

        ongoingSnackbarView.snackbarView.dismiss {
            self.showingToken = nil

            while let ongoingSnackbar = self.dequeue() {
                ongoingSnackbar.snackbarView.dismiss()
            }
        }
    }

    func enqueue(_ ongoingSnackbar: OngoingSnackbar) {
        snackbarViewList.append(ongoingSnackbar)
    }

    func dequeue() -> OngoingSnackbar? {
        guard !snackbarViewList.isEmpty else { return nil }

        return snackbarViewList.remove(at: 0)
    }

    func showEnqueuedSnackbar() {
        guard showingToken == nil else { return }
        guard let ongoingSnackbar = snackbarViewList.first else { return }
        guard let containerView = ongoingSnackbar.view() else { return }

        showingToken = ongoingSnackbar.token

        ongoingSnackbar.snackbarView.show(in: containerView)
    }
}
