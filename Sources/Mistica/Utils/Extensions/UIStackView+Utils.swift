//
//  UIStackView+Utils.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

extension UIStackView {
    func removeArrangedSubviews() {
        arrangedSubviews.forEach { subview in
            subview.removeFromSuperview()
        }
    }
}
