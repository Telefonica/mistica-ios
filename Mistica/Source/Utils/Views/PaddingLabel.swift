//
//  PaddingLabel.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

import Foundation
import UIKit

class PaddingLabel: UILabel {
    @IBInspectable open var topInset: CGFloat = 0
    @IBInspectable open var bottomInset: CGFloat = 0
    @IBInspectable open var leftInset: CGFloat = 0
    @IBInspectable open var rightInset: CGFloat = 0

    var contentInset: UIEdgeInsets {
        get { UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset) }
        set {
            topInset = newValue.top
            bottomInset = newValue.bottom
            leftInset = newValue.left
            rightInset = newValue.right
        }
    }

    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: contentInset))
    }

    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.height += topInset + bottomInset
        contentSize.width += leftInset + rightInset
        return contentSize
    }
}
