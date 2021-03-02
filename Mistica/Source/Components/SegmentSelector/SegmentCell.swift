//
//  SegmentCell.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import Foundation
import UIKit

class SegmentCell: UICollectionViewCell {
    private enum Constants {
        static let titleInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        static let titleCornerRadius: CGFloat = 16
        static let cellMinimumWidth: CGFloat = 56
    }

    private let title = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpTitle()
        setUpAccessibility()
        accessibilityTraits = [.button]
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /// Delegate the Large Content Title on the `title` UILabel, which will provide the correct value (i.e. the
    /// content of `text`).
    @available(iOS 13, *)
    override var largeContentTitle: String? {
        get { title.largeContentTitle }
        set {}
    }

    /// Override of `accessibilityLabel` to delegate the accessibility content on `title`, but still using the cell as
    /// the `accessibilityElement`, to improve VoiceOver behavior (i.e. the label is very small compared to the cell,
    /// and much harder to discover on VoiceOver).
    override var accessibilityLabel: String? {
        get { title.text }
        set {}
    }
}

// MARK: Public API

extension SegmentCell {
    func show(title: String) {
        self.title.text = title
    }

    func showSelected() {
        backgroundColor = .textNavigationBarPrimary
        title.textColor = .navigationBarBackground
    }

    func showDeselected() {
        backgroundColor = .navigationsSearchBarBackground
        title.textColor = .textNavigationBarPrimary
    }
}

// MARK: Private

private extension SegmentCell {
    func setUpTitle() {
        contentView.addSubview(title, constraints: [
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.titleInsets.top),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.titleInsets.left),
            contentView.bottomAnchor.constraint(equalTo: title.bottomAnchor, constant: Constants.titleInsets.bottom),
            contentView.trailingAnchor.constraint(equalTo: title.trailingAnchor, constant: Constants.titleInsets.right),
            contentView.widthAnchor.constraint(greaterThanOrEqualToConstant: Constants.cellMinimumWidth)
        ])

        layer.cornerRadius = Constants.titleCornerRadius
        layer.masksToBounds = true

        // Opt out of Dynamic Type, we will use LargerContentViewer API instead.
        title.font = .textPreset7(weight: .regular)
        title.textAlignment = .center
    }

    func setUpAccessibility() {
        // This component don't grow with Dynamic Type, but presents a HUD instead, since it is intended to be always
        // presented below the navigation bar.
        if #available(iOS 13, *) {
            showsLargeContentViewer = true
        }

        // For Voice Over, consider the whole cell as the accessibility element, since the cell is much bigger then the
        // title label, and it is more difficult to find it. The accesibility label is overridden to just dynamically
        // delegate on the title label
        isAccessibilityElement = true
        title.isAccessibilityElement = false
    }
}
