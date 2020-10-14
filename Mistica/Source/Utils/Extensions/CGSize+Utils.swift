//
//  CGSize+Utils.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

import Foundation
import UIKit

extension CGSize {
    func inset(by insets: UIEdgeInsets) -> CGSize {
        CGSize(width: width + insets.left + insets.right, height: height + insets.bottom + insets.top)
    }

    func area() -> CGFloat {
        width * height
    }
}
