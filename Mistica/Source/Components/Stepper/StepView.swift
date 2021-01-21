//
//  StepView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import UIKit

class StepView: UIView {
    private enum Constants {
        static let height: CGFloat = 24
    }

    enum State {
        case done
        case active(step: Int)
        case pending(step: Int)
    }

    var state: State = .done {
        didSet { didSetState() }
    }

    func setState(_ state: State, animated: Bool) {
        if animated {
            UIView.transition(
                with: self,
                duration: UIView.defaultAnimationDuration,
                options: .transitionCrossDissolve,
                animations: { self.state = state },
                completion: nil
            )
        } else {
            self.state = state
        }
    }

    private lazy var label = UILabel(frame: bounds)
    private lazy var imageView = UIImageView()

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
        addSubview(withDefaultConstraints: label)

        imageView.image = UIImage(named: "icn_check_stepper", type: .brandedAndThemed)
        addSubview(withDefaultConstraints: imageView)
    }

    override var intrinsicContentSize: CGSize {
        CGSize(width: Constants.height, height: Constants.height)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        makeRounded()
    }
}

extension StepView {
    func didSetState() {
        switch state {
        case .done:
            imageView.isHidden = false
            label.isHidden = true
            removeBorder()
            backgroundColor = .clear
            accessibilityTraits = []
        case .active(let step):
            label.text = "\(step + 1)"
            label.textColor = .textPrimaryInverse
            label.isHidden = false
            imageView.isHidden = true
            removeBorder()
            backgroundColor = .controlActivated
            accessibilityTraits = [.selected]
        case .pending(let step):
            label.text = "\(step + 1)"
            label.textColor = .borderDark
            label.isHidden = false
            imageView.isHidden = true
            addBorder(borderColor: .borderDark)
            backgroundColor = .clear
            accessibilityTraits = []
        }
    }
}
