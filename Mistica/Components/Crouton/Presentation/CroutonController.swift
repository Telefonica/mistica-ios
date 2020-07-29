//
//  CroutonController.swift
//  Mistica
//
//  Created by dmarin on 28/10/2016.
//  Copyright © 2016 Tuenti Technologies S.L. All rights reserved.
//

import UIKit

@available(iOSApplicationExtension, unavailable)
public class CroutonController: NSObject {
    public struct Token: Equatable {
        private let identifier: ObjectIdentifier
        fileprivate init(_ croutonView: CroutonView) {
            identifier = ObjectIdentifier(croutonView)
        }

        #if DEBUG
            static var stub: Token {
                Token(CroutonView(text: "", config: CroutonConfig(style: .info)))
            }
        #endif
    }

    public typealias ActionConfig = (text: String, handler: DidTapActionBlock)

    public typealias DismissHandlerBlock = () -> Void
    public typealias DidTapActionBlock = () -> Void

    private var croutonViewList = [CroutonView]()
    private var showingToken: Token?

    public static let shared = CroutonController()

    override init() {}
}

// MARK: Public functions

@available(iOSApplicationExtension, unavailable)
public extension CroutonController {
    /// Show a crouton (or enqueue one if there is already a crouton shown)
    /// - Parameters:
    ///   - text: The text to display in the crouton
    ///   - action: An optional action which will show a button with the given title and invoke the handler when the button is pressed
    ///   - style: The style of the crouton, `.info` by default
    ///   - dismissHandler: A handler which is called when the handler is removed from the screen
    @discardableResult
    func showCrouton(withText text: String,
                     action: ActionConfig? = nil,
                     style: CroutonStyle = .info,
                     dismissHandler: DismissHandlerBlock? = nil) -> Token {
        assertMainThread()

        let config = CroutonConfig(style: style)

        let dismissHandler = {
            self.dismissCurrentCrouton()

            dismissHandler?()
        }

        let overwrittenAction = action.map { (actionText, handler) -> ActionConfig in
            (actionText, {
                dismissHandler()
                handler()
            })
        }

        let crouton = CroutonView(text: text,
                                  action: overwrittenAction,
                                  config: config,
                                  dismissHandler: dismissHandler)

        show(crouton)

        return Token(crouton)
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
        } else if let index = croutonViewList.firstIndex(where: { token == Token($0) }) {
            croutonViewList.remove(at: index)
        }
    }

    func dismissAll() {
        assertMainThread()
        dismissAllFromCurrentCrouton()
    }
}

// MARK: Private methods

@available(iOSApplicationExtension, unavailable)
private extension CroutonController {
    func show(_ crouton: CroutonView) {
        enqueue(crouton)

        showEnqueuedCrouton()
    }

    func dismissCurrentCrouton() {
        guard let crouton = dequeue() else { return }

        crouton.dismiss {
            self.showingToken = nil
            self.showEnqueuedCrouton()
        }
    }

    func dismissAllFromCurrentCrouton() {
        guard let crouton = dequeue() else { return }

        crouton.dismiss {
            self.showingToken = nil

            while let crouton = self.dequeue() {
                crouton.dismiss()
            }
        }
    }

    func enqueue(_ crouton: CroutonView) {
        croutonViewList.append(crouton)
    }

    func dequeue() -> CroutonView? {
        guard !croutonViewList.isEmpty else { return nil }

        return croutonViewList.remove(at: 0)
    }

    func showEnqueuedCrouton() {
        guard showingToken == nil else { return }
        guard let crouton = croutonViewList.first else { return }
        guard let containerView = visibleContainerView() else { return }

        showingToken = Token(crouton)

        crouton.show(in: containerView)
    }

    func visibleContainerView() -> UIView? {
        guard let viewController = visibleViewController() else { return nil }

        if let viewController = viewController as? CustomCroutonContainer {
            return viewController.customCroutonContainerView
        } else {
            return viewController.view
        }
    }

    func visibleViewController() -> UIViewController? {
        guard let window = UIApplication.shared.keyWindow else {
            assertionFailure("Could not find the app's key window.")
            return nil
        }

        if let rootVC = window.rootViewController as? UINavigationController {
            return visibleViewController(from: rootVC.topViewController!)
        } else if let homeVC = window.rootViewController?.tabBarController,
            let selectedNavigationController = homeVC.selectedViewController as? UINavigationController {
            return visibleViewController(from: selectedNavigationController.topViewController!)
        } else {
            return window.rootViewController
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
        }

        return viewController
    }
}
