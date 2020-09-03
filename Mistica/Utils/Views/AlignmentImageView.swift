//
//  AlignmentImageView.swift
//  Mistica
//
//  Created by Jose Maria Puerta on 21/08/2020.
//  Copyright © 2020 Telefonica. All rights reserved.
//

import UIKit

/// Acts as a `UIImageView` that can be aligned both vertically and horizontally based on the `contentMode`.
@dynamicMemberLookup
class AlignmentImageView: UIView {
    enum HorizontalAlignment {
        case left, center, right
    }

    enum VerticalAlignment {
        case top, center, bottom
    }

    private(set) lazy var imageView = UIImageView()

    var horizontalAlignment: HorizontalAlignment = .center {
        didSet {
            guard horizontalAlignment != oldValue else { return }
            updateAlignmentLayout()
        }
    }

    var verticalAlignment: VerticalAlignment = .center {
        didSet {
            guard verticalAlignment != oldValue else { return }
            updateAlignmentLayout()
        }
    }

    subscript<T>(dynamicMember keyPath: WritableKeyPath<UIImageView, T>) -> T {
        get {
            imageView[keyPath: keyPath]
        }
        set {
            imageView[keyPath: keyPath] = newValue
        }
    }

    override var intrinsicContentSize: CGSize {
        imageView.intrinsicContentSize
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        updateAlignmentLayout()
    }
}

extension AlignmentImageView {
    func commonInit() {
        imageView.frame = bounds
        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(imageView)
    }

    /// Returns the calculated size of the image taking into account the scalation made by `contentMode`.
    func scaledImageSizeByContentMode() -> CGSize {
        var size = bounds.size

        guard let image = imageView.image else { return size }

        let scaleX = size.width / image.size.width
        let scaleY = size.height / image.size.height

        switch contentMode {
        case .scaleAspectFill:
            let scale = max(scaleX, scaleY)
            size = CGSize(width: image.size.width * scale, height: image.size.height * scale)

        case .scaleAspectFit:
            let scale = min(scaleX, scaleY)
            size = CGSize(width: image.size.width * scale, height: image.size.height * scale)

        case .scaleToFill:
            size = CGSize(width: image.size.width * scaleX, height: image.size.height * scaleY)

        default:
            size = image.size
        }

        return size
    }

    /// Returns the calculated frame of the image taking into account the scalation made by `contentMode`.
    func scaledImageFrameByContentMode() -> CGRect {
        let scaledImageSize = scaledImageSizeByContentMode()
        let scaledImageOrigin = CGPoint(x: (bounds.size.width - scaledImageSize.width) / 2.0, y: (bounds.size.height - scaledImageSize.height) / 2.0)
        return CGRect(origin: scaledImageOrigin, size: scaledImageSize)
    }

    /// Updates the `imageView` frame to fit the image within the alignments.
    func updateAlignmentLayout() {
        var frame = scaledImageFrameByContentMode()

        switch horizontalAlignment {
        case .left:
            frame.origin.x = 0.0
        case .right:
            frame.origin.x = bounds.maxX - frame.size.width
        case .center:
            break
        }

        switch verticalAlignment {
        case .top:
            frame.origin.y = 0.0
        case .bottom:
            frame.origin.y = bounds.maxY - frame.size.height
        case .center:
            break
        }

        imageView.frame = frame.integral
    }
}
