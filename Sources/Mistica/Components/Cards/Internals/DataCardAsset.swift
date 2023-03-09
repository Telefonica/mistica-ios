//
//  DataCardAsset.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

private enum ImageSize {
    static let large: CGFloat = 40
    static let small: CGFloat = 24
}

class DataCardAsset: UIStackView {
    private lazy var heightConstraint = containerView.heightAnchor.constraint(equalToConstant: assetType.viewSize)
    private lazy var widthConstraint = containerView.widthAnchor.constraint(equalToConstant: assetType.viewSize)

    private lazy var containerView: UIView = {
        let view = UIView()
        view.addSubview(withCenterConstraints: imageView)
        return view
    }()

    private let imageView = IntrinsictImageView()

    var assetType: DataCardConfiguration.AssetType = .none {
        didSet {
            heightConstraint.constant = assetType.viewSize
            widthConstraint.constant = assetType.viewSize
            imageView.intrinsicWidth = assetType.assetSize
            imageView.intrinsicHeight = assetType.assetSize
            imageView.image = assetType.image
            imageView.contentMode = assetType.contentMode
            containerView.makeRounded(cornerRadius: assetType.cornerRadius)
            containerView.backgroundColor = assetType.backgroundColor
        }
    }

    init() {
        super.init(frame: .zero)

        commonInit()
    }

    var assetTintColor: UIColor? {
        get {
            imageView.tintColor
        }
        set {
            imageView.tintColor = newValue
        }
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

private extension DataCardAsset {
    func commonInit() {
        addArrangedSubview(containerView)
        NSLayoutConstraint.activate([heightConstraint, widthConstraint])
    }
}

private extension DataCardConfiguration.AssetType {
    var assetSize: CGFloat {
        switch self {
        case .none:
            return 0
        case .image:
            return ImageSize.large
        case .icon:
            return ImageSize.small
        }
    }

    var viewSize: CGFloat {
        switch self {
        case .none:
            return 0
        case .image:
            return ImageSize.large
        case .icon:
            return ImageSize.small
        }
    }

    var cornerRadius: CGFloat {
        switch self {
        case .none, .icon:
            return 0
        case .image:
            return viewSize / 2
        }
    }

    var image: UIImage? {
        switch self {
        case .image(let image), .icon(let image, backgroundColor: _):
            return image
        case .none:
            return nil
        }
    }

    var contentMode: UIView.ContentMode {
        switch self {
        case .image:
            return .scaleAspectFill
        case .none, .icon:
            return .scaleAspectFit
        }
    }

    var backgroundColor: UIColor {
        switch self {
        case .icon(_, let backgroundColor):
            return backgroundColor
        case .none, .image:
            return .clear
        }
    }
}
