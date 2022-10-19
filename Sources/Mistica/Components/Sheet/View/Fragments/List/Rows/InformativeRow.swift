import UIKit

// MARK: InformativeRow

class InformativeRow: UIView {
    struct Asset {
        let url: String
        let urlDark: String?
        let size: CGSize
    }
    
    enum AssetAlignment {
        case topLeading
        case centerInTitleHeight
    }
    
    private let item: InformativeItem
    
    // MARK: Initializers
    
    init(item: InformativeItem) {
        self.item = item
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: SubViews
    
    private let contentView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillProportionally
        stackView.alignment = .leading
        return stackView
    }()
    
    private let centerSection: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 2
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    private let topContent = TopContentView()
    
    private let bottomContent: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 8
        return stackView
    }()
    
    private let detailLabel: IntrinsictHeightLabel = {
        let label = IntrinsictHeightLabel()
        label.numberOfLines = 0
        label.font = .textPreset2(weight: .regular)
        label.textColor = .textSecondary
        label.minHeight = 20
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        return label
    }()
    
    private lazy var dummyView = SpacerView(axis: .horizontal, amount: 1)
}

// MARK: Private

private extension InformativeRow {
    func commonInit() {
        layoutViews()
        
        topContent.title = item.title
        topContent.icon = item.icon
        
        if let detailText = item.description {
            detailLabel.text = detailText
        } else {
            bottomContent.isHidden = true
        }
        
        dummyView.amount = item.icon.size.width
    }
    
    func layoutViews() {
        addSubview(withDefaultConstraints: contentView)
        
        bottomContent.addArrangedSubview(dummyView)
        bottomContent.addArrangedSubview(detailLabel)
        
        centerSection.addArrangedSubview(topContent)
        centerSection.addArrangedSubview(bottomContent)
        
        contentView.addArrangedSubview(centerSection)
        
        setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
}

private class TopContentView: UIView {
    private var backStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.spacing = 8
        return stackView
    }()
    
    private var frontStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.spacing = 8
        return stackView
    }()
    
    lazy var iconImageView: IntrinsictImageView = {
        let image = IntrinsictImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let titleLabel: IntrinsictHeightLabel = {
        let label = IntrinsictHeightLabel()
        label.minHeight = 24
        label.numberOfLines = 0
        label.textColor = .textPrimary
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.setContentHuggingPriority(.defaultLow, for: .vertical)
        return label
    }()
    
    private let dummyTitleLabel: IntrinsictHeightLabel = {
        let label = IntrinsictHeightLabel()
        label.minHeight = 24
        label.numberOfLines = 1
        label.textColor = .clear
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.setContentHuggingPriority(.defaultLow, for: .vertical)
        return label
    }()
    
    private lazy var dummyView = SpacerView(axis: .horizontal, amount: 1)
    
    var title: String? {
        didSet {
            dummyTitleLabel.text = title
            titleLabel.text = title
        }
    }
    
    var icon: InformativeItemIcon = .bullet {
        didSet {
            iconImageView.intrinsicHeight = icon.size.height
            iconImageView.intrinsicWidth = icon.size.width
            dummyView.amount = iconImageView.intrinsicWidth
            
            load(icon: icon, in: iconImageView)
        }
    }
    
    init() {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        addSubview(backStackView, constraints: [
            backStackView.topAnchor.constraint(equalTo: topAnchor),
            backStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backStackView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
        addSubview(withDefaultConstraints: frontStackView)
        
        backStackView.addArrangedSubview(iconImageView)
        backStackView.addArrangedSubview(dummyTitleLabel)
        
        frontStackView.addArrangedSubview(dummyView)
        frontStackView.addArrangedSubview(titleLabel)
        
        dummyView.backgroundColor = .red
    }
    
    func load(icon: InformativeItemIcon, in imageView: UIImageView) {
        switch icon {
        case .bullet:
            imageView.image = UIImage.circle(diameter: 6, color: .neutralHigh)
        case .small(let url, let urlDark),
                .regular(let url, let urlDark):
            guard let url = URL(string: url) else { return }
            if let urlDark = urlDark,
               let urlForDarkMode = URL(string: urlDark) {
                imageView.load(url: url, urlForDarkMode: urlForDarkMode)
            } else {
                imageView.load(url: url)
            }
        }
    }
}
