//
//  CellLeftSectionView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © 2020 Telefonica. All rights reserved.
//

import UIKit

private enum ViewStyles {
    static let imageLargeSize: CGFloat = 40
    static let imageSmallSize: CGFloat = 24
}

class CellLeftSectionView: UIStackView {
    var imageView = IntrinsictImageView()

    var assetIsSmall: Bool = false {
        didSet {
            imageView.intrinsicWidth = assetIsSmall ? ViewStyles.imageSmallSize : ViewStyles.imageLargeSize
            imageView.intrinsicHeight = assetIsSmall ? ViewStyles.imageSmallSize : ViewStyles.imageLargeSize
        }
    }

    init() {
        super.init(frame: .zero)

        commonInit()
    }

    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func centerAlignment() {
        alignment = .center
        isLayoutMarginsRelativeArrangement = false
        directionalLayoutMargins = .zero
    }

    func topAlignment() {
        alignment = .top
        isLayoutMarginsRelativeArrangement = true
        directionalLayoutMargins = NSDirectionalEdgeInsets(
            top: 4,
            leading: 0,
            bottom: 0,
            trailing: 0
        )
    }
}

private extension CellLeftSectionView {
    func commonInit() {
        addArrangedSubview(imageView)

        imageView.contentMode = .scaleAspectFit
    }
}
