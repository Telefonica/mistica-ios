//
//  SheetPresentationAnimator.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

/**
 Basically the animator will animate the new View Controller showing it from the bottom.
 It will be dismissed in the opposite direction.
 */
class SheetPresentationAnimator: NSObject {
    private let isPresentation: Bool
    init(isPresentation: Bool) {
        self.isPresentation = isPresentation
    }
}

extension SheetPresentationAnimator: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        UIView.defaultAnimationDuration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let key = isPresentation ? UITransitionContextViewControllerKey.to : UITransitionContextViewControllerKey.from
        guard let controller = transitionContext.viewController(forKey: key) else { return }
        let animationDuration = transitionDuration(using: transitionContext)

        let presentedFrame = transitionContext.finalFrame(for: controller)
        var dismissedFrame = presentedFrame
        dismissedFrame.origin.y = transitionContext.containerView.frame.size.height

        let initialFrame: CGRect
        let finalFrame: CGRect
        let options: UIView.AnimationOptions

        if isPresentation {
            transitionContext.containerView.addSubview(controller.view)
            initialFrame = dismissedFrame
            finalFrame = presentedFrame
            options = .curveEaseOut
        } else {
            initialFrame = presentedFrame
            finalFrame = dismissedFrame
            options = .curveEaseIn
        }

        controller.view.frame = initialFrame
        UIView.animate(withDuration: animationDuration, delay: 0, options: options, animations: {
            controller.view.frame = finalFrame
        }) { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}
