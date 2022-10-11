//
//  SheetTransitioningDelegate.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

public class SheetTransitioningDelegate: NSObject {
    private enum Constants {
        static let percentageToDismiss: CGFloat = 0.35
    }

    private var isInteractionInProgress = false
    private let percentDrivenInteractiveTransition = UIPercentDrivenInteractiveTransition()
}

/// An object that manages the presentation and transition of a sheet.
///
/// To present a view controller with a sheet appearance you should set the `modalPresentationStyle` of a view controller to `.custom`
/// and set its transitioning delegate to an instance of this class.
extension SheetTransitioningDelegate: UIViewControllerTransitioningDelegate {
    // MARK: - Functions

    public func presentationController(
        forPresented presented: UIViewController,
        presenting: UIViewController?,
        source: UIViewController
    ) -> UIPresentationController? {
        SheetPresentationController(presented: presented, presenting: presenting)
    }

    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        SheetPresentationAnimator(isPresentation: true)
    }

    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        SheetPresentationAnimator(isPresentation: false)
    }

    public func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        isInteractionInProgress ? percentDrivenInteractiveTransition : nil
    }
}

extension SheetTransitioningDelegate: SheetViewControllerDelegate {
    public func sheetViewControllerDidStartDragging(_ sheetViewController: SheetViewController) {
        startDismiss(sheetViewController)
    }

    public func sheetViewController(_ sheetViewController: SheetViewController, didDrag percentage: CGFloat) {
        updateDismissProgress(percentage: percentage)
    }

    public func sheetViewControllerDidEndDragging(_ selectorViewController: SheetViewController) {
        finishDismiss()
    }
}

private extension SheetTransitioningDelegate {
    func startDismiss(_ viewController: UIViewController) {
        isInteractionInProgress = true
        viewController.dismiss(animated: true, completion: nil)
    }

    func updateDismissProgress(percentage: CGFloat) {
        let sanitizedPercentage = min(max(0, percentage), 1)
        percentDrivenInteractiveTransition.update(sanitizedPercentage)
    }

    func finishDismiss() {
        isInteractionInProgress = false
        if percentDrivenInteractiveTransition.percentComplete > Constants.percentageToDismiss {
            percentDrivenInteractiveTransition.finish()
        } else {
            percentDrivenInteractiveTransition.cancel()
        }
    }
}
