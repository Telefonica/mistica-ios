//
//  UIViewPropertyAnimator+InputField.swift
//  Mistica
//
//  Created by Jose Maria Puerta on 12/02/2020.
//  Copyright © 2020 Tuenti Technologies S.L. All rights reserved.
//

import Foundation
import UIKit

extension UIViewPropertyAnimator {
    func addTransition(with label: UILabel, textColor: UIColor) {
        guard label.textColor != textColor else { return }

        addAnimations {
            UIView.transition(with: label,
                              duration: self.duration,
                              options: [.transitionCrossDissolve],
                              animations: { label.textColor = textColor },
                              completion: nil)
        }
    }
}
