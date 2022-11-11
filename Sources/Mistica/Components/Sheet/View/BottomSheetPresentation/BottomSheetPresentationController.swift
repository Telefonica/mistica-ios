//
//  BottomSheetPresentationController.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

final class BottomSheetPresentationController: UIPresentationController {
    private lazy var backgroundDimmingView: DimmedView = {
        let view = DimmedView()
        view.didTap = { [weak self] _ in
            self?.presentedViewController.dismiss(animated: true)
        }
        return view
    }()

    let bottomSheetInteractiveDismissalTransition = BottomSheetInteractiveDismissalTransition()

    private lazy var panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(onPan))

    @objc private func onPan(_ gestureRecognizer: UIPanGestureRecognizer) {
        guard let presentedView = presentedView else {
            return
        }

        let translation = gestureRecognizer.translation(in: presentedView)
        let progress = translation.y / presentedView.frame.height

        switch gestureRecognizer.state {
        case .began:
            bottomSheetInteractiveDismissalTransition.start(
                moving: presentedView, interactiveDismissal: true
            )
        case .changed:
            if progress > 0 && !presentedViewController.isBeingDismissed {
                presentingViewController.dismiss(animated: true)
            }
            bottomSheetInteractiveDismissalTransition.move(presentedView, using: translation.y)
        default:
            let velocity = gestureRecognizer.velocity(in: presentedView)
            bottomSheetInteractiveDismissalTransition.stop(
                moving: presentedView,
                at: translation.y,
                with: velocity
            )
        }
    }

    // MARK: UIPresentationController

    override func presentationTransitionWillBegin() {
        guard let presentedView = presentedView else {
            return
        }

        presentedView.addGestureRecognizer(panGestureRecognizer)

        presentedView.layer.cornerRadius = 12
        presentedView.layer.maskedCorners = [
            .layerMinXMinYCorner,
            .layerMaxXMinYCorner
        ]

        guard let containerView = containerView else {
            return
        }

        containerView.addSubview(withDefaultConstraints: backgroundDimmingView)

        let preferredHeightConstraint = presentedView.heightAnchor.constraint(
            equalTo: containerView.heightAnchor
        )

        preferredHeightConstraint.priority = .fittingSizeLevel

        let topConstraint = presentedView.topAnchor.constraint(
            greaterThanOrEqualTo: containerView.topAnchor,
            constant: UIScreen.main.bounds.size.height * 0.3
        )

        // Prevents conflicts with the height constraint used by the animated transition
        topConstraint.priority = .required - 1

        let heightConstraint = presentedView.heightAnchor.constraint(equalToConstant: 0)
        let bottomConstraint = presentedView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)

        containerView.addSubview(presentedView, constraints: [
            topConstraint,
            presentedView.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor
            ),
            presentedView.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor
            ),
            bottomConstraint,
            preferredHeightConstraint
        ])

        bottomSheetInteractiveDismissalTransition.bottomConstraint = bottomConstraint
        bottomSheetInteractiveDismissalTransition.heightConstraint = heightConstraint

        guard let transitionCoordinator = presentingViewController.transitionCoordinator else {
            return
        }

        transitionCoordinator.animate { _ in
            self.backgroundDimmingView.dimState = .max
        }
    }

    override func presentationTransitionDidEnd(_ completed: Bool) {
        guard !completed else { return }

        backgroundDimmingView.removeFromSuperview()
        presentedView?.removeGestureRecognizer(panGestureRecognizer)
    }

    override func dismissalTransitionWillBegin() {
        guard let transitionCoordinator = presentingViewController.transitionCoordinator else {
            return
        }

        transitionCoordinator.animate { _ in
            self.backgroundDimmingView.dimState = .off
        }
    }

    override func dismissalTransitionDidEnd(_ completed: Bool) {
        guard completed else { return }

        backgroundDimmingView.removeFromSuperview()
        presentedView?.removeGestureRecognizer(panGestureRecognizer)
    }
}
