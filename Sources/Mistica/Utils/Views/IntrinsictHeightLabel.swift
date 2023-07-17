//
//  IntrinsictHeightLabel.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

// A custom Label which defines a minimun frame height
public class IntrinsictHeightLabel: UILabel {
    var minHeight: CGFloat = 0 {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }

    override public var intrinsicContentSize: CGSize {
        let contentSize = super.intrinsicContentSize

        return CGSize(width: contentSize.width, height: max(contentSize.height, minHeight))
    }
}
