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
        let token: Token
        let croutonView: CroutonView
        private weak var exactViewController: UIViewController?
        private let rootViewController: RootViewController.Closure

        init(
            token: Token,
            croutonView: CroutonView,
            exactViewController: UIViewController? = nil,
            rootViewController: RootViewController.Closure? = nil
        ) {
            self.token = token
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
                return nil
            }
        }

//        private func visibleViewController(_ rootViewController: () -> UIViewController?) -> UIViewController? {
//            guard let rootViewController = rootViewController() else {
//                assertionFailure("Root view controller not found!")
//                return nil
//            }
//
//            let visibleVC = visibleViewController(from: rootViewController)
//
//            if let rootVC = visibleVC as? UINavigationController {
//                return visibleViewController(from: rootVC.topViewController!)
//            } else if let homeVC = visibleVC.parent?.tabBarController,
//                      let selectedNavigationController = homeVC.selectedViewController as? UINavigationController {
//                return visibleViewController(from: selectedNavigationController.topViewController!)
//            } else {
//                return visibleVC
//            }
//        }

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
