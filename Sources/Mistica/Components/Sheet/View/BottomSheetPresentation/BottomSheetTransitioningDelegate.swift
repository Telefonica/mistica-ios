//
//  BottomSheetTransitioningDelegate.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

// MARK: BottomSheetTransitioningDelegate

final class BottomSheetTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {
    private weak var bottomSheetPresentationController: BottomSheetPresentationController?

    func presentationController(
        forPresented presented: UIViewController,
        presenting: UIViewController?,
        source: UIViewController
    ) -> UIPresentationController? {
        let bottomSheetPresentationController = BottomSheetPresentationController(
            presentedViewController: presented,
            presenting: presenting ?? source
        )

        self.bottomSheetPresentationController = bottomSheetPresentationController

        return bottomSheetPresentationController
    }

    func animationController(
        forDismissed dismissed: UIViewController
    ) -> UIViewControllerAnimatedTransitioning? {
        guard
            let bottomSheetPresentationController = dismissed.presentationController as? BottomSheetPresentationController
        else {
            return nil
        }

        return bottomSheetPresentationController.bottomSheetInteractiveDismissalTransition
    }

    func interactionControllerForDismissal(
        using animator: UIViewControllerAnimatedTransitioning
    ) -> UIViewControllerInteractiveTransitioning? {
        animator as? BottomSheetInteractiveDismissalTransition
    }
}

