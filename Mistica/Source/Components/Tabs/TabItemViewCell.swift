//
//  TabItemViewCell.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import UIKit

public class TabItemViewCell: UICollectionViewCell {
    private enum Constants {
        static let cellHeight: CGFloat = 56
        static let innerPadding: CGFloat = 16
        static let bottomPadding: CGFloat = innerPadding - heightDivider
        static let iconAndTextSpace: CGFloat = 8
        static let iconSize: CGFloat = 24
        static let heightDivider: CGFloat = 2
        static let minimumItemWidthForLargeScreen: CGFloat = 208.0
    }
    
    private lazy var verticalStack: UIStackView = {
        let verticalStack = UIStackView(arrangedSubviews: [horizontalStack, selectedLine])
        verticalStack.backgroundColor = .clear
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        verticalStack.axis = .vertical
        verticalStack.distribution = .fill
        verticalStack.alignment = .center
        return verticalStack
    }()

    private lazy var horizontalStack: UIStackView = {
        let horizontalStack = UIStackView(arrangedSubviews: [imageView, title])
        horizontalStack.translatesAutoresizingMaskIntoConstraints = false
        horizontalStack.backgroundColor = .clear
        horizontalStack.isLayoutMarginsRelativeArrangement = true
        horizontalStack.directionalLayoutMargins = NSDirectionalEdgeInsets(
            top: Constants.innerPadding,
            leading: Constants.innerPadding,
            bottom: Constants.bottomPadding,
            trailing: Constants.innerPadding
        )
        horizontalStack.backgroundColor = .clear
        horizontalStack.axis = .horizontal
        horizontalStack.distribution = .fill
        horizontalStack.alignment = .fill
        horizontalStack.spacing = Constants.iconAndTextSpace
        return horizontalStack
    }()

    private lazy var imageView = UIImageView()

    private lazy var title: UILabel = {
        let label = UILabel()
        label.font = .textPreset3(weight: .regular)
        label.backgroundColor = .clear
        label.lineBreakMode = .byTruncatingTail
        return label
    }()

    private lazy var selectedLine: UIView = {
        let selectedLine = UIView()
        selectedLine.backgroundColor = .controlActivated
        return selectedLine
    }()

    private lazy var minimumWidthConstraintForLargeScreen = {
        contentView.widthAnchor.constraint(greaterThanOrEqualToConstant: Constants.minimumItemWidthForLargeScreen)
    }()

    private lazy var imageViewWidthConstraint = {
        imageView.widthAnchor.constraint(equalToConstant: Constants.iconSize)
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

extension TabItemViewCell {
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
            if newValue == nil {
                imageViewWidthConstraint.constant = 0
            } else {
                imageViewWidthConstraint.constant = Constants.iconSize
            }
        }
    }

    func activeMinimumWidthConstraint(_ isActive: Bool) {
        minimumWidthConstraintForLargeScreen.isActive = isActive
    }

    func showSelected() {
        selectedLine.backgroundColor = .controlActivated
        title.textColor = .textPrimary
        imageView.tintColor = .neutralHigh
    }

    func showDeselected() {
        selectedLine.backgroundColor = .clear
        title.textColor = .textDisabled
        imageView.tintColor = .neutralLow
    }
}

// MARK: - Private

private extension TabItemViewCell {
    func commomInit() {
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        
        contentView.addSubview(verticalStack, constraints: [
            verticalStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            verticalStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            verticalStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            verticalStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            selectedLine.heightAnchor.constraint(equalToConstant: Constants.heightDivider),
            selectedLine.widthAnchor.constraint(equalTo: verticalStack.widthAnchor),
            contentView.heightAnchor.constraint(equalToConstant: Constants.cellHeight),
            imageViewWidthConstraint,
            imageView.heightAnchor.constraint(equalToConstant: Constants.iconSize),
            minimumWidthConstraintForLargeScreen
        ])
        setUpAccessibility()
    }

    func setUpAccessibility() {
        // This component don't grow with Dynamic Type, but presents a HUD instead, since it is intended to be always
        // presented below the navigation bar.
        if #available(iOS 13, *) {
            showsLargeContentViewer = true
            addInteraction(UILargeContentViewerInteraction())
        }

        // For Voice Over, consider the whole cell as the accessibility element, since the cell is much bigger then the
        // title label, and it is more difficult to find it. The accesibility label is overridden to just dynamically
        // delegate on the title label
        isAccessibilityElement = true
        title.isAccessibilityElement = false
    }
}

// MARK: Accessibility

public extension TabItemViewCell {
    @available(iOS 13, *)
    override var largeContentTitle: String? {
        get { title.largeContentTitle }
        set {}
    }

    override var largeContentImage: UIImage? {
        get { imageView.image }
        set {}
    }

    override var accessibilityLabel: String? {
        get { title.text }
        set {}
    }
}
