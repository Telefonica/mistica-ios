//
//  StepView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import Lottie
import UIKit

class StepView: UIView {
    private enum Constants {
        static let height: CGFloat = 24
    }

    enum State: Equatable {
        case done
        case active(step: Int)
        case pending(step: Int)
    }

    var state: State = .done {
        didSet {
            guard oldValue != state else { return }
            didSetState()
        }
    }

    func setState(_ state: State, animated: Bool) {
        if state == .done && state != self.state {
            animatedView.play()
        }

        if animated {
            UIView.transition(
                with: self,
                duration: UIView.defaultAnimationDuration,
                options: .transitionCrossDissolve,
                animations: { self.state = state },
                completion: nil
            )
        } else {
            animatedView.stop()
            animatedView.currentProgress = state == State.done ? 1 : 0
            self.state = state
        }
    }

    private lazy var label = UILabel()
    private lazy var circularView = UIView()
    private lazy var animatedView: AnimationView = {
        let animation = AnimationView()
        animation.loopMode = .playOnce
        animation.isUserInteractionEnabled = false
        animation.animation = NSDataAsset.checkAnimation.lottieAnimation
        animation.contentMode = .scaleAspectFit
        animation.heightAnchor.constraint(equalTo: animation.widthAnchor).isActive = true
        animation.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        animation.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        return animation
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    func commonInit() {
        label.font = .textPreset8(weight: .medium)
        label.textAlignment = .center
        circularView.addSubview(withDefaultConstraints: label)

        let colorKeypath = AnimationKeypath(keypath: "**.Color")
        let colorProvider = ColorValueProvider(UIColor.controlActivated.lottieColorValue)
        animatedView.setValueProvider(colorProvider, keypath: colorKeypath)

        addSubview(withDefaultConstraints: animatedView)
        addSubview(withDefaultConstraints: circularView)
    }

    override var intrinsicContentSize: CGSize {
        CGSize(width: Constants.height, height: Constants.height)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        circularView.makeRounded()
    }
}

extension StepView {
    func didSetState() {
        switch state {
        case .done:
            animatedView.alpha = 1
            circularView.alpha = 0
            circularView.removeBorder()
            circularView.backgroundColor = .clear
            accessibilityTraits = []
        case .active(let step):
            label.text = "\(step + 1)"
            label.textColor = .textPrimaryInverse
            animatedView.alpha = 0
            circularView.alpha = 1
            circularView.removeBorder()
            circularView.backgroundColor = .controlActivated
            accessibilityTraits = [.selected]
        case .pending(let step):
            label.text = "\(step + 1)"
            label.textColor = .borderDark
            animatedView.alpha = 0
            circularView.alpha = 1
            circularView.addBorder(color: .borderDark)
            circularView.backgroundColor = .clear
            accessibilityTraits = []
        }
    }
}
