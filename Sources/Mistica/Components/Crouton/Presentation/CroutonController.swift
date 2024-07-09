//
//  CroutonController.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

public class CroutonController: NSObject {
    public enum RootViewController {
        public typealias Closure = () -> UIViewController?
        public static let `default`: Closure = { UIApplication.shared.windows.filter(\.isKeyWindow).first?.rootViewController }
    }

//    public typealias RootViewControllerClosure = () -> UIViewController?
//    public static let defaultRootViewControllerClosure = { UIApplication.shared.windows.filter(\.isKeyWindow).first?.rootViewController }

    public typealias Token = UUID
    public typealias ActionConfig = (text: String, accessibilityLabel: String?, handler: DidTapActionBlock)

    public typealias DismissHandlerBlock = (SnackbarDismissReason) -> Void
    public typealias DidTapActionBlock = () -> Void

    private var croutonViewList = [OngoingCrouton]()
    private var showingToken: Token?

    public static let shared = CroutonController()

    override init() {}
}

// MARK: Public functions

public extension CroutonController {
    /// Show a crouton (or enqueue one if there is already a crouton shown)
    /// - Parameters:
    ///   - text: The text to display in the crouton
    ///   - action: An optional action which will show a button with the given title and invoke the handler when the button is pressed
    ///   - style: The style of the crouton, `.info` by default
    ///   - dismissHandler: A handler which is called when the handler is removed from the screen
//    @available(iOSApplicationExtension, unavailable)
//    @discardableResult
//    func showCrouton(
//        config: SnackbarConfig,
//        style: CroutonStyle = .info,
//        dismissHandler: DismissHandlerBlock? = nil
//    ) -> Token {
//        showCrouton(
//            config: config,
//            style: style,
//            dismissHandler: dismissHandler,
//            rootViewController: UIApplication.shared.windows.filter(\.isKeyWindow).first?.rootViewController
//        )
//    }

    /// Show a crouton (or enqueue one if there is already a crouton shown)
    /// - Parameters:
    ///   - text: The text to display in the crouton
    ///   - action: An optional action which will show a button with the given title and invoke the handler when the button is pressed
    ///   - style: The style of the crouton, `.info` by default
    ///   - dismissHandler: A handler which is called when the handler is removed from the screen
    ///   - rootViewController: The root view controller that will show the crouton.
    @discardableResult
    func showCrouton(
        config: SnackbarConfig,
        style: CroutonStyle = .info,
        dismissHandler: DismissHandlerBlock? = nil,
        exactViewController: UIViewController? = nil,
        rootViewController: RootViewController.Closure? = nil
    ) -> Token {
        assertMainThread()

        let styleConfig = CroutonConfig(style: style, croutonDismissInterval: config.dismissInterval)

        let dismissHandler: (SnackbarDismissReason) -> Void = { dismissReason in
            self.dismissCurrentCrouton()

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
        let croutonView = CroutonView(
            text: config.title,
            action: overwrittenAction,
            config: styleConfig,
            dismissHandler: dismissHandler,
            forceDismiss: config.forceDismiss
        )

        let ongoingCrouton = OngoingCrouton(
            token: token,
            croutonView: croutonView,
            exactViewController: exactViewController,
            rootViewController: rootViewController
        )
        show(ongoingCrouton)

        return token
    }

    var isShowingACrouton: Bool {
        showingToken != nil
    }

    /// Dismisses (or removes from enqueued croutons) the crouton identified by `token`
    /// - Parameter token: a unique token that identifies a crouton
    func dismiss(token: Token) {
        assertMainThread()

        // There has to be a shown crouton (even if it's not the one we are interested in)
        guard let showingToken = showingToken else { return }

        if showingToken == token {
            dismissCurrentCrouton()
        } else if let index = croutonViewList.firstIndex(where: { token == $0.token }) {
            croutonViewList.remove(at: index)
        }
    }

    func dismissAll() {
        assertMainThread()
        dismissAllFromCurrentCrouton()
    }
}

// MARK: Private methods

private extension CroutonController {
    func show(_ crouton: OngoingCrouton) {
        enqueue(crouton)
        showEnqueuedCrouton()
    }

    func dismissCurrentCrouton() {
        guard let crouton = dequeue() else { return }

        crouton.croutonView.dismiss {
            self.showingToken = nil
            self.showEnqueuedCrouton()
        }
    }

    func dismissAllFromCurrentCrouton() {
        guard let ongoingCrouton = dequeue() else { return }

        ongoingCrouton.croutonView.dismiss {
            self.showingToken = nil

            while let ongoingCrouton = self.dequeue() {
                ongoingCrouton.croutonView.dismiss()
            }
        }
    }

    func enqueue(_ ongoingCrouton: OngoingCrouton) {
        croutonViewList.append(ongoingCrouton)
    }

    func dequeue() -> OngoingCrouton? {
        guard !croutonViewList.isEmpty else { return nil }

        return croutonViewList.remove(at: 0)
    }

    func showEnqueuedCrouton() {
        guard showingToken == nil else { return }
        guard let ongoingCrouton = croutonViewList.first else { return }
        guard let containerView = ongoingCrouton.view() else { return }

        showingToken = ongoingCrouton.token

        ongoingCrouton.croutonView.show(in: containerView)
    }
}
