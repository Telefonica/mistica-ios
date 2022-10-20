import UIKit

class ActionRow: UIStackView {
    
    let item: ActionItem
    
    init(item: ActionItem) {
        self.item = item
        
        super.init(frame: .zero)
        
        commonInit()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let titleLabel: IntrinsictHeightLabel = {
        let label = IntrinsictHeightLabel()
        label.minHeight = 64
        label.numberOfLines = 0
        label.textColor = .textPrimary
        return label
    }()
    
    lazy var iconImageView: IntrinsictImageView = {
        let image = IntrinsictImageView()
        image.contentMode = .scaleAspectFit
        image.intrinsicWidth = 24
        image.intrinsicHeight = 24
        return image
    }()
}

private extension ActionRow {
    func commonInit() {
        layoutViews()
        
        titleLabel.text = item.title
        
        let imageTintColor: UIColor
        
        switch item.style {
        case .destructive:
            titleLabel.textColor = .textLinkDanger
            imageTintColor = .textLinkDanger
        case .normal:
            titleLabel.textColor = .textPrimary
            imageTintColor = .neutralHigh
        }
        
        if let url = item.url {
            load(url: url, urlDark: item.urlDark, in: iconImageView, tintColor: imageTintColor)
        } else {
            iconImageView.isHidden = true
        }
    }
    
    func layoutViews() {
        spacing = 16
        alignment = .center
        distribution = .fillProportionally
        
        addArrangedSubview(iconImageView)
        addArrangedSubview(titleLabel)
        
    }
    
    func load(url: String, urlDark: String?, in imageView: UIImageView, tintColor: UIColor) {
        guard let url = URL(string: url) else { return }
        if let urlDark = urlDark,
           let urlForDarkMode = URL(string: urlDark) {
            imageView.load(url: url, urlForDarkMode: urlForDarkMode, tintColor: tintColor)
        } else {
            imageView.load(url: url, tintColor: tintColor)
        }
    }
}
