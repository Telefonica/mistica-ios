//
//  CalloutAsset.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

private enum Constants {
    static let iconSize: CGFloat = 24
}

class CalloutAsset: UIImageView {
    var assetType: CalloutConfiguration.CalloutAssetType = .none {
        didSet {
            image = assetType.image
            contentMode = assetType.contentMode
            backgroundColor = assetType.backgroundColor
            makeRounded(cornerRadius: assetType.cornerRadius)

            if assetType != oldValue {
                setNeedsLayout()
                invalidateIntrinsicContentSize()
            }
        }
    }

    init() {
        super.init(frame: .zero)
    }

    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var intrinsicContentSize: CGSize {
        CGSize(width: Constants.iconSize, height: Constants.iconSize)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        frame = CGRect(x: 0, y: 0, width: Constants.iconSize, height: Constants.iconSize)
    }
}

// MARK: Private

private extension CalloutConfiguration.CalloutAssetType {
    var assetSize: CGFloat {
        switch self {
        case .smallIcon:
            return Constants.iconSize
        case .none:
            return 0
        }
    }

    var cornerRadius: CGFloat {
        switch self {
        case .smallIcon, .none:
            return 0
        }
    }

    var image: UIImage? {
        switch self {
        case .smallIcon(let image):
            return image
        case .none:
            return nil
        }
    }

    var contentMode: UIView.ContentMode {
        switch self {
        case .smallIcon, .none:
            return .scaleAspectFill
        }
    }

    var backgroundColor: UIColor {
        switch self {
        case .smallIcon, .none:
            return .clear
        }
    }
}
