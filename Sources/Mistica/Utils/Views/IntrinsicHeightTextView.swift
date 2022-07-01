//
//  IntrinsicHeightTextView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import UIKit

/// This UITextView subclass will size itself based on a fixed valud for it's height.
class IntrinsicHeightTextView: UITextView {
    var intrinsicHeight: CGFloat = 128
    override var intrinsicContentSize: CGSize {
        let width = super.intrinsicContentSize.width
        let height = max(intrinsicHeight, super.intrinsicContentSize.height)
        return CGSize(width: width, height: height)
    }
}
