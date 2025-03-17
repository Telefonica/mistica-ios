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

    public typealias ActionConfig = (text: String, accessibilityLabel: String?, handler: DidTapActionBlock)
    public typealias DismissHandlerBlock = (SnackbarDismissReason) -> Void
    public typealias DidTapActionBlock = () -> Void

    private var currentCroutonView: CroutonView?

    public static let shared = CroutonController()

    override init() {}
}

// MARK: Public functions

public extension CroutonController {
    /// Show a crouton
    /// - Parameters:
    ///   - text: The text to display in the crouton
    ///   - action: An optional action which will show a button with the given title and invoke the handler when the button is pressed
    ///   - style: The style of the crouton, `.info` by default
    ///   - dismissHandler: A handler which is called when the handler is removed from the screen
    ///   - exactViewController: The exacti viewCotroller where the croutono will be show. Has priority over rootViewController
    ///   - rootViewController: The root view controller that will show the crouton.
    func showCrouton(
        config: SnackbarConfig,
        style: CroutonStyle = .info,
        dismissHandler: DismissHandlerBlock? = nil,
        exactViewController: UIViewController? = nil,
        rootViewController: RootViewController.Closure? = nil
    ) {
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

        let croutonView = CroutonView(
            text: config.title,
            action: overwrittenAction,
            config: styleConfig,
            dismissHandler: dismissHandler,
            forceDismiss: config.forceDismiss
        )

        let ongoingCrouton = OngoingCrouton(
            croutonView: croutonView,
            exactViewController: exactViewController,
            rootViewController: rootViewController
        )

        show(ongoingCrouton)
    }

    var isShowingACrouton: Bool {
        currentCroutonView != nil
    }

    /// Dismisses the current crouton if it exists
    func dismiss() {
        assertMainThread()
        dismissCurrentCrouton()
    }
}

// MARK: Private methods

private extension CroutonController {
    func show(_ crouton: OngoingCrouton) {
        dismissCurrentCrouton()
        guard let view = crouton.view() else { return }
        crouton.croutonView.show(in: view)
        currentCroutonView = crouton.croutonView
    }

    func dismissCurrentCrouton() {
        currentCroutonView?.dismiss()
        currentCroutonView = nil
    }
}
