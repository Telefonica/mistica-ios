//
//  BottomSheetInteractiveDismissalTransition.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

final class BottomSheetInteractiveDismissalTransition: NSObject {
    private enum Constants {
        static let maxBouncingHeight: CGFloat = 250
        @MainActor static let animationDuration: CGFloat = UIView.defaultAnimationDuration
        static let animationCurve: UIView.AnimationCurve = .easeOut
    }

    private weak var transitionContext: UIViewControllerContextTransitioning?

    private var heightAnimator: UIViewPropertyAnimator?
    private var offsetAnimator: UIViewPropertyAnimator?

    private var interactiveDismissal: Bool = false

    var bottomConstraint: NSLayoutConstraint?
    var heightConstraint: NSLayoutConstraint?
}

// MARK: Public methods

extension BottomSheetInteractiveDismissalTransition {
    @MainActor
    func start(moving presentedView: UIView, interactiveDismissal: Bool) {
        self.interactiveDismissal = interactiveDismissal

        heightAnimator?.stopAnimation(false)
        heightAnimator?.finishAnimation(at: .start)
        offsetAnimator?.stopAnimation(false)
        offsetAnimator?.finishAnimation(at: .start)

        heightAnimator = createHeightAnimator(
            animating: presentedView, from: presentedView.frame.height
        )
    }

    @MainActor
    func move(_ presentedView: UIView, using translation: CGFloat) {
        let progress = translation / presentedView.frame.height

        heightAnimator?.fractionComplete = progress * -1
        offsetAnimator?.fractionComplete = progress

        transitionContext?.updateInteractiveTransition(progress)
    }

    @MainActor
    func stop(
        moving presentedView: UIView,
        at translation: CGFloat,
        with velocity: CGPoint
    ) {
        let progress = translation / presentedView.frame.height

        heightAnimator?.fractionComplete = progress * -1
        offsetAnimator?.fractionComplete = progress

        transitionContext?.updateInteractiveTransition(progress)

        let finishDismiss = velocity.y > 100 || progress > 0.45

        heightAnimator?.isReversed = true
        offsetAnimator?.isReversed = !finishDismiss

        if finishDismiss {
            transitionContext?.finishInteractiveTransition()
        } else {
            transitionContext?.cancelInteractiveTransition()
        }

        if progress < 0 {
            heightAnimator?.addCompletion { _ in
                Task { @MainActor in
                    self.offsetAnimator?.stopAnimation(false)
                    self.offsetAnimator?.finishAnimation(at: .start)
                }
            }

            heightAnimator?.startAnimation()
        } else {
            offsetAnimator?.addCompletion { _ in
                Task { @MainActor in
                    self.heightAnimator?.stopAnimation(false)
                    self.heightAnimator?.finishAnimation(at: .start)
                }
            }

            offsetAnimator?.startAnimation()
        }

        interactiveDismissal = false
    }
}

// MARK: UIViewControllerAnimatedTransitioning

extension BottomSheetInteractiveDismissalTransition: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        Constants.animationDuration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let presentedView = transitionContext.view(forKey: .from) else {
            return
        }

        offsetAnimator?.stopAnimation(true)

        let offset = presentedView.frame.height
        let offsetAnimator = createOffsetAnimator(
            animating: presentedView,
            to: offset,
            transitionContext: transitionContext
        )

        offsetAnimator.startAnimation()

        self.offsetAnimator = offsetAnimator
    }

    func interruptibleAnimator(
        using transitionContext: UIViewControllerContextTransitioning
    ) -> UIViewImplicitlyAnimating {
        guard let offsetAnimator = offsetAnimator else {
            fatalError("Somehow the offset animator was not set")
        }

        return offsetAnimator
    }
}

// MARK: UIViewControllerInteractiveTransitioning

extension BottomSheetInteractiveDismissalTransition: UIViewControllerInteractiveTransitioning {
    func startInteractiveTransition(_ transitionContext: UIViewControllerContextTransitioning) {
        guard transitionContext.isInteractive, let presentedView = transitionContext.view(forKey: .from) else {
            animateTransition(using: transitionContext)
            return
        }

        let fractionComplete = offsetAnimator?.fractionComplete ?? 0

        offsetAnimator?.stopAnimation(true)

        let offset = transitionContext.containerView.frame.height
        let offsetAnimator = createOffsetAnimator(
            animating: presentedView,
            to: offset,
            transitionContext: transitionContext
        )

        offsetAnimator.fractionComplete = fractionComplete

        transitionContext.updateInteractiveTransition(fractionComplete)

        self.offsetAnimator = offsetAnimator
        self.transitionContext = transitionContext
    }

    var wantsInteractiveStart: Bool {
        interactiveDismissal
    }

    var completionCurve: UIView.AnimationCurve {
        Constants.animationCurve
    }
}

// MARK: Private

private extension BottomSheetInteractiveDismissalTransition {
    @MainActor
    func createHeightAnimator(
        animating view: UIView,
        from height: CGFloat
    ) -> UIViewPropertyAnimator {
        let propertyAnimator = UIViewPropertyAnimator(
            duration: Constants.animationDuration,
            curve: Constants.animationCurve
        )

        heightConstraint?.constant = height
        heightConstraint?.isActive = true

        let finalHeight = height + Constants.maxBouncingHeight

        propertyAnimator.addAnimations {
            self.heightConstraint?.constant = finalHeight
            view.superview?.layoutIfNeeded()
        }

        propertyAnimator.addCompletion { position in
            Task { @MainActor in
                self.heightConstraint?.isActive = position == .end ? true : false
                self.heightConstraint?.constant = position == .end ? finalHeight : height
            }
        }

        return propertyAnimator
    }

    @MainActor
    func createOffsetAnimator(
        animating view: UIView,
        to offset: CGFloat,
        transitionContext: UIViewControllerContextTransitioning
    ) -> UIViewPropertyAnimator {
        let propertyAnimator = UIViewPropertyAnimator(
            duration: Constants.animationDuration,
            curve: Constants.animationCurve
        )

        propertyAnimator.addAnimations {
            self.bottomConstraint?.constant = offset
            view.superview?.layoutIfNeeded()
        }

        propertyAnimator.addCompletion { position in
            Task { @MainActor in
                self.bottomConstraint?.constant = position == .end ? offset : 0
            }
        }

        propertyAnimator.addCompletion { _ in
            Task { @MainActor in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
        }

        return propertyAnimator
    }
}
