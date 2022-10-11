//
//  SheetPresentationController.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

/**
 This class handles a custom presentation where the View Controller will be shown from the bottom
 to a custom top offset. A dimming view will be shown to darken the rest of the background.
 */
class SheetPresentationController: UIPresentationController {
    private enum Constants {
        static let maxTopOffset: CGFloat = 180
    }

    private let dimmingView = UIView()

    init(
        presented: UIViewController,
        presenting: UIViewController?
    ) {
        super.init(presentedViewController: presented, presenting: presenting)
        setUpDimmingView()
        setUpMaskedCorners()
    }

    override func presentationTransitionWillBegin() {
        guard let containerView = containerView else {
            super.presentationTransitionWillBegin()
            return
        }

        containerView.insertSubview(dimmingView, at: 0)
        NSLayoutConstraint.activate([
            dimmingView.topAnchor.constraint(equalTo: containerView.topAnchor),
            dimmingView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            dimmingView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            dimmingView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])

        let presentationAction = {
            self.dimmingView.alpha = 0.4
        }

        animateAlongsideTransitionIfPossible(presentationAction)
    }

    override func dismissalTransitionWillBegin() {
        let dismissalAction = {
            self.dimmingView.alpha = 0.0
        }

        animateAlongsideTransitionIfPossible(dismissalAction)
    }

    override var frameOfPresentedViewInContainerView: CGRect {
        guard let containerView = containerView, let presentedView = presentedView else {
            return super.frameOfPresentedViewInContainerView
        }

        /// The maximum height allowed for the sheet. We allow the sheet to reach the top safe area inset.
        let maximumHeight = containerView.frame.height - containerView.safeAreaInsets.top - containerView.safeAreaInsets.bottom

        let fittingSize = CGSize(width: containerView.bounds.width, height: UIView.layoutFittingCompressedSize.height)
        let presentedViewHeight = presentedView.systemLayoutSizeFitting(
            fittingSize,
            withHorizontalFittingPriority: .required,
            verticalFittingPriority: .defaultLow
        ).height

        /// The target height of the presented view.
        /// If the size of the of the presented view could not be computed, meaning its equal to zero, we default to the maximum height.
        let targetHeight = presentedViewHeight == .zero ? maximumHeight : presentedViewHeight

        // Adjust the height of the view by adding the bottom safe area inset.
        let adjustedHeight = min(targetHeight, maximumHeight) + containerView.safeAreaInsets.bottom

        let targetSize = CGSize(width: containerView.frame.width, height: adjustedHeight)
        let targetOrigin = CGPoint(x: .zero, y: containerView.frame.maxY - targetSize.height)

        return CGRect(origin: targetOrigin, size: targetSize)
    }
}

private extension SheetPresentationController {
    var maxTopOffset: CGFloat {
        let safeTopInset = containerView?.safeAreaInsets.top ?? 0
        return Constants.maxTopOffset + safeTopInset
    }

    var bottomSafeArea: CGFloat {
        containerView?.safeAreaInsets.bottom ?? 0
    }

    func setUpDimmingView() {
        dimmingView.translatesAutoresizingMaskIntoConstraints = false
        dimmingView.backgroundColor = .backgroundOverlay
        dimmingView.alpha = 0.0

        let recognizer = UITapGestureRecognizer(target: self, action: #selector(tapOnDimmingView))
        dimmingView.addGestureRecognizer(recognizer)
    }

    func setUpMaskedCorners() {
        presentedView?.layer.cornerRadius = 12
        presentedView?.clipsToBounds = true
        presentedView?.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }

    func animateAlongsideTransitionIfPossible(_ animation: @escaping () -> Void) {
        if let coordinator = presentedViewController.transitionCoordinator {
            coordinator.animate(alongsideTransition: { _ in
                animation()
            })
        } else { return }
    }

    @objc private func tapOnDimmingView() {
        presentingViewController.dismiss(animated: true)
    }
}
