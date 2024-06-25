//
//  CroutonController.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

public class CroutonController: NSObject {
    public typealias Token = UUID
    public typealias ActionConfig = (text: String, accessibilityLabel: String?, handler: DidTapActionBlock)
    fileprivate typealias OngoingCrouton = (token: Token, croutonView: CroutonView, rootViewController: () -> UIViewController?)

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
    @available(iOSApplicationExtension, unavailable)
    @discardableResult
    func showCrouton(
        config: SnackbarConfig,
        style: CroutonStyle = .info,
        dismissHandler: DismissHandlerBlock? = nil
    ) -> Token {
        showCrouton(
            config: config,
            style: style,
            dismissHandler: dismissHandler,
            rootViewController: UIApplication.shared.windows.filter(\.isKeyWindow).first?.rootViewController
        )
    }

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
        rootViewController: @escaping @autoclosure () -> UIViewController?
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
        let crouton = CroutonView(
            text: config.title,
            action: overwrittenAction,
            config: styleConfig,
            dismissHandler: dismissHandler,
            forceDismiss: config.forceDismiss
        )

        show(crouton, token: token, rootViewController: rootViewController)

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
    func show(_ crouton: CroutonView, token: Token, rootViewController: @escaping () -> UIViewController?) {
        enqueue(OngoingCrouton(token: token, croutonView: crouton, rootViewController: rootViewController))

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
        guard let containerView = visibleContainerView(ongoingCrouton.rootViewController) else { return }

        showingToken = ongoingCrouton.token

        ongoingCrouton.croutonView.show(in: containerView)
    }

    func visibleContainerView(_ rootViewController: () -> UIViewController?) -> UIView? {
        guard let viewController = visibleViewController(rootViewController) else { return nil }

        if let viewController = viewController as? CustomCroutonContainer {
            return viewController.customCroutonContainerView
        } else {
            return viewController.view
        }
    }

    func visibleViewController(_ rootViewController: () -> UIViewController?) -> UIViewController? {
        guard let rootViewController = rootViewController() else {
            assertionFailure("Root view controller not found!")
            return nil
        }

        let visibleVC = visibleViewController(from: rootViewController)

        if let rootVC = visibleVC as? UINavigationController {
            return visibleViewController(from: rootVC.topViewController!)
        } else if let homeVC = visibleVC.parent?.tabBarController,
                  let selectedNavigationController = homeVC.selectedViewController as? UINavigationController {
            return visibleViewController(from: selectedNavigationController.topViewController!)
        } else {
            return visibleVC
        }
    }

    func visibleViewController(from viewController: UIViewController) -> UIViewController {
        if let presentedViewController = viewController.presentedViewController {
            if presentedViewController is UIAlertController {
                return viewController
            } else {
                return visibleViewController(from: presentedViewController)
            }
        } else if let viewController = viewController as? UINavigationController {
            if let topViewController = viewController.topViewController {
                return visibleViewController(from: topViewController)
            } else {
                return viewController
            }
        } else if let tabViewController = viewController as? UITabBarController {
            if let selectedTab = tabViewController.selectedViewController {
                return selectedTab
            } else {
                return viewController
            }
        }

        return viewController
    }
}
