//
//  IntrinsicMaxButtonWidthContainerView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

class IntrinsicMaxButtonWidthContainerView: UIStackView {
    let primaryButton = Button(title: "")
    let secondaryButton = Button(style: .secondary, title: "")

    init() {
        super.init(frame: .zero)
        axis = .vertical
        spacing = 16
        addArrangedSubview(primaryButton)
        addArrangedSubview(secondaryButton)
    }

    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var intrinsicContentSize: CGSize {
        let width = max(primaryButton.intrinsicContentSize.width, secondaryButton.intrinsicContentSize.width)
        return CGSize(width: width, height: UIView.noIntrinsicMetric)
    }
}
