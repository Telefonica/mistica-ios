//
//  TabItemView.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

public class TabItemView: UIView {
    private enum Constants {
        static let innerPadding: CGFloat = 16
        static let innerLateralPadding: CGFloat = 16
        static let iconSize: CGFloat = 24
        static let iconAndTextSeparator: CGFloat = 8
        static let heightDivider: CGFloat = 5
        static let heightLabel: CGFloat = 24
        static let minimumWidthLabel: CGFloat = 208
        static let maximumWidthLabel: CGFloat = 284
    }
    
    private var tabItem: TabItem?
    
    private lazy var verticalStack: UIStackView = {
        let verticalStack = UIStackView(arrangedSubviews: [horizontalStack, separator])
        verticalStack.backgroundColor = UIColor.blue
        verticalStack.axis = .vertical
        verticalStack.distribution = .fill
        verticalStack.alignment = .leading
        verticalStack.spacing = 0
        return verticalStack
    }()
    
    private lazy var horizontalStack: UIStackView = {
        let horizontalStack = UIStackView(arrangedSubviews: [icon, label])
        horizontalStack.backgroundColor = .red
        horizontalStack.layoutMargins = UIEdgeInsets(top: Constants.innerPadding,
                                                     left: Constants.innerLateralPadding,
                                                     bottom: Constants.innerPadding,
                                                     right: Constants.innerLateralPadding)
        horizontalStack.isLayoutMarginsRelativeArrangement = true
        horizontalStack.axis = .horizontal
        horizontalStack.distribution = .fill
        horizontalStack.alignment = .center
        horizontalStack.spacing = Constants.iconAndTextSeparator
        return horizontalStack
    }()
    
    private lazy var icon: UILabel = {
        let label = UILabel()
        label.backgroundColor = .gray
        label.text = tabItem?.icon ?? ""
        return label
    }()

    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = .textPreset8(weight: .medium)
        label.backgroundColor = .gray
        label.text = tabItem?.title ?? ""
        label.adjustsFontSizeToFitWidth = false
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    private lazy var separator: UIView = {
        let separator = UIView()
        separator.backgroundColor = .orange
        return separator
    }()
    
    public init(tabItem: TabItem) {
        self.tabItem = tabItem
        
        super.init(frame: .zero)
        
        commomInit()
    }

    public required init?(coder: NSCoder) {
        tabItem = nil
        super.init(coder: coder)
        
        commomInit()
    }
}

// MARK: - Private

private extension TabItemView {
    func commomInit() {
        backgroundColor = .orange
                
        addSubview(verticalStack, constraints: [
            verticalStack.topAnchor.constraint(equalTo: topAnchor, constant: 0.0),
            verticalStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0.0),
            verticalStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0.0),
            
            icon.widthAnchor.constraint(equalToConstant: Constants.iconSize),
            icon.heightAnchor.constraint(equalToConstant: 24),
            
            label.widthAnchor.constraint(greaterThanOrEqualToConstant: 100),
            
            separator.heightAnchor.constraint(equalToConstant: Constants.heightDivider),
            separator.widthAnchor.constraint(equalTo: horizontalStack.widthAnchor)
        ])
    }
}
