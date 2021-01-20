//
//  NavigationPresetView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

public class NavigationPresetView: UIStackView {
    private let imageView = UIImageView(image: .arrowRight)

    public let badgeView = BadgeView()

    public var isBadgeHidden = false {
        didSet {
            if isBadgeHidden {
                badgeView.removeFromSuperview()
            } else if badgeView.superview == nil {
                insertArrangedSubview(badgeView, at: 0)
            }
        }
    }

    public var isNavigationIconHidden = false {
        didSet {
            if isNavigationIconHidden {
                imageView.removeFromSuperview()
            } else if badgeView.superview == nil {
                addArrangedSubview(imageView)
            }
        }
    }

    public convenience init() {
        self.init(frame: .zero)
    }

    override public init(frame _: CGRect) {
        super.init(frame: .zero)

        commonInit()
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)

        commonInit()
    }
}

private extension NavigationPresetView {
    func commonInit() {
        axis = .horizontal
        alignment = .center
        spacing = 16

        imageView.tintColor = .textSecondary

        addArrangedSubview(imageView)
    }
}
