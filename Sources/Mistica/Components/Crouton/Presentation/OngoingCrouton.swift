//
//  OngoingCrouton.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

extension CroutonController {
    struct OngoingCrouton {
        let croutonView: CroutonView
        private weak var exactViewController: UIViewController?
        private let rootViewController: RootViewController.Closure

        init(
            croutonView: CroutonView,
            exactViewController: UIViewController? = nil,
            rootViewController: RootViewController.Closure? = nil
        ) {
            self.croutonView = croutonView
            self.exactViewController = exactViewController
            self.rootViewController = rootViewController ?? RootViewController.default
        }

        func view() -> UIView? {
            guard let viewController = viewController() else { return nil }

            if let viewController = viewController as? CustomCroutonContainer {
                return viewController.customCroutonContainerView
            } else {
                return viewController.view
            }
        }

        private func viewController() -> UIViewController? {
            if let exactViewController {
                return exactViewController
            } else if let rootViewController = rootViewController() {
                return visibleViewController(from: rootViewController)
            } else {
                assertionFailure("Root view controller not found!")
                return nil
            }
        }

        private func visibleViewController(from viewController: UIViewController) -> UIViewController {
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
}
