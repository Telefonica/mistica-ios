//
//  IntrinsictHeightLabel.swift
//  Mistica
//
//  Created by Jose Miguel Brocal on 03/06/2020.
//  Copyright © 2020 Tuenti Technologies S.L. All rights reserved.
//

import UIKit

// A custom Label which defines a minimun frame height
class IntrinsictHeightLabel: UILabel {
    var minHeight: CGFloat = 0 {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }

    override var intrinsicContentSize: CGSize {
        let contentSize = super.intrinsicContentSize

        return CGSize(width: contentSize.width, height: max(contentSize.height, minHeight))
    }
}
