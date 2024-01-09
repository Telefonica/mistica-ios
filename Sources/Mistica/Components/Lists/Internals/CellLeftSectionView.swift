//
//  CellLeftSectionView.swift
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

public protocol ListCellContentAssetDelegate: AnyObject {
    func listCellContentDidTapOnAsset()
}

class CellLeftSectionView: UIStackView {
    private lazy var heightConstraint = containerView.heightAnchor.constraint(equalToConstant: assetType.viewSize.height)
    private lazy var widthConstraint = containerView.widthAnchor.constraint(equalToConstant: assetType.viewSize.width)

    private lazy var containerView: UIView = {
        let view = UIView()
        view.addSubview(withCenterConstraints: imageView)
        return view
    }()

    private let imageView = IntrinsictImageView()

    weak var delegate: ListCellContentAssetDelegate? {
        didSet {
            imageView.isUserInteractionEnabled = delegate != nil
        }
    }

    var assetType: ListCellContentView.CellAssetType = .none {
        didSet {
            heightConstraint.constant = assetType.viewSize.height
            widthConstraint.constant = assetType.viewSize.width
            imageView.intrinsicWidth = assetType.assetSize.width
            imageView.intrinsicHeight = assetType.assetSize.height
            imageView.contentMode = assetType.contentMode
            containerView.makeRounded(cornerRadius: assetType.cornerRadius)
            containerView.backgroundColor = assetType.backgroundColor

            load()
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

    func load() {
        switch assetType {
        case .none:
            imageView.image = nil
        case .custom(let asset, _):
            load(asset: asset)
        case .smallIcon(let image), .largeIcon(let image, _):
            imageView.image = image
        }
    }

    func load(asset: ListCellContentView.CellAssetType.Asset) {
        switch asset {
        case .image(let image):
            imageView.image = image
        case .url(let url):
            imageView.load(url: url)
        }
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
        addArrangedSubview(containerView)
        NSLayoutConstraint.activate([heightConstraint, widthConstraint])

        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapAsset))
        imageView.addGestureRecognizer(gesture)
        imageView.isUserInteractionEnabled = delegate != nil
    }

    @objc
    func didTapAsset() {
        delegate?.listCellContentDidTapOnAsset()
    }
}

private extension ListCellContentView.CellAssetType {
    var assetSize: CGSize {
        switch self {
        case .none:
            return CGSize.zero
        case let .custom(_, size):
            if let size = size { return size }
            return CGSize(width: ImageSize.large, height: ImageSize.large)
        case .smallIcon, .largeIcon:
            return CGSize(width: ImageSize.small, height: ImageSize.small)
        }
    }

    var viewSize: CGSize {
        switch self {
        case .none:
            return CGSize.zero
        case let .custom(_, size):
            if let size = size { return size }
            return CGSize(width: ImageSize.large, height: ImageSize.large)

        case .largeIcon:
            return CGSize(width: ImageSize.large, height: ImageSize.large)

        case .smallIcon:
            return CGSize(width: ImageSize.small, height: ImageSize.small)
        }
    }

    var cornerRadius: CGFloat {
        switch self {
        case .none, .smallIcon:
            return 0
        case .custom(_, let size):
            return (size != nil ? MisticaConfig.currentCornerRadius.container : viewSize.height / 2)
        case .largeIcon:
            return viewSize.height / 2
        }
    }

    var image: UIImage? {
        switch self {
        case .custom(let asset, _):
            guard case let .image(image) = asset else { return nil }
            return image
        case .smallIcon(let image), .largeIcon(let image, _):
            return image
        case .none:
            return nil
        }
    }

    var contentMode: UIView.ContentMode {
        switch self {
        case .custom:
            return .scaleAspectFill
        case .none, .smallIcon, .largeIcon:
            return .scaleAspectFit
        }
    }

    var backgroundColor: UIColor {
        switch self {
        case .largeIcon(_, let backgroundColor):
            return backgroundColor
        case .none, .smallIcon, .custom:
            return .clear
        }
    }
}
