//
//  File.swift
//  
//
//  Created by Alejandro Ruiz on 17/2/23.
//

import Foundation
import UIKit

open class ListTableViewCell: UITableViewCell {
    
    public var listViewCell: ListViewCell = ListViewCell()
    private lazy var cellSeparatorView = SeparatorView(axis: .horizontal)
    
    public var isCellSeparatorHidden: Bool = true {
        didSet {
            guard listViewCell.cellStyle != .boxed && listViewCell.cellStyle != .boxedInverse else { return }

            cellSeparatorView.isHidden = isCellSeparatorHidden
        }
    }
    // MARK: Initializers
    
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        commonInit()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    // MARK: UITableViewCell Overrides

    override public func systemLayoutSizeFitting(_ targetSize: CGSize,
                                                 withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority,
                                                 verticalFittingPriority: UILayoutPriority) -> CGSize {
        let size = super.systemLayoutSizeFitting(
            targetSize,
            withHorizontalFittingPriority: horizontalFittingPriority,
            verticalFittingPriority: verticalFittingPriority
        )

        return CGSize(width: size.width, height: max(size.height, listViewCell.cellStyle.minHeight))
    }

    override public func setHighlighted(_ highlighted: Bool, animated _: Bool) {
        if highlighted {
            highlightedView.backgroundColor = .backgroundAlternative
        } else {
            highlightedView.backgroundColor = .backgroundContainer
        }
    }

    override public func setSelected(_: Bool, animated _: Bool) {
        // Do nothing
    }

    override open var isUserInteractionEnabled: Bool {
        didSet {
            listViewCell.centerSection.isUserInteractionEnabled = isUserInteractionEnabled
        }
    }

    override open func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        guard traitCollection.userInterfaceStyle != previousTraitCollection?.userInterfaceStyle else { return }
        listViewCell.cellBorderView.layer.borderColor = listViewCell.cellStyle.borderColor
    }
    
    func commonInit() {
        layoutViews()
        updateCellStyle()
    }
    
    func layoutViews() {
        contentView.addSubview(constrainedToLayoutMarginsGuideOf: listViewCell)

        contentView.addSubview(cellSeparatorView, constraints: [
            cellSeparatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cellSeparatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -ListViewCell.ViewStyles.horizontalPadding),
            cellSeparatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ListViewCell.ViewStyles.horizontalPadding),
            cellSeparatorView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    func updateCellStyle() {
        directionalLayoutMargins = listViewCell.cellStyle.contentViewLayoutMargins
        preservesSuperviewLayoutMargins = false
        backgroundColor = .background
    }
}

private extension ListTableViewCell {
    var highlightedView: UIView {
        switch listViewCell.cellStyle {
        case .fullWidth, .boxedInverse:
            return contentView
        case .boxed:
            return listViewCell.cellBorderView
        }
    }
}
