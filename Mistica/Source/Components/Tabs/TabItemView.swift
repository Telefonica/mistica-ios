//
//  TabItemView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

public class TabItemView: UICollectionViewCell {
    private enum Constants {
        static let innerPadding: CGFloat = 16
        static let bottomPadding: CGFloat = innerPadding - heightDivider
        static let iconSize: CGFloat = 24
        static let iconAndTextSpace: CGFloat = 8
        static let selectedLineHeight: CGFloat = 5
        static let heightLabel: CGFloat = 24
        static let heightDivider: CGFloat = 2
        static let minimumWidthLabel: CGFloat = 45
        static let minimumWidthIPadLabel: CGFloat = 208
        static let maximumWidthLabel: CGFloat = 284
        static let horizontalHeight: CGFloat = 54
    }
        
    private lazy var verticalStack: UIStackView = {
        let verticalStack = UIStackView(arrangedSubviews: [horizontalStack, selectedLine])
        verticalStack.backgroundColor = .clear
        verticalStack.axis = .vertical
        verticalStack.distribution = .fill
        verticalStack.alignment = .center
        return verticalStack
    }()
    
    private lazy var horizontalStack: UIStackView = {
        let horizontalStack = UIStackView(arrangedSubviews: [imageView, title])
        horizontalStack.translatesAutoresizingMaskIntoConstraints = false
        horizontalStack.isLayoutMarginsRelativeArrangement = true
        horizontalStack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: Constants.innerPadding,
                                                                           leading: Constants.innerPadding,
                                                                           bottom: Constants.bottomPadding,
                                                                           trailing: Constants.innerPadding)
        horizontalStack.backgroundColor = .clear
        horizontalStack.axis = .horizontal
        horizontalStack.distribution = .fillProportionally
        horizontalStack.alignment = .center
        horizontalStack.spacing = Constants.iconAndTextSpace
        return horizontalStack
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    private lazy var title: UILabel = {
        let label = UILabel()
        label.font = .textPreset8(weight: .medium)
        label.backgroundColor = .clear
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    private lazy var selectedLine: UIView = {
        let selectedLine = UIView()
        selectedLine.backgroundColor = .controlActivated
        return selectedLine
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        commomInit()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commomInit()
    }
}

// MARK: Public API

extension TabItemView {
    var text: String? {
        get {
            title.text
        }
        set {
            title.text = newValue
        }
    }
    
    var icon: UIImage? {
        get {
            imageView.image
        }
        set {
            imageView.image = newValue
        }
    }
        
    func showSelected() {
        selectedLine.isHidden = false
        title.textColor = .textPrimary
        imageView.tintColor = .iconPrimary
        
    }

    func showDeselected() {
        selectedLine.isHidden = true
        title.textColor = .textDisabled
        imageView.tintColor = .iconDisabled
    }
}

// MARK: - Private

private extension TabItemView {
    func commomInit() {
        contentView.backgroundColor = .clear
        
        addSubview(verticalStack, constraints: [
            verticalStack.topAnchor.constraint(equalTo: topAnchor),
            verticalStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            verticalStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            horizontalStack.heightAnchor.constraint(equalToConstant: Constants.horizontalHeight),
            imageView.widthAnchor.constraint(equalToConstant: Constants.iconSize),
            imageView.heightAnchor.constraint(equalToConstant: Constants.iconSize),
            selectedLine.heightAnchor.constraint(equalToConstant: Constants.heightDivider),
            selectedLine.widthAnchor.constraint(equalTo: horizontalStack.widthAnchor)
        ])
    }
}
