//
//  File.swift
//  
//
//  Created by Jose Miguel Brocal on 20/1/21.
//

import UIKit

private enum Constants {
    static let imageSize = CGFloat(40)
    static let iconSize = CGFloat(24)
    static let viewSize = CGFloat(40)
}

// MARK: Internal

class DataCardAsset: UIView {
    private var imageView = UIImageView()
    
    var assetType: DataCardConfiguration.AssetType? {
        didSet {
            guard let assetType = assetType else {
                imageView.image = nil
                backgroundColor = .clear
                return
            }

            imageView.image = assetType.image
            imageView.contentMode = assetType.contentMode
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
        
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        commonInit()
    }
    
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var intrinsicContentSize: CGSize {
        guard assetType != nil else {
            return CGSize(width: UIView.noIntrinsicMetric, height: UIView.noIntrinsicMetric)
        }

        return CGSize(width: Constants.viewSize, height: Constants.viewSize)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let assetType = assetType else {
            frame = CGRect(x: 0, y: layoutMargins.top, width: Constants.imageSize, height: Constants.imageSize)
            imageView.frame = CGRect(x: 0, y: 0, width: Constants.imageSize, height: Constants.imageSize)
            return
        }
        
        frame = CGRect(x: 0, y: layoutMargins.top, width: Constants.viewSize, height: Constants.viewSize)
        
        // ImageView centered at X and Y
        let imageX = (Constants.viewSize - assetType.assetSize) / 2
        let imageY = (Constants.viewSize - assetType.assetSize) / 2
                
        imageView.frame = CGRect(x: imageX, y: imageY, width: assetType.assetSize, height: assetType.assetSize)
    }
}

// MARK: Private

private extension DataCardAsset {
    func commonInit() {
        addSubview(imageView)
    }
}

private extension DataCardConfiguration.AssetType {
    var assetSize: CGFloat {
        switch self {
        case .image:
            return Constants.imageSize
        case .icon:
            return Constants.iconSize
        }
    }

    var cornerRadius: CGFloat {
        switch self {
        case .image:
            return 0
        case .icon:
            return Constants.viewSize / 2
        }
    }

    var image: UIImage? {
        switch self {
        case .image(let image), .icon(let image, backgroundColor: _):
            return image
        }
    }

    var contentMode: UIView.ContentMode {
        switch self {
        case .image:
            return .scaleAspectFill
        case .icon:
            return .scaleAspectFit
        }
    }

    var backgroundColor: UIColor {
        switch self {
        case .image:
            return .clear
        case .icon(_, let backgroundColor):
            return backgroundColor
        }
    }
}
