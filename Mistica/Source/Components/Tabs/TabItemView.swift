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
        static let innerLateralPadding: CGFloat = 16
        static let iconSize: CGFloat = 24
        static let iconAndTextSpace: CGFloat = 8
        static let selectedLineHeight: CGFloat = 5
        static let heightLabel: CGFloat = 24
        static let minimumWidthLabel: CGFloat = 45
        static let minimumWidthIPadLabel: CGFloat = 208
        static let maximumWidthLabel: CGFloat = 284
    }
        
    private lazy var verticalStack: UIStackView = {
        let verticalStack = UIStackView(arrangedSubviews: [horizontalStack, selectedLine])
        verticalStack.backgroundColor = .clear
        verticalStack.axis = .vertical
        verticalStack.distribution = .fill
        verticalStack.alignment = .leading
        verticalStack.spacing = 0
        return verticalStack
    }()
    
    private lazy var horizontalStack: UIStackView = {
        let horizontalStack = UIStackView(arrangedSubviews: [icon, title])
        horizontalStack.layoutMargins = UIEdgeInsets(top: Constants.innerPadding,
                                                     left: Constants.innerLateralPadding,
                                                     bottom: Constants.innerPadding,
                                                     right: Constants.innerLateralPadding)
        horizontalStack.backgroundColor = .clear
        horizontalStack.isLayoutMarginsRelativeArrangement = true
        horizontalStack.axis = .horizontal
        horizontalStack.distribution = .fill
        horizontalStack.alignment = .center
        horizontalStack.spacing = Constants.iconAndTextSpace
        return horizontalStack
    }()
    
    private lazy var icon: UIImageView = {
        let icon = UIImageView()
        icon.backgroundColor = .clear
        icon.image = .checkmarkIconSmall
        return icon
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
    
    func showSelected() {
        selectedLine.isHidden = false
        title.textColor = .textPrimary
        icon.tintColor = .iconPrimary
        
    }

    func showDeselected() {
        selectedLine.isHidden = true
        title.textColor = .textDisabled
        icon.tintColor = .iconDisabled
    }
}

// MARK: - Private

private extension TabItemView {
    func commomInit() {
        contentView.backgroundColor = .clear
        contentView.addSubview(verticalStack, constraints: [
            verticalStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            verticalStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            verticalStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            verticalStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                        
            icon.widthAnchor.constraint(equalToConstant: Constants.iconSize),
            icon.heightAnchor.constraint(equalToConstant: Constants.iconSize),
            
            title.widthAnchor.constraint(lessThanOrEqualToConstant: Constants.maximumWidthLabel),
            
            selectedLine.heightAnchor.constraint(equalToConstant: Constants.selectedLineHeight),
            selectedLine.widthAnchor.constraint(equalTo: verticalStack.widthAnchor)
        ])
    }
}
