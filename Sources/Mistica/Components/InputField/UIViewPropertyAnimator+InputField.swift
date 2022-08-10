//
//  UIViewPropertyAnimator+InputField.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import UIKit

extension UIViewPropertyAnimator {
    func addTransition(with label: UILabel, textColor: UIColor) {
        guard label.textColor != textColor else { return }

        addAnimations {
            UIView.transition(
                with: label,
                duration: self.duration,
                options: [.transitionCrossDissolve],
                animations: { label.textColor = textColor },
                completion: nil
            )
        }
    }
}
