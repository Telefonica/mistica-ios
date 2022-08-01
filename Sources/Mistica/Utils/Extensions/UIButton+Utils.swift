//
//  UIButton+Utils.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import MisticaCommon
import UIKit

extension UIButton {
    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
//        setBackgroundImage(UIImage(color: color), for: state)
    }

    private var states: [UIControl.State] {
        [.normal, .selected, .highlighted, .disabled]
    }

    /// Set image for all states.
    ///
    /// - Parameter image: UIImage.
    func setImageForAllStates(_ image: UIImage) {
        states.forEach { self.setImage(image, for: $0) }
    }
}
